+++
title = "Distance Tool"

[menu.main]
identifier = "distance_tool"
parent = "core_components"
+++

## Distance Measure Tool
The <b>Distance Tool</b> measures the distance between two points in the scene.
Distance measure mode can be activated by either pressing <b>Alt + D</b> shortcut or the respective button on the editor toolbar. 

While holding the <b>left mouse button</b>, drag the mouse between two points in the scene to measure distance. The tool snaps to vertices if close enough to a one by default, holding down <b>Left Shift</b> overrides this.

The tool can be de-activated by pressing <b>Alt + D</b> or the respective button on the editor toolbar again. For further use, the gizmos stay visible even after the tool is de-activated. Pressing <b>Alt + Shift + D</b> clears these gizmos from the screen.

![](/img/distance_tool/distance_tool_gizmos.png)
<center><b>Helper Gizmos</b></center>

* <b>Green line</b> shows the actual distance between points.
* <b>Blue lines</b> show the lateral and longtidunal distances.
* <b>Yellow circle</b> depicts the range.