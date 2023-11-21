+++
title = "Decals"

[menu.main]
identifier = "decal"
parent = "core_components"
+++

## What is a Decal?

Decals are a way of projecting materials into other geometries. They can affect the following channels of the PBR shading pipeline: Albedo, Normal, Specular, Gloss and Occlusion. Thus, changing the final appearance of other meshes and materials. They can be used to add variety to the scene like dirt, mud, moss. Also, they are a usefull tool to break texture tiles on the meshes. Their projection geometries are cubes and they are projected in the Z direction. 

## How to Setup a Decal Material?

First of all, shader of the material should be "Decal". Diffuse, NormalMap and SpecularMap can be set to any texture. The shading model will be same as "pbr_metallic". 
![](/img/decal/top_properties.png)

#### Material Shader Flags

Material shader flags dictates which shading properties will be used and the types of objects that the decal will be visible. Note: "use_albedo" is a must. A typical example for a decal material which will be visible on all of the materials is as follows. 
![](/img/decal/material_shader_flags.png)

#### Mandatory Settings at the 'Others' Tab

In order for the decal to be rendered correctly, "Cull Front Faces" and the "Don't Modify Depth Buffer" flags should be enabled. 
![](/img/decal/other_settings.png)

## How to Setup a Decal Prefab?

To create a decal entity/prefab, a specific mesh (Decal Mesh) should be added to an empty entity. Then, the material of that mesh should be chaned to the material that we prepared in the first section. Finally, under the Components/Meta Mesh/Custom Mesh Parameters, UV Scale X/Y values should be set accordingly. For a regular texture, those values should both be 1. For a atlas type texture, UV Scale and UV Offset values should be set to focus on the desired texture position inside the atlas. 
![](/img/decal/entity_setup.png)
