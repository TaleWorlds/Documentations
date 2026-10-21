+++
title = "XML 编辑器入门"
ai_translated = true

[menu.main]
identifier = "xml_editor"
parent = "bestpractices"
+++

#### 模组（Module）
Bannerlord 由多个不同的模块（Module）组成,它们赋予了游戏不同的功能。你可以把它们看作是游戏的模组（mod）。这种方式让玩家可以轻松地对游戏进行修改。这些模块位于 Mount & Blade II Bannerlord 安装目录下的 `Modules` 文件夹中。
#### XML
XML 的全称是 E**x**tensible **M**arkup **L**anguage（可扩展标记语言）,用于存储与游戏相关的数据。如果我们想向某个模块添加数据,就需要在其中创建一个 XML 文档,或者将数据添加到已有的 XML 文档中。
#### XSD（架构文件）
XSD 的全称是 **X**ML **S**chema **D**efinition（XML 架构定义）。它为通过 XML 文件提供的数据提供了一层验证机制。Bannerlord 中的每个 XML 文件都有一个相关联的架构（schema）文件。例如,架构文件为文化（culture）对象提供了一个架构,大致如下所示:

- Culture（文化）
	- Name（名称）
	- Id（标识符）
	- Description（描述）
	- ……

正如你所看到的,这些文件规定了我们应该如何构建 XML 文件的结构。在 99% 的情况下,XML 编辑器会阻止你进行架构文件中不允许的更改。如果你碰巧做出了与架构文件不匹配的更改,那么在保存文件时会出现错误提示,从而让你能够修正错误。
#### XSLT
XSLT 的全称是 E**x**tensible **S**tylesheet **L**anguage **T**ransformations（可扩展样式表语言转换）。它允许根据定义的规则,将现有的 XML 文件转换为新的 XML 文件。这些规则会在 XML 文件被加载进游戏时应用。

<img src="/img/xml_editor/1.png" style="max-width:800px; height:auto;" />

示例用例:假设我们想对游戏中的某个文化进行修改,但它是在某个官方模块中定义的。我们不能直接打开并编辑官方模块,因为那样的更改将不再属于我们自己的模块。

因此,我们不直接修改该 XML 文件,而是在我们自己的模块中使用 XSLT 创建规则,以转换相关官方模块中现有的 XML 文件。

#### XML 编辑器入门
XML 编辑器是一款可以让你执行以下操作的程序:

- 通过具有架构感知能力的验证来编辑你模块的 XML 文件,防止无效的更改。
- 通过 XSLT 安全地修改官方模块和其他模块的数据,生成非破坏性的转换规则。
	- 通过界面（UI）而非文本编辑器来完成上述两个步骤。

你可以通过 Steam 上的 `Mount & Blade II: Bannerlord Modding Kit` 访问 XML 编辑器。安装 Kit 后,你会在游戏根目录下的 `XMLEditor` 文件夹中找到 XML 编辑器。

首次启动 XML 编辑器时,系统会要求你调整编辑器的设置。选择「是」,你将看到设置窗口。

<img src="/img/xml_editor/2.png" style="max-width:800px; height:auto;" />

首先,你需要选择你的游戏文件夹。它默认指向 Steam 版本的游戏。其他设置是可选的,你可以保持默认不变。

- **游戏文件夹（Game Folder）**:你安装游戏的文件夹。如果路径无效,你会看到一个红色警告。编辑器在没有正确文件夹设置的情况下无法正常工作。
- **编辑器主题（Editor Theme）**:更改编辑器及其窗口的整体配色。
- **为窗口使用强调色（Use accent colors for windows）**:根据强调色更改窗口和标题栏的颜色。
- **禁用检查器中显示的警告（Disable warnings showing in the inspector）**:禁用检查器（inspector）中可能显示的任何警告。除非你清楚自己在做什么,否则通常不建议启用此选项。
- **启用 XSLT 编辑（实验性）（Enable XSLT editing (experimental)）**:为编辑器启用 XSLT 编辑功能。XSLT 编辑功能可用,但仍处于实验阶段,可能不太稳定。在直接 XML 编辑中存在的一些功能在 XSLT 模式下可能不可用。

编辑器的配置文件直接保存在 Bannerlord 配置文件所在文件夹旁边——`Documents\Mount and Blade II Bannerlord\Configs\xml_editor_config.json`。如果你的设置出现任何问题,可以随时删除该配置文件并重新启动编辑器,系统会重新创建设置文件。

你可以从主窗口工具栏的 `File` -> `Settings` 访问设置,或者在模块选择窗口（Module Selection Window）中选择 `Change Settings` 选项。

确认设置后,点击 `Save and Close` 按钮。你将被导航到模块选择窗口。
##### 什么是活动模块（Active Module）？
活动模块用于向编辑器描述你的工作意图。它使编辑器能够在直接编辑 XML 文件和创建 XSLT 文件生成规则这两种方式之间做出选择。

<img src="/img/xml_editor/3.png" style="max-width:800px; height:auto;" />

在模块选择窗口中,你将看到位于你所选择的游戏文件夹中的模块。在这里,你需要选择希望你的工作所属的模块。XML 编辑器只支持直接编辑你自己的模块或第三方模块。如果你想修改官方模块的值,你需要将你的模组（mod）设置为活动模块,并使用 XSLT 编辑来编辑官方模块。
#### 编辑器界面与编辑 XML 文件
选择好你要操作的模块之后,你将看到 XML 编辑器的界面。在我们的例子中,我们选择了一个仅包含一个 `items.xml` 文件的空模组。

<img src="/img/xml_editor/4.png" style="max-width:800px; width:100%; height:auto;" />

快速浏览一下初始界面:

- 顶部是编辑器工具栏。你可以从这里访问一些快捷操作,例如重新加载编辑器或打开一些附加的编辑器窗口,比如依赖关系编辑器（dependency editor）。
- 中间部分是你的主编辑器区域。目前它显示的是与游戏相关的架构文件。选择任意一个架构文件将显示与该架构相关联的 XML 文件。
- 底部有一个活动模块选择按钮。它显示当前处于活动状态的模块,如果需要,你可以点击它来更改你的活动模块。更改活动模块会重新加载编辑器。

由于我们的示例模组只有一个与 Items 架构相关联的 `items.xml` 文件,我们将通过选择 Items 架构继续本指南。

<img src="/img/xml_editor/5.png" style="max-width:800px; width:100%; height:auto;" />

选择一个架构会打开文档浏览器（document explorer）窗口。文档浏览器向我们展示与所选架构相关联的每个 XML 文件。你也可以为所选的模块和架构创建新的 XML 文档。这些文件的名称以 `[模块名称].[Xml 名称]` 的形式显示。让我们继续选择 Example Mod.items 文件。

<img src="/img/xml_editor/6.png" style="max-width:800px; width:100%; height:auto;" />

选中目标文档后,我们将进入 `元素浏览器（Element Explorer）` 窗口,它向我们展示 XML 文件中的顶级元素。你可以将元素浏览器与我们下面添加的完全相同的文档截图进行比较,以帮助你准确理解自己所看到的内容。在底部,你可以看到一个用于创建新顶级元素的按钮,以及用于保存文件更改的保存按钮。

<img src="/img/xml_editor/7.png" style="max-width:500px; height:auto;" />

要编辑这些元素之一,你可以点击元素浏览器窗口中的该元素。这将打开我们的最后一个窗口——`检查器窗口（Inspector Window）`。检查器窗口让你能够查看与元素浏览器窗口中所选内容相关联的所有属性和子元素。

<img src="/img/xml_editor/8.png" style="max-width:800px; width:100%; height:auto;" />

在检查器窗口中,每个下拉菜单代表一个 XML 元素。你可以通过点击想要应用更改的元素旁边的齿轮图标来进行与元素相关的更改。你可以进行诸如创建子元素或删除所选元素之类的更改。

在每个下拉菜单下方,你可以看到显示的字段。这些字段是 XML 元素的属性。`Undefined`（未定义）表示该属性不存在。之所以这样标注,是为了确保我们能够区分空值和没有值的属性。右键点击字段还会显示一些选项,比如从元素中移除属性。

XML 编辑器中的字段是智能的。它们会尝试显示合适的字段类型,例如为布尔字段显示复选框,否则回退为文本字段。它们还会检查架构文件中的要求,并在出现任何问题时向你发出警告。标有 `Required`（必需）的字段是架构文件所要求的。如果新文件与架构文件不兼容,或者缺少必需字段,系统将阻止你保存文件。系统会向你显示相应的错误信息,以便你进行修正。

进行更改后,请务必点击保存按钮。还需要注意的是,没有针对单个元素级别的保存功能。一旦你做出更改,就需要保存整个文档。

#### 使用 XSLT 编辑官方模块
要编辑官方模块,你需要启用 XSLT 编辑模式。通过 `File` -> `Settings` 打开设置窗口,确保勾选了 `Enable XSLT editing` 复选框。完成之后,如果我们点击任意架构文件,我们还会看到来自其他模块的相关 XML 文件。我们可以通过 XML 文件右侧的黄色警告图标来区分 XSLT 编辑模式。

<img src="/img/xml_editor/9.png" style="max-width:800px; width:100%; height:auto;" />

出于演示目的,我们将继续选择属于游戏 Native 模块的一部分的 `mpitems` 文件。

<img src="/img/xml_editor/10.png" style="max-width:800px; width:100%; height:auto;" />

现在我们可以看到属于 `Native.mpitems` 文件的元素。这里需要注意的一点是,XSLT 编辑不支持删除元素。相反,我们可以用一个空元素来替换该元素。让我们继续选择一个要编辑的元素。

<img src="/img/xml_editor/11.png" style="max-width:800px; width:100%; height:auto;" />

我们选择了 `mp_pointed_skullcap_over_cloth_headwrap` 这个物品。你可以看到检查器中出现了一个错误,阻止我们进行任何编辑。这是因为要进行 XSLT 编辑,我们的模块需要依赖于目标模块——在本例中是 Native 模块。我们可以通过前往 `Window` -> `Dependency Editor`（依赖关系编辑器）来快速修复此错误。

<img src="/img/xml_editor/12.png" style="max-width:800px; width:100%; height:auto;" />

`Dependency Editor`（依赖关系编辑器）让我们能够编辑模块的依赖关系。在左侧,我们可以看到我们尚未依赖的模块。我们可以点击左侧的模块,将其添加为依赖项。由于 mpitems 属于 Native 模块的一部分,我们将选择 Native,然后选择 `Add Dependency`（添加依赖）。最终,效果将如下所示:

<img src="/img/xml_editor/13.png" style="max-width:800px; width:100%; height:auto;" />

现在我们可以关闭依赖关系编辑器,返回检查器界面。你会看到错误已经消失,只剩下一个警告,提示我们正在使用 XSLT 编辑而非直接 XML 编辑。我们可以忽略这个警告。

<img src="/img/xml_editor/14.png" style="max-width:800px; width:100%; height:auto;" />

我们的设置已经完成,现在可以像编辑其他 XML 元素一样继续编辑该元素了。在后台,编辑器会将这些更改转换为 XSLT。你可以在模块的 `ModuleData` 文件夹下一个名为 `XSLT` 的文件夹中找到生成的 XSLT 文件。请注意,直接 XML 编辑中的某些功能在 XSLT 编辑模式下可能不可用。
</content>
