+++
title = "Overriding Scenes and Prefabs"
description = ""
weight = 1
+++

You can override existing scenes and prefabs by creating new one with the same name.

{{% notice info %}}
You should keep in mind that overriding prefabs may break existing scripts if you change entity hierarchy. Make sure you preserve entity hierarchy to avoid possible breaking errors if your entity is being used by existing scripts.
{{% /notice %}}
### Prefabs

Prefab definitions are stored in xml files located in **Prefabs** folder in each module's directory.

### Scenes

Scenes are stored in two separate folders **SceneObj** and **SceneEditData** in each module's directory. **SceneObj** folder stores necessary files to open scene in client mode while **SceneEditData** stores files necessary for editing operations.