+++
title = "植被实现"
weight = 15
ai_translated = true
+++

植被是游戏引擎中最重要的渲染方面之一。在性能方面,它占据了整体渲染任务的很大一部分。在创建新的植被网格时,应确保该网格具有较低的多边形过度绘制(overdraw)量。

在纹理中的空白像素(会增加过度绘制)和网格的三角形数量(会增加多边形数量成本)之间也存在权衡。最佳三角形数量和 UV 布局可能因具体情况而异。

植被网格是经过优化的渲染对象,设计用于在大范围的可视距离内以大量实例进行绘制。

要能够添加、移除或修复植被资源,首先需要打开"资源浏览器(Resource Browser)"。

<img src="/img/implementing_flora/implementing_flora_1.jpg" width="900px"/>

在 Assets 文件夹中,在资源浏览器内的空白处右键单击并创建一个新文件夹。

<img src="/img/implementing_flora/implementing_flora_2.jpg" width="900px"/>

打开你新创建的文件夹,逐个导入你的所有网格和纹理。

<img src="/img/implementing_flora/implementing_flora_3.jpg" width="900px"/>

导入后,为了能够从漫反射纹理(diffuse texture)创建 SDF Alpha,你需要在选中纹理文件时屏幕右侧打开的"纹理检查器(Texture inspector)"面板中勾选"Generate SDF Alpha"(生成 SDF Alpha),然后在同一面板上点击保存。

{{% notice tip %}}
SDF Alpha 是我们引擎中用于改善植被 Alpha 性能的一种技术。如果不应用此技术,纹理中嵌入的 Alpha 通道将不会被处理。
{{% /notice %}}

<img src="/img/implementing_flora/implementing_flora_4.jpg" width="900px"/>

要创建植被材质(Flora Material),在资源浏览器的空白区域右键单击,然后点击 Create > Material(创建 > 材质),之后你可以为你的材质命名。

{{% notice tip %}}
如果你想为新导入的网格使用编辑器中已有的或你自己创建的材质,可以在 3D 建模软件中,将你网格的材质重命名为你想在编辑器中使用的现有材质的名称。导入后,编辑器会自动将这些材质分配给你的网格。
{{% /notice %}}

<img src="/img/implementing_flora/implementing_flora_5.jpg" width="900px"/>

{{% notice tip %}}
在深入了解"材质设置(material settings)"之前,请查看[材质编辑器(Material Editor)]({{< ref "material_editor" >}})以获取更多信息。
{{% /notice %}}

点击新创建的材质,并在右侧的着色器面板中选择你想使用的着色器。辨别你想使用的着色器类型很重要,例如,如果我们的植被是草,我们需要选择 grass 着色器;对于树木和灌木,我们选择 flora_leaf 着色器。在本文档中,我们创建的是草类植被,并选择了 grass_shader。

<img src="/img/implementing_flora/implementing_flora_6.jpg" width="900px"/>

为植被选择好着色器后,我们需要将纹理连接(定义)到植被材质上。要实现这一点,你可以在纹理面板(Textures Panel)中搜索纹理,或者直接从资源浏览器将其拖放到纹理槽中。SDF Alpha 也应遵循相同的流程。

{{% notice warning %}}
请确保通过点击材质检查器(Material Inspector)底部的"save"(保存)按钮来保存你的更改,否则材质将恢复为默认设置。
{{% /notice %}}

<img src="/img/implementing_flora/implementing_flora_7.jpg"/>

接下来我们要检查 alpha_test 和 use_albedo_alpha 标志。为了不对性能造成不利影响,请勿为 Grass 着色器勾选 use_specular 标志。

<img src="/img/implementing_flora/implementing_flora_8.jpg"/>

然后我们转到"Transparency"(透明度)选项卡,从 Alpha Blend Mode(Alpha 混合模式)下拉列表中选择"Factor"(系数),并为"Alpha Test"(Alpha 测试)提供一个用作截止值的数值。在大多数情况下,45 的数值是合适的。

<img src="/img/implementing_flora/implementing_flora_9.jpg"/>

在材质设置的最后一步,我们勾选"Others"(其他)部分下的"Two Sided"(双面)框,然后保存。

<img src="/img/implementing_flora/implementing_flora_10.jpg"/>,

现在材质设置已经完成,选中相关网格后,我们可以在屏幕右侧搜索材质名称,并将其应用到选中的网格上然后保存。或者我们也可以选择/拖放来应用。然后我们可以在网格编辑器中双击该网格,查看材质是否已被应用。

<img src="/img/implementing_flora/implementing_flora_11.jpg" width="900px"/>
<img src="/img/implementing_flora/implementing_flora_12.jpg" width="900px"/>

## 植被种类编辑器(Flora Kind Editor)

植被种类编辑器(Flora Kind Editor)是我们定义和管理已导入植被的地方。

### 向植被种类编辑器添加资源

为了能够将我们创建的植被添加到场景中,我们需要在植被种类编辑器中定义它。我们可以从 Window > Module Data > Flora Editor 访问它。

<img src="/img/implementing_flora/implementing_flora_13.jpg" width="900px"/>

通过植被种类编辑器,我们可以:

1. 访问已存在/即将添加到编辑器中的植被列表。
2. 命名/重命名植被项目。
3. 定义植被的参数。
4. 查看按季节划分的植被变体。
5. 添加植被及其变体。
6. 查看网格信息,以及查看或更改物理体对象(body objects)和材质。

<img src="/img/implementing_flora/implementing_flora_14.jpg" width="900px"/>

要添加新植被,我们可以点击左上方的"Add New Flora"(添加新植被),然后在屏幕右侧的 Flora Kind Name(植被种类名称)文本字段中更改其名称。

<img src="/img/implementing_flora/implementing_flora_15.jpg" width="900px"/>

我们在属性(properties)部分定义植被的属性。如果我们的植被是以草的形式存在,我们勾选"grass"(草)框。为了让植被贴合平地或斜坡,我们分别勾选"align with ground"(贴合地面)和"align with slope"(贴合斜坡)。如果我们希望植被在一定距离外消失,我们勾选"fading out"(淡出)框,并在其正上方的"view distance"(视距)字段中填入正确的数值。在使用草的情况下,我们勾选"no shadow"(无阴影)框以最大化性能。而对于明显更大且分布更稀疏的植被对象,如树木和灌木丛,则**不勾选**该框。

<img src="/img/implementing_flora/implementing_flora_16.jpg" width="900px"/>

点击位于 Seasons(季节)缩略图下方的"Add Variation"(添加变体),以添加你准备好的植被网格。在这里,你可以为不同季节添加不同的植被版本,以便特定季节的植被会自动显示。你还可以添加多个植被网格以创造更多样性。

<img src="/img/implementing_flora/implementing_flora_17.jpg" width="900px"/>

现在我们已经完成了将植被及其所需参数添加到"植被种类编辑器"中的工作,可以通过点击"Save Flora"(保存植被)来保存该创建;如果添加了多个植被种类,则点击"Save All"(全部保存)。

### 将植被添加到场景中

将你的网格导入游戏并输入到植被种类编辑器后,我们可以使用"Flora Paint"(植被绘制)工具将我们的植被绘制到场景中。首先我们可以在场景中生成地形。为此,我们可以从顶部菜单栏选择"Select Terrain"(选择地形)工具,然后在弹出的右侧窗口中点击"Generate Terrain"(生成地形),并在接下来的窗口中点击 ok,以最终生成地形。我们执行这些步骤仅仅是为了创建地形,以便我们随后可以使用植被绘制工具。

<img src="/img/implementing_flora/implementing_flora_18.jpg" width="900px"/>

地形创建完成后,我们从顶部栏选择"Flora Paint"(植被绘制)工具。然后我们输入之前在植被种类编辑器中定义的植被名称,并将其应用到场景中。

<img src="/img/implementing_flora/implementing_flora_19.jpg" width="900px"/>
<img src="/img/implementing_flora/implementing_flora_20.jpg" width="900px"/>

另一种向场景添加植被的方法是,将其放入我们为地形绘制创建的某个图层中。为此,我们可以从顶部菜单栏选择"Paint Terrain Layer"(绘制地形图层)工具。然后我们从右侧打开的新窗口中添加一个新图层。

<img src="/img/implementing_flora/implementing_flora_21.jpg" width="900px"/>

我们双击新图层并打开其属性菜单。然后我们勾选"Flora Layer"(植被图层)框并展开"Flora Meshes"(植被网格)选项卡。

勾选 Flora Layer(植被图层)框将停用用于绘制地形的纹理,但是我们添加的植被仍然可见。如果我们想同时查看植被和我们添加到图层中的纹理,则应保持该框不勾选。

<img src="/img/implementing_flora/implementing_flora_22.jpg"/>

在"Flora Meshes"(植被网格)部分下,点击"Flora"(植被)旁边的下拉菜单,选择你准备好的植被,然后绘制你地形的某个区域。

<img src="/img/implementing_flora/implementing_flora_23.jpg"/>
<img src="/img/implementing_flora/implementing_flora_24.jpg" width="900px"/>
