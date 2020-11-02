+++
title = "地形网格混合系统"

[menu.main]
identifier = "terrain_mesh_blend_system"
parent = "core_components"
+++

在此介绍一个新的地形网格的混合 (blending) 系统。特定的地形 (terrain) 层可以和选中的网格 (mesh) 混合起来。可以修改混合的高度，平滑度以及随机高度偏移量。

这些值可以存在预制件 (prefabs) 中或者是在场景中根据网格而改变。高度图 (Heightmap) 混合还可以根据网格的高度图来改变不同的混合行为。

| 有混合 | 没有混合 |
| ------ | ------------ |
| ![](/img/terrain_mesh_blend/with_mesh_blend.png) | ![](/img/terrain_mesh_blend/without_mesh_blend.png) |

### 地形层限制

地形层需要在变成网格混合层 (mesh blend layer) 之前满足一部分限制。

- 漫反射贴图 (Diffuse Texture) 应该有 (2048, 2048) 尺寸并且是 DXT1 格式 （没有 alpha）。
- 普通贴图 (Normal Texture) 应该有 (2048, 2048) 尺寸并且是 BC5 格式。
- 高光贴图 (Specular Texture) 应该有 (2048, 2048) 尺寸并且是 DXT1 格式。
- 每一层级不应该应用 “diffuse alpha” 和 “ground slope” 标记 (flag)。

### 材料属性

网格应该有一个带着 “terrain_mesh_blend_shader” 着色器 (shader) 的材料。为了应用高度图混合，需要指定一个高度图纹理并应用着色器的标记。

### 网格属性

可以从实体查看器 (Entity Inspector) 的 Components/Mesh/Vector 参数窗口中改变网格属性。

- 混合高度阈值：地形混合的最大距离。
- 混合平滑度：更高的值意味着更平滑的转移。
- 随机量：混合高度阈值可以根据这个值在像素点的位置增加或者减少。
- 随机瓦片 (Tile)：调整随机高度图修改的瓦片。
- 高度图因子 (Factor)：控制网格的高度图因子。更大意味着在高度图更高的位置，混合的更少。

![](/img/terrain_mesh_blend/editor_props.png)
 
