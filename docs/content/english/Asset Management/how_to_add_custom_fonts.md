+++
title = "How to Add Custom Fonts"
weight = 15
+++


#### Introduction

This documentation will go through the following steps:

* Setting Up The Files and Paths
* Generating Fonts
* Placing Files in the Module Folder
* Generating Sprite Sheets
* How to Use Fonts In Bannerlord

#### Prerequisites

* TrueTypeFont file for the font. E.g. (OpenSans-Regular.ttf)
* Mount &amp; Blade II: Bannerlord - Modding Kit downloaded from steam
* Knowledge on generating UI Spritesheets (see: [Generating and Loading UI Sprite Sheets]({{< ref "generating_and_loading_ui_sprite_sheets.md" >}}))

#### Setting Up The Files and Paths

* Go to Mount &amp; Blade II Bannerlord\GUI\GauntletUI\Fonts\.
* Make sure the two files below exist in the directory. We will use them to generate our font data.
	* **GenerateFont.bat**
	* **GenerateFontSettings.txt**
* Move your **.ttf** font file to the directory.
* For our example, we will use a font file named **OpenSansRegular.ttf**.
* Open the file: &quot;**GenerateFontSettings.txt**&quot;.
* &quot;**GenerateFontSettings.txt**&quot; default values are:

		-fontpath {FONT\_PATH.ttf}
		-outputpath {OUTPUT\_PATH.png}
		-atlassize 2048 2048
		-size 64
		-angle 8
		-range 16
		-padding 16
		-smooth 0
		-smoothingConstant 0.5-mode 1

* Here, we need to change the placeholder variables **{FONT\_PATH.ttf}** and **{OUTPUTPATH.png}** with actual paths.
* The paths here are relative to the directory: **…\bin\Win64_Shipping_wEditor** directory unless you specify a full path.
* Please note that if you want to use paths that contain spaces, you need to put them inside quotes.
* Setting -fontpath:
	* In our example, the variable should be: **-fontpath OpenSansRegular.ttf**.
* Setting -outputpath:
	* This variable determines where the **.png** file should be placed. We should use a **.png** file path to a non-existent file which will be created in the process of generating atlas.
	* In our example we set the -outputpath variable as: **-outputpath OpenSansRegular.png**.
* The contents of **GenerateFontSettings.txt** should now look like this:

		-fontpath OpenSansRegular.ttf
		-outputpath OpenSansRegular.png
		-atlassize 2048 2048
		-size 64
		-angle 8
		-range 16
		-padding 16
		-smooth 0
		-smoothingConstant 0.5-mode 1

_If the generated .png file does not contain all the characters for your font, consider increasing the_ **-atlassize**.

#### Generating Fonts

* Now that the files are added and the correct paths for generator set up, start the **GenerateFont.bat**.
* If everything is properly set up, the program will not throw any errors and will generate 3 files in the directory which you defined as your **-outputpath**.
	* In our example, the 3 files are:
		* **OpenSansRegular.fnt**
		* **OpenSansRegular.bfnt**
		* **OpenSansRegular.png**
* If you see any errors in the batch script, make sure that the **-fontpath** and **-outputpath** variables are set correctly.
* In our example, the 3 generated files are located in the **…\bin\Win64_Shipping_wEditor\** directory since we put a relative path.

#### Placing Files in the Module Folder

* In the step above, we have generated 3 files. Now we need to place those files in our module.

##### Font Files

* Go to **{YOURMODULE}\GUI\Fonts** folder. If your module doesn&#39;t have a **Fonts** folder, create it.
* Move the generated **.fnt** and **.bfnt** files to the **Fonts** folder, in our example they are named **OpenSansRegular.fnt** and **OpenSansRegular.bfnt**.

##### Image File

* Go to **{YOURMODULE}\GUI\SpriteParts** folder. If your module doesn&#39;t have any **GUI** or **SpriteParts** folders, create them.
* In the **SpriteParts** folder, create an empty folder named **ui\_custom\_fonts**.
* If you don&#39;t have a **Config.xml** in your **SpriteParts** folder, create it too.
* At this stage, **SpriteParts** folder should have a folder named **ui\_custom\_fonts** and a file named **Config.xml**.
* Now we can move our **.png** file to the ui\_custom\_fonts folder. In our example, the file is named **OpenSansRegular.png**.

##### Configuration

* In order to be able to use our font in-game, we need to specify in our **Config.xml** file that our font needs to be loaded automatically.
* The contents of the Config.xml should include this Config:

		<Config>
			<SpriteCategory Name="ui_custom_fonts">
				<PackAllSpritesToUniqueTextures/>
				<SingleChannel/>
				<AlwaysLoad/>
				<EdgeSize Value="0" />
			</SpriteCategory>
		</Config>

* Note that **ui\_custom\_fonts** here comes from the name of the folder you created in **{YOURMODULE}\GUI\SpriteParts**.

#### Generating Sprite Sheets

* Now the spritesheets of the font need to be generated, using the **.png** file created in the last process.
* We will briefly cover how to add your new font to the spritesheets. For a detailed explanation see: [Generating and Loading UI Sprite Sheets]({{< ref "generating_and_loading_ui_sprite_sheets.md" >}}).
	* Run the spritesheet generator by simply launching the **Mount &amp; Blade II Bannerlord\bin\Win64\_Shipping\_wEditor\TaleWorlds.TwoDimension.SpriteSheetGenerator.exe**.
	* If everything was set up correctly, the output of spritesheet generator should look like this:
<img src="/img/how_to_add_custom_fonts/spritesheet_generator.png"/>
	* You should import the font via the resource browser in-game. Which was explained in the [document]({{< ref "generating_and_loading_ui_sprite_sheets.md" >}}) above.

#### Using the Newly Added Fonts

* If we did everything correctly, we should be able to use our newly added fonts in-game.
* In order to use a font, we can declare it&#39;s name in a brush, for example:

		<Brush Name="CustomBrush.With.New.Font" Font="OpenSansRegular" TextHorizontalAlignment="Right">
			<Styles>
				<Style Name="Default" FontColor="#F4E1C4FF" TextGlowColor="#000000FF" TextOutlineColor="#000000FF" TextOutlineAmount="0.01" TextGlowRadius="0" TextBlur="0" FontSize="20" />
			</Styles>
		</Brush>

* Now any widgets that use this brush, will be rendered using our newly added font.

#### Setting default fonts for a language

* For some languages, you may need your own custom fonts. If that&#39;s the case for you, you can set a default font for your language.
* To achieve this, create a file named **{YOURMODULE}Languages.xml** and put it in the folder: **{YOURMODULE}\GUI\Fonts** folder.
* Please note that you should give your **\*Languages.xml** file a unique name, and it should always end with &quot; **Languages**&quot; (e.g. _ **MyModuleLanguages.xml** _). For more information please see: [Adding &amp; Overriding Assets]({{< ref "overriding_assets.md" >}})
* In the new languages file, you can define a new language node, override existing ones, and change the default language of the game.
* Language nodes are used for mapping built-in fonts to your custom fonts.
* For example if you want to set default fonts for the **Turkish** language, your node should look like this:

		<Languages>
			<!-- Turkish -->
			<Language id="Türkçe" DefaultFont="OpenSans-Regular" LineSeperatorChar="-">
				<Map From="FiraSansExtraCondensed-Light" To="OpenSans-Regular"/>
				<Map From="FiraSansExtraCondensed-Medium" To="OpenSans-Regular"/>
				<Map From="FiraSansExtraCondensed-Regular" To="OpenSans-Regular"/>
				<Map From="Galahad" To="OpenSans-Regular"/>
				<Map From="Galahad_Numbers_Bold" To="OpenSans-Regular"/>
			</Language>
		</Languages>

* Here, we have set the default font for the Turkish language as &quot;OpenSansRegular&quot;. And mapped some built-in fonts to our custom ones as well.
* After saving this file, default fonts for your language should be set-up and you should see the correct font for your language.