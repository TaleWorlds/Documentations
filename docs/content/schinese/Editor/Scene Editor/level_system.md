+++
title = "场景等级系统"

[menu.main]
identifier = "level_system"
parent = "core_components"
+++

## 等级系统 Level System
新的等级系统用一个更可扩展和统一的系统取代了旧的硬编码系统。
可以在SceneOptions查看器下的“Levels”面板中为场景添加新级别（或删除现有级别）。
![](/img/level_system/level_system_panel.png)

## 游戏中的等级
#### - Bannerlord -
目前，Bannerlord会识别一些在游戏中具有意义的等级。
分别是：
1. level_1
2. level_2
3. level_3
4. siege
5. civilian


## 设置实体可见性 Setting Entity visibilities
通过选择一个实体，然后在**Entity Inspector**下的**Scene Level Visibilities**面板中，可以使实体仅在特定级别的组合场景中**可见**。
![](/img/level_system/level_system_entity_visibility.png)

选择您希望该实体可见的级别。
**场景中的实体级别将作为一个整体进行检查。**
### 示例
对某个实体，如果你同时选择level_1和siege，当打开的场景级别为level_2和siege，这个实体将不可见，因为它没有"level_2"。
如果你同时选择了level_1和siege，当打开了一个级别为level_1和civilian的场景，这个实体将不可见，因为它没有"siege"。
只有当你打开一个有level_1和siege的场景时，它才会可见。


如果你想让一个实体在level_1、level_2和civilian场景中可见，请选择level_1、level_2和civilian。
这个实体在任何一个攻城场景中都不会出现，也不会出现在任何级别为level_3的场景中。

## 在编辑器中测试可见性

![](/img/level_system/level_system_visibility_panel.png)

有两个选项可以查看具有不同级别可见性的实体。

1. 要求所有级别 Require all levels（与场景完全相同）
2. 要求至少一个级别 Require at least one level（仅编辑器，一次查看所有实体）

### Require all levels
在此模式下，可见性系统将和场景保持一致，你可以用此模式来测试哪些实体将以何种组合在场景中可见。
如果你选择level_1和siege，你将只看到有同时有level_1和siege级别的实体，而不是有其他组合等级的实体。

### Require at least one level
这是一个仅存在于编辑器的模式，如果你选择了一个等级，无论该实体有什么等级组合，它都会显示出来；如果实体有该等级，它就会可见。
如果你想看到所有的_civilian_实体而不管它们有什么级别，或者你希望看到_level\_1_实体，不管它们是siege还是civilian，这都会很有用。

## 测试场景
![](/img/level_system/level_system_start_mission_as.png)
为此，请以允许您选择级别组合的方式修改“Start mission as”窗口。
如果要使用level_1和攻城模式测试城堡场景，请选择这些级别并按OK。该任务将从1级攻城模式开始。
