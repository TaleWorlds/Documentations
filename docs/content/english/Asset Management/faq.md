+++
title = "Frequently Asked Questions"
weight = 1
+++

##### How to install the tools?

You can download the “Mount & Blade Bannerlord Modding Tools” from the Tools section of steam. Note that the tools use some of the files downloaded within the game itself. Thus, the tools and game should be at the same version and installed on the same harddrive.

##### How to launch the tools?
You can use the SinglePlayer option from the Launcher and once you are in the Initial Menu, you can either press the Editor button or press the Ctrl + E key combination to start up the editor. 

##### How to create your own module?
We have a built-in functionality in the editor which creates a new module and populates it with example xml files registered to the module for ease of adding new content. After opening the editor, you can use the “Create New Module” option in the “File” menu from the top toolbar. Note that you need to restart the game in order to register the module from the Launcher. 

##### How to edit Native resources?
You cannot edit native resources, you can override them on your own module. For details look at [Overriding Assets]({{< ref "overriding_assets.md" >}}).

##### I can’t add new meshes, textures etc.
You cannot add resources to native modules, you should add them to your own module. First, you need to create a new module by following [this guide]({{< ref "quickguide_create_a_mod.md" >}}).
For the details of adding new assets look at [Overriding Assets]({{< ref "overriding_assets.md" >}}).

##### Example scenes to look at?

empire_village_003
khuzait_castle_002
sturgia_town_b
battle_terrain_v
empire_castle_keep_a_l3_interior
empire_house_c_tavern_a
empire_dungeon_a
arena_empire_a
Main_map
		
##### Where to find example assets?
You can inspect native resources from Resource Browser but there aren't source files for these and you cannot export them. We will be providing some example source files soon.

##### I have mods with DLL’s and my modding tools does not launch.
If you have any mods with DLL’s enabled, be sure to copy them to the Modules\MOD_NAME\bin\Win64_Shipping_wEditor folder as well.

##### My modding tool does not launch.
Be sure that Visual Studio 2013 Redist x64 is installed in your machine. Also, check whether the version numbers for the base game and modding tools match. If all of the above checks does not work, you can create a new topic in the “Bug & Crashes” section of the modding forums (https://forums.taleworlds.com/index.php?forums/bug-crash-reports.784/). 