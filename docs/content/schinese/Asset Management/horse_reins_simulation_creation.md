+++
title = "马缰绳模拟制作"
weight = 15
ai_translated = true
+++

### 简介

本教程介绍如何为马铠套装的缰绳添加模拟效果。

我们之前只为马铠使用一个网格,但缰绳会悬在空中,不会根据重力移动。因此我们决定为缰绳添加模拟效果,这意味着需要对系统进行一些调整。现在马铠不再是单一网格,而是包含 3 个网格。我们将它们分为 2 组。

#### 第一组:

- **马铠/挽具 (The horse armor/harness)**:与马身体相关的铠甲套装部分,如图 2b 所示(它有自己的模拟效果,但我们这里暂不讨论)。例如:horse_harness_x
- **原始缰绳部件 (The original rein piece)**:从上述最初的单一网格中分离出来的部分,如图 2c 所示。我们保留了这个未经模拟的部件,用于不需要模拟部件的场合;也就是当相机距离马匹较远,铠甲套装开始切换到 LOD 1 及后续其他 LOD 时使用。例如:horse_harness_x_rein

#### 第二组:

- **模拟缰绳部件 (The simulated rein piece)**:当相机靠近马匹时,骑手手持缰绳,缰绳会根据物理效果移动。例如:horse_harness_x_rein_rope

本教程主要讲解如何创建第三个网格,也就是"模拟缰绳部件"。但在深入讲解步骤之前,我们想先澄清几点。

|  |  |
| ------ | ----------- |
| <img src="/img/horse_reins_simulation_creation/image_1a.png" width="350px"/> | <img src="/img/horse_reins_simulation_creation/image_1b.png" width="350px"/> |
| **图 1a**;*通常每个组件都有不同的名称,但我们将把网格的各部分统称为头饰(headpiece)或缰绳(rein),如图 1b 所示。* | **图 1b**;*为简单起见,出于功能上的考虑,我们将只使用"头饰"和"缰绳"这两个名称。* |

我们以下文将马挽具命名为"horse_harness_x"作为示例(以浅灰色标记),以便解释分组方式(这些名称仅作为示例选用,请注意游戏中已存在名为"horse_harness_x、horse_harness_x_rein、horse_harness_x_rein_rope"的网格)。

 |  |
------- | ------- | --------
<img src="/img/horse_reins_simulation_creation/image_2a.png"/> | <img src="/img/horse_reins_simulation_creation/image_2b.png"/> | <img src="/img/horse_reins_simulation_creation/image_2c.png"/>
**图 2a**;*这是初始阶段,在此阶段您根据马的解剖结构为马挽具/铠甲和缰绳建模(缰绳的建模位置应在骑手可触及的范围内,我们使用了 3ds Max 为铠甲套装建模)。* | **图 2b**;*horse_harness_x。* | **图 2c**;*horse_harness_x_rein(头饰是该网格的一部分,之后将被复制以生成 horse_harness_x_rein_rope)。*

在接下来的章节中,我们将讲解如何创建第三个组件,即铠甲套装的"模拟缰绳部件"。

### 模拟缰绳部件:Horse_harness_x_rein_rope

模拟部件需要使用另一个骨骼进行蒙皮,该骨骼是我们 Modding Kit 的一部分,位于 Mount & Blade II Bannerlord\modding_resources 目录下(参见图 3)。

<img src="/img/horse_reins_simulation_creation/image_3.png" width="900px"/>

**图 3**;*左侧为包含 22 根骨骼的 horse_harness_rein_skeleton。右侧展示了 horse_harness_x_rein_rope 应如何适配该骨骼。*

#### 创建模拟网格的步骤:
1. 复制网格"horse_harness_x_rein"。
2. 将其重命名为"horse_harness_x_rein_rope"。
3. 调整新网格("horse_harness_x_rein_rope"),使其完美贴合"horse_harness_rein_skeleton"(完成后网格应如图 5a 和 5b 所示)。
4. 根据"horse_harness_rein_skeleton"对"horse_harness_x_rein_rope"进行蒙皮。图 4 展示了所涉及骨骼的骨骼列表。
5. 将模拟区域顶点的 alpha 值设置为"100"。将其他非模拟顶点设置为"0"(参见图 6)。

 |  |  |
------- | ------- | -------- | --------
<img src="/img/horse_reins_simulation_creation/image_4.png"/> | <img src="/img/horse_reins_simulation_creation/image_5a.png"/> | <img src="/img/horse_reins_simulation_creation/image_5b.png"/> | <img src="/img/horse_reins_simulation_creation/image_6.png"/>
**图 4**;*horse_harness_rein_skeleton 的骨骼。* | **图 5a**;*horse_harness_x_rein_rope 与 horse_harness_x_rein 的侧视图对比。* | **图 5b**;*horse_harness_x_rein_rope(选中的网格)与 horse_harness_x_rein 的俯视图对比。* | **图 6**;*所选顶点(红色/较亮)的 alpha 值被设置为"100",因为它们属于缰绳的模拟区域。骑手手持的部分和头饰部分(参见图 1b)不进行模拟,因此将其设置为"0"。*

### 将网格导出到游戏中

将网格以 fbx 格式导出到指定文件夹:

[Game Folder]\Modules\[Mod Folder]\AssetSources
