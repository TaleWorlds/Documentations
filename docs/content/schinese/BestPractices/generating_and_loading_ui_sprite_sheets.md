+++
title = "Generating and Loading UI Sprite Sheets"

[menu.main]
identifier = "sprite_sheets"
parent = "bestpractices"
+++

#### Introduction
Sprites are two-dimensional images that are mostly used in the user interface of a game. Sprite sheets are the collection of such images. In other words, sprites are packed together to form a sprite sheet. This documentation will go through the following steps:

* Adding new sprites.
* Generating sprite sheets from the sprites that you have added.
* Importing the sprite sheets to your module.
* Using sprites in UI XML files.
* Loading and unloading the sprite categories.

#### Prerequisites
* A submodule created under INSTALLATION_PATH\Mount & Blade II Bannerlord\Modules\
* Knowing how to build your project from the Integrated Development Environment (IDE) like Visual Studio.
* Mount & Blade II: Bannerlord - Modding Kit downloaded from Steam.

#### Adding Sprites
* Create a new folder named GUI under Modules\YOUR_MODULE_NAME\
* Create a new folder named SpriteParts under the newly created folder GUI.
* Create a new folder named ui_{YOUR_CATEGORY_NAME} under the newly created folder SpriteParts. In this documentation, it will be named **ui_mycategory**.
* Note: Content inside of ui_{YOUR_CATEGORY_NAME} will be put in a single category called **mycategory**. All the sprites in a category are loaded and unloaded together. It is suggested to divide your sprites into categories (instead of having only one category) in order to avoid unnecessary sprites being loaded. For example, you may create a new screen in the game that requires certain sprites to be loaded. Those sprites could be packed into a category and once that screen is opened, you can then load the relevant sprites only, and then when the screen is closed you can then unload them (see Loading & Unloading Sprite Categories section).
* Put your sprites into the ui_{YOUR_CATEGORY_NAME} folder. For example, this sprite is added and named **mysprite.png**:

<img src="/img/sprite_sheets/1.png"/>

#### Generating Sprite Sheets
In order to generate sprite sheets, run the TaleWorlds.TwoDimension.SpriteSheetGenerator.exe executable file located at INSTALLATION_PATH\Mount & Blade II Bannerlord\bin\Win64_Shipping_wEditor. If you have followed the steps above, after running SpriteSheetGenerator.exe, you should see the following window:

<img src="/img/sprite_sheets/2.PNG" width="900px"/>

SpriteSheetGenerator.exe will create two folders named Assets and AssetSources under Modules\YOUR_MODULE_NAME. It will also create a SpriteData.xml file (with a prefix of your module name) under Modules\YOUR_MODULE_NAME\GUI.

#### Importing Created Sprite Sheets
In order to use the sprites in your sprite sheets, you should also import them from the resource browser. Follow these steps to import a sprite sheet:

* Make sure you have built your project into Modules\YOUR_MODULE_NAME\bin\Win64_Shipping_wEditor (in addition to Win64_Shipping_Client). If your project is not built properly, you will get a crash while launching.
* Run Mount & Blade II: Bannerlord - Modding Kit from Steam.
* Make sure your mode is selected in the Mods section of the Launcher, then hit “Play”.
* On the main menu, press Alt + ` to open the console.
* Type resource.show_resource_browser, then hit enter.

<img src="/img/sprite_sheets/3.PNG" width="900px"/>

This should open the resource browser:

<img src="/img/sprite_sheets/4.PNG" width="900px"/>

Collapse the folder named Native on the left of the resource browser to see your module easily. Then, select your module.

<img src="/img/sprite_sheets/5.PNG" width="900px"/>

Open the GauntletUI folder in your module. Then, press the “Scan new asset files” button which is pointed with a red arrow below (arrow on the right).

<img src="/img/sprite_sheets/6.png" width="900px"/>

This should open a new window:

<img src="/img/sprite_sheets/7.PNG"/>

Make sure your category is selected (in the example, it is ui_mycategory) then press the Import button. Then, you should see something similar to this:

<img src="/img/sprite_sheets/8.PNG" width="900px"/>

Close the resource browser and the game.
You should now see a new file named ui_{YOUR_CATEGORY_NAME}_1_tex.tpac under Modules\YOUR_MODULE_NAME\Assets\GauntletUI.

#### Using Sprites In UI XML Files
You may now use the sprites in the sprite sheets that you have created (you also need to load the corresponding category which is explained below, in the Loading & Unloading Sprite Categories section). Sprites are used in UI XML files. You may refer to your sprites with their names. You can find the names of your sprites in the SpriteData.xml file (with a prefix of your module name) which is located at Modules\YOUR_MODULE_NAME\GUI.
To give an example, we will create a new UI XML file. To do that, go back to the folder named GUI under Modules\YOUR_MODULE_NAME\ and create a new folder named Prefabs. Create a new file named MyXml.xml under the Prefabs folder. You may now refer to your sprites in this file as Sprite="mysprite". For example, the content of the MyXml.xml file could be: 

	<Prefab>
		<Window>
			<Widget DoNotAcceptEvents="true" DoNotPassEventsToChildren="true" WidthSizePolicy="StretchToParent" HeightSizePolicy="StretchToParent">
				<Children>
					<ImageWidget WidthSizePolicy="Fixed" HeightSizePolicy="Fixed" SuggestedWidth="128" SuggestedHeight="128" HorizontalAlignment="Center" VerticalAlignment="Center" Sprite="mysprite"/>
				</Children>
			</Widget>
		</Window>
	</Prefab>

#### Loading & Unloading Sprite Categories
In order to use the sprites that you have added, you need to load them. In the example below, we override the OnGameStart and OnGameEnd methods of MBSubModuleBase class to add and remove the MyScreen global layer respectively. Notice that the constructor of MyScreen loads the sprite category and the UI XML that we have created in previous sections. We also unload the sprite category inside the OnFinalize method. 

If you are going to copy the below code, do not forget to change the namespace and name of the Main function. They should match with the fields in your SubModule.xml. In other words, you should change SpritesheetDocumentation (namespace) to YOUR_MODULE_NAME and Main (name of the Main function) to YOUR_MAIN_FUNCTION_NAME in this field of the SubModule.xml:

	<SubModuleClassType value="YOUR_MODULE_NAME.YOUR_MAIN_FUNCTION_NAME"/>

Otherwise, they won’t be recognized and the game will crash while launching.

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

#### Conclusion
* Make sure you have built your project into Modules\YOUR_MODULE_NAME\bin\Win64_Shipping_Client.
* Launch the game (not the Modding Kit) from Steam and make sure your module is selected in the Mods section of the Launcher, then hit “Play”.
* Create a new campaign or load a compatible save file to open the campaign map. Both of them will start a game. Notice that the code we have written adds the screen once the game starts (check the OnGameStart method).
* After you start the game by creating a new campaign, you should see this screen:

<img src="/img/sprite_sheets/9.PNG" width="900px"/>