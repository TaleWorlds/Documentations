+++
title = "Naming Conventions"
description = ""
weight = 1
+++

To distinguish and organize assets and simplfy asset authoring process there are some predefined rules to consider.

##### Meshes

All meshes imported from a single geometry file(e.g. fbx) are grouped by their names. To add a LOD mesh simply append **".lod\<n\>"** to the name of your mesh. Here **n** is the number of lod.  
Consider an fbx file as below :

asset.fbx : 

- wall_damaged
- wall_damaged_v2
- wall_damaged_v2.lod1
- wall_damaged.lod1
- wall_damaged.lod2

Two meshes will be imported from asset.fbx file : wall_damaged, wall_damaged_v2. These meshes will have one and two lods respectively. If your modelling software does not support dots in names(e.g. Maya) you can also use "\_" insted of "." to specifiy lods(e.g. wall_damaged_v2_lod1).  
A mesh can not have more than one material so during import phase meshes wil be divided into submeshes according to material usages of polygons. Consecutive numbers will be appended to the names of these auto generated meshes. Consider a mesh **wall_damaged** using three different materials. Name of the imported mesh will be **wall_damaged** and it will have three submeshes with names **wall_damaged.1**, **wall_damaged.2**, **wall_damaged.3**.

{{% notice info %}}
During mesh import, materials defined in geometry files are not created. You should create materials manually with the same name they are referenced from geometry files.
{{% /notice %}}

##### Physics shapes

You can export physics shapes just like regular meshes. The only difference between a mesh and a physics shape is that name of physics shapes begin with "bo_" prefix. You can also export analytical capsules and spheres as well.

**Capsules**

If name of a node begins with **"bo_capsule"** it will be imported as an analytical capsule shape. Sizes of this capsule is determined by following rules : 

- Local XY axes assumed as the radial plane of capsule
- Local Z axis assumed as the direction of capsule(height)
- Scale of object in XY directions should be equal

Only orientation and extents of capsule nodes are used. Any content attached to them(like mesh) is ignored.

**Spheres**

If name of a node begins with **"bo_sphere"** it will be imported as an analytical sphere shape. Sizes of this sphere is determined by the extents of the node. Center of the node will also be the center of the sphere shape.
Only orientation and extents of sphere nodes are used. Any content attached to them(like mesh) is ignored.

**Composite Shapes**

You can combine different shape types to create more complex shapes. To export a composite shape you must create a node whose name begins with **"bo_composite"**. You can append child nodes with different shape types to this node.

- bo_composite_building1
 - bo_capsule1
 - bo_capsule2
 - bo_sphere
 - bo_building_walls

 This shape will be imported as a single asset with name **bo_composite_building1**.

##### Textures

You can provide basic hints for your texture by following by following these rules:

- Albedo textures ends with _d
- Normal textures ends with _n
- Specular textures ends with _s
- Heightmap textures ends with _h

Despite these rules are not obligatory, it will help engine to decide best compilation rules during first import and help some features of editor to work(e.g. auto completing normal texture slot of material). If your textures do not follow them you can change import settings later though.

##### Skeletons

Most of in-house assets are organized so that skeletons, meshes and animations using these skeletons are stored in separate files. So we follow some naming rules to correctly establish cross-references between these files. If you are also planning to import skeletons, meshes and animations from different files :

- Bone hierarchy of skeletons must match
- Every bone node should have its name ending with a hardcoded bone number(e.g. _0, _1) to make sure skeletons originating from different files have their bone numbers match regardless of export process of your modelling software or exporting tool. There are these rules that each bone name must follow :
 - Appended bone indices must start from zero
 - Appended bone indices must not be greater than or equal to number of bones
 - Two bones can not have same bone index

{{% notice info %}}
If you want to export only skeleton related assets(e.g. skinned mesh or animation) but not the skeleton itself -which is the case if you have a file you imported your skeleton from and you regularly import new meshes for that skeleton from different files- you should append **_notused** to the name of skeleton to make engine automatically ignore it and import only other assets.
{{% /notice %}}

Skeletons take their names from the root node of bone hierarchy in your geometry file. This is to let you name your skeletons something other than the name of root bone. If your root bone does not have a parent node, you can create a dummy node and make your root bone child of it. By renaming dummy node you will be able to rename your skeleton without affecting bone names.

{{% notice info %}}
Some softwares automatically export animations with a predefined names(e.g. 3DS Max -> take_001). This will cause multiple skeleton animations to be imported with same name if you have more than one skeleton defined in your geometry file since engine interprets animation data defined for each skeleton as different assets. Because of this you will receive a **duplicate asset** warning. To avoid this it is best to export one skeleton per geometry file. You can also disable **animation import** from import settings of that file.
{{% /notice %}}