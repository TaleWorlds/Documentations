+++
title = "导航网格查看器"
description = ""
weight = 20
+++

#### 工具
这些工具可以帮助您生成和操作导航网格：

#### 生成工具（Generation Tools）

![](/img/inspectors/nav_mesh_inspector/generation_tools.PNG)

* Auto Generate: 顾名思义，将根据上述参数自动生成导航网格物体。
* Generate Grids: 仅为地形生成格子状导航网格。它会忽略场景中的实体。
* Create New Face: 在相机所在的坐标上创建一个新的导航网格四边形面。
* Extrude: 
* Remove: 删除选定的导航网格边。
* Fill: 在选定的导航网格顶点之间填充并形成一个面。
* Grow Selection: 选择选定元素的相邻元素来扩大选择范围（适用于所有顶点，边和面结构）。
* Connect: 绘制一条边来连接选定的两个导航网格顶点。
* Subdivide: 通过在顶点的中间放置一个顶点来划分它。该顶点连接到相邻的顶点并划分感兴趣的面。
* Weld: 移除边而代之以单个顶点。它将旧边的相邻顶点连接到新生成的顶点。
* Import Faces From Prefabs: 导入之前导出的面。
* Import Body: <not_known>
* Make Quads When Possible: 选择相邻的三角形面，这些面可以构造四边形（不形成凹多边形）。这不会构造出具有最大表面积的面的最佳导航网格，但是它将局部选择形成最大表面积的三角形。仍然会大大减少面的总数。

#### 调试工具（Debugging Tools）

![](/img/inspectors/nav_mesh_inspector/debugging_tools.PNG)

* X-Z Keys: 每个键放入两个不同的球体，当两个球体都放入时，给出这两个球体之间定义路径的统计。
* Select Vertices Below Entities: 选择实体下面的顶点。
* Select Unwalkable Edges: <not_known>
* Fix Concave Faces: 使凹面凸出。
* Select Unconnected Faces: <not_known>
* Calculate Auto Weld Points: <not_known>
* Select Inverted Faces: 查找并选择面向地形的反面。
* Find Path: <not_known>
* Paste Copied Faces: 粘贴复制的面。
* Copy Selected Faces: 复制选定的面。
* Export Faces as Prefab: 导出所选面以供以后使用。
* Ensure Faces Are Not Below Ground: 确保面不在地下。
* Remove Unreachable Faces: 删除孤岛面（其中有一个生成点）。（生成点是根据Prefabs/editor_spawnpoints.xml中的实体来确定的，该实体还包含AnimationPoint脚本。）
* Find Tight Faces: 查找表面积低于所需值的面，然后选择它们。您可以按“删除”按钮删除这些面孔。完成此操作后，请不要忘记“删除未使用的顶点”，我将在下面提到几行。
* Remove Unused Vertices: 删除未连接到任何面的顶点。
* Select Vertices At The Edges: 选择仅连接到2条边，因此不成为连续面组件的一部分的顶点。
* Select Vertices Without Edges: 这将只选择未连接到任何边或面的面。
* Mark Elevation Problem Faces: 到底部（网格或地形）的距离大于1.2米的面将被选中以进行调试。

#### 自动生成参数（Auto Generation Parameters）

![](/img/inspectors/nav_mesh_inspector/auto_generation_parameters.PNG)

这些参数决定导航网格生成的精度、扩展和操作细节。参数说明如下：

* Build Detailed Nav Mesh: 选中此框将使用以下参数，并根据这些参数构建详细的导航网格物体。如果未选中，则以下参数不会生效。
* Cell Size: 定义Recast库测试的样本体素的水平边缘长度。
* Cell Height: 定义Recast库测试的样本体素的垂直边缘长度。
* Agent Max Slope: agent可以攀爬的最大角度（单位度）。
* Agent Height: agent高度。
* Agent Max Climb: agent每次攀爬的最大幅度。
* Agent Radius: agent可以攀爬的半径。
* Edge Max Length: Recast库生成的多边形的最大边长。
* Edge Max Error: 简化后的等高线边界与原始等高线的最大偏差。(定义来自Recast文档)
* Region Min Size: 允许形成孤岛区域的细胞[voxels]的最小数量。(定义来自Recast文档)
* Region Merge Size: 跨度计数小于此值的任何区域，将与较大的区域合并。(定义来自Recast文档)
* Detail Sample Distance: 设置生成细节网格时要使用的采样距离。仅适用于高度细节。(定义来自Recast文档)
* Detail Sample Max Error: 细节网格面与高度场数据的最大距离。仅适用于高度细节。(定义来自Recast文档)


### 自动生成步骤 (Auto Generation Steps)
* 首先，在“参数”标签中填写空白字段。您可能还希望保留默认参数。
* 单击“自动生成”按钮（生成工具），然后等待操作结束。
* 单击“在可能时制作四边形”按钮（生成工具）以对形成凸形的三角形进行四边形化。
* 点击 "查找紧面 "按钮（调试工具），查找并选择边框上的紧面。
* 按下键盘上的“删除”按钮以删除这些选定的面。
* 如果边框上仍然出现紧面，请应用相同的步骤，直到结束为止。
* 单击“删除未使用的顶点”按钮（调试工具）以删除不再连接到任何面的顶点。
* 手动校正由于去除了紧密面而破裂的区域。
* 您可以使用前面提到的工具进一步调试和完善。
