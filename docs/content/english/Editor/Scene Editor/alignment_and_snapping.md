+++
title = "Alignment and Snapping Tools"

[menu.main]
identifier = "alignment_and_snapping"
parent = "core_components"
+++

## Pivot Alignment Tool
The <b>Pivot alignment tool</b> applies the chosen transform values of one entity to another entity. The tool makes it easier for users to create overlapping or precisely aligned entities. 
If an entitity is selected in the editor, the user can set up the alignment tool by pressing <b>Alt + A.</b> This will register the currently selected entity as the input entity. Selecting a second entity with the <b>left mouse button</b>, will then open the interface screen of the alignment tool.  

![](/img/alignment_and_snapping/pivot_alignment_ui.png)
<center><b>(Pivot Alignment Tool User Interface)</b></center>

* <b>Translation checkboxes</b> will translate first entity on the given axis/axes.
* <b>Rotation checkboxes</b> will rotate the first entity without breaking the local scale. Up, side and forward vectors will be aligned depending on the checkboxes.
* If the <b>scale checkboxes</b> are checked, first entity’s scale component of the selected axis or axes will be set as second entity’s scale value which is shown at the inspector.
* If checkboxes are unchecked, first entity will be transformed to its initial frame.
* <b>Align by Pivot</b> button will apply the alignment depending on the active checkboxes and close the interface.
* <b>Revert and Close</b> button will transform the entity to its initial frame and revert any transform operation applied to pivot. 

### Example Usage
![](/img/alignment_and_snapping/pivot_alignment_a.png)
<center><b>(Initial position of bowl and candle)</b></center>
![](/img/alignment_and_snapping/pivot_alignment_b.png)
<center><b>(Pivot alignment in only y-orientation)</b></center>
![](/img/alignment_and_snapping/pivot_alignment_c.png)
<center><b>(Complete pivot alignment)</b></center>

## Surface Snapping Feature
The <b>Surface Snapping Feature</b> allows a user to snap an entity's pivot to the surface of another entity. Holding down the <b>I hot-key</b> continuously snaps the pivot of the currently selected entity to a surface that the mouse cursor intersects with. 
 <b>Control + Z</b> reverts the transformation. This feature aligns the entity’s local y vector with the intersection point’s normal map, so it won’t require the user to make additional adjustments to align the entity with the surface.

 Beware that this will lead to clipping, if the pivot of the entity that you seek to snap to a surface is not located on its own surface.

### Example Usage
![](/img/alignment_and_snapping/surface_snap_a.png)
<center><b>(Pot is snapped to the side surface of the box.)</b></center>
![](/img/alignment_and_snapping/surface_snap_b.png)
<center><b>(Pot is snapped to the upper surface of the box.)</b></center>
![](/img/alignment_and_snapping/surface_snap_c.png)
<center><b>(Pots are surface snapped to each other.)</b></center>

## Vertex Snapping Feature
The <b>Vertex snapping feature</b> allows users to choose any vertex from a selected entity and place that vertex in the same position as any vertex from another entity of their choosing.

![](/img/alignment_and_snapping/vertex_snap_fence.png)
<center><b>(Two fence entities are vertex snapped to each other.)</b></center>

<b>Alt + V</b> activates and deactivates the vertex snapping feature. It only becomes active if an entity has been selected in the editor. There is a button on the editor toolbar as well, which acts like the hot-key.  

![](/img/alignment_and_snapping/vertex_snap_button.png)
<center><b>(Toolbar button for activating/deactivating vertex snapping)</b></center>

After activating the tool and while the <b>left mouse button is in a “down” state</b>, the chosen entity’s selected vertex will continuously snap to the vertex of another, highlighted entity that is closest to the mouse ray’s intersection point. If the distance between the intersection point and the closest vertex is bigger than 2.0f or there is no second entity highlighted, nothing will happen. 

Also, a yellow sphere will be rendered on the vertex to provide head-up display. Thus, user can choose any vertex by moving the mouse. This will be the first vertex. Also, sphere is scaled with respect to camera position’s distance.

![](/img/alignment_and_snapping/vertex_snap_cur_vertex.png)
<center><b>(Current vertex is shown with yellow sphere.)</b></center>

After deciding on the first vertex, the snap operation can be done by <b>holding down the left mouse button</b> and moving the mouse. 
 
### Example Usage
![](/img/alignment_and_snapping/vertex_snap_a.png)
<center><b>(First vertex is shown with yellow sphere.)</b></center>
![](/img/alignment_and_snapping/vertex_snap_b.png)
<center><b>(Snapping path is shown with a yellow line.)</b></center>
![](/img/alignment_and_snapping/vertex_snap_c.png)
<center><b>(If snapping is successful line color becomes green.)</b></center>
![](/img/alignment_and_snapping/vertex_snap_d.png)
<center><b>(Two cubes are snapped to each other by vertex.)</b></center>

If user releases the left mouse button when the line’s color is green, the snap will be successful. If user releases the left mouse button when the line’s color is yellow, there won’t be any snap and entity will be translated to its initial frame.

### Axis Constraints
When snap tool is active, you will see a gizmo on top of the nearest vertex. You can use axes of this gizmo to constraint axial movement or drag from middle to snap freely.