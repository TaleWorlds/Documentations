+++
title = "Creating a Module - Quick Guide"
weight = 1
+++

Modules can contain assets ranging from meshes to physics bodies, scenes, gameplay entities like factions, lords, troops, items and scripts and behaviours that can run any gameplay logic. In this gide, the process of creating one will be explained. 

##### Creating A New Module

Modules reside inside the "Modules" folder in the root directory. It must contain an XML file named SubModule.xml. This file contains basic information like "Name", "ID" and "Version" nodes. Also, one can define dependent modules inside the "DepenendedModules" node. If you want to make a Single Player mod, it should also contain a "SingleplayerModule" node. After this, the module will be visible at the Launcher. 

SubModules can define DLL's to be loaded at runtime. These DLL's should contain a Class which inherits from "MBSubModuleBase" and the name should match with the "SubModuleClassType" node inside the xml. That class will be constructed and certain callbacks willl be called so that od can registers its behaviours to the game.

##### Module Hierarchy

Modules can have several folders which contains different types of content:

{{% notice info %}}
* bin: The compiled DLL's should be put inside the "bin\Win64_Shipping_Client" folder so that the game can find and load the DLL.
* Atmospheres: This folder contains the different atmosğhere templates that can be used through the game. New atmosğhere can be saved to any module  from the Editor.
* AssetSources: This folder contains the sources for the assets. Editor imports assets to this folder. This folder may be filtered out before publishing the mod. For more information about adding new content to the module, see <strong>[Adding & Overriding Assets]({{< ref "overriding_assets.md" >}})</strong>.
* Assets: This folder contains the asset data derived from the content sources. It is only used at the mod development phase. This folder may be filtered out before publishing the mod.
* AssetPackages: After the content work is done for the module, content creator should start the Publish operation to ready the content for release. Th,s fodler contains the "Published" assets. 
* GUI: This folder contains any new GUI element, prefab or brush that can be used through the game.
* ModuleData: This folder contains many of the important xml files for gameplay logic. "project.mbproj" file governs the xml's that will be loaded inside the folder. These xml's range from animations and sets to factions, trops, items etc. 
* NavMeshPrefabs: Navigation mesh face groups can be saved in editor as templates to easily insert into multiple scenes. This folder contains those.
* Prefabs: This folder contains the prefabs XML's. For more information, see <strong>[Entities & Prefabs]({{< ref "prefabs.md" >}})</strong>.
* SceneObj: This fodler holds the Scene Data which is stripped from any Edit Data. Scenes witout terrain only resides in this folder. 
* SceneEditData: Contains the terrain edit data for every scene. This folder may be filtered out before publishing the mod.
{{% /notice %}}