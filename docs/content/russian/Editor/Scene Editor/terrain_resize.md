+++
title = "Resizing Terrain"

[menu.main]
identifier = "terrain_resize"
parent = "core_components"
+++

## Resizing Terrain
If required, terrain node count can be resized at <b>Resize Terrain</b> panel in <b>Terrain Inspector</b>.

![](/img/terrain_resize/resize_panel.PNG)

* There are 4 direction that you can add new nodes, or remove existing nodes. +X, +Y, -X, -Y (South, East, North, West, respectively) (Coloring is consistent with Gizmo). \\
* Adding or removing nodes will automatically relocate existing entities and floras to their new locations. New nodes will have their height data unspecified, and may look unconnected to the rest of the terrain. Artist can (and should) easily fix this using in-editor height brushes, or can export the height map and modify using an external height map generation tool and then import back to the editor.\\
* Using positive values to a side will append that much new nodes to that side. If you write +2 to each side, terrain will expand by 2 nodes on each side. If you write 3 only to +X, and 0 (zero) to rest, terrain will expand by 3 nodes only on +X direction.\\
* If you write a negative value to a side, it will remove that much nodes from that side. \\
* If you write 0 (zero) to a side, there will be no modifications on that side. (default value)

| Adding | Deleting |
| ------------ | ------------ |
| ![](/img/terrain_resize/append.PNG) | ![](/img/terrain_resize/delete.PNG) |
