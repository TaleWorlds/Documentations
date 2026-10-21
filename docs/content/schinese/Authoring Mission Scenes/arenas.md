+++
title = "竞技场场景的构成要素"
description = ""
weight = 1
ai_translated = true
+++

#### 简介

* 本文档将回答“如何创建竞技场场景?”以及“创建竞技场场景时应考虑哪些因素?”这两个问题。

#### 场景准备

* 首先需要强调的一点是,竞技场场景的地形不应过大。竞技场场景中可以使用较少的地形节点,远少于其他类型场景所需的数量。

#### 地形与场景模型
* 在竞技场场景中,地形应该是平坦或接近平坦的,带有少量不平整的部分(具体取决于场景作者的喜好)。
* 应事先使用模块化部件(看台和包厢)放置模型。
	* 示例:一个斯图尔基亚(Sturgian)竞技场场景拥有 `sturgia_arena_grandstand_a`、`sturgia_arena_grandstand_b`、`sturgia_arena_grandstand_c`、`sturgia_arena_grandstand_d` 等模块化网格部件。
* 应使用假房屋(fake houses),因为我们不希望看台背景和内城景观显得空旷。我们可以通过参考 `Adam0` 模型在战斗区域和包厢中的头部高度视角来实现这一点。
* 每个派系都有独特的模型。这些模型应被恰当地使用,并放置在场景的相应部位。

#### 必需的出生点(spawn points)
* 在活跃战斗区域:
	* `tournament_practice_set`
	* `tournament_fight_set`
* 在包厢区域:
	* `sp_tournament_master`
	* `sp_player_near_arena_master`
	* `_barrier_passage_center`(需要放置在门口或包厢入口点)
	* `sp_player`

#### 带截图的竞技场创建分步指南
* 地形特性:一个节点(颜色贴图分辨率:512x512),LOD 倍率(1)
* 现在已指定战斗区域。我们还完成了地形绘制(建议使用 `adam0` 网格来辅助比例把控)。

|  |  |
| ------ | ----------- |
| <img src="/img/arena_scenes/1.jpg"/> | <img src="/img/arena_scenes/2.jpg"/> |


* 在确定竞技场位置之后,应放置包厢和看台(如果你有自己的自定义模型,可以在此阶段使用它们,否则请使用预制件(prefab)标签页中的现有模型,例如 `arena_main_building`)。
* 除了环境元素之外,你还可以放置各种网格用于视觉美化(石头、破损的木桶、原木等)。

<img src="/img/arena_scenes/3.jpg" width="1200px" />

* 还应在场景中放置火把和光源。

<img src="/img/arena_scenes/4.jpg" width="1200px" />

* 在预制件标签页中搜索 `arena_audience_mid_point`。将其定期放置在场景中央。

<img src="/img/arena_scenes/5.jpg" width="1200px" />

* 在预制件标签页中搜索 `crowd_man`。按你的喜好将三种变体放置在看台上。

<img src="/img/arena_scenes/6.jpg" width="1200px" />

* 这一阶段是最重要的阶段之一。需要放置在竞技场主建筑(我们称之为包厢)中的出生点如下:
	* `sp_tournament_master`
	* `sp_player_near_arena_master`
	* `_barrier_passage_center`
	* `sp_player`
* `sp_tournament_master` 应面朝背对战斗区域放置。在此出生点前方,你需要放置 `sp_player_near_arena_master`,因为它们需要彼此面对面。此外,还需要放置 `camera_height_limiter`,因为镜头应当能看到包厢区域。
* 需要在包厢中放置屏障(barries)。

| 出生点放置 | 出生点放置与放置的屏障 |
| ------ | ----------- |
| <img src="/img/arena_scenes/7.jpg"/> | <img src="/img/arena_scenes/8.jpg"/> |

| 已放置出生点的另一个视角 | 摄像机高度限制器的水平、位置及镜头目标 |
| ------ | ----------- |
| <img src="/img/arena_scenes/9.jpg"/> | <img src="/img/arena_scenes/10.jpg"/> |

* `envmap_prop` 应放置在竞技场中心。此物体的高度很重要。建议使用 `Adam0` 模型来进行比例把控。

<img src="/img/arena_scenes/11.jpg" width="1200px" />

* 如果有任何我们不希望玩家或 AI 进入的区域,应放置屏障。

<img src="/img/arena_scenes/12.jpg" width="1200px" />

* 应沿着看台绘制一条路径(path)。此路径用于看台音效。别忘了为该路径命名。
	* 在预制件标签页中搜索 `arena_path_sound`。将该预制件放置在场景中你想要的任意位置。展开 `Entity Inspector` 标签页中的 `Scripts` 下拉菜单,你应该会看到 `path_converger` 脚本。将你之前输入的路径名称输入到 `path_converger` 脚本中的 `Path Name` 字段。

|  |  |
| ------ | ----------- |
| <img src="/img/arena_scenes/13.jpg"/> | <img src="/img/arena_scenes/14.jpg"/> |

* 需要在场景中放置一个通用摄像机。你可以在预制件标签页中搜索 `camera_instance`。警告!预制件标签页中有两个 Camera Instance。我们要使用的是名称以小写字母命名的那个。你可以按照截图所示将摄像机添加到场景中。

<img src="/img/arena_scenes/15.jpg" width="1200px" />

* 对于竞技场战斗区域,你需要放置两个出生点集(spawn point sets)。它们是:
	* `tournament_practice_set`(用于“练习战斗”战役选项)
	* `tournament_fight_set`(用于“加入锦标赛”战役选项)
* 放置这两个集合之后,你需要放置子出生点。详情请参见截图。

|  |  |
| ------ | ----------- |
| <img src="/img/arena_scenes/16.jpg"/> | <img src="/img/arena_scenes/17.jpg"/> |

* 你需要在战斗区域周围放置 `border_soft`(不需要环绕看台放置)。

<img src="/img/arena_scenes/18.jpg" width="1200px" />

* 最后一个阶段是为包厢和战斗区域创建导航网格(navmesh)。

|  |  |
| ------ | ----------- |
| <img src="/img/arena_scenes/19.jpg"/> | <img src="/img/arena_scenes/20.jpg"/> |
