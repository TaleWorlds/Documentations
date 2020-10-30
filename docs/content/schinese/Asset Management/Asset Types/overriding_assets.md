+++
title = "添加与覆盖资产"
description = ""
weight = 1
+++

在 RGL 中，您可以轻松地覆盖现有资产或在编辑器中为自定义模组创建新资产。覆盖机制的生效方式是将现有资产替换为你的模组资产目录中提供的对应资产。 它会尝试匹配您的自定义资产与其他模块先前通过其名称注册的资产。模块的加载顺序会影响这一过程。

如果除了 **Native** 模块之外还分别加载了 **模组 A** 和 **模组 B** ，则最终资产及其来源列表如下：

<table style="vertical-align: bottom">
<thead>
    <tr>
        <th>Native</td>
        <th>模组 A</td>
        <th>模组 B</td>
        <th>结果</td>
    </tr>
</thead>
<tbody>
    <tr>
        <td>adobe_wall<br>tarnished_metal<br>ground_mud<br>marble<br>-<br></td>
        <td>adobe_wall<br>tarnished_metal<br>-<br>-<br>metal_plate</td>
        <td>adobe_wall<br>-<br>ground_mud<br>-<br>-<br></td>
        <td>Module B::adobe_wall<br>Module A::tarnished_metal<br>Module B::ground_mud<br>Native::marble<br>Module A::metal_plate<br></td>
    </tr>
</tbody>
</table>

当前可在自定义模组中替换的资产类型为：

- [材质 (Material)](#材质覆盖)
- [网格模型 (Mesh)](#网格模型覆盖)
- [纹理 (Texture)](#纹理覆盖)
- [物理形状 (Physics Shape)](#物理形状覆盖)

### 文件夹结构

资产系统会根据模块目录中的某些文件夹名称进行处理。这是这些文件夹及其用法的列表：

- **Assets** : 包括可编辑的 *.tpac 文件，该文件存储每个资产的元数据。
- **AssetSources** : 包括导入资产（.psd，.fbx）的源文件。
- **AssetPackages** : 包括只读 *.tpac 文件。当一个模组被打包用于客户端构建时，将生成该文件。
- **EmAssetPackages** : 包括只读 *.tpac 文件。当一个模组被打包用于编辑器构建时，将生成该文件。
- **DsAssetPackages** : 包括只读 *.tpac 文件。当一个模组被打包用于服务器构建时，将生成该文件。
- **RuntimeDataCache** :  包括引擎所需的对每个资产自动生成的数据。可以删除，但在启动过程中从头开始生成可能会花费时间。

### Modding Permissions

资产系统会根据游戏运行的可执行文件的版本寻找不同的文件夹。根据这些文件夹的存在与否，它判定一个模块是否可以被修改，或只能在只读模式下使用。如果您想发布您的模块，您可以打包您的资产并共享打包后的文件夹，而不需要发布成千上万的文件及其源文件。您有三个选项来打包您的资产。

- **Client** : 其他人可以激活您的模组并运行。您必须分发 **AssetPackages** 文件夹。
- **Editor** : 其他人可以在编辑器中使用您的模组，但不能修改它。如果您希望其他人从您的模组派生模组，则使用它。您必须分发 **EmAssetPackages** 文件夹。
- **Server** : 用于服务器构建。需要剥离与服务器无关的所有数据。您必须分发 **DsAssetPackages** 文件夹。

您也可以像使用您的模组一样共享您的模组，以允许其他人修改它。在这种情况下，你必须分发 **Assets**、**AssetSources** 和可选的 **RuntimeDataCache** 文件夹。

### 材质覆盖
覆盖材料可以通过创建一个新的材质来完成，其名称与您要覆盖的材质相同。
导航到您的模块的assets目录，并在浏览器窗格中的空白处右击。创建一个新的材质，并将其重命名为与您要覆盖的材质相同的名称。

{{% panel footer="被模组 A 覆盖的现有网格模型的材质" %}}![](/img/modding/assets/material_override.png){{% /panel %}}
此时，系统中所有的材质引用将被重定向到您的自定义材质。
<br><br>
### 网格模型覆盖
模型可以从多种文件格式（如Trf、Fbx）导入。从单个文件导入的资源根据 <>资产命名规则<> 按其名称进行分组。想象如下一个fbx文件：

- Model.fbx
    - wall(Mesh)
    - wall.lod1(Mesh)
    - wall.lod3(Mesh)
    - bo_wall(Physics Shape)

根据资产命名的惯例，前三个资源将被归入一个网格，其中有三个子网格属于不同的 LOD，最后从 Model.fbx 导入两个资产：wall (Mesh）和 bo_wall (Physics shape)。最后将从 Model.fbx 中导入两个资产：wall (Mesh) 和 bo_wall (Physics shape)。

按照这些规则，您可以导出一个新的几何文件（例如 fbx)，其中包含一组名称以 **wall** 开头的网格。在这种情况下，一个新的 **wall** 网格将从这些子网格中创建，而现有的网格将被您提供的网格完全替换。几何图形文件的名称不在考虑之列。值得一提的是，网格覆盖是在网格层面进行的。不能通过模组覆盖来覆盖单个子网格。

{{% panel footer="现有的带有名称 **testbox** 的立方体网格被模组 A 用茶壶覆盖" %}}![](/img/modding/assets/metamesh_override.png){{% /panel %}}
<br><br>
### 纹理覆盖
纹理的覆盖与材质非常相似。你需要导入一个新的纹理，其名称与你要覆盖的纹理相同。你也可以将任何已经导入的纹理重命名为与要覆盖的纹理名称相匹配的字符。

{{% panel footer="现有的名为 **roman_ground_d** 的 albedo 纹理被模组 A 用白色纹理覆盖" %}}![](/img/modding/assets/texture_override.png){{% /panel %}}
<br><br>
### 物理形状覆盖
覆盖物理形状需要你导入一个与你要替换的资产名称相同的物理形状。检查 <>资产命名规则<> 以了解如何导入物理形状。

{{% panel footer="现有的圆环形状被模组 A 用一个自定义的水蓝色形状覆盖" %}}![](/img/modding/assets/physics_shape_override.png){{% /panel %}}
