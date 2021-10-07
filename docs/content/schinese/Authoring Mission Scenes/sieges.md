+++
title = "攻城战场景是如何构成的"
description = ""
weight = 1
+++

#### 简介
在创建被围攻的城镇和城堡场景时，这个围攻功能组件列表将帮助你。

___

#### 可攻击墙

*可攻击墙是指在攻城场景中支持被破坏功能的墙体位置。我们必须指定实体阶段和破损阶段和它们的重要位置，以及如果有破损时AI导航网格的变化。

* 给父实体添加一个会用在攻城梯和攻城塔上（例如:wall_segment_left，wall_segment_right）的标签。这个标签将识别哪些攻城机与哪些路线有关，并将用于攻城机上的 "target wall segment"变量。
* 将标签"broken_child"添加到被破坏的墙，将标签"solid_child"添加到实体墙。
* 给实体墙添加两个实体作为子实体。第一个是当攻击者接近城堡时，防御者部队将在哪里等待，第二个是他们应该站在哪里进行防御。这两个实体应该分别有 "wait_pos"和 "middle_pos"的标签。

<img src="/img/siege_scenes/Show_middle_pos_and_wait_pos.png" width="1200px" />

* 对于被破坏的墙，添加三个子实体。它们应该有 "wait_pos"、"middle_pos"和 "attacker_wait_pos "三个标签。前两个和实体墙一样，“attacker_wait_pos”是攻击者部队等待其他攻城引擎就位的地方（最好是在掩体后面）。
* **wallSegment 脚本**
    * 输入可攻城墙的一侧（应该是left或right，中间是留给门房的，不管它的位置在哪里）。
    * 输入你将用于该可围攻墙的导航网ID。
    * 重新制作导航网，并为其标识"ID"。
    * 确保新的导航网面有正确的等级。

<img src="/img/siege_scenes/wallsegment.png"/>

| 实体墙导航网格 | 破损墙导航网格 |
| ------ | ----------- |
| <img src="/img/siege_scenes/siegable_walls_1.png"/> | <img src="/img/siege_scenes/siegable_walls_2.png"/> |

* 如果您不打算在碎片导航ids下使用，您可以在墙壁段脚本上输入相应的ID的"-1"。
* 在此示例中，当墙壁未损坏时，328将连接到342，331将连接到391，341将处于活动状态，351将处于活动状态。
* 当墙体被打破并有一个突破口时，328将连接到371，381将连接到391，361将处于活动状态。
* 这样一来，如果我们在可围攻的墙体周围有很多碎片，那么因为缺乏导航网而被卡住的agent就会少很多。
* 在此图中，为了清晰起见，导航网之间的空隙被夸大了。

___

#### 城堡门

*城堡大门是与撞城锤互动的位置和预制件。我们必须提供两个必备元素，1个外门会被撞锤击破，1个内门会被普通部队攻击击破。*

* 放置外门和内门。
* 外门要有"external_gate"标签，内门要有"inner_gate"标签。
* **CastleGate 脚本**
    * 输入您将用于大门的导航网ID。
    * 将侧面变量设为 "middle"。
    * 根据其位置和级别更改闸门的HP（对于外门，HP应是：1级为12000，2级为15000，3级为18000。所有级别的内门HP都应该是1000。
    * 重新制作导航网并标识相应的ID。
    * 确保新的导航网面有正确的等级。
* 调整外门的"middle_position"的位置。它应该非常接近内门的内侧。
* 您可以使用[navigationmeshidtodisableonopen]导航网ID关闭打开状态的导航网。

<img src="/img/siege_scenes/navigationmeshidtodisableonopen.png" width="1200px" />

* **相关预制件**
    * Aserai_castle_gate_inner_l1
    * Aserai_castle_gate_outer_l1
    * Battania_castle_gate_inner_l3
    * Battania_castle_gate_outer_l3
    * Empire_castle_gate_inner_l2
    * Empire_castle_gate_inner_l3
    * Empire_castle_gate_outer_l2
    * Empire_castle_gate_outer_l3
    * European_castle_gate_outer_l1
    * European_castle_gate_outer_l2
    * Khuzait_castle_gate_outer_l1
    * Sturgia_castle_gate_inner_l3
    * Sturgia_castle_gate_outer_l3

___

#### 部署点

*所有攻城器械都被放置在部署点下。这些点在以后的任务中会成为可选择的位置，玩家可以在这些位置上放置攻城设备，如弩炮、攻城槌或攻城塔。*

* 防御者需要有4个器械。攻击者需要4个器械。攻城塔需要2台。还有一台用于攻城槌。
* 器械可以连接到这些部署点上，可以将它们放在它们的半径内，也可以通过标签来连接。

<img src="/img/siege_scenes/Deploymentpoint.png" width="1200px" />

* 最佳实践
    * 确保部署点的半径不重叠。
    * 比如说，你需要为每一层设置不同的部署点。
        * 由于城墙会随着层数的变化而变化 守城机器自然要在城墙上有不同的位置。
    	* 由于城门位置会发生变化，所以破城槌需要走不同的路径。攻城塔也是如此。

___

#### Secondary Siege Machines

*辅助攻城机是远程攻城机，可以支持攻击或抵御攻击者。其中包括双方的弩炮（ballista）和投石机（Mangonel），以及攻击者的重型投石机。*
 
* 每个防守者阵地应包括投石机和弩炮实体，每个攻击者阵地应包括投石机弩炮和配重式抛石机预制件。
* 防守者和攻击者应该各有4个"部署点"阵地。
* 攻城器械和部署点都有一个 "side"变量，确保这些变量是正确的。
* 任何攻城机都不应该被一个以上的部署点所控制。
<br><br>
* **相关的预制件**
    * Ballista_a_spawner
    * Ballista_b_spawner
    * Mangonel_a_spawner
    * Mangonel_b_spawner
    * trebuchet_a_spawner

___

#### 攻城塔

*攻城塔是攻城者在战役地图中建造攻城塔时对应的预制件。它们取代了一条城墙通道。如果攻城塔被部署，它们将覆盖该"side"的攻城梯。如果某条城墙被砸破，攻城塔就不能部署到那条城墙通道上。
*

* 将合适的攻城塔放置到现场。
* 调整可部署的出口坡道的角度，可以选择坡道并旋转它，或者使用"SiegeTowerSpawner "脚本中的"RampRotationDegree"参数。
* 如果你的出口坡道向上或向下有很大的坡度角，请确保导航网预制件适合坡道，否则请制作一个。
* <a href="http://docs.modding.bannerlord.com/editor/scene-editor/path_editing/">使用路径工具，为攻城塔构建路径</a>。
* **SiegeTowerSpawner 脚本**
    * 输入路径名称。
    * 输入目标墙段。这就是我们添加到墙体上的标签，它有攻击和等待的位置。攻城塔会搜索该标签，然后搜索它的子实体来引导AI部队进行相应的进攻。
    * 输入side标签。
    * 一旦塔连接到它的路径，将部署点放在连接攻城塔的路径开始处。
*  你可以在攻城塔的道路上用标签`tower_merlon`标记城齿。一旦攻城塔被部署到场景中，这些城齿就会被移除。确保它们有一个 "DestructableComponent "脚本，并且 "CanBeDestroyedInitially "标签被选中。
* 将"_barrier_ai_04x04m "预制构件放置在攻城塔将接近的墙上。给障碍物一个独特的标签，如 "tower_barrier_lvl3"，现在把这个标签插入 "Barrier_ai_04x04m "中。现在，在SiegeTowerSpawner脚本下的 "BarrierTagToRemove "参数中插入这个标签。一旦攻城塔的斜坡打开，被标记的障碍物就会被移除。
<br><br>
* **相关的预制件**
    * Siege_tower_5m_spawner
    * Siege_tower_9m_spawner
    * siege_tower_12m_spawner

___

#### 攻城槌

*攻城槌是攻城者在战役中建造打夯时，对应的预制件。撞击夯将连接到side标记，一旦到达城门，部队挥动攻城槌就会破坏外门。*

* <a href="http://docs.modding.bannerlord.com/editor/scene-editor/path_editing/">使用路径工具</a>建立路径。攻城槌预制件的幽灵实体上的碰撞指示器应该与大门接触，以配合动画和视觉效果。

<img src="/img/siege_scenes/crashindicator.png" width="1200px" />

* **BatteringRamSpawner 脚本**
    * 输入side标签 
    * GateTag: outer_gate
    * 输入脚本的路径名称
    * 将破城槌连接到路径后，将部署点放在路径的开头与攻城槌连接
<br><br>
* **相关的预制件**
    * Batteringram_a_spawner

___

#### 沟渠填充物(Ditch Filler)

*如果场景中城堡周围有沟渠和护城河，我们有一个沟渠填充物系统，可以让攻城塔和撞城车正常工作。如果玩家部署了连接的攻城引擎，沟渠填充物会产生。我们必须安排和识别各种导航网面，让AI在填沟器周围正确使用寻路。*

* 放置适当的实体来填充护城河后，<a href="http://docs.modding.bannerlord.com/editor/scene-editor/creating_entity/#entity-hierarchies">将它们全部收集到一个父实体下</a>。
*  将标签 "ditch_filler "和适当的side标签（left, right, or middle）添加到连接的攻城引擎中。
* 一旦攻城塔或撞城锤被部署，沟渠填充物也会随之部署。
* 我们操纵导航网的方式与破损墙体类似。
* 导航网的ID在攻城塔和撞城锤的脚本上。
* 输入你将用于沟渠填充物的导航网ID。
* 重新制作导航网，并为其命名ID。
* 确保新的导航网面具有正确的水平。

| SiegeTowerSpawner脚本 | 沟渠填充物 |
| ------ | ----------- |
| <img src="/img/siege_scenes/Ditchfiller.png" /> | <img src="/img/siege_scenes/Ditchfiller_numbers.png"/> |

* 在本例中，当没有沟渠填充物时，423、426和424将被停用，422和433将保持连接，427将激活，432和425将连接。422和433将保持连接 427将被激活，432和425将被连接。
* 当有沟渠填充物时，422将从433断开并连接到423，426将被激活，425将从432断开并连接到424，427将被停用。

___

#### 攻城梯

*攻城梯默认部署在两面可攻城墙上，除非有攻城塔或突破口。*

* 选择正确的梯子生成器尺寸，千万不要调整梯子生成器的高度。
* **SiegeLadderSpawner脚本**
    * 输入目标墙段。这是我们添加到墙上的标签，它有攻击和待命的位置。梯子将搜索该标签，然后搜索其子实体，据此引导AI部队。
    * 输入你将使用的导航网的id。
    * 输入SideTag。
    * "merlon_solid_left"或"merlon_solid_right"标签必须根据墙壁的左或右位置加入两个梯子相交的墙齿。这些标签的添加是为了确保被标记的墙齿不会被破坏，也不会导致AI部队移动的物理问题。
* 重新制作导航网，并将导航网进行相应的编码。
* 攻城梯上的导航网面应该是面朝向墙的。

<img src="/img/siege_scenes/directionalladdernavmesh.png" width="1200px" />

* 使用 "UpperStateRotationDegree "和 "DownStateRotationDegree "调整竖起和放下的位置，以配合地形和墙壁。
* 将"_barrier_ai_04x04m "预制件放置在梯子落脚的墙上。给障碍物一个独特的标签，如 "left_ladder_barrier_a"。现在将这个标签插入到梯子的 "BarrierTagToRemove "参数中。一旦攻城梯被提升到城墙上，被标记的障碍物就会被移除。
<br><br>
* **相关的预制件**
    * Siege_ladder_6m_spawner
    * Siege_ladder_7m_spawner
    * Siege_ladder_8m_spawner
    * Siege_ladder_11m_spawner
    * Siege_ladder_14m_spawner

___

#### 弓箭手阵地（Archer Positions)

*弓箭手阵地是AI方向的位置，场景设计者可以用它来定义弓箭手的射击阵地。弓箭手阵地有2种类型*

* **大型弓箭手阵地**
    * 弓箭手阵型使用的位置
    * 带有预制名称"defender_archer_position"和"attacker_archer_position"。
    *  它们有"archer_position"和"archer_position_attacker"的标签。
<br><br>
* **小型弓箭手阵地**
    *  弓箭手agent使用的位置。
    *  有"strategic_archer_point"和"strategic_attacker_archer_position"的预制名称。
    * 它们有"strategicarea"脚本。脚本中的变量有：
        * 攻击方或防御方
        * 范围(弓箭手的阵地应该在agent的范围半径内才能使用)。在这个范围内必须有一个大型弓箭手阵地，小型弓箭手阵地才会被激活。默认范围是防御者40米，攻击者60米。
        * 深度和宽度：都代表部队可用区域的大小。1x1适合在1m x 1m的区域内容纳一个部队。4x2适合8个部队在4m x 2m的区域内使用。
<br><br>	
* **相关的预制件**
    * Defender_archer_position
    * Attacker_archer_position
    * Strategic_archer_point
    * strategic_attacker_archer_position

___

#### 部署边界（Deployment Boundaries）

*我们在场景中放置边界实体，以指定攻击者和防御者可以部署部队的位置。它们的工作原理很像软边界。*

* 所有的边界实体都应该有这三个标签：
    * walk_area_vertex
    * defender or attacker
    * deployment_castle_boundary_[insert number]
* [insert number]中具有相同数字的deployment_castle_boundary_[insert number]标签相互连接以创建一个凸形区域。例如，带有deployment_castle_boundary_3标签的5个实体将创建一个五边形，定义一个边界区域。
* 你可以使用 prefabs "attacker_boundry", "defender_boundry"，并根据你的需要进行编辑。
* 如果你在这些边界集合中添加一个"out"标签，它就像一个负空间，从部署区中减去而不是增加。通过这种方法，您可以创建凹形部署区。
<br><br>
* **相关的预制件**
    * Attacker_boundry
    * Defender_boundry

___

#### 摄像机(Camera)

*摄像机的位置和角度指定了在部署阶段将使用的视角。*

*  创建一个空实体。
* 攻击者的摄像机应该有 "strategiccameraattacker "的标签。
* 防御者的摄像机应该有 "strategiccameradefender "的标签。
* 确保摄像机的位置在部署边界内。

___

#### 生成点（Spawn Points)

*生成点是指在战斗开始时，NPC部队和玩家将在场景中产生的位置。*

*  使用标准的"sp_battle_set"预制构件进行部队生成和增援。该预制件包括16个实体，用于每一种类型的部队，攻击者和防御者，初始(start)或增援(reinforcements)。普通生成指定了战斗开始时的生成位置，而援军则定义了援军的生成位置。
* 确保设置适当的关卡可见性，因为在市民级别场景内有另一个"sp_battle_set"预制件用于公共区域战斗任务。

___

#### 预定撤退路线(Flee Lines)

*进攻方与防守方都有预定撤退路线。如果放在攻城场景中，AI应该更倾向于利用预定撤退路线逃跑，而不是跑到最近的软边界边缘。*

* 防守方应该沿着预定撤退路线到下一个防守处。
* 预定撤退路线必须被导航网覆盖才会激活。
<br><br>
* **相关的预制件**
    * Flee_line_attacker
    * Flee_line_defender

___

#### 战术阵地脚本(Tactical Position Script)

*脚本[tacticalposition]可以让我们修改各种AI位置的宽度。*

* 一旦添加到一个实体中，你可以在其中改变许多参数。对于攻城战来说，唯一重要的参数是_width。这里输入的值等于阵型的宽度，单位是米。
* 你可以在[wait_pos]、[middle_pos]、[attacker_wait_pos]、弓箭手阵地和攻城梯等待阵地中使用这个脚本。 

| 战术位置 | 部署 |
| ------ | ----------- |
| <img src="/img/siege_scenes/tactical_position_1.png"/> | <img src="/img/siege_scenes/tactical_position_2.png"/> |
___

#### AI屏障(AI Barrier)

*在所有AI部队可能从不可接受的高度坠落的位置，都应该添加AI屏障。*

*  使用路径工具，先画出路径线，然后勾选"Enable Barrier Build"复选框。障碍物建好后，点击"Go to entity"，选中预制件的脚本。以下 "barrier_builder "脚本参数应该被选中。
    * AI Limiter
    * Agent Only
    * If necessary, Flip can be checked according to the side of the wall.

___

#### 可抛石堆(Throwable Rock Pile)

*我们可以将可用的石头堆放到围攻场景中。*

* 预制件 [throwable_rock_pile] 有三个组成部分。:
    * Stone pile: 有8个可交互的点，让人工智能捡起石头
    * throw_pos: agent将移动到哪里去投掷石块
    * volume_box: 指定AI可以投掷石头的区域。
* 当敌方AI移动到volume_box中时，该预制件将调用一个agent，该agent将捡起一块石头，并尝试将其扔向volume_box中可以瞄准的敌人。
* 每一个volume_box可以有多个throw_pos。只需复制 throw_pos 实体。
* 你可以通过在volume_box中添加一个标签，并在throw_pos的脚本中输入该标签的名称，将throw_pos实体连接到volume_box中。

<img src="/img/siege_scenes/stone_throw.png" width="1200px" />

___

#### 在被破坏的墙和完好的墙下使用可抛石堆和弓箭手阵地（以及几乎所有其他的东西）。

* 可抛石堆和弓箭手阵地是子实体的时候，就可以使用。
* 因此，你可以将这些实体以及任何其他你想要的实体分别放置在实心墙或断壁之下作为子实体。这样，你就可以创建覆盖在突破口上的弓箭手位置，或者在没有突破口的情况下利用实心墙。

| 坚壁实例 | 断壁实例 |
| ------ | ----------- |
| <img src="/img/siege_scenes/solid.png"/> | <img src="/img/siege_scenes/broken.png"/> |

___

#### 城齿（merlon）和其他可毁坏部件

*根据定居点的墙体HP，我们制造了墙体缺口，但我们也摧毁了一些包含destructable_component脚本的实体。这个功能是为城齿设计的，但它并不专门检查城齿，而是检查脚本本身。*

* 在"destructable_component"脚本中存在一个名为"CanBeDestroyedInnıtially"的参数。如果它被选中，该实体有机会在场景初始化时被摧毁，这取决于城堡的命中点（在攻城战地图上的攻城进程中被击倒）。
* 默认情况下，城齿的可破坏属性是on的，而其他几乎所有东西对应属性都是off的。如果你制作了任何特定场景的可破坏实体，请确保正确设置上述参数。
