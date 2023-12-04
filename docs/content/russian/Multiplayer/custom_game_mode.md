+++
title = "Creating a Custom Game Mode"
description = ""
weight = 10
+++

#### Prerequisites
To make a custom MP game mode, you first need to create your module’s folder under the `Modules` folder of your games installation. Inside your module’s folder, you need to create a `bin` folder for your DLL files and a `SubModule.xml` file for your module’s definition and additional data.

For programming, you need to have .NET Framework development tools installed. To do that, download Visual Studio 2022 Community Edition and install .NET 6 support. After that’s done, create a new Class Library project.\

For the client side, add references to DLLs located in the `Win64_Shipping_Client` folder of your Mount & Blade II: Bannerlord installation. \\
For the server side, add references to DLLs located in the `Win64_Shipping_Server` folder of your Mount & Blade II: Dedicated Server installation.

Make sure the output directory of your project is:

* `Win64_Shipping_Client` of your module’s `bin` folder for the client code.
* `Win64_Shipping_Server` of your module’s `bin` folder for the server code.

After everything is set up, you can start programming your game mode.
Please note that the game mode created in this document with its full source code and additional data files are provided to you in a ZIP file.

#### Module Definition File
Before starting defining behaviors of your game mode, you first need to fill the `SubModule.xml` file so the mod is defined. This file is where you give your mod a name, an ID, version and define its dependencies and DLL files.

	<Module>
		<Name value="MP Bounty"/>
		<Id value="BountyMP"/>
		<Version value="v1.8.0"/>
		<ModuleCategory value="Multiplayer"/>
		<DependedModules>
			<DependedModule Id="Native" DependentVersion="e1.8.0" Optional="false"/>
		</DependedModules>
		<SubModules>
			<SubModule>
				<Name value="BountyMP"/>
				<DLLName value="BountyMP.dll"/>
				<SubModuleClassType value="BountyMP.BountyMPSubModule"/>
			</SubModule>
		</SubModules>
	</Module>

From this sample definition file, we can see the basic needs of a mod. For the `ModuleCategory` node, the value can be either `Multiplayer` or `Server` for MP mods. If the mod is a Multiplayer mod, it means that it is loaded for both client and server. Server mods are only loaded on the server side and can be used for management or analytics needs.

`SubModules` node defines DLL files that this mod creates and uses. Make sure the name of your DLL file and the name of your class that inherits `MBSubModuleBase` matches with the ones in this file.

#### SubModule Class
To define your game mode in code, you need to create a class that inherits the `MBSubModuleBase` class. In this class, override `OnSubModuleLoad` method and add this line:

	Module.CurrentModule.AddMultiplayerGameMode(new MissionMultiplayerBountyMPMode("BountyMP"))

The string given to the constructor is the name of your game mode. For this sample, we’re creating a game mode named `BountyMP`. To load XML files with text information, override `InitializeGameStarter` method, call the base method and add this line:

	game.GameTextManager.LoadGameTexts(ModuleHelper.GetModuleFullPath("BountyMP") + "ModuleData/multiplayer_strings.xml")

Again, both the module name and XML file name depend on your mod’s file names.

In the XML file, you can define the following so your game mode’s name show up on the server list:

	<?xml version="1.0" encoding="utf-8"?>
	<base xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" type="string">
		<strings>
			<string id="str_multiplayer_official_game_type_name.BountyMP" text="{=*}Bounty" />
			<string id="str_multiplayer_game_type.BountyMP" text="{=*}Bounty" />
		</strings>
	</base>

Make sure IDs match up with the ones you defined in your code and module definition files.

#### GameMode Class
To make the server start the mission with your game mode, you need to create a new class that inherits `MissionBasedMultiplayerGameMode`. In this class, override `StartMultiplayerGame` method like this **for your client module**:

	public override void StartMultiplayerGame(string scene) {
		MissionState.OpenNew("BountyMP", new MissionInitializerRecord(scene),
			missionController => {
				return new MissionBehavior[] {
					MissionLobbyComponent.CreateBehavior(),
					new MissionMultiplayerBountyMPClient(),
					new MultiplayerAchievementComponent(),
					new MultiplayerTimerComponent(),
					new MultiplayerMissionAgentVisualSpawnComponent(),
					new MissionLobbyEquipmentNetworkComponent(),
					new MultiplayerTeamSelectComponent(),
					new MissionHardBorderPlacer(),
					new MissionBoundaryPlacer(),
					new MissionBoundaryCrossingHandler(),
					new MultiplayerPollComponent(),
					new MultiplayerAdminComponent(),
					new MultiplayerGameNotificationsComponent(),
					new MissionOptionsComponent(),
					new MissionScoreboardComponent(new BountyMPScoreboardData()),
					new MissionMatchHistoryComponent(),
					new EquipmentControllerLeaveLogic(),
					new MissionRecentPlayersComponent(),
					new MultiplayerPreloadHelper(),
				};
			}
		);
	}

In this class, override StartMultiplayerGame method like this for your server module:

	public override void StartMultiplayerGame(string scene) {
		MissionState.OpenNew("BountyMP", new MissionInitializerRecord(scene),
			missionController => {
				return new MissionBehavior[] {
					MissionLobbyComponent.CreateBehavior(),
					new MissionMultiplayerBountyMP(),
					new MissionMultiplayerBountyMPClient(),
					new MultiplayerTimerComponent(),
					new SpawnComponent(new BountyMPSpawnFrameBehavior(), new BountyMPSpawningBehavior()),
					new MissionLobbyEquipmentNetworkComponent(),
					new MultiplayerTeamSelectComponent(),
					new MissionHardBorderPlacer(),
					new MissionBoundaryPlacer(),
					new MissionBoundaryCrossingHandler(),
					new MultiplayerPollComponent(),
					new MultiplayerAdminComponent(),
					new MultiplayerGameNotificationsComponent(),
					new MissionOptionsComponent(),
					new MissionScoreboardComponent(new BountyMPScoreboardData()),
					new MissionAgentPanicHandler(),
					new AgentHumanAILogic(),
					new EquipmentControllerLeaveLogic(),
					new MultiplayerPreloadHelper(),
				};
			}
		);
	}


This method shows how a mission runs at an overview. All mission behaviors are loaded one by one and they all handle different aspects of the game. Depending on your game mode, you might want all of these or only some of these at your mode. Also please note that there are dependencies between some of these behaviors, meaning that if one is not present, others might not work correctly.  In this example, there are two mission behaviors that you are not going to get if you have created a clean project with the steps mentioned in the first section. These two behaviors are the ones the modder creates to add their own game logic. These are `MissionMultiplayerBountyMP` and `MissionMultiplayerBountyMPClient`. The former manages the game mode from the server while the latter manages the game mode from the client side. Make sure that all shared and important data is on your server and synchronized properly.

#### Mission Behaviors
For all native game modes, the server side game mode logic class, `MissionMultiplayerBountyMP` in this example, inherits `MissionMultiplayerGameModeBase`. This class defines basic spawning and synchronization systems. Also for all native game modes, the client side game mode message handling logic class, `MissionMultiplayerBountyMPClient` in this example, inherits `MissionMultiplayerGameModeBaseClient`. There are several overrides available for this class that makes sure the registering and deregistering from message handlers happen at the correct time.

#### Mission Representatives
In native game modes, Mission Representative classes are added to all clients to handle game mode specific data and logic. From this representative class, the client can query various things about the game mode depending on the situation. The server can also use a client’s mission representative to calculate various things, including gold gains, flag information and more. Contents of this class are dependent on the game mode itself, the base class of Mission Representative only has the gold and controlled agent of the client. In the example, it is `BountyMPMissionRepresentative`. Mission Representatives are added in the server game mode Mission Behavior class mentioned in the previous section.

#### Hosting a Modded Custom Server
To host a custom server with mods, you can use the launch command like the following:

	DedicatedCustomServer.Starter.exe _MODULES_*Native*Multiplayer*YOUR_MODULE_NAME_1*YOUR_MODULE_NAME_2*_MODULES_

In between asterisk characters, you can put the name of any mod you want.

The file you've provided to `/dedicatedcustomserverconfigfile` parameter can also have the name of your custom game mode in it.

#### Sample Mod
You can find a sample mod that adds a new MP Game Mode [here](https://download.taleworlds.com/BountyMP.zip). Please note that there might be small bugs in the sample mod, since it's not a complete and polished official game mode.

To compile the client side of the sample, you need to have `Mount & Blade II: Bannerlord` installed.

To compile the server side of the sample, you need to have `Mount & Blade II: Dedicated Server` installed.

