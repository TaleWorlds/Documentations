+++
title = "覆盖场景和预制件"
description = ""
weight = 1
+++

你可以通过在同一个游戏中创建新的方式来覆盖现有的场景 (scenes) 以及预制件 (prefabs)。

{{% notice info %}}
需要注意的是，如果修改了实体 (entity)  覆盖现有的预制件的层级 (hierarchy) 可能会导致当前的游戏脚本 (Scripts) 无法运行。如果你的实体是要被脚本调用的，请确保你保留了实体间的层级关系来避免程序出错。
{{% /notice %}}

### 预制件 (Prefabs)

预制件在 xml 文件中的定义在 ** 预制件 ** 以及其子文件夹下可以找到。
Prefab definitions are stored in xml files located in **Prefabs** folder in each module's directory.

### 场景 (Scenes)

场景储存在 Mod 目录下的 **SceneObj** 和 **SceneEditData** 文件夹中。**SceneObj** 目录保存了在客户端模式 (Client Mode) 中打开场景所需要的文件，而 **SceneEditData** 目录保存了编辑场景所需要的文件。
