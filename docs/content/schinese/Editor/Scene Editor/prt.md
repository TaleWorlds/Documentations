+++
title = "预计算辐射传递 - GI系统"

[menu.main]
identifier = "prt_system"
parent = "core_components"
+++

我们为引擎引入了一个新的全局照明系统。它是基于一个叫做"Precomputed Radiance Transfer"的预制系统。该技术允许我们在场景中烘焙本地环境，并在运行时以优化的方式显示。烘焙的数据是独立于氛围的。因此，我们可以为每个氛围使用相同的烘焙数据来照明场景。

| 使用后 | 使用前 |
| ------ | ------------ |
| ![](/img/prt_system/prt_ss_gi.png) | ![](/img/prt_system/prt_ss_sky_access.png) |

### 烘焙过程 Baking Procedure

场景烘焙分为两个部分：

- 首先，艺术家应该放置边界探头，以确定场景的GI边界。

附注1：如果要尽量减少GI的边界（不要延伸到远离可导航区处），可以减少网格尺寸，这样在城镇内最重要的地方就会有更高的精度。对于城镇场景，我们一般使用宽1.5米、高2.5米的网格尺寸。

附注2：对于GI边界外的像素，我们使用场景中的后备探头。默认情况下，我们使用的是GI顺序中靠近左角的最高活动探头。艺术家可以通过先选择探头，并在用户界面中选中"Fallback Probe"复选框。从场景中选择任何其他探头。

![](/img/prt_system/grid1.png) ![](/img/prt_system/grid2.png)

- 在下一个通道，创建GI探针。探针的初始位置是使用场景的导航网格自动计算获得的。 通过导航网格，我们将探针放置在代理可以移动的地方，同时也放置在这些导航点可见的任何地方。探针是在一个三维网格结构中生成的。每一个探针位置都会计算出一个方向性的环境数据。 使用这些环境光值，屏幕中的每个像素都会被最近的8个探针照亮。在某些情况下，当相邻探针之间的光照相差非常大时，就会出现漏光或漏影现象。为了解决这些问题，我们会像点光源一样，从探针中渲染出阴影图。带有阴影图的探头被命名为可见度探头（"Visibility Probes"）。为了解决内存使用问题，可见度探头的最大数量不得超过2048。在自动放置阶段，系统也会尝试寻找最可能的漏光位置，并将这些探头分配为可见度探头。它考虑到了环境光差。对于额外的漏光修复，系统会闲置最后5%的可见度探头，以便场景设计师使用它们修复剩余的漏光问题。

![](/img/prt_system/prt_probes.png)
![](/img/prt_system/diffuse_ambient.png)

### PRT Files

prt_data.bin 位于 SceneObj 文件夹内，是去掉任何编辑数据的压缩版本。这个文件应该被发送到源代码控制系统。另一个文件是编辑数据文件。它非常大(大约2 - 3 GB)，会自动发送到网络中的edit data文件夹。一旦你在编辑器中打开一个预制场景，只有压缩数据被加载。为了能够编辑烘焙数据，你应该在PrtInspector的 "General Info "面板上用 "Load "按钮加载编辑数据。

**重要节点**：在对 prt 数据进行任何修改后，不要忘记在PrtInspector的"General Info"面板上点击"Save"按钮保存数据。

### PRT 操作

![](/img/prt_system/gi_operations_tab.png)

- **Load** : 服务器载入编辑数据。
- **Save** : 将当前的编辑数据保存到服务器上。
- **Auto Height Boundary** :  根据场景的最小/最大高度自动调整 PRT 边界探头的高度。
- **Bake Single Level** :  用当前使用级别烘培场景，应该用于内部场景。
- **Bake All Levels** :  用预定义的多级（即level-1/level-2/level-3和siege/civilian）组合烘培场景。


### 探针放置参数 Probe Placement Parameters：
- **Grid Width**：确定XY平面中探针网格单元的大小。对于城镇，可以使用1.5。对于室内场景，可以使用0.5至1.0。
- **Grid Height**：确定探针网格单元的高度。对于城镇，应使用接近2.5的值。对于室内场景，可以使用0.5至1.0。
	 
### 选择工具 Selection Tools:
为了保证快速、顺利编辑的探针，我们采用了多种选择工具。

- **Select All** :  选择所有的探针。
- **Grow** : 增长选区以包括XY平面上的邻近探针。
- **Shrink** : 将选区缩小到只包括XY平面上的邻近探针。
- **Fill** : 查找当前选择的探针组的内部探针并选择它们。
- **Select Border** : 查找并选择当前选区的边框探针。
- **Select Inner Border** : 查找并选择当前选区的内边框。
- **Select Outer Border** : 查找并选择当前选区的外边框。
- **Lasso Tool** : 我们实现了一个屏幕空间的套索工具，以方便选择一组探头。可以通过按'r'开始，并通过双击或再次按'r'完成。

![](/img/prt_system/lasso.png)

### Visibility Tools

- **Show Active Probes** ：显示所有活动的探头
- **Show Deactive Probes** ：显示停用的探头。
- **Show Visibility Probes** : 显示可见性探头（为了防止漏光，计算可见性的探头）。
- **Level To Show** :  选择要显示的Z级。-1表示所有级别。
- **Show Probe Radius** ：确定调试可视化的探头半径。
- **Box Tool** :  启用一种模式，在这种模式下，您可以用.NET技术进行调试。

旁注：本系统只渲染相对于摄像机最近的100个探头。

### 有用的快捷键

- **Left Ctrl + x**: 启用/禁用所选探头
- **Left Ctrl + c**: 切换"可见度探头"状态。
- **Left Alt + Left Mouse Click**：选择影响某个像素的探头。(非常平滑的修复漏光问题的工具，选择像素，使用切换可见性状态的快捷方式来修复问题) 


