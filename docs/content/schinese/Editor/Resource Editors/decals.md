+++
title = "贴花(Decals)"
ai_translated = true

[menu.main]
identifier = "decal"
parent = "core_components"
+++

## 什么是贴花(Decal)?

贴花(Decal)是一种将材质投影到其他几何体上的方法。它们可以影响 PBR 着色管线的以下通道:Albedo(反照率)、Normal(法线)、Specular(高光)、Gloss(光泽度)和 Occlusion(遮蔽)。因此,它们会改变其他网格体和材质的最终外观。它们可用于为场景增添变化,例如污垢、泥土、苔藓。此外,它们也是打破网格体上纹理平铺感的实用工具。其投影几何体为立方体,并沿 Z 方向进行投影。

## 如何设置贴花材质?

首先,材质的着色器(shader)应设置为“Decal”。Diffuse(漫反射)、NormalMap(法线贴图)和 SpecularMap(高光贴图)可以设置为任意纹理。其着色模型(shading model)将与“pbr_metallic”相同。
![](/img/decal/top_properties.png)

#### 材质着色器标志(Material Shader Flags)

材质着色器标志决定了将使用哪些着色属性,以及贴花将在哪些类型的对象上可见。注意:“use_albedo”是必须启用的。以下是一个典型示例,展示了一个将在所有材质上可见的贴花材质。
![](/img/decal/material_shader_flags.png)

#### “Others”标签页中的必要设置

为了使贴花正确渲染,应启用“Cull Front Faces”(剔除正面)和“Don't Modify Depth Buffer”(不修改深度缓冲区)标志。
![](/img/decal/other_settings.png)

## 如何设置贴花预制件(Decal Prefab)?

要创建贴花实体/预制件,需要将特定的网格体(贴花网格体,Decal Mesh)添加到一个空实体中。然后,应将该网格体的材质更改为我们在第一节中准备的材质。最后,在 Components/Meta Mesh/Custom Mesh Parameters 下,应相应地设置 UV Scale X/Y 数值。对于普通纹理,这些数值应均为 1。对于图集(atlas)类型的纹理,应设置 UV Scale 和 UV Offset 数值,以聚焦到图集内所需的纹理位置。
![](/img/decal/entity_setup.png)
