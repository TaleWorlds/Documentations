+++
title = "材质编辑器"
description = ""
weight = 1
+++

### 总览 ###
<img src="/img/material_editor/overview.png" width="1280">
我们专有的游戏引擎使用标准的金属PBR管道进行材料创作。
导航到文件夹后，右键单击空白处，然后选择 Create > Material，可以轻松创建新材料。

可以通过双击资源浏览器中的现有材料来打开材料编辑器。
<img src="/img/material_editor/create_new.png">

### 查看器 ###
#### 着色器(shader) ####
<img src="/img/material_editor/shader.png">
您可以从此“着色器选择”小部件中选择适当的着色器。
有几种常用的着色器。最重要的是pbr_metallic和pbr_shading两种。

##### pbr_shading #####
此着色器得到了广泛的使用，而原因仅在于我们的引擎在开发的早期没有使用PBR着色管道，大多数内容不是为PBR管道创建的，因此创建此着色器是为了支持我们已经存在的内容，并且仅在过渡期间使用。
新内容不应使用此着色器，而应使用pbr_metallic。

##### pbr_metallic #####
这是您大多数时候应该使用的。该着色器使用标准的金属PBR流水线，并且输入与大多数纹理创作软件兼容。

**输入：**
- Albedo and Normal: 通用标准，可以直接使用纹理编辑软件的输出
- Specular: 此纹理将其4通道用于不同目的。红色通道包含金属信息，绿色通道包含光泽度（粗糙度的倒数），蓝色通道包含环境光遮挡，而Alpha通道包含半透明（仅适用于植被着色器）。

##### grass #####
此着色器是pbr_metallic的派生类，仅应在草网格上使用。包含特殊效果，例如风动画，摇摆动画，平滑的LOD过渡，来自地形的颜色乘法等。

##### flora_leaf #####
此着色器是pbr_metallic的派生类，仅应在树木/灌木丛的叶子部分使用。包含特殊效果，例如风动画，摇摆动画，从地形进行的颜色乘法，平滑的LOD过渡，半透明（镜面纹理的Alpha通道）等。

##### flora_bark #####
此着色器是pbr_metallic的派生类，仅应在树木/灌木丛的树皮部分使用。包含特殊效果，例如风动画，平滑的LOD过渡等。

### 贴图Textures ###
<img src="/img/material_editor/textures.png">
此面板用于设置着色器的输入纹理。
纹理名称是不言自明的，但是有一些特殊情况。

##### Diffuse2Map #####
引擎内部使用此输入来创建特殊效果/混合，例如Shield Banner Paintings，此插槽中的Banner纹理仅出现在“Diffuse 1”纹理包含Alpha的位置。
此纹理的使用确实取决于所使用的着色器。

##### DetailNormalMap #####
此输入用于在常规法线贴图的顶部创建微瑕疵和其他高频细节。可以在**纹理设置**面板中调整此纹理的比例

##### HeightMap #####
此输入同时用于视差遮挡着色（Parallax Occlusion Shading）和位移贴图（Displacement）。

##### Decal(___)Map #####
这些输入由引擎内部使用，以在实体上创建蒙皮贴花（例如代理上的血液和泥浆）。

### 纹理设置 ###
<img src="/img/material_editor/texture_settings.png">
此设置可用于进一步调整纹理，以实现更多变化和微调。
某些设置仅用于某些特殊的着色器以传递自定义参数。

##### Areamap Scale #####
用于内部参数传递。

##### 镜面反射（Specular Coef） #####
在着色器中，将金属通道（“镜面纹理”的红色通道）乘以该值。

##### 光泽度（Gloss Coef） #####
光泽通道（镜面纹理的绿色通道）乘以着色器中的该值。

##### 环境光阻塞系数（Ambient Occlusion Coef） #####
在着色器中，将AO通道（镜面纹理的蓝色通道）乘以该值。

##### 法向深度（Normal Depth） #####
法线纹理X和Y通道乘以这个值。如果您设置一个接近零的值，表面会显得更平坦，因为X和Y的值会接近零，只有Z方向会贡献给法线贴图。

##### 细节正常比例（Detail Normal Scale） #####
此参数设置细节纹理应平铺多少次。较高的值会增加频率。

##### 视差模式（Parallax Mode） #####
您可以选择用于该材料的位移方法。选项为视差或位移。两者都需要一个高度图(Heightmap)纹理。视差在着色器中使用视差遮挡映射，位移使用硬件镶嵌。

##### 视差量（Parallax Amount） #####
位移效应的强度。

##### 视差偏移（Parallax Offset） #####
将中间值设置为所需的高度。（高度图中值为0.5）。

### 材质着色器标记（Material Shader Flags） ###
<img src="/img/material_editor/material_flags.png">
您可以在着色器中启用和禁用某些编译时条件，以启用/禁用某些效果。这些是编译时标志，并且材质着色器将使用这些标志进行编译。
比较重要的一些有：

##### use_detailnormalmap #####
应启用此标志以利用明细法线贴图功能。

##### alpha_test #####
Diffuse 1纹理的alpha值用作切出纹理。可以在“Transparency”面板中指定Alpha阈值。

##### use_specular #####
在所有情况下均应启用此标志。这只是出于荒谬的原因。

##### use_procedural_wind_animation #####
可以启用以创建非常简单且便宜的正弦波式风效果。主要用于帐篷/旗帜。（不要与布料的物理特性混淆）

##### self_illumination #####
启用自发光。照明纹理应在Diffuse 2中指定。亮度参数可以在Vector Arguments面板中调整。

##### use_specular_from_diffuse #####
永远不要使用这个。它仅用于pbr管道转换阶段，仅出于传统原因仅在此使用。只需对漫反射纹理进行灰度处理，然后将其用作镜面反射纹理。

##### use_double_colormap_with_mask_texture #####
在内部用于在服装中创建团队色彩效果。将创建特殊的纹理以指定衣服的哪些部分应受团队颜色的影响。在“Diffuse 2”纹理中指定了用于原色和辅助颜色的简单红色/绿色纹理。通过游戏代码将原色和副色设置为“颜色因子”。

### 透明度（Transparency） ###
<img src="/img/material_editor/transparency.png">
可以在此处指定Alpha blend mode和 Alpha Test阈值。
也可以在此处启用“ Multi Pass Alpha”功能。该技术使用Alpha test和Alpha blend两次渲染网格，以创建笨重但外观平滑的alpha测试网格。（在中部区域进行Alpha test，以获得高覆盖率，但边缘（例如毛发）用Alpha blend渐变平滑）。

### Others ###
<img src="/img/material_editor/others.png">
该面板通常用于技术/内部使用，主要用于创建使用核心引擎功能的材质。

### 向量参数（Vector Arguments） ###
<img src="/img/material_editor/vector_args.png">
该面板包含两个向量参数。两者都含有4个实数值，一共八个。
这些矢量的参数用于一些特殊的着色效果，如设置自发光，速度和纹理扫描等的方向的亮度
哪一个向量参数发生了什么变化，其实取决于它的使用效果。

### 颜色因子（Factor Colors） ###
<img src="/img/material_editor/factor_color.png">
这些颜色与网格上的内部因子颜色相乘，通常使用游戏代码来改变。如果你真的想让一些纹理稍微深一点，绿一点等等，你可以用这个面板把它们相乘。

### 顶点布局（Vertex Layout） ###
<img src="/img/material_editor/vdecl.png">
该面板用于指定“顶点着色器”应使用的“顶点布局”。

##### 凹凸贴图（Bump Map） #####
在大多数情况下应启用（标准PBR需要这样做）。

##### 蒙皮和精确蒙皮（Skinning and Skinning Precise） #####
如果你的材质将与蒙皮网格一起使用，请启用蒙皮，如果你的蒙皮网格很大，有重要的小多边形（如眼睛），请启用精确蒙皮。(这将禁用一些优化，所以只有在真正需要的时候才使用)。

##### Double UV #####
如果您的自定义着色器需要双UV通道，请启用。

##### PostFX #####
由引擎内部使用。
