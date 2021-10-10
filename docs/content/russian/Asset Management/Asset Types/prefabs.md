+++
title = "Entities & Prefabs"
description = ""
weight = 1
+++


In RGL, entities are containers for all of the meshes, particles, script components, occluders and physics objects. They can also contain other entities as children. They have their own transformation that determines their position, scale and rotation in the world. 

##### Prefabs

Prefabs are template entities which do not sever the connection to the prefab even after it is saved in a scene. Complex entities can be constructed one time and saved as a prefab to be used at any time, in any scene. Later updates to the prefab will affect the already done scenes as well. In Bannerlord, nearly all of the mission objects and scene props are prefabs. 

##### Connection Rules

Once a prefab is placed into a scene, all of the values under prefab(mesh colors, child entity transforms, script values) are connected to the original prefab and will be updated after every change to the original one.  Any change in the scene for those values will sever the connection.  Beware that any “Addition” operation to the prefab in the scene, will break the prefab connection all together. Examples: adding a new mesh, particle system, light, child entity or script component.


