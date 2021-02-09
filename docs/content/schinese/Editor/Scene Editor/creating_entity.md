+++
title = "创建实体"
description = ""
weight = 1
+++

游戏中的实体是场景的基础建筑方块。每个模型，光照，贴图，脚本行为都是实体的元素。 \

### 新建空实体 ###
![](/img/create_new_entity/add_empty_entity_toolbar.png)
在编辑器中，你可以用工具栏的<strong>新增空实体（Add Empty Entity）</strong> 按钮创建实体，然后根据需求加上不同的部件。\

所有实体都可以由不同的组件组成。

### 增加组件 ###
![](/img/create_new_entity/add_component.png)
组件可以在选择实体后用工具栏找到。 有5大组件组成，模型，光照，贴图，粒子，脚本。
##### A - 模型（Mesh）:#####
模型很直观，就是你能在场景看到的每个集合体。在选择新增模型按钮后，在选项框中选择你想要的模型。
![](/img/create_new_entity/add_mesh.png)

##### B -  贴图（Decal）:#####
---

##### C - 光照（Light）:#####
光照是用来照亮场景，通常附着于发光的实体（比如篝火，火把等） 每个光照都可以自定义，你可以启动/关闭 动态/静态，还能设置颜色 你还能特别定制光照的效果。在选择增加光照之后，你可以在实体检查器（Entity Inspector）的组建界面（Components）设置属性 引擎会使用瓦片延迟渲染（Tiled Deferred Rendering）技术来让光照性能更加优化而且也不会那么重叠 可以调整这些参数进一步优化场景。 在场景可视化中，黄色球体表时光照范围，而蓝色球显示为光照带来的阴影。
![](/img/create_new_entity/add_light.png)

##### D - 粒子系统（Particle System）:#####
粒子模拟和渲染许多图片或者模型来制造视觉效果 粒子效果非常有用，当你像创建动态物品或者体积效果，比如火焰，烟雾，溅射效果等，难度比较大，而且绝大多数情况下在都不能在一般模型中创建 点击新增粒子（ add particle）之后，选择 粒子（Particle）效果，你就可以从组建界面（Component）来编辑这个实体（Edit Instance）
![](/img/create_new_entity/add_particle.png)

##### (E) 脚本（Script）:#####
脚本是游戏基础建筑方块的相关行为，并附加在实体上 脚本可以用C#编写并完全访问连接的实体或者整个场景中，这样场景里的其他实体也能联动。
在点击新增脚本（add script）后，你可以选择你想要的脚本，再在界面中根据具体情况改脚本的参数。\
![](/img/create_new_entity/add_script.png)

### 实体层级 （Entity Hierarchies） ###
多个实体联动时，实体分父类和子类 子类实体自动和父类实体的位置关联，移动父类实体时子类实体都会移动。
多选和操作实体可以  <strong><a href='{{< relref "entity_inspector.md" >}}'>点击这里查看</a></strong> \
你可以用实体纲(Entity Outliner)，拖拽实体来创建层级。\
![](/img/create_new_entity/empty_entity_outliner.png)

你可以让子实体脱离父实体，按鼠标右键即可与父类脱离。

 | | 
---- | ---- | ----
![](/img/create_new_entity/detach_before.png) | ![](/img/create_new_entity/detach_select.png) | ![](/img/create_new_entity/detach_after.png)

