+++
title = "Path Editing"
description = ""
weight = 1
+++

Level designer can easily add, edit or delete paths and path points by the scene editor.

##### Adding a new path

User can use the Add New Path button at the upper toolbar. User should enter a unique name for every path. After the path is added, the editor's editing state will become "Path Select". By spacing either space or the "Add a new path point" button from the upper toolbar, user can transition to the "Path Node Add" mode and start adding new path nodes. At every click one more path node will be added to the current selected path. By pressing space again, user can start selecting and editing the existing path nodes. Every path node has three transform points. These are the center(cube) and the two tangents(spheres). User can hover onto them and select them by pressing the left mouse button. Then, pressing "T" button will spawn the transformation triad which can be used to move these points. Every operation can be undone by the "Control z" key combination. Selected path nodes can be deleted via the "Del" key. A path can be deleted by selecting the path and hitting the "Del" button. Also, to select another path, one can just hover into one of its node poinmts and pressing the left mouse button.

| Add a new path | Add a new path point | Select a path point |
| ------------ | ------------ | ------------ |
| ![](/img/path_editing/add_path.png) | ![](/img/path_editing/add_path_point.png) | ![](/img/path_editing/select_path_point.png) |

