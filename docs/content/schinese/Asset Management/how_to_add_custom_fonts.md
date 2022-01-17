+++
title = "如何添加自定义字体"
weight = 3
+++


#### 介绍

本篇文档包含以下步骤：

* 设置文件和路径
* 生成字体
* 将文件放置到模组目录
* 生成精灵表（Sprite Sheets）
* 如何在《霸主》中使用字体

#### 前提条件

* 字体的 TrueTypeFont 文件。（例如 OpenSans-Regular.ttf）
* 从 Steam 下载的 Mount &amp; Blade II: Bannerlord - Modding Kit
* 生成用户界面精灵表（UI Spritesheets）的相关知识（参阅：[生成和加载 UI Spritesheets](http://docs.modding.bannerlord.com/zh_cn/asset-management/generating_and_loading_ui_sprite_sheets/)）

#### 设置文件和路径

* 转到目录 Mount &amp; Blade II Bannerlord\GUI\GauntletUI\Fonts\。
* 确认目录下存在以下两个文件，我们需要使用它们来生成我们的字体数据。
	* **GenerateFont.bat**
	* **GenerateFontSettings.txt**
* 移动你的 **.ttf** 字体文件到该目录。
* 举个例子，我们将要使用一个名为 **OpenSansRegular.ttf** 的字体文件。
* 打开改文件：&quot;**GenerateFontSettings.txt**&quot;。
* &quot;**GenerateFontSettings.txt**&quot; 的默认内容为：

		-fontpath {FONT_PATH.ttf}
		-outputpath {OUTPUT_PATH.png}
		-atlassize 2048 2048
		-size 64
		-angle 8
		-range 16
		-padding 16
		-smooth 0
		-smoothingConstant 0.5-mode 1

* 在这里，我们需要将占位符变量 **{FONT\_PATH.ttf}** 和 **{OUTPUT\_PATH.png}** 修改为实际的路径。
* 此处相对路径相对于：**…\bin\Win64_Shipping_wEditor**，除非你指定了一个绝对路径。
* 请注意如果你需要使用包含空格的路径，请使用双引号将其括起来。
* 设置 -fontpath:
	* 在我们的示例中，该变量为：**-fontpath OpenSansRegular.ttf**
* 设置 -outputpath:
	* 该变量决定我们将 **.png** 文件放入哪个目录。如果我们使用一个不存在的 **.png** 文件路径，那么该文件将在生成图集的过程中创建。
	* 在我们的示例中，变量 -outputpath 设置为：**-outputpath OpenSansRegular.png**
* **GenerateFontSettings.txt** 的内容现在应该为：

		-fontpath OpenSansRegular.ttf
		-outputpath OpenSansRegular.png
		-atlassize 2048 2048
		-size 64
		-angle 8
		-range 16
		-padding 16
		-smooth 0
		-smoothingConstant 0.5-mode 1

_如果生成的 .png 文件无法包含你字体中的所有字符，请考虑增加_ **-atlassize**。

#### 生成字体

* 现在已经添加了文件并设置了生成器的正确路径，运行 **GenerateFont.bat**。
* 如果所有的都设置正确，那么该程序将不会抛出任何错误，并且会在你定义的 **-outputpath** 的目录下生成 3 个文件。
	* 在我们的示例中，这 3 个文件是：
		* **OpenSansRegular.fnt**
		* **OpenSansRegular.bfnt**
		* **OpenSansRegular.png**
* 如果你在批处理脚本中看到了任何错误，请确认你的变量 **-fontpath** 和 **-outputpath** 的设置正确。
* 在我们的示例中，生成的 3 个文件位于我们的相对路径 **…\bin\Win64_Shipping_wEditor** 目录下。

#### 将文件放置到模组目录

* 上述步骤中，我们生成了 3 个文件。现在我们需要把这些文件放入我们的模组中。

##### 字体文件

* 转到 **{YOURMODULE}\GUI\Fonts** 目录。如果你的模组没有 **Fonts** 目录，请创建一个。
* 将生成的 **.fnt** 和 **.bfnt** 文件移动到 **Fonts** 目录，在我们的示例中，它们是 **OpenSansRegular.fnt** 和 **OpenSansRegular.bfnt**。

##### 图像文件

* 转到 **{YOURMODULE}\GUI\SpriteParts** 目录。如果你的模组没有 **GUI** 或 **SpriteParts** 目录，请创建一个。
* 在 **SpriteParts** 目录下，创建一个空目录 **ui\_custom\_fonts**。
* 在 **SpriteParts** 目录下如果没有 **Config.xml** ，则创建一个。
* 在此阶段， **SpriteParts** 目录下有一个名为 **ui\_custom\_fonts** 的目录和一个名为 **Config.xml** 的文件。
* 现在我们可以将我们的 **.png** 文件移动到 **ui\_custom\_fonts** 目录下。在我们的示例中，该文件名为 **OpenSansRegular.png**。

##### 配置

* 为了能够在游戏中使用我们的字体，我们需要在我们的 **Config.xml** 文件中指定以便于我们的字体能够自动加载。
* Config.xml 文件的内容应包含如下 Config 标签：

		<Config>
			<SpriteCategory Name="ui_custom_fonts">
				<PackAllSpritesToUniqueTextures/>
				<SingleChannel/>
				<AlwaysLoad/>
				<EdgeSize Value="0" />
			</SpriteCategory>
		</Config>

* 请注意这里的 **ui\_custom\_fonts** 值是你在 **{YOURMODULE}\GUI\SpriteParts** 目录下创建的目录名。

#### 生成精灵表

* 现在需要使用在上一步过程中创建的 **.png** 文件来生成字体的精灵表（spritesheets）。
* 我们将简要介绍如何将新字体添加到精灵表（spritesheets）中，详情请参阅：[生成和加载 UI Spritesheets](http://docs.modding.bannerlord.com/zh_cn/asset-management/generating_and_loading_ui_sprite_sheets/)。
	* 通过直接启动 **Mount &amp; Blade II Bannerlord\bin\Win64\_Shipping\_wEditor\TaleWorlds.TwoDimension.SpriteSheetGenerator.exe** 来运行精灵表生成器。
	* 如果设置都正确，精灵表生成器的输出将会是以下效果：
<img src="/img/how_to_add_custom_fonts/spritesheet_generator.png"/>
	* 你应该通过游戏内的资源浏览器（resource browser）导入字体，说明请查看上述[文档](http://docs.modding.bannerlord.com/zh_cn/asset-management/generating_and_loading_ui_sprite_sheets/)。

#### 使用新添加的字体

* 如果你的设置正确，我们应该能够在游戏内使用新添加的字体。
* 为了使用一种字体，我们可以在一个笔刷（Brush）中声明它的名称，例如：

		<Brush Name="CustomBrush.With.New.Font" Font="OpenSansRegular" TextHorizontalAlignment="Right">
			<Styles>
				<Style Name="Default" FontColor="#F4E1C4FF" TextGlowColor="#000000FF" TextOutlineColor="#000000FF" TextOutlineAmount="0.01" TextGlowRadius="0" TextBlur="0" FontSize="20" />
			</Styles>
		</Brush>

* 现在任何使用该笔刷（Brush）的界面工具集（widgets）都会使用我们新添加的字体进行渲染。

#### 为某一语言设置默认字体

* 对于一些语言，你可能需要你自己的自定义字体。如果这符合你的情况，你可以为你的语言设置一个默认字体。
* 创建一个文件命名为 **{YOURMODULE}Languages.xml** 然后放入 **{YOURMODULE}\GUI\Fonts** 目录。
* 请注意你要给 **\*Languages.xml** 一个单独的名字，并且始终以 &quot; **Languages**&quot; 结尾。（例如 _ **MyModuleLanguages.xml** _）更多信息请参阅：[添加和覆盖资产](http://docs.modding.bannerlord.com/zh_cn/asset-management/asset-types/overriding_assets/)
* 在此新语言文件中，你可以定义一个新的 Language 节点，覆盖掉已存在的节点，并且修改游戏的默认语言。
* Language 节点用于将内置字体映射到自定义字体。  
* 例如，如果你想为 **土耳其语** 设置默认字体，你的节点应该如下：

		<Languages>
			<!-- 土耳其语 -->
			<Language id="Türkçe" DefaultFont="OpenSans-Regular" LineSeperatorChar="-">
				<Map From="FiraSansExtraCondensed-Light" To="OpenSans-Regular"/>
				<Map From="FiraSansExtraCondensed-Medium" To="OpenSans-Regular"/>
				<Map From="FiraSansExtraCondensed-Regular" To="OpenSans-Regular"/>
				<Map From="Galahad" To="OpenSans-Regular"/>
				<Map From="Galahad_Numbers_Bold" To="OpenSans-Regular"/>
			</Language>
		</Languages>

* 至此，我们已经将土耳其语的默认字体设置为了 &quot;OpenSansRegular&quot;，并将一些内置字体映射到我们的自定义字体中。
* 保存该文件后，你的语言的默认字体应该被设置完毕，且你应该能看到你语言的正确的字体。