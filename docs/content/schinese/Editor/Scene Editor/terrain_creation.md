+++
title = "地形创建"
description = ""
weight = 1
+++

------------------
## 创建新地形

生成，删除和修改地形节点可以通过 **地形检查器 (Terrain Inspector)** —> **属性 (Properties)** 进行操作。

地形节点Terrain node是二维计算，分辨率和大小可以通过 **新地形属性 (New Terrain Properties)** 界面查看。

这些参数必须在创建之前就有指定数值，尽管可以在之后对各节点进行一一调整。


 | 
---- | ----
![](/img/terrain_generation/generate_terrain.png) | ![](/img/terrain_generation/generate_terrain_result.png)


## 调整节点属性

节点分辨率可以在选择节点后（选择多个节点就要按住CTRL选择）即可在 **节点属性（Node Properties）** 界面中调整。

这个功能可用于分辨率不太重要的地方来优化地形（如定居点之外，玩家无法进入的地方，或者水底）

![](/img/terrain_generation/resolution.png)


## 导入/导出材质地图或者高度地图

为了支持外部地形生成器，引擎可以导入导出地形材质地图或者高度地图。你可以通过导入各种图层（碎屑图，水流图，植被图，基岩图）和16 bit的高度地图来轻松生成想要的地形。要导入材质地图时，首先你必须创建一个新的地形图层，然后选择该图层，进入 属性 (Properties)，选择一些节点（CTRL+A 选择所有）然后点击 导入Materialmap材质地图 按钮。这样就会打开一个文件对话框让你选择文件，你可以选择8 bit的材质当作材质地图。你也可以用同样方法导入高度地图，高度地图8，16bit都可以（PNG或者源文件格式）。

 | | | | 
---- | ---- | ---- | ---- | ----
![](/img/terrain_generation/add_layer.png) | ![](/img/terrain_generation/import_weightmap.png) | ![](/img/terrain_generation/weightmap.png) | ![](/img/terrain_generation/weight_imported.png) | ![](/img/terrain_generation/height_imported.png)

