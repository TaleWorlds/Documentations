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

*所有攻城器械都被放置在部署点下。这些点在以后的任务中会成为可选择的位置，玩家可以在这些位置上放置攻城设备，如弩机、撞锤或攻城塔。*

* 防御者需要有4个器械。攻击者需要4个器械。攻城塔需要2台。还有一台用于撞城锤。
* 器械可以连接到这些部署点上，可以将它们放在它们的半径内，也可以通过标签来连接。

<img src="/img/siege_scenes/Deploymentpoint.png" width="1200px" />

* 最佳实践
    * 确保部署点的半径不重叠。
    * 比如说，你需要为每一层设置不同的部署点。
        * 由于城墙会随着层数的变化而变化 守城机器自然要在城墙上有不同的位置。
    	* 由于城门位置会发生变化，所以破城槌需要走不同的路径。攻城塔也是如此。

___

#### Secondary Siege Machines

*辅助攻城机是远程攻城机，可以支持攻击或抵御攻击者。其中包括双方的弩机（ballista）和投石机（Mangonel），以及攻击者的重型投石机。*
 
* 每个防守者阵地应包括投石机和弩机实体，每个攻击者阵地应包括投石机弩机和重型投石机预制件。
* 防守者和攻击者应该各有4个"部署点"阵地。
* 攻城机和部署点都有一个 "side"变量，确保这些变量是正确的。
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

#### 破城槌

*破城槌是攻城者在战役中建造打夯时，对应的预制件。撞击夯将连接到side标记，一旦到达城门，部队挥动破城槌就会破坏外门。*

* <a href="http://docs.modding.bannerlord.com/editor/scene-editor/path_editing/">使用路径工具</a>建立路径。破城槌预制件的幽灵实体上的碰撞指示器应该与大门接触，以配合动画和视觉效果。

<img src="/img/siege_scenes/crashindicator.png" width="1200px" />

* **BatteringRamSpawner 脚本**
    * 输入side标签 
    * GateTag: outer_gate
    * 输入脚本的路径名称
    * 将破城槌连接到路径后，将部署点放在路径的开头与破城槌连接
<br><br>
* **相关的预制件**
    * Batteringram_a_spawner

___

#### 沟渠填充物

*如果场景中城堡周围有沟渠和护城河，我们有一个沟渠填充物系统，可以让攻城塔和撞城车正常工作。如果玩家部署了连接的攻城引擎，沟渠填充物会产生。我们必须安排和识别各种导航网面，让AI在填沟器周围正确使用寻路。*

* 放置适当的实体来填充护城河后，<a href="http://docs.modding.bannerlord.com/editor/scene-editor/creating_entity/#entity-hierarchies">将它们全部收集到一个父实体下</a>。
*  将标签 "ditch_filler "和适当的side标签（left, right, or middle）添加到连接的攻城引擎中。
* 一旦攻城塔或撞城锤被部署，沟渠填充物也会随之部署。
* 我们操纵导航网的方式与破损墙体类似。
* 导航网的ID在攻城塔和撞城锤的脚本上。
* 输入你将用于沟渠填充物的导航网ID。
* 重新制作导航网，并为其命名ID。
* 确保新的导航网面具有正确的水平。

| SiegeTowerSpawner Script | Ditch Filler |
| ------ | ----------- |
| <img src="/img/siege_scenes/Ditchfiller.png" /> | <img src="/img/siege_scenes/Ditchfiller_numbers.png"/> |

* In this example, when there is no ditch filler, 423, 426, and 424 will be deactivated. 422 and 433 will stay connected 427 will be active, 432 and 425 will be connected.
* When there is a ditch filler, 422 will disconnect from 433 and connect to 423, 426 will be active, 425 will be disconnected from 432 and connect to 424, and 427 will be deactivated.

___

#### Siege Ladders

*Siege ladders are deployed by default to both siegeable walls unless there is a siege tower or a breach.*

* Choose the correct size of the ladder spawner, never resize the ladder spawners height.
* **SiegeLadderSpawner script**
    * Enter the target wall segment. This is the tag we added to the wall that has the middle and wait positions. The ladder will search for that tag and then search for its child entities to direct AI troops accordingly.
    * Enter the id of the navigation mesh you will use.
    * Enter the SideTag.
    * "merlon_solid_left" or "merlon_solid_right" tag have to add both ladder merlons according to walls right or left position. These tags are added to make sure tagged merlons do not break and cause physics problems with AI troops movements.
* Remake and id the navmesh accordingly.
* Nav mesh face on the siege ladder should be one directional towards the wall.

<img src="/img/siege_scenes/directionalladdernavmesh.png" width="1200px" />

* Adjust the standing and fork holder positions using the “UpperStateRotationDegree” and “DownStateRotationDegree” to match the terrain and the walls.
* Place a “_barrier_ai_04x04m” prefab on the wall where the ladder will land. Give the barrier a unique tag like “left_ladder_barrier_a”. Now insert this tag to the ladder's “BarrierTagToRemove” parameter. The tagged barrier will be removed once the siege ladder is lifted up to the walls.
<br><br>
* **Related prefabs**
    * Siege_ladder_6m_spawner
    * Siege_ladder_7m_spawner
    * Siege_ladder_8m_spawner
    * Siege_ladder_11m_spawner
    * Siege_ladder_14m_spawner

___

#### Archer Positions

*Archer positions are AI direction locations with which scene designers can define locations where archers can shoot from. There are 2 types of archer positions.*

* **Big archer positions**
    * Positions used by archer formations.
    * With prefab names “defender_archer_position” and “attacker_archer_position”.
    * They have the tags “archer_position” and “archer_position_attacker”.
<br><br>
* **Small archer positions**
    * Positions used by archer agents.
    * With prefab names “strategic_archer_point” and “strategic_attacker_archer_position”.
    * They have the script “strategicarea”. The script has variables for:
        * Attacker or defender side.
        * Range (an archer position should be in their range for them to be used). There must be a big archer position inside this range for the small archer position to be active. The default range is 40m for defender and 60m for attacker.
        * Depth and width: Both represent the size of the area usable by troops. 1x1 is suitable for one troop in a 1m x 1m area. 4x2 is suitable for 8 troops in a 4m x 2m area.
<br><br>	
* **Related prefabs**
    * Defender_archer_position
    * Attacker_archer_position
    * Strategic_archer_point
    * strategic_attacker_archer_position

___

#### Deployment Boundaries

*We place boundary entities to the scene to specify where attackers and defenders can deploy their troops. They work pretty much like soft borders.*

* All boundary entities should have these 3 tags:
    * walk_area_vertex
    * defender or attacker
    * deployment_castle_boundary_[insert number]
* deployment_castle_boundary_[insert number] tag with the same number in [insert number] are connected to each other to create a convex area. For example 5 entities with deployment_castle_boundary_3 tag will create a pentagon, defining a border area.
* You can use prefabs “attacker_boundry“, “defender_boundry“  and edit them to your needs.
* If you add an “out” tag to one of those boundary sets it acts like a negative space, subtracting from the deployment zone instead of adding to it. With this method you can create concave deployment zones.
<br><br>
* **Related prefabs**
    * Attacker_boundry
    * Defender_boundry

___

#### Camera

*The camera position and angle specify the viewpoint that will be used during the deployment phase.*

* Create an empty entity.
* Camera for the attacker should have the tag “strategycameraattacker”.
* Camera for the defender should have the tag “strategycameradefender”.
* Make sure that the camera positions are inside the deployment boundaries.

___

#### Spawn Points

*Spawn points are the locations where NPC troops and the player will spawn in the scene at the start of the battle.*

* Use the standard “sp_battle_set” prefab for troop spawning and reinforcements. The prefab includes 16 entities, for each type of troops, attacker and defender, starting or reinforcement. Normal spawn designates the spawn location at the start of the battle, while reinforcements define where the reinforcements will spawn.
* Make sure to set the proper level visibility, since another “sp_battle_set” prefab is used within the civilian level for common area fight missions.

___

#### Flee Lines

*There are flee lines both for attackers and defenders. If placed in siege scenes, the AI should prefer to run away using the flee lines rather then to the closest soft border edge.*

* Defenders should run to the keep.
* To be active, the Flee lines must be covered by navigation mesh.
<br><br>
* **Related prefabs**
    * Flee_line_attacker
    * Flee_line_defender

___

#### Tactical Position Script

*The script [tacticalposition] enables us to modify the width of various AI positions.*

* Once added to an entity you can change many parameters within it. For siege purposes, the only important one is _width. Value entered here is equal to the width of the formation in meters.
* You can use this script in [wait_pos], [middle_pos], [attacker_wait_pos], archer positions and siege ladder wait positions.

| Tactical Position | Deployment |
| ------ | ----------- |
| <img src="/img/siege_scenes/tactical_position_1.png"/> | <img src="/img/siege_scenes/tactical_position_2.png"/> |
___

#### AI Barrier

*The AI barrier should be added to all locations where the AI troops might fall from unacceptable heights.*

* With the path tool, first draw the path line then check the “Enable Barrier Build” checkbox. After the barrier is built, click “Go to entity” and check the scripts of the prefab. The following “barrier_builder” script parameters should be checked:
    * AI Limiter
    * Agent Only
    * If necessary, Flip can be checked according to the side of the wall.

___

#### Throwable Rock Pile

*We can place usable rock piles to siege scenes.*

* The prefab [throwable_rock_pile] has three components:
    * Stone pile: With 8 interactable points for AI to pick up the rocks.
    * throw_pos: Where the agent will move to throw the rock.
    * volume_box: Designates the area to which the AI can throw the rock.
* When an enemy AI moves into the volume_box the prefab will call an agent, that agent will pick up a rock and try to throw it to an enemy in the volume_box that it can target.
* You can have multiple throw_pos per volume_box. Just duplicate the throw_pos entity.
* You connect throw_pos entities to a volume_box by adding a tag to the volume_box and entering that tag name to the script of throw_pos.

<img src="/img/siege_scenes/stone_throw.png" width="1200px" />

___

#### Using Throwable rock piles and Archer position (and pretty much everything else) under Broken and Solid walls

* throwable_rock_pile’s and archer positions do work when they are child entities.
* So you can separately place these entities as well as any other entity you want under solid or broken walls as child entities. This way you can create archer positions covering a breach, or utilize the solid wall when there is no breach.

| Example of Solid Walls | Example of Broken Walls |
| ------ | ----------- |
| <img src="/img/siege_scenes/solid.png"/> | <img src="/img/siege_scenes/broken.png"/> |

___

#### Merlons and other Destructible components

*According to the wall HP of the settlement we create wall breaches but we also destroy some the entities containing the destructable_component script. This feature was intended for merlons but it does not specifically check for merlons but rather for the script itself.*

* A parameter called “CanBeDestroyedInnıtially” is present in the “destructable_component” script. If it is checked, that entity has a chance to be destroyed on mission start, depending on the castle hit points (that are brought down during the siege progression on the campaign map).
* By default it is on for merlons and off for pretty much everything else. If you make any scene specific destructible entities, make sure to set the aforementioned parameter properly. 