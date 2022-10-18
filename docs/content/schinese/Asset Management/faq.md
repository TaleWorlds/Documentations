+++
title = "常见问题解答"
weight = 10
+++

##### 如何安装工具？

从 Steam 库的工具部分中找到并下载“Mount & Blade Bannerlord Modding Tools”。请注意，本工具会使用部分已经下载好的游戏本体的文件，因此，工具的版本应与游戏版本一致并且应与游戏本体安装在同一驱动器中。

##### 如何启动工具？

选择启动器中的 Singleplayer 选项并启动，等你进入到游戏主菜单界面后，你既可以单击 Editor 启动编辑器，也可以按下组合键 Ctrl + E 来启动编辑器。

##### 如何创建你自己的模组？

我们在编辑器里内置了一个功能，可以直接创建一个有 XML 模板文件的模组，方便你快速开始添加新内容。打开编辑器后，在顶端工具栏的“File”菜单下找到“Create New Module”选项，点击它。请注意，你需要重启游戏来让启动器识别该模组。

##### 如何编辑游戏本体(Native)资源？

你无法直接编辑游戏本体资源，但你可以在你的模组中覆盖掉它们。详情请参阅： <strong>[添加&覆盖资产]({{< ref "overriding_assets.md" >}})</strong>

##### 我无法添加新模型、材质等

你无法直接向游戏本体添加资源，你需要在你自己的模组里添加它们。  
首先，你需要新建一个模组：<strong>[快速入门指南]({{< ref "quickguide_create_a_mod.md" >}})</strong>  
更多关于添加新的资产的信息请参阅： <strong>[添加&覆盖资产]({{< ref "overriding_assets.md" >}})</strong>  

##### 可供参考的示例场景？

empire_village_003  
khuzait_castle_002  
sturgia_town_b  
battle_terrain_v  
empire_castle_keep_a_l3_interior  
empire_house_c_tavern_a  
empire_dungeon_a  
arena_empire_a  
Main_map  

##### 在哪能找到示例资产？

你可以从资源浏览器(Resource Browser)中查看这些游戏本体的资源，但没有源文件提供，因此你也无法导出它们。我们很快会提供一些示例的源文件。

##### 我有包含 DLL 文件的模组然后我的工具无法启动？

如果你有任何包含 DLL 文件的模组，请确保它们同样被复制到了 Modules\MOD_NAME\bin\Win64_Shipping_wEditor 目录下。

##### 我的模组工具无法启动

请确定你的机器安装了 Visual Studio 2013 Redist x64。此外，请检查你的游戏本体版本是否与模组开发工具版本相匹配。如果完成了以上检查仍旧无法启动，你可以在官方论坛的modding forums分区下的“Bug & Crashes”板块发帖反馈：https://forums.taleworlds.com/index.php?forums/bug-crash-reports.784/
