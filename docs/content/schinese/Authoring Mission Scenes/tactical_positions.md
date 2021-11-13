+++
title = "行动的战术位置"
description = ""
weight = 4
+++

### 战术阵地和战术区域

这些是让AI了解地形特征的脚本实体。与攻城战中不同，AI不会总是使用你放置的战术阵地或区域。他们会在自己认为有利的条件下使用它们。

由于玩家的移动路径和AI刷入路径随机化，在战斗中可能出现的情况非常多。因此，最好尽可能多地标记有意义的阵地和区域。漏掉一些有意义的阵地标记将不会导致像攻城战中那样明显的错误，但会导致战斗的趣味性降低，因为AI不会意识到他们周围的环境。下面是关于战术阵地和战术区域的类型以及使用方法。

#### 战术阵地
##### 高地（High ground），坡面方向

这些是面向一个方向的有利高地阵地。如果敌人从战术阵地面对的方向靠近，AI可以守住这些阵地。
方向是最重要的部分。要防守的阵地将面对阵地的前进方向（编辑器中的绿色箭头）。参数如下。

{{% notice info %}}
* _width: AI会尝试在整个 _width 范围内展开阵型，如果它太小且AI兵力过多，或者过大而AI兵力不足，则AI会认为这个阵地是不合适的。
* _slope: 对于选择不同战术阵地也很重要，单位是度数，AI认为合适的最大坡度是60度。它应该大致估算出阵地的陡度。
* _isInsurmountable: false （是否不可逾越）
* _isOuterEdge: false （是否是外边缘）
* _tacticalPositionType: HighGround
* _tacticalPositionMembership: 标记周围的地形是否是森林、开阔地或障碍地形。
* _tacticalPositionSide: BehaviorSideNotSet
{{% /notice %}}

![](/img/tactical_positions/1.png)

##### 山顶(Top of Hill)，可全方位防御 

这是丘陵顶部的高地阵地，易于防御所有方向。无论敌人的进近方向如何，AI都可以守住这些阵地。AI会面朝敌人在山顶布阵。方向并不重要。

{{% notice info %}}
* _width 是很重要的，应大致等于山顶的半径。
* _slope 对于在不同的定位点做出选择很重要，它的单位是度数，AI认为合适的最大坡度是60度。它应该大致描述出定位点的陡度。
* _isInsurmountable => true	这就是山顶类型的主要特征。
* _isOuterEdge => false
* _tacticalPositionType => HighGround
* _tacticalPositionMembership => 标记周围的地形是否是森林、开阔地或障碍地形。
* _tacticalPositionSide => BehaviorSideNotSet
{{% /notice %}}

![](/img/tactical_positions/2.png)

##### 隘口（Choke Points）

这种类型是两边有不可逾越障碍的隘口。人数较少的AI可以尝试守住这些隘口，以减轻自己的人数劣势。

{{% notice info %}}
* Direction 是最重要的部分。防守阵地将面对该阵地的前进方向（编辑器中的绿色箭头） ***
* _width 很重要，AI会尝试在整个 _width 范围内展开阵型，如果它太小且AI兵力过多，或者过大而AI兵力不足，则AI会认为这个阵地是不合适的。
* Slope 对于阵地之间的选择也很重要，它以度为单位，并且AI最多可以识别60度的坡度。它应该粗略估计阵地的陡度。
* _isInsurmountable => false	(目前这个字段对隘口没有任何作用，但我会在_isInsurmountable为真的情况下，增加同一个隘口的前后两个方向防守功能，因此如果有一个隘口可以用来对付前面和后面的敌人，就将它标记为true，而不是布置两个方向相反的隘口)
* _isOuterEdge => false
* _tacticalPositionType => ChokePoint
* _tacticalPositionMembership => 标记周围的地形是否是森林、开阔地或障碍地形。
* _tacticalPositionSide => BehaviorSideNotSet
{{% /notice %}}

![](/img/tactical_positions/3.png)

##### 悬崖（Cliff Positions）

这种战术阵地本身毫无意义。它们应该放在隘口战术阵地下的实体层次结构中。如果放在隘口下，而AI使用了这个隘口，才会使用悬崖阵地。

{{% notice info %}}
* 悬崖阵地应该是当母体隘口被其他防守者占据时，敌人无法到达的阵地。
* 当符合条件时，远程火力阵型将移动到这个阵地。
* 悬崖阵地的方向将决定弓箭手阵型使用此阵地时的朝向。
* _width 很重要，AI会尝试在整个 _width 范围内展开阵型，如果它太小且AI兵力过多，或者过大而AI兵力不足，则AI会认为这个阵地是不合适的。
* _slope => 不重要
* _isInsurmountable => false
* _isOuterEdge => false
* _tacticalPositionType => Cliff
* _tacticalPositionMembership => 标记周围的地形是否是森林、开阔地或障碍地形。
* _tacticalPositionSide => BehaviorSideNotSet
{{% /notice %}}

![](/img/tactical_positions/4.png)

#### 战术区域（TACTICAL REGIONS）

这些都是用于标记场景中的区域。只给出一个半径的圆形区域。显然，场景中会有完全自定义/随机形状的森林、险要地貌和开阔地。因此应该定义多个由不同圆形区域组成的战术区域，可以根据需要添加多个圆形区域。每个战术区域的圆形区域半径可以是一个粗略的估计，不需要精确。

##### 森林区域（Forest Areas）

如果敌人拥有更多的远程和骑兵部队，则AI可以在森林区域内使用阵地，因为弓箭手和骑兵在森林中的效能较低。任何对远程部队和骑兵都不利的地区都可以指定为一个森林区域，它不一定必须是一片有树木的森林，也可以是一个有很多障碍物和掩护物的市场。 

![](/img/tactical_positions/5.png)

##### 障碍地形（Difficult Terrain）

这包括岩石地形以及沼泽，甚至可能是集市或一些地面有很多障碍物的阵地，任何不妨碍范围性火力(如森林)但阻碍和减缓骑兵的区域都应该被考虑并标记为障碍地形。如果敌方的骑兵部队数量占优，AI可以在困难地形区域内使用阵地。

![](/img/tactical_positions/6.png)

##### 开阔地形（Open Areas）

能让骑兵快速移动和清除远程火力的地形。这个区域类型是用来标记合适的战场。如果AI拥有优势或同等数量的射手和骑兵单位，可以选择在开阔区域进行防御。

![](/img/tactical_positions/7.png)

#### 战术区域和阵地组合

A节中描述的战术阵地也可以放在战术区域实体下，它们的_tacticalRegionMembership应该被正确选择。在这种情况下，AI会意识到隘口也在森林区域，在合适的条件下，可以相应地选择该隘口或高地。
