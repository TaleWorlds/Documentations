+++
title = "托管自定义服务器"
description = ""
weight = 5
ai_translated = true
+++

## 安装
在 Steam 库中启用工具（Tools）。`Mount & Blade II: Dedicated Server` 应该会出现在你的列表中。下载并安装它。

## 托管
默认情况下,专用服务器使用 UDP 端口 7210。你必须拥有一个可见的(公共)互联网 IP 地址,并且上述端口必须可被访问。

不支持匿名托管。你必须先进入游戏来创建一个服务器令牌(token)。

### 生成令牌
启动 `Mount & Blade II: Bannerlord` 多人游戏并登录游戏大厅:

<img src="/img/hosting_server/hosting_server_1.jpg" width="900px" />

按下 `ALT` + `波浪号键 (~)` 打开游戏控制台:

<img src="/img/hosting_server/hosting_server_2.jpg" width="900px" />

在文本框中输入 `customserver.gettoken` 并按回车:

<img src="/img/hosting_server/hosting_server_3.jpg" width="900px" />

你的令牌已生成,并保存在你的 `Documents\Mount & Blade II Bannerlord\Tokens` 文件夹下:

<img src="/img/hosting_server/hosting_server_4.png" width="900px" />

如果你打算在安装了 Bannerlord 的同一台电脑上托管专用服务器,那么这就是你需要做的全部工作。但如果你打算使用另一台电脑进行托管,请将此令牌文件复制到目标电脑的 `Documents\Mount & Blade II Bannerlord\Tokens` 文件夹中。下面的启动参数(Launch Arguments)部分还展示了另一种替代方法。

请注意,生成的令牌与你的 Bannerlord 账户绑定。任何滥用行为都将被追溯到最初生成该令牌的用户。**我们建议将其保密**,不要与他人分享。

还要记住,出于安全原因,**你的令牌会在 3 个月后过期**,届时你可以通过生成一个新令牌来替换它。

### 服务器管理
你可以通过在服务器控制台(启动服务器时会打开)中输入命令来管理你的服务器。

输入 `list` 并按下 `enter`,你将获得专用服务器中所有可用的命令:

<img src="/img/hosting_server/consolecommands.png" width="600px" />

例如,要运行一个简单的服务器,你可以在控制台中输入以下命令:

* `ServerName Custom Dedicated Beta Test`
* `GameType TeamDeathmatch`
* `start_game`
* `start_mission`

执行这些命令后,你的自定义服务器将对所有玩家可见并可访问。

通过 `ServerName` 和 `GameType` 命令,你只是简单地设置服务器的名称和游戏模式。

通过 `start_game` 命令,你开始托管你的服务器。你的服务器将对所有玩家可见。任何进入你服务器的玩家都将在中场(intermission)状态等待。

通过 `start_mission` 命令,你的服务器将切换到任务(mission)模式,玩家将能够开始游戏。

你也可以使用简写命令 `start_game_and_mission` 来代替这两个命令。

#### 技巧与窍门

##### 配置文件
除了在服务器控制台中逐条执行命令外,你还可以指定一个在初始化时运行的配置文件,该文件的内容将被逐行执行。

你可以在 Native 模组目录下找到示例配置文件(`Modules\Native\ds_config_*.txt`)。请注意,目前你自己的配置文件也必须位于同一目录中才能被服务器找到。有关如何指定要运行的配置文件,请参阅下面的启动参数部分。

##### 启动参数
目前有几个特别有用的启动参数:

`/dedicatedcustomserverconfigfile [configuration_file_name]`
指定一个要运行的配置文件,如上面配置文件部分所述。

`/dedicatedcustomserverauthtoken [authentication_token_contents]`
当令牌通过启动参数传递时,就不需要包含令牌的本地文件了。

`/DisableErrorReporting`
禁用崩溃上传器弹窗和自动错误报告。

`/LogOutputPath [output_path]`
设置服务器的日志输出目录。路径应放在双引号中。

`/port [number]` 可选地指定一个端口号来运行服务器,适用于使用非默认端口的情况。

##### 日志文件
默认情况下,自定义服务器的日志文件可以在 Windows 的 ProgramData 目录下找到(`%programdata%\Mount and Blade II Bannerlord\logs`)。

##### 自动战斗计数
在 `enable_automated_battle_switching` 之前使用命令 `set_automated_battle_count`,你可以设置服务器关闭前要进行的任务数量。

例如,`set_automated_battle_count 10` 将使服务器进行 10 场任务后关闭。如果你想要无限数量的任务,请将其设置为 `-1`。

#### 附加功能
从 v1.2.x 补丁开始,下面带删除线的文本不再适用。`DedicatedCustomServerHelper` 模组及其功能已合并到基础游戏中。

~~我们提供了可选的 `DedicatedCustomServerHelper` 模组来帮助服务器主机。其中有几个子模组用于不同的目的。~~ 要让服务器端模组能够从外部被使用,你还需要使 TCP 端口 7210 可被访问。

~~请注意,虽然该模组对服务器主机来说是可选的,但如果你作为主机加载了该模组,玩家也需要加载它。否则,模组不匹配将导致玩家无法加入。~~

##### 管理 Web 面板
该模组会启动一个 Web 面板,通过一个常规管理页面和一个终端页面与你的自定义服务器进行交互:

<img src="/img/hosting_server/hosting_server_6.png" width="900px" />

一旦服务器初始化完成,你可以通过服务器的 IP 地址和端口访问该 Web 面板。

该 Web 面板受服务器配置的 `AdminPassword` 选项密码保护。**默认情况下,此选项为空,因此请务必将其更改为一个安全的密码**。

如果你不希望该 Web 面板可从本地网络或本机以外被访问,并且也不需要下面的地图下载功能,你可以自由地阻止 TCP 端口 7210 的外部访问。

##### 游戏内地图下载 [地图下载器]
我们还提供了一种方式,允许玩家通过游戏内面板下载你服务器的地图文件。作为服务器主机,有一些条件你必须确保才能使此功能正常工作:

* 要提供的地图必须且只能位于 Multiplayer 模组的 `SceneObj` 目录中,方式与典型模组包含场景的方式相同。如果该目录缺失,你可以手动创建它。
* 要提供的地图必须通过 `Map` 配置选项、`add_map_to_automated_battle_pool` 或 `add_map_to_usable_maps` 命令进行"注册"。换句话说,只有在服务器上可玩的地图才会被提供。

请注意,如果场景被加载到多个模组中,会导致诸如场景不显示在下载面板上等问题。

玩家在尝试加入服务器时将收到下载所有缺失地图的提示,或者他们可以在自定义服务器列表条目上点击右键,这将打开一个上下文菜单,其中包含打开该服务器下载面板的选项。一旦所有缺失的地图成功下载完成,就无需重启游戏,他们应该能够直接加入你的服务器。

<img src="/img/hosting_server/downloadpanel.png" width="600px" />

请注意,此功能旨在支持简单的使用场景。这不是一个模组管理器功能,无法支持需要分散在给定模组中其他资源(ModuleData、Prefabs 等)的地图。只有 `SceneObj` 目录的内容会在服务器和客户端之间传输。

如果缺乏预制件(prefab)支持是个问题,你或许可以通过打破预制件,使该场景可以通过地图下载器使用。在编辑器中打开场景,选中所有实体对象,右键单击并选择 *Break Prefab*(打破预制件)。

##### 游戏内管理面板与管理功能
游戏内管理面板提供了一种组织和管理活动的简便方式。

管理功能仅对那些通过提供管理员密码(在服务器上右键单击,然后选择 `Join as Admin`)以管理员身份进入服务器的人开放。然后你可以通过 Escape 菜单访问管理面板。`AdminPassword` 可以从服务器配置中设置。

|  |  |
| ------ | ----------- |
| <img src="/img/hosting_server/adminpanel1.png"/ width="400px"> | <img src="/img/hosting_server/adminpanel2.png" width="400px"/> |

游戏内面板有两个主要的操作按钮:

* `Apply and Start Mission`(应用并开始任务)-> 这将应用所做的所有更改并立即开始一场新任务。
* `Apply Changes`(应用更改)-> 这将应用所做的所有更改。列在"立即生效"(Immediate Effects)下的更改将立即生效。列在"任务选项"(Mission Options)下的更改将在下一场任务中应用。

游戏内管理面板带有以下选项:

###### 任务选项(需要任务重启)

请注意,如果你希望使用游戏内管理面板更改需要任务重启的"任务选项",你必须使用地图中场系统。这意味着你必须在服务器配置中使用 `start_game_and_mission`(或 `start_game`)和 `enable_automated_battle_switching` 命令。不使用这些命令将自动禁用管理面板上的所有任务选项。

此外,选项会根据所选的游戏类型而开放。例如,选择 TeamDeathMatch 时,预热时间限制(Warmup Time Limit)选项不可用——因为 TDM 中没有预热环节。

* Game Type(游戏类型)
	* 列出所有可用的游戏类型(Siege、TeamDeathmatch、Captain、Skirmish、Duel、Battle)
* Map(地图)
	* 列出所有通过 `add_map_to_usable_maps [MapName] [GameType],[GameType]` 命令传递给服务器配置的地图
		* 例如:`add_map_to_usable_maps mymap Siege,Skirmish`(请注意,GameType 必须正确大写)
* Attacker & Defender Cultures(攻方与守方文化)
* Minimum Score to Win Duel(赢得决斗所需的最低分数)
* Number of Rounds(回合数)
* Map Time Limit(地图时间限制)
* Round Time Limit(回合时间限制)
* Warmup Time Limit(预热时间限制)
* Maximum Number of Players(最大玩家数)

###### 立即生效
* Welcome Message(欢迎消息)
* Team Balance Threshold(队伍平衡阈值)
* Friendly Damages(友军伤害)
* Class Limits(职业限制,Allow、Disallow)

###### 其他
* End Warmup(结束预热)
	* 覆盖预热计时器,在 30 秒内结束预热。
* Mute/Unmute Player(静音/取消静音玩家)
	* 使玩家静音,阻止其使用聊天功能。
* Kick Player(踢出玩家)
	* 将玩家踢出服务器。被踢出的玩家可以立即重新加入服务器。
* Ban Player(封禁玩家)
	* 将玩家从服务器中封禁。被封禁的玩家在服务器重启之前无法重新加入。

以下是在更改游戏类型、地图和文化时你应该预期的一些行为:

* 如果你将游戏类型、地图和文化保持未选择状态 -> 游戏将运行当前正在进行的游戏类型,并让玩家对可用地图(通过 `add_map_to_automated_battle_pool` 传递的那些)和文化进行投票。
* 如果你将游戏类型、地图和文化保持未选择状态,并且该游戏类型不是服务器最初启动时的类型 -> 游戏将运行当前正在进行的游戏类型,并从可用地图(通过 `add_map_to_usable_maps` 传递的那些)中随机使用一张地图,并让玩家对文化进行投票。
* 如果你选择了游戏类型但将地图和文化保持未选择状态,并且所选游戏类型不是服务器最初启动时的类型 -> 游戏将运行当前正在进行的游戏类型,并从可用地图(通过 `add_map_to_usable_maps` 传递的那些)中随机使用一张地图,并让玩家对文化进行投票。
* 如果你选择了游戏类型和地图,但将文化保持未选择状态 -> 游戏将使用所选的游戏类型和所选地图运行,并让玩家对文化进行投票。
* 如果你选择了游戏类型、地图和文化 -> 游戏将使用所选的游戏类型、地图和文化运行,不会出现投票画面。
* 如果你没有通过 `add_map_to_usable_maps` 参数为特定游戏类型提供任何地图,该特定游戏类型将在管理面板中被禁用。
* 官方地图只能与预定的游戏类型配合使用。尝试通过 `add_map_to_usable_maps` 将它们用于其他游戏类型,将不会在管理面板中显示它们。

###### 管理员公告
你还可以利用管理员公告系统,通过在聊天中输入以下内容向服务器上的所有人推送文本:

* `/ab [text]` - 管理员广播(Admin Broadcast)- 在屏幕中央以及聊天中显示公告,并伴有提示音。
* `/ac [text]` - 管理员聊天(Admin Chat)- 在聊天中显示公告。

## 常见问题
##### 托管时 Steam 需要保持打开吗?
不需要。你只需要 Steam 来保持服务器文件的更新。你可以自由地将服务器文件复制到其他电脑进行托管。但我们强烈建议你配合 Steam 使用,以保持其更新。与 Warband 不同,目前任何旧版本的服务器文件都将与我们的系统不兼容。

##### 你们是否计划添加对其他游戏平台的支持?
是的。

##### 如果我不想使用任何游戏平台来获取服务器文件,还有其他选择吗?
目前,Steam 是唯一的下载方式。我们计划将其添加到其他游戏平台,也正在讨论在未来使用 Docker 主机来分发服务器文件。

##### 你们会提供 Linux 支持吗?
Linux 服务器文件已经可用!

##### 我的服务器是否对所有人可见?
是的,除非你设置密码保护,否则你的服务器将对所有人可见。

##### 我可以托管多少个服务器?
你可以同时托管的服务器数量是有限制的。目前,你最多可以托管 50 个服务器。

##### 硬件要求是什么?
这取决于游戏模式和玩家数量。在默认配置下,我们托管我们的游戏:

* 对于较小规模的战斗(Skirmish 和 Duel):2 核 CPU(2GHz 至 3GHz),4GB 内存
* 对于较大规模的战斗(Siege、Team Deathmatch 和 Captain):4 核 CPU(2GHz 至 3GHz),8GB 内存

但是,举例来说,你也始终可以在 2 核机器上以较少玩家数托管攻城模式。

你也可以尝试用单核机器托管一个非常小的游戏,但你在游戏过程中可能会遇到一些性能峰值。

##### 带宽要求是什么?
这取决于玩家数量。默认情况下,我们向每个玩家发送 60 个数据包,每个数据包小于 1.5 千字节。对于大多数配置,任何专用服务器提供商都应该能够提供足够的网络连接。

##### 是否支持修改(Modification)?
是的!前往 https://moddocs.bannerlord.com/multiplayer/custom_game_mode/ 了解更多信息。
