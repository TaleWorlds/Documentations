+++
title = "Uploading/Updating a Mod"
description = ""
weight = 5
+++

## Creating a new Steam Workshop Item

### Preparing the WorkshopCreate.xml

Download [this file](https://download.taleworlds.com/WorkshopCreate.xml) and place it anywhere you want. You can also create one with the following code:

	<Tasks>
		<CreateItem/>
		<UpdateItem>
			<ModuleFolder Value="C:\Program Files (x86)\Steam\steamapps\common\Mount &amp; Blade II Bannerlord\Modules\YourModuleName"/>
			<!-- A direct path of your module -->
			<ItemDescription Value="A Bannerlord Mod"/>
			<!-- A description that will be displayed on Steam Workshop, can be edited via the Steam UI -->
			<Tags> 
				<!-- You can use the following tags: -->
				<!-- Type: Graphical Enhancement, Map Pack, Partial Conversion, Sound, Total Conversion, Troops, UI, Utility, Weapons and Armour -->
				<!-- Setting: Native, Antiquity, Dark Ages, Medieval, Musket Era, Modern, Sci-Fi, Fantasy, Oriental, Apocalypse, Other -->
				<!-- Game Mode: Singleplayer, Multiplayer -->
				<!-- Compatible Version: e1.9.0, v1.0.0,... The currently available versions can be found at the Steam Workshop "Browse by Tag" section -->
				<Tag Value="Partial Conversion" />
				<Tag Value="Dark Ages" />
				<Tag Value="Singleplayer" />
				<Tag Value="Multiplayer" />
				<Tag Value="e1.9.0" />
			</Tags>
			<Image Value="C:\Program Files (x86)\Steam\steamapps\common\Mount &amp; Blade II Bannerlord\Modules\YourModuleName\Image.png"/>
			<!-- Determines the featured image displayed on Steam Workshop, a direct path to it must be inserted here (the image should be smaller than 1 MB) -->
			<Visibility Value="Public"/>
			<!-- Determines visibility on Steam Workshop. Can be: Public, FriendsOnly, Private -->
		</UpdateItem>
	</Tasks>

* Open the file using Notepad, Notepad++ or other tools
* Edit the `Items` to match your module
	* `ModuleFolder`: A direct path of your module
	* `ItemDescription`: A description that will be displayed on Steam Workshop, can be edited via the Steam UI
	* `Tags`: Allows your mod to be found by filtering categories. Here are the tags you can assign to your item:
		* `Type`: Graphical Enhancement, Map Pack, Partial Conversion, Sound, Total Conversion, Troops, UI, Utility, Weapons and Armour
		* `Setting`: Native, Antiquity, Dark Ages, Medieval, Musket Era, Modern, Sci-Fi, Fantasy, Oriental, Apocalypse, Other
		* `Game Mode`: Singleplayer, Multiplayer
		* `Compatible Version`: e1.9.0, v1.0.0,... (the currently available versions can be found at the Steam Workshop "Browse by Tag" section)
		* You’re encouraged to only use the above tags as they’re what players will be able to filter mods by. Any other tags won’t show up on the Filter list but will show up on your mod Steam Workshop page
	* `Image`: Determines the featured image displayed on Steam Workshop, a direct path to it must be inserted here (the image should be smaller than 1 MB)
	* `Visibility`: Determines visibility on Steam Workshop. Can be: Public, FriendsOnly, Private
* Save the changes made to `WorkshopCreate.xml`

{{% notice warning %}}
You may run into an error during the publishing process. An endless print of the following line: Status: k_EItemUpdateStatusInvalid 0/0 - If that occurs your upload may have completed successfully and you’re free to close the console. If the upload failed, try again.
{{% /notice %}}

{{% notice tip %}}
The size of your uploaded module displayed on the Steam Workshop may differ from the actual size of the module. This is normal.
{{% /notice %}}

### Publishing the module
* Find the following folder `\Steam\steamapps\common\Mount & Blade II Bannerlord\bin\Win64_Shipping_Client` and confirm that the `TaleWorlds.MountAndBlade.SteamWorkshop.exe` is located inside of it
* Type `cmd` into the bar where the folder location is displayed and press `Enter`
* Type `TaleWorlds.MountAndBlade.SteamWorkshop.exe c:\path\WorkshopCreate.xml` into the console, with the path directing to your `WorkshopCreate.xml` file and press `Enter`
* If no errors appear, your mod has been successfully uploaded to Steam Workshop

## Updating a Steam Workshop Item

### Preparing the WorkshopUpdate.xml

Download [this file](https://download.taleworlds.com/WorkshopUpdate.xml) and place it anywhere you want. You can also create one with the following code:

	<Tasks>
		<GetItem>
			<ItemId Value="YourWorkshopItemIdHere"/>
			<!-- Can be found in the URL of your workshop item -->
		</GetItem>
		<UpdateItem>
			<ModuleFolder Value="C:\Mount &amp; Blade II Bannerlord\Modules\MyMod"/>
			<!-- A direct path of your module -->	
			<ChangeNotes Value="New cool features" />
			<!-- Insert patch notes -->
			<Tags> 
				<!-- You can use the following tags: -->
				<!-- Type: Graphical Enhancement, Map Pack, Partial Conversion, Sound, Total Conversion, Troops, UI, Utility, Weapons and Armour -->
				<!-- Setting: Native, Antiquity, Dark Ages, Medieval, Musket Era, Modern, Sci-Fi, Fantasy, Oriental, Apocalypse, Other -->
				<!-- Game Mode: Singleplayer, Multiplayer -->
				<!-- Compatible Version: e1.9.0, v1.0.0,... The currently available versions can be found at the Steam Workshop "Browse by Tag" section -->
				<Tag Value="Partial Conversion" />
				<Tag Value="Dark Ages" />
				<Tag Value="Singleplayer" />
				<Tag Value="Multiplayer" />
				<Tag Value="e1.9.0" />
			</Tags>
		</UpdateItem>
	</Tasks>

* Open the file using Notepad, Notepad++ or other tools
* Edit the `Items` to match your module
	* `ItemId`: Insert the ID of your workshop module. You can find it by going to your workshop module page, right-clicking on a blank slot and selecting `Copy Page URL`. If you then paste the URL somewhere, you’ll see the ID.
	* `ModuleFolder`: A direct path of your module
	* `ChangeNotes`: Think of this as patch notes, they will be displayed on the “Change Notes” section of your Workshop module
	* `Tags`: Allows your mod to be found by filtering categories. Updating tags can be done through the `WorkshopUpdate.xml` file
* Save the changes made to `WorkshopUpdate.xml`

### Publishing the update
* Find the following folder `\Steam\steamapps\common\Mount & Blade II Bannerlord\bin\Win64_Shipping_Client` and confirm that the `TaleWorlds.MountAndBlade.SteamWorkshop.exe` is located inside of it
* Type `cmd` into the bar where the folder location is displayed and press `Enter`
* Type `TaleWorlds.MountAndBlade.SteamWorkshop.exe c:\path\WorkshopUpdate.xml` into the console, with the path directing to your `WorkshopUpdate.xml` file and press `Enter`
* If no errors appear, your mod has been successfully updated