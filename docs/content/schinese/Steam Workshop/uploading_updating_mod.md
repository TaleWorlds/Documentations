+++
title = "上传/更新一个模组"
description = "在该教程中，你将了解到如何新建或是上传更新一个模组到 Steam 创意工坊，向其他玩家分享你的创意。"
weight = 5

+++

## 为你的MODs上传做准备

为了能让其他玩家使用你的MOD，你需要通过模组工具上传你的MOD。你可以为终端玩家部署它，或只用于服务器或者其他开发者，所有的这些都会在下面解释。

### 通过模组工具来输出
Exporting the Module via the Modding Tools

* 在检查你的MOD在登陆器的MOD列表中后，通过登陆器打开模组工具。
* 从主菜单界面打开编辑器
* 在最上面的文件（File）选项，选择输出（export）。

<img src="/img/uploading_updating_mod/1.png"/>

在弹出的“发表”窗口中，应可从下面的选项选择：

|  |  |
| ------ | ----------- |
| <img src="/img/uploading_updating_mod/2.png"/> | <img src="/img/uploading_updating_mod/3.png"/> |

* `Client`: 你的MOD会被包装起来用作客户端，这就意味着玩家需要这些安装包来进行游戏。如果你想通过Steam的创意工坊来发表你的MOD，这是你最起码应该做的。
* `Dedicated Server`: 你的MOD也可以在服务器上运行。如果你想在多人模式中运行你的MOD，那么你需要检查这个选项。
* `Editor`: 别的玩家可以通过编辑器（Editor）来打开你的模组并且更改。如果你不讲编辑器打包，那么别人就不能通过编辑器打开你的MOD。
* 
{{% notice warning %}}
不要忘记在“Module”下拉菜单中去选择你的MOD。否则，你很可能会不小心发表系统自带的MOD（Native module），这会耗费很长的时间。
{{% /notice %}}

* 在选择这些选项并在下拉菜单中选择你的MOD之后，单击发布（Publish）以继续。
* 在点击发布按钮后，一个选择目标文件夹的弹窗会出现，选择需要保存的地址，此地址需要是你电脑上可写入的储存空间，你的MOD会被复制到这里作为即将上传的版本。
* 之后就只要上传在目标地址下的MOD文件夹到Steam的创意工坊即可。请遵守在“**新建一个 Steam 创意工坊项目**” 和 “**更新一个 Steam 创意工坊项目**”章节的指示
  
{{% notice warning %}}
作为一个MOD开发者，如果你要在上传到Steam的创意工坊后去测试你的MOD，请暂时将你的MOD从“Steam\steamapps\common\Mount & Blade II Bannerlord\Modules”移到其他地方。如果你没有暂时移开，那么游戏会尝试从Bannerlord/Modules文件夹加载module而不是workshop/content/261550。
{{% /notice %}}

## 新建一个 Steam 创意工坊项目

### 准备 WorkshopCreate.xml

下载[该文件](https://download.taleworlds.com/WorkshopCreate.xml)然后把它放到任何你想放的地方。或者你也可以用以下代码创建一个：

	<Tasks>
		<CreateItem/>
		<UpdateItem>
			<ModuleFolder Value="C:\Program Files (x86)\Steam\steamapps\common\Mount &amp; Blade II Bannerlord\Modules\YourModuleName"/>
			<!-- 你模组的绝对路径 -->
			<ItemDescription Value="A Bannerlord Mod"/>
			<!-- 将会显示在 Steam 创意工坊的说明，可以通过 Steam UI 来编辑 -->
			<Tags> 
				<!-- 你可以使用如下标签： -->
				<!-- 类型：Graphical Enhancement, Map Pack, Partial Conversion, Sound, Total Conversion, Troops, UI, Utility, Weapons and Armour -->
				<!-- 设定：Native, Antiquity, Dark Ages, Medieval, Musket Era, Modern, Sci-Fi, Fantasy, Oriental, Apocalypse, Other -->
				<!-- 游戏模式：Singleplayer, Multiplayer -->
				<!-- 兼容版本：e1.9.0, v1.0.0,... 当前可用的版本你可以在 Steam 创意工坊的“按标签浏览”分区找到 -->
				<Tag Value="Partial Conversion" />
				<Tag Value="Dark Ages" />
				<Tag Value="Singleplayer" />
				<Tag Value="Multiplayer" />
				<Tag Value="e1.9.0" />
			</Tags>
			<Image Value="C:\Program Files (x86)\Steam\steamapps\common\Mount &amp; Blade II Bannerlord\Modules\YourModuleName\Image.png"/>
			<!-- 决定显示在 Steam 创意工坊的展示图片，这里插入的必须是一个绝对路径（图片文件大小应小于 1 MB） -->
			<Visibility Value="Public"/>
			<!-- 决定是否在 Steam 创意工坊上可见，可以是：Public, FriendsOnly, Private -->
		</UpdateItem>
	</Tasks>

* 使用 Notepad, Notepad++ 或是其他工具打开该文件
* 编辑匹配你模组的 `Items` 
	* `ModuleFolder`：你模组的绝对路径
	* `ItemDescription`：将会显示在 Steam 创意工坊的说明，可以通过 Steam UI 来编辑
	* `Tags`：允许通过特定类别过滤来找到你的模组。以下是你可以为你的项目添加的标签：
		* `Type`：Graphical Enhancement, Map Pack, Partial Conversion, Sound, Total Conversion, Troops, UI, Utility, Weapons 和 Armour
		* `Setting`：Native, Antiquity, Dark Ages, Medieval, Musket Era, Modern, Sci-Fi, Fantasy, Oriental, Apocalypse, Other
		* `Game Mode`：Singleplayer, Multiplayer
		* `Compatible Version`：e1.9.0, v1.0.0,...（当前可用的版本你可以在 Steam 创意工坊的“按标签浏览”分区找到）
		* 我们鼓励你只使用上述标签，因为玩家可以通过这些标签来过滤模组。其他任何标签都不会显示在过滤器列表中，但会显示在你的模组 Steam 创意工坊页面上。
	* `Image`：决定显示在 Steam 创意工坊的展示图片，这里插入的必须是一个绝对路径（图片文件大小应小于 1 MB）
	* `Visibility`：决定在 Steam 创意工坊上的可见性。可以是：Public, FriendsOnly, Private
* 将更改保存到 `WorkshopCreate.xml`

{{% notice warning %}}
必须为游戏启用 Steam Cloud 才能成功上传你的模组。你可以右击你 Steam 库里的 Mount &amp; Blade II: Bannerlord，然后点属性再点通用。或者通过 Steam 客户端的设置窗口的云服务标签页为所有游戏启用 Steam Cloud。
{{% /notice %}}

{{% notice warning %}}
在发布过程中，你可能会遇到一个错误。不停地打印这一行：Status: k_EItemUpdateStatusInvalid 0/0 - 如果出现这种情况，你的上传可能已经完成，你可以随意关闭控制台。如果上传失败，请重试一次。
{{% /notice %}}

{{% notice tip %}}
显示在 Steam 创意工坊页面的你上传的模组的大小可能会与实际的模组大小有些差别。这是正常的。
{{% /notice %}}

### 发布模组
* 找到如下目录 `\Steam\steamapps\common\Mount & Blade II Bannerlord\bin\Win64_Shipping_Client` 并确认 `TaleWorlds.MountAndBlade.SteamWorkshop.exe` 在里面
* 在目录地址栏中输入 `cmd` 并按下 `Enter`
* 输入 `TaleWorlds.MountAndBlade.SteamWorkshop.exe c:\path\WorkshopCreate.xml` 到控制台中，带上你的 `WorkshopCreate.xml` 文件绝对路径并按下 `Enter`
* 如果没有错误出现，你的模组已经被成功上传到 Steam 创意工坊

## 更新一个 Steam 创意工坊项目

### 准备 WorkshopUpdate.xml

下载[该文件](https://download.taleworlds.com/WorkshopUpdate.xml)然后把它放到任何你想放的地方。或者你也可以用以下代码创建一个：

	<Tasks>
		<GetItem>
			<ItemId Value="YourWorkshopItemIdHere"/>
			<!-- 可以是你的创意工坊项目的 URL -->
		</GetItem>
		<UpdateItem>
			<ModuleFolder Value="C:\Mount &amp; Blade II Bannerlord\Modules\MyMod"/>
			<!-- 你模组的绝对路径 -->	
			<ChangeNotes Value="New cool features" />
			<!-- 插入更新日志 -->
			<Tags> 
				<!-- 你可以使用如下标签： -->
				<!-- Type: Graphical Enhancement, Map Pack, Partial Conversion, Sound, Total Conversion, Troops, UI, Utility, Weapons and Armour -->
				<!-- Setting: Native, Antiquity, Dark Ages, Medieval, Musket Era, Modern, Sci-Fi, Fantasy, Oriental, Apocalypse, Other -->
				<!-- Game Mode: Singleplayer, Multiplayer -->
				<!-- Compatible Version: e1.9.0, v1.0.0,... 当前可用的版本你可以在 Steam 创意工坊的“按标签浏览”分区找到 -->
				<Tag Value="Partial Conversion" />
				<Tag Value="Dark Ages" />
				<Tag Value="Singleplayer" />
				<Tag Value="Multiplayer" />
				<Tag Value="e1.9.0" />
			</Tags>
		</UpdateItem>
	</Tasks>

* 使用 Notepad, Notepad++ 或其他工具打开该文件
* 编辑匹配你模组的 `Items` 
	* `ItemId`：插入你创意工坊模组的 ID。你可以去创意工坊模组页面找到它，在空白处右键并选择 `复制网页URL`。如果你把 URL 粘贴到其它地方，你就会看到 ID。
	* `ModuleFolder`：你模组的绝对路径
	* `ChangeNotes`：把它当作更新日志，它们会显示在你的创意工坊模组的“改动说明”部分
	* `Tags`：允许通过特定类别过滤来找到你的模组，更新标签也可以通过 `WorkshopUpdate.xml` 文件实现
* 保存更改到 `WorkshopUpdate.xml`

### 发布更新
* 找到如下目录 `\Steam\steamapps\common\Mount & Blade II Bannerlord\bin\Win64_Shipping_Client` 并确认 `TaleWorlds.MountAndBlade.SteamWorkshop.exe` 在里面
* 在目录地址栏中输入 `cmd` 并按下 `Enter`
* 输入 `TaleWorlds.MountAndBlade.SteamWorkshop.exe c:\path\WorkshopUpdate.xml` 到控制台中，带上你的 `WorkshopUpdate.xml` 文件绝对路径并按下 `Enter`
* 如果没有错误出现，你的模组已经被成功上传到 Steam 创意工坊