+++
title = "Meta Mesh Editor" 
+++

#### Import Settings
* Divide Into Grid: Divides the meta mesh into grids, and adds all the generated section meshes to the submeshes.
* Remove Redundant Vertices: The name implies what it does.
* Recompute Normals: While importing the meta mesh, computes normal vectors for all sub-meshes instead of importing them as well.
* Normal Computation: Decides whether the normal vector computation will depend on the face area (weighted) or not (default).
* Recompute Tangents: While importing the meta mesh, computes the tangent vectors for all sub-meshes instead of importing them as well.
* Whiten: Linear interpolation amount between the vertex color and white per each color channel.

#### Lod Meshes
* All the active sub-meshes of the meta mesh can be seen here. The material properties, mesh parameters and tags can be changed via the interface.

![](/img/meta_mesh_editor/lods.PNG)

#### Unused Meshes

* This shows the activity situation of the sub-meshes. If the ignore checkbox is checked, this means that the corresponding sub-mesh is inactive. After changing status of the lod meshes, please press "Apply Ignores" button for your changes to take place and be saved.

![](/img/meta_mesh_editor/ignored_meshes.png)

#### Save
* Saves all the changes done to the meta mesh.