+++
title = "对齐和捕捉工具"

[menu.main]
identifier = "alignment_and_snapping"
parent = "core_components"
+++

## 枢轴对齐工具
The <b>枢轴对齐工具</b>(Pivot alignment tool) 把一个实体的选定变量用在另一个实体上。这个工具能让用户更容易做出精确对齐和重叠。
在选中编辑器的实体后，用户可以按<b>ALT+A</b>就能设置对其工具。这就把选定的实体注册为输入的实体。选择第二个实体然后按<b>鼠标左键</b>，就能打开对齐工具的界面。

![](/img/alignment_and_snapping/pivot_alignment_ui.png)
<center><b>(枢轴对齐工具用户窗口)</b></center>

* <b>轴线复选框(Translation checkbox)</b> 会把第一个实体根据所选择的轴线进行平行移动。
* <b>旋转复选框(Rotation checkbox)</b> 会在保持原有大小的基础上对实体进行转换。各轴的数值会复选框来对齐相应的位置。
* <b>比例复选框（scale checkboxes）</b> 选择后，第一个实体所选的轴会被设置为第二个实体的比例值，会显示在框中。
* 如果没有选中复选框，那么第一个实体就会转换为初始框架。
* <b>轴线对齐（Align by Pivot）</b> 按钮会根据启动的复选框来对齐并关闭界面。
* <b>还原并关闭（Revert and Close）</b> 按钮会更改实体的初始框架并退出。

### 使用案例
![](/img/alignment_and_snapping/pivot_alignment_a.png)
<center><b>(蜡烛和碗的初始位置)</b></center>
![](/img/alignment_and_snapping/pivot_alignment_b.png)
<center><b>(只在Y轴对齐)</b></center>
![](/img/alignment_and_snapping/pivot_alignment_c.png)
<center><b>(完全对齐)</b></center>

## 表面捕捉功能
<b>表面捕捉功能（Surface Snapping Feature)</ b> 能让玩家用一个实体在另一个实体的表面轴线进行捕捉，按住<b>I 键</b> 并持续地将所选实体在另一个实体的表面进行捕捉。<b>CTRL + Z</b>还原转换。这个功能能让实体对象的局部Y轴的法线图进行对齐，所以不需要用户做额外的调整来对齐表面。

注意，如果你想对齐的实体的轴线不在表面时，就可能会造成穿模。

### 使用案例
![](/img/alignment_and_snapping/surface_snap_a.png)
<center><b>(罐子放在了箱子的侧面)</b></center>
![](/img/alignment_and_snapping/surface_snap_b.png)
<center><b>(罐子放在了箱子的正上方)</b></center>
![](/img/alignment_and_snapping/surface_snap_c.png)
<center><b>(多个罐子黏在了一起)</b></center>

## 顶点捕捉功能
<b>顶点捕捉功能（Vertex snapping feature）</b> 能让玩家去选择所选实体的顶点并放在另一个实体的顶点上。

![](/img/alignment_and_snapping/vertex_snap_fence.png)
<center><b>(两个栅栏恰好在互相的顶点捕捉)</b></center>

按<b>Alt + V</b> 即可启动和关闭这个顶点捕捉功能。只能在选择实体后才能启动。编辑器工具栏也有个按钮，可以当作快捷键 

![](/img/alignment_and_snapping/vertex_snap_button.png)
<center><b>(编辑器工具栏的顶点捕捉功能)</b></center>

在启动这个功能后，<b>按鼠标左键就是“向下”的状态</b>，选择的实体顶点会持续捕捉另一个顶点，高亮的实体会和最接近的顶点互动。如果相交点和最近的顶点之间的距离大于2.0f或没有突出显示第二个实体，则不会发生任何事情。

还有，显示的黄色球体就是高亮的顶点。因此，玩家可以移动鼠标选择任意顶点来。而且球体的大小是根据摄像头的距离放大缩小。

![](/img/alignment_and_snapping/vertex_snap_cur_vertex.png)
<center><b>(目前所选顶点在黄色小球上)</b></center>

在选择好顶点后，<b>按住鼠标左键</b> 即可进行顶点捕捉操作
 
### 使用案例
![](/img/alignment_and_snapping/vertex_snap_a.png)
<center><b>(选中第一个实体的黄色顶点)</b></center>
![](/img/alignment_and_snapping/vertex_snap_b.png)
<center><b>(黄色线段是捕捉路径)</b></center>
![](/img/alignment_and_snapping/vertex_snap_c.png)
<center><b>(成功捕捉顶点后，线条变成绿色)</b></center>
![](/img/alignment_and_snapping/vertex_snap_d.png)
<center><b>(两个方块的顶点贴合在了一起)</b></center>

当用户放开鼠标左键后线条变成绿色，显示为捕捉成功。如果线条是黄色，那么放开鼠标后不会有任何操作，并退回操作之前的状态。

### Axis Constraints （轴约束）
当捕捉工具被启动时，你会看最近的顶点有个gizmo。你可以用各轴的gizmo来限制轴的移动，或者从中间拖拽来自由捕捉。
