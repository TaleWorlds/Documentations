+++
title = "Creating Custom Banner Icons & Colors"
weight = 3
+++


#### Introduction

This documentation will go through the following steps:

* Setting up a custom texture containing banner icons. 
* Generating a material for the custom banner icons. 
* Adding newly created banner icons to a custom module.
* Adding custom icon colors to Banner Editor.

#### Prerequisites

* Mount & Blade II: Bannerlord - Modding Kit downloaded from Steam.

#### Creating a Banner Icon Texture

* To create a set of new banner icons, first create a PSD file with 2048x2048 resolution that is split into 16 equal grid parts.
* Then put this file into your module's **AssetSources\BannerIcons** directory. 
* Also you need to create an empty  folder in **Assets\BannerIcons**.
* In the sample image below, canvas is split into a 4x4 grid and there is a sample banner icon at the first(0th) slot.
* Banner icon slots start with slots 0, 1, 2 and 3 at the top row and ends with slots 12, 13, 14, 15 at the bottom row.
<img src="/img/creating_custom_banner_icons/banner_icon_guide.png" style="width:512px;"/>

#### Importing Banner Icon Texture In Game and Creating a new Material

* Now that the texture is added, Launch Mount & Blade II: Bannerlord - Modding Kit from Steam.
* Make sure your module is selected in the Mods section of the Launcher, then hit “Play”.
* On the main menu, press **Alt + `** to open the console.
* Type **resource.show_resource_browser** then hit enter.
* From the resource browser, select the folder with your module's name.
* While in this folder, click on "Scan new asset files".
<img src="/img/creating_custom_banner_icons/banner_icons_resource_browser_1.png" style="height:500px;"/>

* If you've done the previous steps correctly, a popup should display a new file detected. Click import.
<img src="/img/creating_custom_banner_icons/banner_icons_resource_browser_2.png" style="height:500px;"/>

* Go into **BannerIcons** subfolder and click on the texture you've created and set the Import Settings as shown below.
<img src="/img/creating_custom_banner_icons/banner_icons_resource_browser_3.png" style="height:500px;"/>

* While in the same folder, right click and select **Create** and then **Material**. Name this material with the same name that your texture has.
<img src="/img/creating_custom_banner_icons/banner_icons_material_1.png" style="height:500px;"/>

* The new material should show up as shown below.
<img src="/img/creating_custom_banner_icons/banner_icons_material_2.png" style="height:500px;"/>

* Initial settings for the new material:
	* Remove all predefined textures from the Textures List.
	* Add your banner icons texture to the diffuse slot of the Textures List.
	* Set the shader from **pbr_metallic** to **gui_color_and_stroke**.
<img src="/img/creating_custom_banner_icons/banner_icons_material_3.png" style="height:500px;"/>

* Additional settings for **Material Shader Flags**, **Transparency**, **Others** and **Vertex Layout** tabs:
<img src="/img/creating_custom_banner_icons/banner_icons_material_4.png" style="height:600px;"/>

* Now that we are done with the texture and the material of our custom banner icon, we can add it to our module.

#### Creating Custom Banner Definitions

* To use custom banner icons in game, an XML file containing banner definitions needs to be added to your module.
* Path of this file is **{MODULE_NAME}\ModuleData\banner_icons.xml**.
* This file is automatically loaded while your module is loading.
* An example **banner_icons.xml** is shown below.

```xml
<?xml version="1.0" encoding="utf-8"?>
<base xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" type="string">
  <BannerIconData>
    <BannerIconGroup id="16" name="{=!}My Custom Banner Icon Group" is_pattern="false">
      <Icon id="16001" material_name="module_custom_banner_icons_01" texture_index="0" />
    </BannerIconGroup>
  </BannerIconData>
</base>
```

* After the baseline XML definition, a root element named **BannerIconData** is added. All of the custom icons are added under this element.
* For each icon group, a **BannerIconGroup** element needs to be added. The ID of this group needs to be unique. Check Native Module's banner icon group IDs before adding a custom group.
* The name parameter is decided by you, the modder, and can be anything. The naming scheme is the same with any other localized text.
* Children elements of **BannerIconGroup** are **Icon** elements. All icon elements also have to have a unique ID. The same ID rules as Banner Icon Groups apply for Icons as well.
* Material name of the icon needs to be the material we've created in the previous step.
* Texture Index is a number from 0 to 15 and it is described in the first step of this guide.
* If you've added the **banner_icons.xml** file shown above to your module and relaunch the game, you should be able to use the icon you've created.
* The icon with the empty thumbnail is the icon we've created. Click on that button to select the newly created banner icon.
<img src="/img/creating_custom_banner_icons/banner_icons_ingame_1.png" style="height:500px;"/>

* Notice that the thumbnail is missing. To add the thumbnail, follow the [Generating and Loading UI Sprite Sheets](http://docs.modding.bannerlord.com/asset-management/generating_and_loading_ui_sprite_sheets/) guide. Note that the name of your sprite and the ID of the icon needs to be same. So for our example, thumbnail sprite's name is **16001.png**
* After generating the thumbnail, the banner icons list should look as follows.
<img src="/img/creating_custom_banner_icons/banner_icons_ingame_2.png" style="height:500px;"/>

#### Adding Custom Color Options

* To add a set of colors, create a **BannerColors** element in your modules **banner_icons.xml** file. 
* Children elements of **BannerColors** are **Color** elements. All color elements have to have a unique ID. Same ID rules as **Icon** elements apply here as well.
* There are two optional parameters for colors.
	* **player_can_choose_for_background**: Makes color available at the Background Color section of the Banner Editor Screen.  
	* **player_can_choose_for_sigil**: Makes color available at the Sigil Color section of the Banner Editor Screen.
* If none of these parameters are given as **true**, the color is still added to use in banners but can be only used by NPC clans and factions.

```xml
<?xml version="1.0" encoding="utf-8"?>
<base xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" type="string">
  <BannerIconData>
    <BannerIconGroup id="16" name="{=!}My Custom Banner Icon Group" is_pattern="false">
      <Icon id="16001" material_name="module_custom_banner_icons_01" texture_index="0" />
    </BannerIconGroup>
	<BannerColors> <!-- New colors element-->
      <Color id="2000" hex="0xFFDBCFB0" player_can_choose_for_sigil="true" />
      <Color id="2001" hex="0xFF545775" player_can_choose_for_background="true" />
    </BannerColors>
  </BannerIconData>
</base>
```

* If you added the colors like shown above, you will get the following colors in Banner Editor Screen.
<img src="/img/creating_custom_banner_icons/banner_colors_ingame_1.png" style="height:500px;"/>
