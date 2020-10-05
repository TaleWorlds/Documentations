+++
title = "Spawn Point Debug Tool"

[menu.main]
identifier = "spawn_point_debug_tool"
parent = "bannerlord_scenes"
+++

## Introduction

The tool which has prefab named "SpawnPointDebugView" can be added to scene. Prefab has "SpawnPointDebugView" script attached and tool can be opened through inspector toggle.
Tool has 3 tabs named "Scene basic information tab", "Scene entity check tab" and "Navigation mesh check tab".

![](/img/spawn_point_debug_tool/tooldocument1.png)

## 1. Scene Basic Information Tab

This tab tries to determine the scene type in order to find necessities; if detected type is not correct, artist can override the type using toggle buttons below.

## 2. Scene Entity Check Tab

This tab calculates the spawn point count and warns artist if counts are not in the scene criteria. Clicking the "Count Entities" button and toggling the categories will fill the table of calculations. "DONT USE" toggle stands for outdated entities which scene must not include. Last column of table shows how many agent will be spawned on current spawn points.

![](/img/spawn_point_debug_tool/tooldocument2.png)

At the end of each row there is a button which can list all game prefabs with clicked button's tag. Clicking the button will open a new window that list all prefabs with particular tag.

![](/img/spawn_point_debug_tool/tooldocument4.png)
![](/img/spawn_point_debug_tool/tooldocument5.png)

## 3. Navigation Mesh Check Tab
This tool will mark the spawn points which are not on the navigation mesh or on the navigation mesh that will be deactivated by 'Navigation Mesh Deactivator'. If scene does not have 'Navigation Mesh Deactivator', Deactivation face id will be 0 and scene entity check tab will warn artist to place it in scene. Clicking "CHECK" button and toggling the categories will show debug lines on the invalid spawn points with category color.
Navigation Mesh Check tool shows the spawn points according to scene level. Each toggle will activate 2 buttons named "Previous" and "Next". Clicking these buttons will make editor camera to focus on the misplaced spawn points one by one.

![](/img/spawn_point_debug_tool/tooldocument6.png)

This tab can also checks points that are out of mission bound but this feature is only working in missions.

{{% notice tip %}}
To check points that out of mission bounds, tool can be activated in the mission if current scene has "SpawnPointDebugView" tool prefab with console  command "debug.mission_spawnpoint_count_and_mesh_checker_ui".
{{% /notice %}}

{{% notice warning %}}
If you are seeing the tab buttons multiple time, there are more than one "SpawnPointDebugView" in the scene, please remove them. 
{{% /notice %}}




