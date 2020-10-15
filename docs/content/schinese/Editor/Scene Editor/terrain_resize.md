+++
title = "调整地形大小"

[menu.main]
identifier = "terrain_resize"
parent = "core_components"
+++

## 调整地形大小

如果需要，地形节点数量可以在 <b>Terrain Inspector</b> 的 <b>Resize Terrain</b> 面板调整。

![](/img/terrain_resize/resize_panel.PNG)

* 你可以从 4 个方向添加新的节点或移除已有的节点。+X, +Y, -X, -Y（分别是南，东，北，西）（上色和 Gizmo 一致）
* 添加和移除节点会自动重新在新的位置分配现存的实体 (entities) 和植物 (floras)。新的节点由于他们的高度信息还未定义，可能会显得无法和其他地形连接。设计者应该可以用编辑器内置的高度笔刷 (Height Brushes) 来修改，或者导出高度图在其他高度图生成软件中修改，之后在导入回编辑器中。
* 如果在地形的一边输入正数，那么地形像那一边扩展那么多的节点。如果你往每一边写了 +2，那么地形就会像每一边扩展 2 格。如果你写了 +3 在 +X 方向，其他方向为 0 那么地形只会往 +X 方向扩展 3 格。
* 如果你输入一个负数，那么将会减少相应的节点数。
* 如果你输入 0（默认值），那么将不会有改变。

| 添加 | 删除 |
| ------------ | ------------ |
| ![](/img/terrain_resize/append.PNG) | ![](/img/terrain_resize/delete.PNG) |
