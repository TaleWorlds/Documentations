+++
title = "实体查看器"
description = ""
weight = 20
+++

### Transform面板 ###
![](/img/inspectors/entity_inspector/transform/transform.PNG)

Transform面板允许您改变所选实体的transform、rotation和scale属性。
所有这些值都是相对于所选实体的父实体而言的，如果实体没有父实体，那么它们就是全局值。(在<b>[世界]({{< ref "#world-space" >}})</b> 空间中).

#### Scale ####
##### 已锁定 #####
![](/img/inspectors/entity_inspector/transform/scale_locked.PNG)
如果锁定图标处于锁定状态，改变比例参数中的任何一个分量，都会将所有比例分量设置为相同的值，实体将处于统一的缩放模式。
##### 未锁定 #####
![](/img/inspectors/entity_inspector/transform/scale_unlocked.PNG)
如果锁定图标处于解锁状态，每个比例分量都可以独立改变，并将允许不均匀缩放。

### 使用Gizmo进行Transform ###

#### Transform模式 ####

所有转换也可以使用Gizmo完成。
可以通过选择一个或多个实体并按下下面的热键之一来激活Gizmo。

Rotate | Translate | Scale
---- | ---- | ----
热键： R | 热键： T | 热键： Y
![](/img/inspectors/entity_inspector/transform/gizmo_rotate.PNG) | ![](/img/inspectors/entity_inspector/transform/gizmo_translate.PNG) | ![](/img/inspectors/entity_inspector/transform/gizmo_scale.PNG)

#### Transform空间 ####

Gizmo可以在三个不同的空间工作：[世界]({{< ref "#world-space" >}})空间，[本地]({{< ref "#local-space" >}})空间和[屏幕]({{< ref "#screen-space" >}})空间。

##### World space #####

世界坐标只是一个固定的、父坐标系。这是一个全局坐标系，所有的东西都是相对这个坐标系定义的。
世界坐标在<span style="color: #CC4000">X</span>方向上具有固定的[ 1，0，0]，在<span style="color: #40AA00">Y</span>方向上具有固定的[ 0，1，0 ]，在<span style="color: #0080DD">Z</span>方向上具有固定的[0，0，1] 。

##### Local space #####
局部坐标是相对于实体本身而言的，每一次变换的定义都是以实体的中心为宇宙的中心。

##### Screen space #####
屏幕空间的坐标是相对于摄像机的。视口的右边总是<span style="color: #CC4000">X</span>轴，顶部总是<span style="color: #40AA00">Y</span>轴，向前总是<span style="color: #0080DD">Z</span>（负Z）轴。

### 实体标签系统 ###
编辑器上的实体可以通过用户定义的标签来标识。

#### 添加标签
在实体查看器的“Tags”标题下，有一个标签为“Add New Tag”的按钮。此按钮将打开一个窗口，询问新标签名称。

#### 使用现有标签
点击“Add New Tag”按钮后，从窗口的下拉菜单中，您可以选择以前添加到当前场景实体中的标签。 

#### 特例：预制件
如果你正在修改一个预制实体，给预制实体添加标签不会破坏它。换句话说，如果你在场景中给预制实体打上标签后又改变主意修改了预制实体，使用了预制实体的场景实体也会有所有的改变。
标签以`<tags>...</tags>`的语法存储在xml文件中。(不含字符之间的空格)
