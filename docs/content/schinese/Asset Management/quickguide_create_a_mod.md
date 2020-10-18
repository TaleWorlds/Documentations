+++
title = "创建一个Mod - 快速入门"
weight = 1
+++

Mod 可以包含从网格到物理实体、场景、游戏实体（如派系、领主、部队、物品）以及可以运行任何游戏逻辑的脚本和行为等资产 (Assets)。在本指南中，将解释创建一个 Mod 的过程。

##### 新建一个Mod

Mod 位于根目录下的 "Modules" 文件夹内，它必须包含名为 SubModule.xml 的 xml 文件。这个文件提供 "Name"、"ID" 和 "Version" 节点等基本信息。另外，还可以在 "DepenendedModules" 节点里面定义依赖模块。如果你想制作一个单人模式 Mod，它的 "DepenendedModules" 也应该包含一个 "SingleplayerModule" 节点。此后，该 Mod 将在游戏启动器中出现。

子Mod 可以定义在运行时加载的 DLL。这些 DLL 应该包含继承自 "MBSubModuleBase" 的 Class，其名称应该与 xml 中的 "SubModuleClassType" 节点一致。该类将被构造，并被调用某些回调，这样 od 就可以将其行为注册到游戏中。

##### Mod 层次结构

Mod 可以具有多个文件夹，其中包含不同类型的内容：

{{% notice info %}}

* bin: 编译后的DLL应该放在 "bin/Win64_Shipping_Client"文件夹内，这样游戏才能找到并加载DLL。
* Atmospheres: 此文件夹包含可在游戏中使用的不同环境 (Atmosphere) 模板。可以从编辑器将新的环境保存到任何 Mod。
* AssetSources: 此文件夹包含资产的来源。编辑器将资产导入此文件夹。在发布 Mod 之前可以过滤掉这个文件夹。关于向模块添加新内容的更多信息，请参见 <strong>[添加&覆盖资产]({{< ref "overriding_assets.md" >}})</strong>。
* Assets: 此文件夹包含从内容源派生的资产数据。它仅在 mod 开发阶段使用。在发布 mod 之前，该文件夹可能会被过滤掉。
* AssetPackages: 当模块的内容工作完成后，内容创建者应该开始 "Publish" 操作，为内容的发布做好准备。此文件夹包含了被发布的资产。
* GUI: 此文件夹包含任何新的可供游戏使用的GUI元素，预制件或笔刷。
* ModuleData: 此文件夹有许多包含了重要游戏逻辑的 xml 文件。"project.mbproj" 文件管理着将被加载到该文件夹内的 xml 文件。这些 xml 涵盖了从动画和套装到阵营、部队、物品等内容。
* NavMeshPrefabs: 导航网面组可以在编辑器中保存为模板，方便插入到多个场景中。此文件夹包含了这些内容。
* Prefabs: 此文件夹包含了预制件的XML。更多信息，请看 <strong>[实体&预制件]({{< ref "prefabs.md" >}})</strong>。
* SceneObj: 此文件夹保存着从任何编辑数据中剥离出来的场景数据。没有地形的场景只能存放在这个文件夹中。
* SceneEditData: 包含每个场景的地形编辑数据。此文件夹可以在发布mod之前过滤掉。

{{% /notice %}}
