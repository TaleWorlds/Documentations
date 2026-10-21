+++
title = "创建自定义旗帜图标与颜色"
weight = 15
ai_translated = true
+++


#### 简介

本文档将介绍以下步骤：

* 设置包含旗帜图标的自定义贴图。
* 为自定义旗帜图标生成材质。
* 将新创建的旗帜图标添加到自定义模组中。
* 向旗帜编辑器（Banner Editor）添加自定义图标颜色。

#### 先决条件

* 从Steam下载的《骑马与砍杀2:领主》- 模组制作工具包（Modding Kit）。

#### 创建旗帜图标贴图

* 要创建一套新的旗帜图标，首先需要创建一个分辨率为2048x2048的PSD文件，并将其分割为16个相等的网格部分。文件可以比这更大，但不建议将其做得更小。
* 然后将此文件放入你的模组的**AssetSources\BannerIcons**目录中。请注意，该文件可以是PSD或DDS格式。
* 此外，你还需要在**Assets\BannerIcons**中创建一个空文件夹。
* 在下方的示例图片中，画布被分割为4x4网格，并且在第一个（第0个）槽位中有一个示例旗帜图标。
* 旗帜图标槽位从顶行的0、1、2、3开始，到底行的12、13、14、15结束。
<img src="/img/creating_custom_banner_icons/banner_icon_guide.png" style="width:512px;"/>

#### 将旗帜图标贴图导入游戏并创建新材质

* 现在贴图已添加完毕，请从Steam启动《骑马与砍杀2:领主》- 模组制作工具包（Modding Kit）。
* 确保在启动器的Mods部分选中你的模组，然后点击"Play"。
* 在主菜单中，按下**Alt + `**打开控制台。
* 输入**resource.show_resource_browser**，然后按回车键。
* 在资源浏览器（Resource Browser）中，选择与你的模组名称相同的文件夹。
* 在该文件夹中，点击"Scan new asset files"（扫描新资源文件）。
<img src="/img/creating_custom_banner_icons/banner_icons_resource_browser_1.png" style="height:500px;"/>

* 如果你正确完成了前面的步骤，会弹出一个窗口提示检测到新文件。点击导入（import）。
<img src="/img/creating_custom_banner_icons/banner_icons_resource_browser_2.png" style="height:500px;"/>

* 进入**BannerIcons**子文件夹，点击你创建的贴图，并按如下所示设置导入设置（Import Settings）。如果你的旗帜图案细节较多，也建议勾选"**Do not Compress**"（不压缩）选项。
<img src="/img/creating_custom_banner_icons/banner_icons_resource_browser_3.png" style="height:500px;"/>

* 在同一文件夹中，右键单击并选择**Create**（创建），然后选择**Material**（材质）。将此材质命名为与你的贴图相同的名称。
<img src="/img/creating_custom_banner_icons/banner_icons_material_1.png" style="height:500px;"/>

* 新材质应如下图所示出现。
<img src="/img/creating_custom_banner_icons/banner_icons_material_2.png" style="height:500px;"/>

* 新材质的初始设置：
	* 从贴图列表（Textures List）中移除所有预定义的贴图。
	* 将你的旗帜图标贴图添加到贴图列表的漫反射（diffuse）槽位中。
	* 将着色器（shader）从**pbr_metallic**设置为**gui_color_and_stroke**。
<img src="/img/creating_custom_banner_icons/banner_icons_material_3.png" style="height:500px;"/>

* **材质着色器标志（Material Shader Flags）**、**透明度（Transparency）**、**其他（Others）**以及**顶点布局（Vertex Layout）**选项卡的附加设置：
<img src="/img/creating_custom_banner_icons/banner_icons_material_4.png" style="height:600px;"/>

* 现在我们已经完成了自定义旗帜图标的贴图和材质设置，可以将其添加到我们的模组中。

#### 创建自定义旗帜定义

* 要在游戏中使用自定义旗帜图标，需要向你的模组中添加一个包含旗帜定义的XML文件。
* 该文件的路径为**{MODULE_NAME}\ModuleData\banner_icons.xml**。
* 该文件会在你的模组加载时自动加载。
* 下面展示了一个示例**banner_icons.xml**文件。

```xml
<?xml version="1.0" encoding="utf-8"?>
<base xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" type="string">
  <BannerIconData>
    <BannerIconGroup id="16" name="{=!}My Custom Banner Icon Group" is_pattern="false">
      <Icon id="16001" material_name="module_custom_banner_icons_01" texture_index="0" />
    </BannerIconGroup>
  </BannerIconData>
</base>
```

* 在基础XML定义之后，添加了一个名为**BannerIconData**的根元素。所有自定义图标都添加在该元素之下。
* 对于每个图标组，需要添加一个**BannerIconGroup**元素。该组的ID必须是唯一的。在添加自定义组之前，请先检查原生模组的旗帜图标组ID。
* name参数由你（模组制作者）自行决定，可以是任意内容。其命名方式与其他本地化文本相同。
* **BannerIconGroup**的子元素是**Icon**元素。所有图标元素同样必须具有唯一的ID。图标的ID规则与旗帜图标组相同。
* 图标的材质名称需要与我们在上一步中创建的材质相同。
* 贴图索引（Texture Index）是一个从0到15的数字，在本指南的第一步中已有说明。
* 如果你已将上面展示的**banner_icons.xml**文件添加到你的模组中并重新启动游戏，你应该就能使用你创建的图标了。
* 带有空白缩略图的图标就是我们创建的图标。点击该按钮以选择新创建的旗帜图标。
<img src="/img/creating_custom_banner_icons/banner_icons_ingame_1.png" style="height:500px;"/>

* 请注意缩略图尚未显示。要添加缩略图，请参阅[生成和加载UI精灵表（Generating and Loading UI Sprite Sheets）]({{< ref "generating_and_loading_ui_sprite_sheets.md" >}})指南。请注意，你的精灵图名称需要与图标的ID相同。因此在我们的示例中，缩略图精灵图的名称为**16001.png**。
* 生成缩略图后，旗帜图标列表应如下所示。
<img src="/img/creating_custom_banner_icons/banner_icons_ingame_2.png" style="height:500px;"/>

#### 添加自定义颜色选项

* 要添加一组颜色，请在你的模组的**banner_icons.xml**文件中创建一个**BannerColors**元素。
* **BannerColors**的子元素是**Color**元素。所有颜色元素必须具有唯一的ID。此处的ID规则与**Icon**元素相同。
* 颜色有两个可选参数。
	* **player_can_choose_for_background**：使该颜色在旗帜编辑器界面（Banner Editor Screen）的背景颜色（Background Color）部分中可用。
	* **player_can_choose_for_sigil**：使该颜色在旗帜编辑器界面（Banner Editor Screen）的纹章颜色（Sigil Color）部分中可用。
* 如果这些参数都没有设置为**true**，该颜色仍会被添加以用于旗帜，但只能被NPC氏族和势力使用。
* 如果要添加大量新颜色，可能需要包含并更新位于**Native\GUI\Prefabs\BannerEditor**中名为**BannerEditor.xml**的预制件（prefab）。

```xml
<?xml version="1.0" encoding="utf-8"?>
<base xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" type="string">
  <BannerIconData>
    <BannerIconGroup id="16" name="{=!}My Custom Banner Icon Group" is_pattern="false">
      <Icon id="16001" material_name="module_custom_banner_icons_01" texture_index="0" />
    </BannerIconGroup>
	<BannerColors> <!-- New colors element-->
      <Color id="2000" hex="0xFFDBCFB0" player_can_choose_for_sigil="true" />
      <Color id="2001" hex="0xFF545775" player_can_choose_for_background="true" />
    </BannerColors>
  </BannerIconData>
</base>
```

* 如果你按照上面所示添加了颜色，你将在旗帜编辑器界面（Banner Editor Screen）中获得以下颜色。
<img src="/img/creating_custom_banner_icons/banner_colors_ingame_1.png" style="height:500px;"/>
