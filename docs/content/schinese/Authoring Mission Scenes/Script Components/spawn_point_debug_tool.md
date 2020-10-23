+++
title = "出生点 Debug 工具"

[menu.main]
identifier = "spawn_point_debug_tool"
parent = "bannerlord_scenes"
+++

## 介绍

这个可以添加进场景的工具有一个预制件 (prefab) 叫做“SpawnPointDebugView”。预制件有附带一个“SpawnPointDebugView”脚本，工具可以通过查看器选项 (Inspector Toggle) 打开。工具有 3 个选项卡，分别叫做“Scene basic information tab”，“Scene entity check tab”和“Navigation mesh check tab”。

![](/img/spawn_point_debug_tool/tooldocument1.png)

## 1. 场景基础信息选项卡 (Scene Basic Information Tab)

这个选项卡可以决定场景的类型，从而找到一些场景必须品。如果检测出的类型不正确，设计师可以通过下面的选项按钮 (toggle button) 来重写类型。

## 2. 场景实体检查选项卡 (Scene Entity Check Tab)

这个选项卡计算了出生点 (Spawn Point) 数量，并且在数量不在场景规则 (Scene Criteria) 中时提醒设计师。点击“Count Entities”按钮，并且勾选分类，便可以填充计算表了。“DONT USE”选项代表了场景中绝对不能包含的过期的实体。表格的最后一栏体现了多少行为者 (agent) 会在当前出生点生成。

![](/img/spawn_point_debug_tool/tooldocument2.png)

在每一行的结尾，有一个按钮可以展开所有的游戏预制件，每一个都带着点击过按钮 (clicked button) 的标签 (tag)。点击这个按钮将会打开一个新的窗口，其中展示了所有预制件以及其特有的标签。

![](/img/spawn_point_debug_tool/tooldocument4.png)
![](/img/spawn_point_debug_tool/tooldocument5.png)

## 3. 导航网格检查选项卡 (Navigation Mesh Check Tab)

这个工具标记了没在导航网络或者被“Navigation Mesh Deactivator”停用的导航网络中的出生点。如果一个场景没有“Navigation Mesh Deactivator”那么停用的面包 ID 将会为 0，同时场景实体检查选项卡中会提醒设计师要放一个上去。点击“CHECK”按钮，同时勾选分类，将给不合法的出生点生成对应分类颜色 Debug 线。

导航网格检查工具展示了场景级别 (Scene Level) 的出生点。每一个勾选框将会激活两个按钮，分别叫做“Previous”和“Next”。点击这两个按钮可以分别使编辑器镜头 (Camera) 一个一个聚焦于放错的出生点。

![](/img/spawn_point_debug_tool/tooldocument6.png)

这个选项卡同时可以检查在任务 (mission) 边界外的出生点，不过这个功能只在任务中有用。

{{% notice tip %}}
想检查在任务边界外的检查点，如果当前场景是有“SpawnPointDebugView”工具预制件和控制台命令“debug.mission_spawnpoint_count_and_mesh_checker_ui”的话，那么工具可以在任务中启用。
{{% /notice %}}

{{% notice warning %}}
如果你看到选项卡按钮很多次，那么说场景中有不止一个“SpawnPointDebugView”，请移除他们。
{{% /notice %}}




