+++
title = "Создание пользовательского игрового режима"
description = ""
weight = 10
ai_translated = true
+++

#### Предварительные требования
Чтобы создать пользовательский MP игровой режим, вам сначала нужно создать папку вашего модуля в папке `Modules` вашей установленной игры. Внутри папки вашего модуля вам нужно создать папку `bin` для ваших DLL-файлов и файл `SubModule.xml` для определения вашего модуля и дополнительных данных.

Для программирования вам потребуются установленные инструменты разработки .NET Framework. Для этого скачайте Visual Studio 2022 Community Edition и установите поддержку .NET 6. После этого создайте новый проект Class Library.\

Для клиентской стороны добавьте ссылки на DLL-файлы, находящиеся в папке `Win64_Shipping_Client` вашей установки Mount & Blade II: Bannerlord. \\
Для серверной стороны добавьте ссылки на DLL-файлы, находящиеся в папке `Win64_Shipping_Server` вашей установки Mount & Blade II: Dedicated Server.

Убедитесь, что выходной каталог вашего проекта следующий:

* `Win64_Shipping_Client` в папке `bin` вашего модуля для клиентского кода.
* `Win64_Shipping_Server` в папке `bin` вашего модуля для серверного кода.

После того как всё настроено, вы можете начать программировать свой игровой режим.
Обратите внимание, что игровой режим, созданный в этом документе, вместе с полным исходным кодом и дополнительными файлами данных, предоставляется вам в ZIP-архиве.

#### Файл определения модуля
Прежде чем начать определять поведения вашего игрового режима, вам сначала нужно заполнить файл `SubModule.xml`, чтобы определить мод. В этом файле вы даёте вашему моду имя, ID, версию и определяете его зависимости и DLL-файлы.

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

Из этого примера файла определения мы можем увидеть базовые потребности мода. Для узла `ModuleCategory` значением может быть либо `Multiplayer`, либо `Server` для MP модов. Если мод является мультиплеерным модом, это означает, что он загружается как на клиенте, так и на сервере. Серверные моды загружаются только на стороне сервера и могут использоваться для нужд управления или аналитики.

Узел `SubModules` определяет DLL-файлы, которые создаёт и использует этот мод. Убедитесь, что имя вашего DLL-файла и имя вашего класса, наследующего `MBSubModuleBase`, совпадают с указанными в этом файле.

#### Класс SubModule
Чтобы определить ваш игровой режим в коде, вам нужно создать класс, наследующий класс `MBSubModuleBase`. В этом классе переопределите метод `OnSubModuleLoad` и добавьте эту строку:

	Module.CurrentModule.AddMultiplayerGameMode(new MissionMultiplayerBountyMPMode("BountyMP"))

Строка, передаваемая в конструктор, является именем вашего игрового режима. Для данного примера мы создаём игровой режим под названием `BountyMP`. Чтобы загрузить XML-файлы с текстовой информацией, переопределите метод `InitializeGameStarter`, вызовите базовый метод и добавьте эту строку:

	game.GameTextManager.LoadGameTexts(ModuleHelper.GetModuleFullPath("BountyMP") + "ModuleData/multiplayer_strings.xml")

Опять же, и имя модуля, и имя XML-файла зависят от имён файлов вашего мода.

В XML-файле вы можете определить следующее, чтобы название вашего игрового режима отображалось в списке серверов:

	<?xml version="1.0" encoding="utf-8"?>
	<base xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" type="string">
		<strings>
			<string id="str_multiplayer_official_game_type_name.BountyMP" text="{=*}Bounty" />
			<string id="str_multiplayer_game_type.BountyMP" text="{=*}Bounty" />
		</strings>
	</base>

Убедитесь, что ID совпадают с теми, что вы определили в файлах кода и определения модуля.

#### Класс GameMode
Чтобы заставить сервер запустить миссию с вашим игровым режимом, вам нужно создать новый класс, наследующий `MissionBasedMultiplayerGameMode`. В этом классе переопределите метод `StartMultiplayerGame` следующим образом **для вашего клиентского модуля**:

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

В этом классе переопределите метод StartMultiplayerGame следующим образом для вашего серверного модуля:

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


Этот метод показывает в общих чертах, как работает миссия. Все поведения миссии (mission behaviors) загружаются одно за другим, и каждое из них отвечает за разные аспекты игры. В зависимости от вашего игрового режима вам может понадобиться либо всё это, либо только часть этого в вашем режиме. Также обратите внимание, что между некоторыми из этих поведений существуют зависимости, то есть если одно из них отсутствует, другие могут работать некорректно. В этом примере есть два поведения миссии, которых вы не получите, если создали чистый проект, следуя шагам, упомянутым в первом разделе. Эти два поведения — те, что создаёт сам моддер для добавления собственной игровой логики. Это `MissionMultiplayerBountyMP` и `MissionMultiplayerBountyMPClient`. Первый управляет игровым режимом со стороны сервера, а второй — со стороны клиента. Убедитесь, что все общие и важные данные находятся на вашем сервере и правильно синхронизируются.

#### Поведения миссии (Mission Behaviors)
Для всех нативных игровых режимов класс логики игрового режима на стороне сервера, в данном примере `MissionMultiplayerBountyMP`, наследует `MissionMultiplayerGameModeBase`. Этот класс определяет базовые системы спавна и синхронизации. Также для всех нативных игровых режимов класс логики обработки сообщений игрового режима на стороне клиента, в данном примере `MissionMultiplayerBountyMPClient`, наследует `MissionMultiplayerGameModeBaseClient`. Для этого класса доступно несколько переопределений, которые обеспечивают правильное время регистрации и отмены регистрации обработчиков сообщений.

#### Представители миссии (Mission Representatives)
В нативных игровых режимах классы Mission Representative добавляются всем клиентам для обработки данных и логики, специфичных для игрового режима. Из этого класса представителя клиент может запрашивать различную информацию об игровом режиме в зависимости от ситуации. Сервер также может использовать представителя миссии клиента для вычисления различных значений, включая прирост золота, информацию о флагах и прочее. Содержимое этого класса зависит от самого игрового режима, базовый класс Mission Representative содержит только золото и управляемого агента клиента. В данном примере это `BountyMPMissionRepresentative`. Представители миссии добавляются в классе поведения миссии игрового режима на стороне сервера, упомянутом в предыдущем разделе.

#### Хостинг моддированного пользовательского сервера
Чтобы разместить пользовательский сервер с модами, вы можете использовать команду запуска следующего вида:

	DedicatedCustomServer.Starter.exe _MODULES_*Native*Multiplayer*YOUR_MODULE_NAME_1*YOUR_MODULE_NAME_2*_MODULES_

Между символами звёздочки вы можете указать имя любого нужного вам мода.

Файл, который вы передали в параметр `/dedicatedcustomserverconfigfile`, также может содержать имя вашего пользовательского игрового режима.

#### Пример мода
Вы можете найти пример мода, который добавляет новый MP игровой режим, [здесь](https://download.taleworlds.com/BountyMP.zip). Обратите внимание, что в примере мода могут быть небольшие ошибки, поскольку это не завершённый и не отполированный официальный игровой режим.

Чтобы скомпилировать клиентскую часть примера, у вас должна быть установлена `Mount & Blade II: Bannerlord`.

Чтобы скомпилировать серверную часть примера, у вас должен быть установлен `Mount & Blade II: Dedicated Server`.
