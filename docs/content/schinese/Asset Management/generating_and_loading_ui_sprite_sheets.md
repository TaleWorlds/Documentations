+++
title = "生成和加载 UI 精灵表"
weight = 15
ai_translated = true
+++

#### 简介
精灵(Sprite)是二维图像,主要用于游戏的用户界面中。精灵表(Sprite Sheet)是此类图像的集合。换句话说,精灵被打包在一起形成一张精灵表。本文档将介绍以下步骤:

* 添加新的精灵。
* 从你添加的精灵生成精灵表。
* 将精灵表导入到你的模组中。
* 在 UI XML 文件中使用精灵。
* 加载和卸载精灵分类(category)。

#### 前提条件
* 在 INSTALLATION_PATH\Mount & Blade II Bannerlord\Modules\ 下创建的子模组
* 了解如何从集成开发环境(IDE),如 Visual Studio,构建你的项目。
* 从 Steam 下载的 Mount & Blade II: Bannerlord - Modding Kit。

#### 添加精灵
* 在 Modules\YOUR_MODULE_NAME\ 下创建一个名为 GUI 的新文件夹。
* 在新创建的 GUI 文件夹下创建一个名为 SpriteParts 的新文件夹。
* 在新创建的 SpriteParts 文件夹下创建一个名为 ui_{YOUR_CATEGORY_NAME} 的新文件夹。在本文档中,它将被命名为 **ui_mycategory**。
* 注意:ui_{YOUR_CATEGORY_NAME} 内的内容将被放入一个名为 YOUR_CATEGORY_NAME 的单一分类中。一个分类中的所有精灵会一起被加载和卸载。建议将你的精灵划分为多个分类(而不是只有一个分类),以避免加载不必要的精灵。例如,你可能在游戏中创建一个新屏幕,需要加载某些精灵。这些精灵可以被打包成一个分类,一旦该屏幕打开,你就可以只加载相关的精灵,然后在屏幕关闭时将它们卸载(参见加载与卸载精灵分类部分)。
* 将你的精灵放入 ui_{YOUR_CATEGORY_NAME} 文件夹中。例如,添加了这个精灵并命名为 **mysprite.png**:
* 对于启动器(Launcher),新精灵应添加到 MODULE_NAME\LauncherGUI\SpriteParts 下的某个分类中。

<img src="/img/sprite_sheets/1.png"/>

#### 生成精灵表
为了生成精灵表,运行位于 INSTALLATION_PATH\Mount & Blade II Bannerlord\bin\Win64_Shipping_wEditor 的 TaleWorlds.TwoDimension.SpriteSheetGenerator.exe 可执行文件。如果你已按照上述步骤操作,在运行 SpriteSheetGenerator.exe 后,你应该会看到以下窗口:

<img src="/img/sprite_sheets/2.PNG" width="1200px"/>

SpriteSheetGenerator.exe 将在 Modules\YOUR_MODULE_NAME 下创建两个名为 Assets 和 AssetSources 的文件夹。它还会在 Modules\YOUR_MODULE_NAME\GUI 下创建一个 SpriteData.xml 文件(带有你的模组名称前缀)。

* 如果你是在为启动器生成精灵表,请使用 LauncherGUI 文件夹下的 **Update Launcher SpriteSheets.bat** 脚本。

#### 导入已创建的精灵表
为了使用你精灵表中的精灵,你还需要从资源浏览器(resource browser)中导入它们。请注意,如果你只是为启动器添加精灵,则应跳过此步骤。

按照以下步骤导入精灵表:

* 确保你已将项目构建到 Modules\YOUR_MODULE_NAME\bin\Win64_Shipping_wEditor(除了 Win64_Shipping_Client 之外)。如果你的项目构建不正确,在启动时会发生崩溃。
* 从 Steam 运行 Mount & Blade II: Bannerlord - Modding Kit。
* 确保在启动器(Launcher)的 Mods 部分选中了你的模组,然后点击"Play"。
* 在主菜单中,按 Alt + ` 打开控制台。
* 输入 resource.show_resource_browser,然后按回车。

<img src="/img/sprite_sheets/3.PNG" width="1200px"/>

这应该会打开资源浏览器:

<img src="/img/sprite_sheets/4.PNG" width="1200px"/>

折叠资源浏览器左侧名为 Native 的文件夹,以便更轻松地找到你的模组。然后,选择你的模组。

<img src="/img/sprite_sheets/5.PNG" width="1200px"/>

打开你模组中的 GauntletUI 文件夹。然后,按下下面用红色箭头标出的"Scan new asset files"(扫描新资源文件)按钮(右侧箭头)。

<img src="/img/sprite_sheets/6.png" width="1200px"/>

这应该会打开一个新窗口:

<img src="/img/sprite_sheets/7.PNG"/>

确保选中了你的分类(在本示例中为 ui_mycategory),然后点击 Import(导入)按钮。然后,你应该会看到类似这样的内容:

<img src="/img/sprite_sheets/8.PNG" width="1200px"/>

关闭资源浏览器和游戏。
你现在应该会在 Modules\YOUR_MODULE_NAME\Assets\GauntletUI 下看到一个名为 ui_{YOUR_CATEGORY_NAME}_1_tex.tpac 的新文件。

#### 在 UI XML 文件中使用精灵
你现在可以使用你创建的精灵表中的精灵了(你还需要加载相应的分类,这在下面的加载与卸载精灵分类部分中有说明)。精灵在 UI XML 文件中使用。你可以通过名称来引用你的精灵。你可以在位于 Modules\YOUR_MODULE_NAME\GUI 的 SpriteData.xml 文件(带有你的模组名称前缀)中找到你精灵的名称。
举个例子,我们将创建一个新的 UI XML 文件。为此,返回到 Modules\YOUR_MODULE_NAME\ 下名为 GUI 的文件夹,并创建一个名为 Prefabs 的新文件夹。在 Prefabs 文件夹下创建一个名为 MyXml.xml 的新文件。你现在可以在这个文件中通过 Sprite="mysprite" 来引用你的精灵。例如,MyXml.xml 文件的内容可以是:

	<Prefab>
		<Window>
			<Widget DoNotAcceptEvents="true" DoNotPassEventsToChildren="true" WidthSizePolicy="StretchToParent" HeightSizePolicy="StretchToParent">
				<Children>
					<ImageWidget WidthSizePolicy="Fixed" HeightSizePolicy="Fixed" SuggestedWidth="128" SuggestedHeight="128" HorizontalAlignment="Center" VerticalAlignment="Center" Sprite="mysprite"/>
				</Children>
			</Widget>
		</Window>
	</Prefab>

#### 加载与卸载精灵分类
为了使用你添加的精灵,你需要加载它们。在这方面,你有两种选择:¸

1. 手动加载与卸载
	* 开发者拥有更多的控制权。他们可以选择何时加载和卸载精灵分类。因此,他们可以管理内存使用和性能。
	* 需要编写代码。因此,比 AlwaysLoad 选项更复杂。

2. 使用 AlwaysLoad 选项
	* 精灵分类在启动时自动加载。
	* 分类会保留在内存中,直到游戏关闭。因此,每次使用时无需手动加载它们。
	* 以增加内存使用为代价,减少 UI 加载时间。
	* 易于使用。

##### 1. 手动加载与卸载
这里我们展示如何手动加载和卸载精灵分类。在下面的示例中,我们重写了 MBSubModuleBase 类的 OnGameStart 和 OnGameEnd 方法,分别用于添加和移除 MyScreen 全局层(global layer)。请注意,MyScreen 的构造函数加载了我们在前面章节中创建的精灵分类和 UI XML。我们还在 OnFinalize 方法中卸载了该精灵分类。

如果你要复制下面的代码,别忘了更改命名空间(namespace)和 Main 函数的名称。它们应该与你 SubModule.xml 中的字段相匹配。换句话说,你应该在 SubModule.xml 的这个字段中,将 SpritesheetDocumentation(命名空间)更改为 YOUR_MODULE_NAME,将 Main(Main 函数的名称)更改为 YOUR_MAIN_FUNCTION_NAME:

	<SubModuleClassType value="YOUR_MODULE_NAME.YOUR_MAIN_FUNCTION_NAME"/>

否则,它们将无法被识别,游戏将在启动时崩溃。

	using TaleWorlds.Core;
	using TaleWorlds.MountAndBlade;
	using TaleWorlds.Engine.Screens;
	using TaleWorlds.Engine.GauntletUI;
	using TaleWorlds.GauntletUI.Data;
	using TaleWorlds.TwoDimension;

	namespace SpritesheetDocumentation
	{
		public class Main : MBSubModuleBase
		{
			private MyScreen _myScreen;
			
			protected override void OnSubModuleLoad()
			{

			}
			
			protected override void OnGameStart(Game game, IGameStarter gameStarterObject)
			{
				base.OnGameStart(game, gameStarterObject);
				_myScreen = new MyScreen();
				ScreenManager.AddGlobalLayer(_myScreen, true); // add MyScreen on game start
			}
			
			public override void OnGameEnd(Game game)
			{
				base.OnGameEnd(game);
				_myScreen.OnFinalize();
				ScreenManager.RemoveGlobalLayer(_myScreen); // remove MyScreen on game end
			}
		}

		public class MyScreen : GlobalLayer
		{
			private GauntletLayer _gauntletLayer;
			private IGauntletMovie _gauntletMovie;
			private SpriteCategory _category;

			public MyScreen()
			{
				var spriteData = UIResourceManager.SpriteData;
				var resourceContext = UIResourceManager.ResourceContext;
				var resourceDepot = UIResourceManager.UIResourceDepot;
				
				_category = spriteData.SpriteCategories["ui_mycategory"]; // select which category to load, put your category name here
				_category.Load(resourceContext, resourceDepot); // load the selected category
				
				_gauntletLayer = new GauntletLayer(2);
				Layer = (ScreenLayer)_gauntletLayer;
				
				_gauntletMovie = _gauntletLayer.LoadMovie("MyXml", null); // load the ui xml in Prefabs folder
			}

			public void OnFinalize()
			{
				// unload ui xml, sprite category, layer, etc.
				_gauntletMovie = null;
				_category.Unload();
				_gauntletLayer = null;
			}
		}
	}

##### 2. 使用 AlwaysLoad 选项
与手动加载与卸载部分中手动加载精灵分类不同,你可以通过为特定分类启用 AlwaysLoad 选项,来选择哪些精灵分类应在启动时自动加载。除非开发者手动卸载,否则启用了 AlwaysLoad 选项的分类将一直保留在内存中,直到游戏关闭,这样你就不必每次使用时都手动加载它们。启用 AlwaysLoad 选项会减少 UI 的加载时间(因为这些分类只在启动时加载一次),但会增加内存使用(因为即使这些分类未被使用,也会保留在内存中)。此选项对于经常被加载和卸载的分类非常有用(例如,用于一个频繁打开和关闭的屏幕的分类)。

注意:此功能随 e1.6.2 版本发布。如果你使用的是更早的版本,但仍想使用 AlwaysLoad 选项,请将游戏和模组开发工具包(modding kit)都切换到 e1.6.2 或更新的版本。

要为某个分类启用 AlwaysLoad 选项,请按照以下步骤操作:

在文件夹 Modules\YOUR_MODULE_NAME\GUI\SpriteParts 下创建一个名为 Config.xml 的新 XML 文件。将以下内容复制并粘贴到 Config.xml 中:

	<Config>
		<SpriteCategory Name="ui_{YOUR_CATEGORY_NAME}">
			<AlwaysLoad/>
		</SpriteCategory>
	</Config>

将 ui_{YOUR_CATEGORY_NAME} 替换为你的分类。然后,按照上面生成精灵表部分中的步骤生成精灵表。要检查一切是否正常,请打开位于 Modules\YOUR_MODULE_NAME\GUI 的 {YOUR_MODULE_NAME}SpriteData.xml 文件。在那里你应该会看到,你在 Config.xml 中选择的分类已启用了 AlwaysLoad 选项:

	<SpriteData>
		<SpriteCategories>
			<SpriteCategory>
				<Name>ui_{YOUR_CATEGORY_NAME}</Name>
				<AlwaysLoad />
				<SpriteSheetCount>1</SpriteSheetCount>
				<SpriteSheetSize ID="1" Width="512" Height="512" />
			</SpriteCategory>
		</SpriteCategories>
		...
	</SpriteData>

你不需要更改/添加任何代码来加载新的精灵表分类。

#### 结论
为了看到下面的结果,请确保你已经创建了一个屏幕,并加载了你在"在 UI XML 文件中使用精灵"部分创建的 UI XML 文件。

注意:如果你已经使用 AlwaysLoad 选项添加了你的精灵分类,但没有使用"手动加载与卸载"部分中分享的代码,你可以编写自己的代码来创建一个屏幕并加载 UI XML。如果你不知道该怎么做,可以复制"手动加载与卸载"部分中的代码(也请阅读该部分中的详细信息),并删除以下几行,因为你已经使用了 AlwaysLoad 选项,不需要手动加载该分类:

	var spriteData = UIResourceManager.SpriteData;
	var resourceContext = UIResourceManager.ResourceContext;
	var resourceDepot = UIResourceManager.UIResourceDepot;
	
	_category = spriteData.SpriteCategories["ui_mycategory"]; // select which category to load, put your category name here
	_category.Load(resourceContext, resourceDepot); // load the selected category

你也可以删除 _category 字段并移除对它的引用。

* 确保你已将项目构建到 Modules\YOUR_MODULE_NAME\bin\Win64_Shipping_Client。
* 从 Steam 启动游戏(不是 Modding Kit),并确保在启动器的 Mods 部分选中了你的模组,然后点击"Play"。
* 创建一个新战役或加载一个兼容的存档以打开战役地图。两者都会启动一场游戏。请注意,我们编写的代码会在游戏开始时添加该屏幕(查看 OnGameStart 方法)。
* 在你通过创建新战役启动游戏后,你应该会看到这个屏幕:

<img src="/img/sprite_sheets/9.PNG" width="1200px"/>
