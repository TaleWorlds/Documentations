+++
title = "距离工具"

[menu.main]
identifier = "distance_tool"
parent = "core_components"
+++

## 测距工具

<b> Distance Tool </b> 可以测量场景内两个点之间的距离。
可以通过按 <b> Alt + D </b> 快捷键 或者点击编辑器工具栏上的对应按钮来激活距离测量模式 (Distance Measure Mode)。

使用时，按住 <b> 鼠标左键 </b>，在场景内从一个点拖动鼠标到另一个点来测量距离。如果靠近一个点过近，工具会默认吸附在顶点上，按住 <b>Left Shift</b> 来取消吸附。

这工具可以通过按 <b> Alt + D </b> 或者点击编辑器工具栏上对应按钮来取消该模式。为了以后方便，测量的图标 (Gizmo) 在取消模式后也会一直可见。按住 <b> Alt + Shift + D </b> 来清除屏幕中的测量图标。

![](/img/distance_tool/distance_tool_gizmos.PNG)
<center><b> 辅助性的图标 </b></center>

* <b> 绿线 </b> 展示了点之间的实际距离。
* <b> 蓝线 </b> 展示了经纬度坐标距离。
* <b> 黄圆 </b> 描述了范围。