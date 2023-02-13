+++
title = "搭建一个自定义服务器"
description = "本文档为搭建自定义服务器的教程，从安装到部署整个流程包括在内。同时，文档内还有关于服务器参数的讲解，以及一些注意事项和可能碰到的问题的说明。在文档最后，还有常见问题一节，用来回答开发者们可能会问的一些普遍的问题。"
weight = 5

+++

## 安装
在你的 Steam 库中选到“工具”，你会在列表里看到 `Mount & Blade II: Dedicated Server`。下载并安装它。

## 搭建
By default, dedicated servers use UDP port 7210. You must have a visible (public) IP address on the internet as well as the aforementioned port being accessible.

服务器不支持匿名搭建，你需要先进入游戏生成一个令牌（Token）。

### 生成一个令牌（Token）
启动游戏 `Mount & Blade II: Bannerlord` 多人模式并登录到联机大厅：

<img src="/img/hosting_server/hosting_server_1.jpg" width="900px" />

通过按键 `ALT` + `波浪号键(~)` 打开游戏控制台：

<img src="/img/hosting_server/hosting_server_2.jpg" width="900px" />

在输入框中输入 `customserver.gettoken` 并按下 `Enter` 键：

<img src="/img/hosting_server/hosting_server_3.jpg" width="900px" />

你的令牌生成了并保存到了 `Documents\Mount & Blade II Bannerlord\Tokens` 目录下：

<img src="/img/hosting_server/hosting_server_4.png" width="900px" />

如果你计划在安装了《霸主》的同一台计算机上搭建独立服务器，那么针对令牌的操作到这一步就可以了。但如果你计划在另外一台不同的计算机上搭建服务器，请复制你的令牌文件到目标电脑上的 `Documents\Mount & Blade II Bannerlord\Tokens` 目录下。还有一种方法是通过程序启动参数来输入令牌，在下面的“启动参数”一节说明。

注意，这个生成的令牌文件是绑定你的《霸主》账户的，如果有任何滥用令牌的行为，我们都可以追溯到创建令牌的用户。**我们建议你只自己用**，并且不要将它分享给其他人。

另外请记住，因安全起见，**你的令牌会在 3 个月后过期**，届时你可以重新生成并更换令牌。

### 服务器管理
你可以在你的服务器控制台（在启动服务器时会显示）里输入命令来管理你的服务器。

通过输入 `list` 然后按下 `enter` 键，你可以获取到独立服务器的所有可用命令：

<img src="/img/hosting_server/hosting_server_5.png" width="800px" />

例如，想要简单启动一个服务器，你可以在控制台输入以下命令：

* `ServerName Custom Dedicated Beta Test`
* `GameType TeamDeathmatch`
* `start_game`
* `start_mission`

通过执行这些命令，你的自定义服务器将出现在服务器列表，并且所有玩家都可以访问。

通过 `ServerName` 和 `GameType` 命令，你可以轻松地设置你的服务器名字和游戏模式。

通过 `start_game` 命令，你可以启动你搭建的服务器。你的服务器将变为所有玩家可见，任何进入服务器的玩家都会在中场休息状态下等待。

通过 `start_mission` 命令，你的服务器将会切换到行动模式，并且玩家能够正式开始游玩。

你可以使用简写 `start_game_and_mission` 来替代上述两个命令。

#### 提示 & 技巧

##### 配置文件
你可以指定一个配置文件在初始化时加载运行，该文件的内容将被逐行执行，而不是通过服务器控制台一条一条的来输入命令。

你可以在 Native 模组目录下找到示例配置文件（`Modules\Native\ds_config_*.txt`）。请注意，目前为止，你自己的配置文件也必须位于该目录下，才能被服务器读取到。关于如何指定要运行的配置文件，请参考下文中提到的“启动参数”。

##### 启动参数
目前，有几个特别有用的启动参数：

`/dedicatedcustomserverconfigfile [配置文件名]`  - 指定一个要加载的配置文件，如上文“配置文件”一节中所提到的那样。

`/dedicatedcustomserverauthtoken [认证令牌内容]`  - 当令牌通过启动参数传入，包含令牌的本地文件就不需要了。

`/DisableErrorReporting ` - 禁用崩溃报告上传（Crash Uploader）弹出和自动错误上报。

`/LogOutputPath [输出目录] ` - 设置服务器日志文件的输出目录，路径应该用双引号括起来。

`/port [number]` Optionally specify a port number to run the server from, useful for using ports other than the default.

##### 日志文件
默认情况下，Windows 的自定义服务器的日志文件可以在你的 ProgramData 目录（`%programdata%\Mount and Blade II Bannerlord\logs`）下找到。

##### 自动换图次数
通过在 `enable_automated_battle_switching` 之前使用命令 `set_automated_battle_count` 你可以设置在服务器关闭前可以游玩的行动数量。

例如，`set_automated_battle_count 10` 会让服务器运行 10 个行动后关闭，如果你想设置为无限行动数量，将值设为 -1。

#### 辅助模组
我们提供可选模组 `DedicatedCustomServerHelper` 来辅助搭建服务器，其中有几个子模组可以实现不同的功能。为了使服务端模组可以通过外部网络使用，你需要开放 TCP 端口 7210。

请注意，尽管该模组对于服务器搭建来说是可选的，但如果你加载了此模组，那么玩家也必须加载此模组。否则，模组不匹配的玩家将无法加入服务器。

##### 网页管理面板
这个模组启动了一个网页面板，通过一个通用的管理页面和终端页面与你的自定义服务器进行交互：

<img src="/img/hosting_server/hosting_server_6.png" width="900px" />

你的网页面板初始化完成后，你可以在你的服务器控制台看到它的 URL 地址。

该网页面板受服务器所配置的 `AdminPassword` 选项的密码保护。**默认情况下，该选项的值为空，所以一定要设置一个安全的密码。**

如果你不希望除本地网络或机器以外的地方能访问网页面板，同时也不需要下面的地图下载功能，那么你只需要拦截外部对 TCP 端口 7210 的访问即可。

##### 游戏内地图下载
我们还提供了一种允许玩家通过游戏内面板下载服务器的地图文件的方式。作为服务器主机，你必须要满足一些条件才能让这个功能发挥作用：

* 地图文件必须置于 **ONLY** `DedicatedCustomServerHelper` 模组的 `SceneObj` 目录下，就像一个典型的包含场景的模组一样。如果没有该目录，你可以手动新建一个。
* 要把这个地图提供给玩家，必须通过 `Map` 选项或  `add_map_to_automated_battle_pool` 命令“注册”到服务器。

Note that having the scene loaded in multiple modules will cause issues such as the scene not being shown on the download panel.

为了让玩家能够打开下载面板，他们需要在加载了 `DedicatedCustomServerHelper` 模组后启动游戏。现在，他们可以鼠标右击自定义服务器列表项，然后会打开一个上下文菜单，其中会有打开该服务器下载面板的选项。地图下载成功后，无需重新启动游戏，他们应该就能直接加入你的服务器。

<img src="/img/hosting_server/hosting_server_7.png" width="600px" />

请注意，这个功能是用于支持这一简单的使用场景。这不是一个模组管理器功能，也无法支持获取给定的模组分布在其他资产（如 ModuleData、Prefabs 等）中的地图。只有 `SceneObj` 目录下的内容会在服务端和客户端之间传输。

If the lack of prefab support is a concern, you may be able to make the scene usable through the helper module by breaking the prefabs. Open the scene in the editor, select all entity objects, right click and select *Break Prefab*.

## 常见问题
##### 在服务器搭建时需要 Steam 保持运行吗？
不，你只需要用 Steam 保持你的服务器文件为最新就行，你可以随意拷贝服务器文件到其它计算机上搭建。但我们强烈推荐你带一个 Steam 以保证文件是最新的。不像《战团》，目前而言，任何旧版本的服务器文件都不兼容我们的系统。

##### 你们计划支持其他的游戏平台吗？
是的。

##### 如果我不想用任何游戏平台来获取服务器文件，会有其他选择吗？
目前，Steam 是下载服务器文件的唯一渠道。我们计划将服务器文件添加到其他游戏平台，同时也在考虑未来使用 Docker 分发服务器文件这样一个方案。

##### 你们会提供 Linux 支持吗？
是的。事实上，我们的后端使用的就是 Linux 服务器，但要给公众使用的话，还需要对系统进行进一步开发。

##### 我的服务器所有人都可以访问吗？
是的，你的服务器所有人都可以访问，除非说你设置了密码来保护。

##### 我可以搭建多少服务器？
你可以同时运行的服务器数量是有限的。目前，你最多可以同时运行 5 个服务器。

##### 硬件要求是什么？
这需要看是何种游戏模式以及玩家数量。这是我们搭建游戏服务器时，默认的配置：

* 小型战斗（遭遇战和决斗）：2 核 CPU (2GHz 到 3GHz) 和 4GB 内存
* 大型战斗（围攻战、团队死斗和领军战）：4 核 CPU (2GHz 到 3GHz) 和 8GB 内存

但举例来说，你总是可以在一台 2 核机器上搭建一个较少玩家的攻城服务器。

你也可以尝试使用单核机器来搭建一台非常小型的服务器，但你可能在游戏中碰到一些使用率突增卡顿的情况。

##### 带宽要求是什么？
这取决于玩家数量。默认情况下，我们会给每个玩家发送 60 个数据包，并且每个数据包少于 1.5 kb（千字节）。对于大多数配置，任何专用服务器供应商都应该能够提供足够的网络连接。

##### 游戏支持任何自定义模组吗？
是的！

##### 自定义时的反作弊功能是怎样的？
对于自定义游戏反作弊是关闭的。请注意，任何修改过游戏的玩家都无法加入官方服务器。

##### 会有游戏内管理面板来帮助更快更方便地管理服务器吗？
我们打算做一个。
