+++
title = "可破坏组件"

[menu.main]
identifier = "bannerlord_destructible_component"
parent = "bannerlord_scenes"
+++


破坏系统为mod制作者们提供了下列可选项。

## 它是什么？

DestructibleComponent是一个ScriptComponent，可以应用于场景中的任何实体，只要该实体具有碰撞体即可。

如果不提供任何信息，脚本将使实体在被破坏后消失。场景重置后，它也会重新出现。

该脚本可用于销毁处于一种或多种状态的实体，并在每种状态下生成可选的声音，粒子和动态对象。

如果删除了该脚本，任何具有DestructibleComponent脚本的现有预制件（攻城塔，大门，投石机等）将继续工作。它将不再是可破坏的。

一个实体可以有多个DestructibleComponent脚本。例如，撞锤是可破坏的，但它的顶棚也可以被单独摧毁。对子级施加的任何损坏也将应用于它的父级(可能是多层父级)。

始终可以调整和改进被销毁的预制件，而不必破坏任何场景，因为它们不是完整实体的一部分（它们是在运行时生成的）。

| 攻城塔脚本范例 |
| ------ |
| ![](/img/destructible_component/Script_Overview.png) |
| **DestructionStates**, 可以是一个或多个预制件。以“,”（英文逗号）分隔。
| **DestroyedByStoneOnly**, 如果为True，则表示只有来自mangonels或trebuchets(两种投石机)的弹丸才能损坏此实体。False表示任何东西都可能损坏此实体。
| **CanBeDestroyedInititally**, 定义在加载场景时是否可以销毁此实体。这是根据从战役地图上控制的轰炸破坏百分比。这通常仅适用于城垛。但是，它也可以用于装饰实体，以使场景从一开始就显得饱受摧残。要销毁的实体是随机选择的。
| **MaxHitPoint** 是此实体的起始耐久度。每次场景重置时，实体还将其当前的生命值设置回MaxHitPoints。
| **ReferenceEntityTag** 是一个可选标记，用于DestructionState预制件的框架与其父级不同时，亦或用于复制动画状态。您可以添加一个具有正确框架的额外实体（在带有DestructibleComponent脚本的实体下），并为其提供参考标记，以便生成的DestructionState预制件将使用该框架。如果没有参考实体，将使用带有DestructibleComponent脚本的实体框架。参考实体还可以在特殊情况下使用，例如城堡门（打开/关闭的动画），以从参考实体获取动画状态并将其应用于新生成的被破坏实体。
| **OriginalStateTag** 仅当您具有多个DestructionStates时才需要它。通常，当一个实体被销毁时，我们将隐藏应用了脚本组件的实体，并从DestructionState（不带父级）中生成一个新实体。但是对于某些实体（如门），我们不想隐藏整个实体，因为它必须保持其功能，直到其被完全破坏为止。使用OriginalStateTag，我们将只隐藏应用了此标签的实体，其余层次结构（粒子，射手站立点等）仍然可见。任何具有多个destroyationState的DestructibleComponent都会将被损坏的预制件作为子实体渲染。
| **HeavyHitParticlesTag** 是可以应用于具有粒子系统的任何子实体的标签。当实体耐久在单次打击中达到一定程度，这些粒子将破裂一次。该粒子系统通常在所有破坏状态之间共享（它不属于隐藏/生成的实体的一部分）。
| **HeavyHitParticlesThreshold** 是在单次打击中触发HeavyHitParticlesTag标签定义的粒子效果所需的最小耐久降低值。

## 特效（Effects）

通常，出于性能考虑，我们尝试将生成的预制件保持尽可能小，并避免实体重复。
您可以使用以下功能来添加效果：

- 在损坏的预制件上生成时：层次结构中每个实体上的所有粒子系统将自动爆发一次。
- 在损坏的预制件上生成时：层次结构中每个实体上的所有动态实体，将自动从破坏前状态受到的最后一次碰撞中接收脉冲。
- 在损坏的预制件上生成时：如果层次结构中每个实体上的所有其他网格都没有动态的body-flag，它们将保留在原位。
- 实体层次结构的一部分：重击粒子必须在所有销毁状态之间共享，并且每当DestructibleComponent受到HeavyHitParticlesThreshold破坏时就触发。
- 您可以在具有骨架的DestructibleComponents上播放自定义动画（例如，城堡门被击打的撞锤击中）。动画进度将转移到新生成的受损实体。
- 您可以在损坏的预制件上添加AmbientSoundEmitter类型的脚本，并提供声音事件。产生实体时它将自动播放。
- 除了使用多个状态外，您还可以添加带有DestructibleComponents的多个子实体（例如，可单独破坏的撞锤顶棚）。请记住，应用于子DestructibleComponent的任何损坏也将应用于层次结构中的每个父级。当前，我们尚不知道拥有太多子实体对性能的影响。

{{% notice tip %}}
武器的任何打击都会根据材料类型（木材，石材，..）播放默认的碰撞粒子效果和声音，因此不要为获得额外效果而疯狂。
{{% /notice %}}

{{% notice warning %}}
渲染损坏的实体后飞来飞去的任何动态网格都是临时的，不应与玩家发生物理碰撞！它们不会影响游戏玩法，因为我们不会为多人游戏中的玩家同步这些游戏。
{{% /notice %}}

## 示例

### 示例1：带有易碎城垛（merlon）的城墙

对于城墙，我们只能摧毁城垛，而不能破坏其他东西。它们只能被mangonels/trebuchets两种投石器损坏，并且在被破坏前只能承受一击。

| 单个墙段(WallSegment)的架构 |
| ------ |
| ![](/img/destructible_component/Wall_Hierarchy_Edited.png) 这就是单个墙段的场景层次结构。European_castle_wall_a_l3是带有脚本WallSegment的实体。它不在乎是否有可销毁的子级。每个城垛是一个不同的子实体，都有自己的DestructibleComponent脚本。一旦销毁它们，它们都会产生相同的销毁预制件。每个城垛都有一个debris_holder实体，它是一个空实体。它仅保留一个ReferenceEntityTag标签，并从中生成损坏的预制件的正确框架（由于网格弯曲，这一点很重要：与父对象相比，位置和旋转可能会发生变化）。 |

| 单个城垛的脚本示例 |
| ------ |
| ![](/img/destructible_component/Wall_Script.png) 每个城垛都有完全相同的脚本。当它们被摧毁时，它们都会产生“碎片”预制件。我们决定让它们被mangonel攻击一次后立即销毁，因此它们的耐久度（HitPoint)非常低。DestroyedByStoneOnly使它们忽略所有其他武器（箭头，剑，斧头等）的伤害。由于“CanBeDestroyedInititally”，因此这些城垛可能在进入场景时就已经被破坏。人鱼需要一个ReferenceEntity实体来确定损坏的预制件的生成框架。 |

**城墙和城垛碎片的起源**

|     |     |
|-----|-----|
![](/img/destructible_component/Wall_Origin_Merlon_Hierarchy.png) | ![](/img/destructible_component/Wall_Origin_Merlon.png) 每个城垛是一个唯一的网格，其起点在城墙的底部（与城墙基点重合）。
![](/img/destructible_component/Wall_Origin_Debris_Hierarchy.png) | ![](/img/destructible_component/Wall_Origin_Debris.png) 每个城垛共享同一个被毁坏的预制件，但每个城垛都有自身的起源。debris_holder具有ReferenceEntityTag。
| ![](/img/destructible_component/Debris_Hierarchy.png) | ![](/img/destructible_component/Debris.png) 碎片预制件的每个子对象都是带有"dynamic"的具有碰撞体的实体。生成时，它将自动接收DestructibleComponent销毁时收到的最后一个脉冲。

### 示例2：围城路障（Barricade）

围城路障是非常简单的对象。它们是静态实体，其唯一功能是阻止射入的弹药。但是，它们可以分多个阶段销毁。每个阶段看起来比以前的阶段更受破坏。

| 围城路障的不同破坏状态 |
| ------ |
| ![](/img/destructible_component/SiegeBarricade_States.png) 当前，不同的状态没有任何特殊的粒子或动态实体，但是以后可以轻松添加它们。带有“dynamic”主体标记的实体和粒子系统在生成时会自动触发。 |

{{% notice tip %}}
被破坏的路障的每个阶段都有自己独特的碰撞体。这使人们可以在路障被破坏的更严重时更轻松地射击，并可以通过设为状态state_5来移除。
{{% /notice %}}

| 场景中的围城路障等级 | 围城路障脚本组件 |
| -------- | ------- |
| ![](/img/destructible_component/SiegeBarricade_Hierarchy_Edited.png) | ![](/img/destructible_component/SiegeBarricade_Script.png) |

siege_barricade_a是空父级。它只保存脚本。siege_barricade_a_state1是实际的网格+实体，并具有“ original_state”标签。当路障受到足够的伤害时，将使siege_barricade_a_state1不可见，生成下一个损坏的预制件并作为子级添加到siege_barricade_a中。这很重要，因为需要向DestructibleComponent告知命中情况，并且只有在其自身或孩子身上具有（可见）碰撞体的情况下，它才能这样做。

当实体的耐久度为0（完全销毁）时，将生成最后一个状态（在这种情况下为state_5）。其他的将在MaxHitPoints和0之间使用。

重置场景后（耐久度重置为MaxHitPoint），原始实体（带有标签“ original_state”的实体）将再次变为可见。

每个DestructionState预制件都具有相同的原点和旋转度，因此我们不必使用ReferenceEntity。
