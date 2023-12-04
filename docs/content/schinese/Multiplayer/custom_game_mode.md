+++
title = "创建自定义游戏模式"
description = "本教程会指导你如何从头开始建立一个包含自定义游戏模式的模组，教程内提供的示例模组将会提供一个试用版本下载链接。"
weight = 10

+++

#### 前提条件
要制作一个多人游戏模式，你首先需要在你游戏安装目录的 `Modules` 目录下创建你的模组文件夹。在你的模组目录下，你需要创建一个 `bin` 文件夹来放置 DLL 文件，还要创建一个 `SubModule.xml` 文件来存放你的模组定义和额外数据。

对于程序开发，你需要有 .NET Framework 开发工具。配置开发环境的话，下载 Visual Studio 2022 社区版并安装 .NET 6 支持。完成这些步骤后，新建一个 Class Library 项目。\\

对于客户端而言，添加位于你的 Mount & Blade II: Bannerlord 安装目录的 `Win64_Shipping_Client` 目录下的所有的 DLL 引用。\\
对于服务端而言，添加位于你的 Mount & Blade II: Dedicated Server 安装目录的 `Win64_Shipping_Server` 目录下的所有的 DLL 引用。

请保证你项目的输出路径是：

* 客户端代码放在你模组 `bin` 目录下的 `Win64_Shipping_Client` 目录下。
* 服务器代码放在你模组 `bin` 目录下的 `Win64_Shipping_Server` 目录下。

一切准备完毕后，你可以开始对你的游戏模式进行编程。
请注意，本文档中创建的游戏模式及其完整的源代码和额外的数据文件，都会以 ZIP 压缩包的形式提供给你。

#### 模组定义（Module Definition）文件
再开始定义你的游戏模式行为（behaviors）前，你需要先填写模组定义的 `SubModule.xml` 文件。在该文件中，你要给你的模组一个名字、一个 ID、一个版本，并定义它的依赖和 DLL 文件。

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

从这个示例定义文件中，我们可以看到一个模组的基本需求。关于多人游戏模组的 `ModuleCategory` 节点，其值可以是 `Multiplayer` 或 `Server`。如果模组是一个 Multiplayer（多人游戏）模组， 这意味着它在客户端和服务端都会被加载。Server（服务器）模组就只在服务器端被加载，并且可以用于管理和分析需要。

`SubModules` 节点定义了这个模组创建和使用的 DLL 文件。确保你的 DLL 文件的名称和继承 `MBSubModuleBase` 类的名称与该文件中的名称一致。

#### SubModule 类
要在代码中定义你的游戏模式，你需要创建一个类并继承自 `MBSubModuleBase` 类。在这个类中，重写 `OnSubModuleLoad` 方法并添加此行：

	Module.CurrentModule.AddMultiplayerGameMode(new MissionMultiplayerBountyMPMode("BountyMP"))

传递给构造函数的字符串是你游戏模式的名字。在该示例中，我们创建了一个名为 `BountyMP` 的游戏模式。要加载有文本信息的 XML 文件，重写 `InitializeGameStarter` 方法，调用其 base 方法然后添加此行：

	game.GameTextManager.LoadGameTexts(ModuleHelper.GetModuleFullPath("BountyMP") + "ModuleData/multiplayer_strings.xml")

同样，模组名和 XML 文件名都取决于你模组中的文件的名字。

在该 XML 文件中，你可以定义如下内容，这样你的游戏模式的名字就会显示在服务器列表中。

	<?xml version="1.0" encoding="utf-8"?>
	<base xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" type="string">
		<strings>
			<string id="str_multiplayer_official_game_type_name.BountyMP" text="{=*}Bounty" />
			<string id="str_multiplayer_game_type.BountyMP" text="{=*}Bounty" />
		</strings>
	</base>

确保 ID 与你在代码和模组定义文件中所定义的 ID 一致。

#### GameMode 类
要让服务器用你的游戏模式开始一场行动（mission），你需要新建一个类继承自 `MissionBasedMultiplayerGameMode`。在该类中，重写 `StartMultiplayerGame` 方法如下 **for your client module**：

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




该方法也大概展示了一场行动是如何进行的。所有行动行为（mission behaviors）都是一个接一个加载的，它们分别处理游戏的不同方面。根据你的游戏模式，你可能希望在你的模式中使用全部这些行为，又或者是只使用一部分。另外请注意，其中一些行为之间存在依赖关系，这意味着如果一个行为不存在，其他行为可能无法正确工作。在本例中，如果你按照第一部分中提到的步骤创建了一个空项目，那么有两个任务行为是无法实现的。开发者创建这两个行为来添加自己的游戏逻辑，它们是 `MissionMultiplayerBountyMP` 和 `MissionMultiplayerBountyMPClient`。前者从服务端管理游戏模式，后者从客户端管理游戏模式，确保所有重要的共享数据都在你的服务器上并正确同步。

#### 行动行为（Mission Behaviors）
对于所有原版游戏模式，服务端的游戏模式逻辑类，示例中的 `MissionMultiplayerBountyMP`，继承自 `MissionMultiplayerGameModeBase`。该类定义了基本的重生和同步系统。对于所有的原版游戏模式，客户端游戏模式消息处理逻辑类，示例中的 `MissionMultiplayerBountyMPClient`，继承自 `MissionMultiplayerGameModeBaseClient`。该类有几种可用的重写，可以确保消息处理程序（message handlers）的注册和注销在正确的时间发生。

#### 行动典型（Mission Representatives）
在原版游戏模式中，所有客户端添加了行动典型（Mission Representative）类来处理游戏模式特定的数据和逻辑。通过这一典型类，客户端可以根据条件查询多种关于游戏的事物。服务端也可以使用客户端的行动典型来计算多种事物，包括获得的金钱、旗帜信息等等。该类的内容依赖于游戏模式自身，行动典型的基类只有客户端的金钱和受控的 AI。在示例中，它是 `BountyMPMissionRepresentative`。行动典型被添加到了服务端游戏模式的先前一节提到的行动行为（Mission Behavior）类中。

#### 搭建使用模组的自定义服务器
要搭建一个使用模组的自定义服务器，你可以使用启动命令，如下：

	DedicatedCustomServer.Starter.exe _MODULES_*Native*Multiplayer*YOUR_MODULE_NAME_1*YOUR_MODULE_NAME_2*_MODULES_

在星号之间，你可以放入任何你想要的模组的名称。

你提供给 `/dedicatedcustomserverconfigfile` 参数的文件也可以包含你的自定义游戏模式的名称。

#### 示例模组
你可以[在这](https://download.taleworlds.com/BountyMP.zip)找到添加了一个新多人游戏模式的示例模组。请注意，示例模组中可能有一些小 bug，这不是一个完整的打磨过的官方游戏模式。

要编译示例的客户端，你需要安装 `Mount & Blade II: Bannerlord`。

要编译示例的服务端，你需要安装 `Mount & Blade II: Dedicated Server`。

