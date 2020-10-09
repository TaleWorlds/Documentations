+++
title = "Terrain Mesh Blend System"

[menu.main]
identifier = "terrain_mesh_blend_system"
parent = "core_components"
+++

We introduce a new terrain mesh blending system. Certain terrain layers can blend into chosen meshes. Blend height, smoothness and random height offsets can be changed. These values can be saved to prefabs and can also be changed in scene per mesh. Heightmap blending can also be used to change the blending behaviour with respect to the mesh's heightmap.

| With Blending | Without Blending |
| ------ | ------------ |
| ![](/img/terrain_mesh_blend/with_mesh_blend.png) | ![](/img/terrain_mesh_blend/without_mesh_blend.png) |

### Terrain Layer Restrictions

Terrain layers should satisfy some restrictions before they are eligible to be a mesh blend layer.

- Diffuse texture should have (2048 , 2048) dimensions and have a DXT1 format(without alpha).
- Normal texture should have (2048 , 2048) dimensions and have a BC5 format.
- Specular texture should have (2048 , 2048) dimensions and have a DXT1 format.
- Layer should not have 'diffuse alpha' or 'ground slope' flags enabled.

### Material Properties

The mesh should have a material with shader "terrain_mesh_blend_shader". To enable heightmap blending, one should assign an heightmap texture and enable the shader flag "".

### Mesh Properties

One can change the mesh's properties from the Components/Mesh/Vector Arguments windows in Entity Inspector. 

- Blend Height Threshold : Maximum distance for terrain blend
- Blend Smoothness : Higher means more smooth transitions
- Random Amount : Blend height threshold can be incresed or decreased with this value with respect to the position of pixel
- Random Tile : Adjusts the tile of the random heightmap adjustment
- Heightmap Factor : Controls the heightmap factor of the mesh. More means less blending in the higher parts of the heightmap.

![](/img/terrain_mesh_blend/editor_props.png)
 
