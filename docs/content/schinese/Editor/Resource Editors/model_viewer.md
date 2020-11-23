+++
title = "模型查看器"

[menu.main]
identifier = "model_viewer"
+++


------------------

可以从以下位置访问模型查看器：**Editor > Window > Show Model Viewer**
![](/img/model_viewer/mv_empty.PNG)

在左侧面板中，您可以更改氛围，隐藏/显示地面或添加任意数量的实体。实体可以是**人类**或简单的**网格**。 
按**Add Entity**会打开一个模式窗口，供您选择实体类型。
![](/img/model_viewer/mv_add_entity.PNG)


#### Transform ####
在这个面板上，你可以设置实体的转换Tranform、旋转Rotation和缩放Scale。

#### 动画 Animation ####
在这个面板上，你可以选择骨骼类型和动画。
您还可以按动画名称过滤动画。
所有引擎的过滤系统都非常强大，因此您可以微调过滤条件。一些例子：
- idle：将过滤包含“idle”的动画。
- .idle：将过滤以“idle”开头的动画。
- idle.：将过滤以“idle”结尾的动画。
- -idle：将过滤不包含“idle”的动画。

**也可以使用以空格分隔的多个过滤器组成的组合**
- "idle -barmaid 2."：将过滤包含 "idle"但不包含"barmaid"，并且以"2"结尾的动画。（例如"guard_idle_2"）
- "idle hangout 7"将过滤同时包含"idle"，"hangout"，"7"的动画。(例如"anim_hangout_idle_7")

您也可以使用“blend”面板混合另一个动画。

#### 视觉效果 Visuals ####

在此面板中，您可以将任何网格物体放置在人类的任何部位，也可以选择人类模型的性别。

![](/img/model_viewer/mv_full.PNG)
![](/img/model_viewer/mv_fun.PNG)

## 保存/加载场景 ##

您还可以通过单击"File > Save Scene > *..Save Name..*"来保存当前的工作场景。
之后你可以通过 "File > Load Saved Scene > *..Write Saved Name..*" 加载之前保存的场景。
