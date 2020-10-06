+++
title = "Scene Level System"

[menu.main]
identifier = "level_system"
parent = "core_components"
+++

## Level System
New level system replaces the old, hardcoded system with a much more extandable and unified system. \\
<b><span style="color: #7f7f00">Adding</span></b> a new level (or <b><span style="color: #7f0000">deleting</span></b> an existing one) to a scene can be done in <b><span style="color: #007f00">Levels</span></b> panel under <b>SceneOptions</b> inspector.

![](/img/level_system/level_system_panel.png)

## Levels in Game
#### - Bannerlord -
Currently, Bannerlord recognizes a few levels that has a meaning in-game. \\
Which are: \\
1) level_1 \\
2) level_2 \\
3) level_3 \\
4) siege \\
5) civilian


## Setting Entity visibilities
Making an entity only visible in a certain level combinations can be done with selecting an entity then going in <b>Scene Level Visibilities</b> panel under <b>Entity Inspector</b>.
![](/img/level_system/level_system_entity_visibility.png)

Select the levels you want this entity to be visible.
<b>Entity levels in missions are checked as a whole.</b>
### Example
If you select both level_1 and siege, and if you open a mission that has _level\_2_ and siege, this entity will NOT be visible since it does not has "level_2". \\
If you select both level_1 and siege, and if you open a mission that has level_1 and _civilian_, this entity will NOT be visible since it does not has "siege". \\
It will only and only be visible if you open a mission that has level_1 and siege.


So if you want an entity to be visible in both level_1 and level_2 and only in civilian mission, select level_1, level_2, and civilian; \\
 so this entity will not be visible in ANY siege missions, and will not be visible in ANY mission as level_3.

## Testing visibility in editor

![](/img/level_system/level_system_visibility_panel.png)

There are two options to see entities with different level visibilities.

__1) Require all levels (Same as missions)__ \\
__2) Require at least one level (Editor only, to see all entities at once)__

### Require all levels
In this mode, visibility system will work as same as the missions, you can use this mode to test what entities will be visible in what combinations. \\
If you select level_1 and siege, you will only see entities that has __both__ level_1 and siege, not the others.

### Require at least one level
This is an editor only mode, if you select a level, it will be visible, no matter what combinations that entity has; if entity has that level, it will be visible. \\
Can be useful if you want to see all _civilian_ entities no matter what level they are, or you can see _level\_1_ entites no matter if they are siege or civilian.

## Testing a scene
![](/img/level_system/level_system_start_mission_as.png)
For this purpose, __Start mission as__ window modified in a way that allows you to select level combinations.
If you want to test a castle scene with level_1 and siege mode, Select these leves and press OK. The mission will start in Level 1 Siege mode.
