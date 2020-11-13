+++
title = "骨骼编辑器"
description = ""
weight = 1
+++

使用资源浏览器导入骨骼后，可以使用骨骼编辑器来编辑骨骼的骨骼，关节和布娃娃参数。

<img src="/img/skeleton_editor/main_window.png" width="1280">

### Editing Bones and Joints ###
要编辑骨骼或关节，可以从“大纲视图”面板中选择所需的项目。
这将创建一个骨骼/关节查看器供您编辑。
所有参数均可视化，所有编辑将立即在预览中呈现。
<img src="/img/skeleton_editor/joint_limits.png" width="1280">

### 关节属性(Joint Properties) ###
#### 轴锁 Axis lock ####
轴锁限制子骨骼在平移空间中的移动。可以针对每个轴单独调整。
**None**：表示该关节不允许在该轴上移动。
**Free**>：表示该关节可以在该轴上自由移动。
**Limited** 表示此关节可以在此轴上在指定距离内移动。（“Axis Limit”参数）

#### 扭锁 Twist Lock ####
扭锁限制子骨骼在Z轴（扭曲轴）上的旋转。扭转的两侧均可单独调节。
**None**：表示该关节不允许旋转。
**Free**：表示该关节可以自由旋转。
**Limited**：表示此关节可以旋转到某个极限。（“Twist Limit”参数）

#### 旋转锁 Swing Lock ####
旋转锁限制了子骨骼在X和Y轴上的旋转。扭转的两侧均可单独调节。
**None**：表示此关节不允许摆动。
**Free**：表示此关节可以自由摆动。
**Limited**：表示此关节可以摆动到某个极限。（“Swing Limit”参数）

所有这些参数均会在预览中显示。艺术家可以随意修改并亲自查看效果。

### 骨骼属性 Bone Properties ###
骨骼属性可用于更改布娃娃和碰撞体。
可以在“Display”面板中启用碰撞体可视化。
您可以从“Properties”面板更改碰撞体半径，Position 1（碰撞体顶部），Position 2（碰撞体底部）等属性。

|   |   |
| ---- | ---- |
|<img src="/img/skeleton_editor/ragdoll_capsule.png" width="768"> | <img src="/img/skeleton_editor/collision_capsule.png" width="768">|

### 布娃娃模拟 Ragdoll Simulation ###
可视化更改的最佳方法是启用布娃娃仿真并实时查看更改。
只需从大纲工具中选择一个骨架，然后单击红色的"Simulation Enabled/Disabled"按钮即可。这将启用布娃娃模拟。再按一次此按钮将禁用布娃娃模拟，并将骨架重置为T姿势。

<img src="/img/skeleton_editor/ragdoll_enabled.png" width="1280">

#### 测试并保存更改 ####
<img src="/img/skeleton_editor/ragdoll_drag.png" width="768">
您可以选择骨骼并用鼠标拖动它们以测试布娃娃收到的约束和行为。
完成调整和测试后，可以从**File > Save**菜单中保存所有更改。
每个被修改的骨骼都会保存到相应的.tpac文件。
