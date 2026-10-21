+++
title = "事件设置"
weight = 20
ai_translated = true
+++

_最后更新:2026 年 4 月 3 日_

---

## 参数 (Parameters)

FMOD Studio 中的参数(Parameters)是控制事件在播放期间行为方式的变量。它们可以驱动音量、音高、滤波器、乐器播放或事件逻辑的变化——使声音变得动态且富有响应性,而不是一成不变。

每个参数都有一个名称、一个取值范围和一个类型。在游戏运行期间,你的代码可以设置或调整这些值,它们也可以由游戏状态、距离、速度或其他输入自动驱动。

参数是游戏与声音设计之间的主要桥梁。它们让音频能够直接对游戏玩法做出反应,使你能够对声音的演变方式进行精细的实时控制。

你可以使用现有参数,也可以创建自己的预设。要查看现有参数,请转到 **Window > Preset Browser**,或按 **Ctrl+8** 打开预设浏览器(Preset Browser)。

### 添加参数 (Adding Parameters)

要添加自定义参数,点击 **New Parameter** 或按 **Ctrl+P**。这将打开**添加参数 (Add Parameter)** 对话框。

| 字段 | 说明 |
|---|---|
| **参数类型 (Parameter Type)** | 定义该参数接受何种类型的值(见下方类型说明) |
| **参数名称 (Parameter Name)** | 唯一且含义明确的标识符 |
| **范围 (Range)** | 最小值与最大值 |
| **标签 (Labels)** | 若使用 Labeled 类型,为每个标签指定的名称 |
| **初始值 (Initial Value)** | 事件开始时的默认值 |
| **参数作用域 (Parameter Scope)** | Local(每个实例独立)或 Global(所有实例共享) |

**参数类型(Parameter Types):**

| 类型 | 说明 |
|---|---|
| User: Continuous | 浮点值,用于平滑、渐进的变化 |
| User: Discrete | 整数值,用于分级的状态 |
| User: Labeled | 字符串值,用于命名的分类 |
| Built-in: Distance | 监听者与发射器之间的距离 |
| Built-in: Distance (Normalized) | 根据最小/最大值将距离归一化到 0–1 |
| Built-in: Direction | 相对于监听者朝向的水平角度 |
| Built-in: Elevation | 相对于监听者的垂直角度 |
| Built-in: Event Cone Angle | 发射器朝向相对于监听者的方向 |
| Built-in: Event Orientation | 监听者与发射器朝向之间的差异 |
| Built-in: Speed (Relative) | 发射器相对于监听者的速度 |
| Built-in: Speed (Absolute) | 发射器在世界空间中的速度 |

**对话框中的其他选项:**

| 选项 | 说明 |
|---|---|
| Exposed recursively via event instrument | 使该参数可通过嵌套的事件乐器(event instrument)进行访问 |
| Read-only | 该参数可以被监视,但不能被修改 |
| Hold value during playback | Local 类型的保持参数只能在事件开始之前,或在事件停止/暂停时设置。Global 类型的保持参数则完全无法被游戏更改 |

---

### 全局参数 (Global Parameters)

全局参数是项目范围内的变量,只存在一份,会影响任何引用它们的事件,并且可以从任何地方读取或修改。

| 名称 | 类型 | 范围 / 默认值 | 说明 |
|---|---|---|---|
| ArenaIntensity | Discrete | 1–3,默认值:1 | 竞技场观众的人数。**1** = 低,**2** = 中,**3** = 高 |
| CampaignCameraHeight | Continuous | 0.0–1000.0,默认值:0.0 | 摄像机相对于战役地图地形的高度 |
| Daytime | Continuous | 0.0–24.0,默认值:12.0 | 以 24 小时制表示的时间 |
| MissionCombatMode | Labeled | 默认值:False | **True** = 场景处于战斗状态,**False** = 场景处于非战斗状态 |
| MissionCulture | Labeled | 默认值:None | 分配给场景的文化:None、Aserai、Battania、Empire、Khuzait、Sturgia、Vlandia、Nord _(War Sails DLC)_、Outlaw、Reserved A、Reserved B |
| MissionProsperity | Labeled | 默认值:None | 繁荣度等级:None _(例如藏身处)_、Low、Medium、High |
| Rainfall | Continuous | 0.0–1.0,默认值:0.0 | 降雨的存在与强度。**0.0** = 无雨 |
| SceneType | Labeled | 默认值:Exterior | **Exterior** = 室外场景,**Interior** = 室内场景 |
| Season | Labeled | 默认值:Summer | Summer、Fall、Winter、Spring |
| SlowMotionMode | Labeled | 默认值:False | **False** = 正常速度,**True** = 启用慢动作 |
| SoundPreset | Labeled | 默认值:Speakers | 音频输出配置:Speakers、Headphones、TV、Night Mode |
| WaveHeight | Continuous | −10.0–10.0,默认值:−10.0 | 波浪的垂直高度 |
| WaveStrength | Continuous | 0.0–10.0,默认值:0.0 | 波浪运动的强度 |
| WindStrength | Continuous | 0.0–10.0,默认值:0.0 | 风力的强度 |

---

### 局部参数 (Local Parameters)

局部参数属于某个特定的事件实例。每个实例都保有各自独立的值,其变化不会影响任何其他事件。

| 名称 | 类型 | 范围 / 默认值 | 说明 |
|---|---|---|---|
| agent_state | Labeled | 默认值:nothing | 潜行任务中角色(agent)的警觉等级。**nothing** = 未察觉,**neutral** = 短暂注意到,**cautious** = 察觉到迹象,**super_cautious** = 正在主动搜索,**alarmed** = 已被定位并警觉 |
| Alert Distance | Built-in: Distance | 0.0–10.0 | 相对于玩家触发任务警报的距离 |
| Armor Type | Continuous | 0.0–0.5,默认值:0.0 | 玩家/角色所穿的护甲。**0.0–0.15** = 布甲,**0.15–0.25** = 皮甲,**0.25–0.35** = 锁子甲,**0.35–0.5** = 板甲 |
| ArmySize | Continuous | 0.0–20.0,默认值:0.0 | 战役地图上军队的规模 |
| battle_size | Continuous | 0.0–4.0,默认值:0.0 | 战役地图战斗中的总部队数量 |
| Crowd Size | Continuous | 0.0–1000.0,默认值:0.0 | 聚集在某地点的部队数量 |
| Depth | Continuous | 0.0–1.0,默认值:0.0 | 水深 |
| Direction | Built-in: Direction | −180.0–180.0 | 监听者朝向与指向发射器连线之间的夹角。**0** = 正前方,**±90** = 侧方,**±180** = 正后方 |
| Distance Ambient 20 | Built-in: Distance | 0.0–50.0 | 50 米范围内 3D 环境事件的距离 |
| Distance Campaign Node | Built-in: Distance | 0.0–30.0 | 30 米范围内 3D 战役节点事件的距离 |
| Distance Combat 500 | Built-in: Distance | 0.0–500.0 | 500 米范围内战斗声音事件的距离 |
| Distance Gallop 500 | Built-in: Distance | 0.0–500.0 | 500 米范围内坐骑疾驰事件的距离 |
| Distance Horse Walk 35 | Built-in: Distance | 0.0–35.0 | 35 米范围内坐骑行走事件的距离 |
| Distance Human Walk 150 | Built-in: Distance | 0.0–150.0 | 150 米范围内人类行走事件的距离 |
| Distance Impact 75 | Built-in: Distance | 0.0–75.0 | 75 米范围内撞击事件的距离 |
| Distance Siege 500 | Built-in: Distance | 0.0–500.0 | 500 米范围内攻城事件的距离 |
| Distance Siege Med 250 | Built-in: Distance | 0.0–250.0 | 250 米范围内攻城事件的距离 |
| Distance Tavern Music | Built-in: Distance | 0.0–100.0 | 100 米范围内酒馆/街头音乐事件的距离 |
| Distance Voice Long | Built-in: Distance | 0.0–500.0 | 500 米范围内语音事件的距离 |
| Distance | Built-in: Distance | 0.0–80.0 | 通用距离参数(默认 80 米) |
| Event Cone Angle | Built-in: Event Cone Angle | 0.0–180.0 | 监听者与发射器正前方向之间的偏离程度。**0** = 正前方,**90** = 侧方,**180** = 正后方 |
| Event Orientation | Built-in: Event Orientation | −180.0–180.0 | 监听者与发射器朝向之间的差异。**0** = 相同方向,**±90** = 垂直,**±180** = 相反方向 |
| Force | Continuous | 0.0–0.1,默认值:0.57 | 施加于物体的瞬时物理力 |
| ForceContinuous | Continuous | 0.0–1.0,默认值:0.0 | 施加于物体的持续性物理力 |
| impactModifier | Continuous | 0.0–0.6,默认值:0.0 | 防御格挡修正值。**0.0** = 无,**0.1** = 主动格挡,**0.2** = 完美格挡(Chamber block),**0.3** = 破防(Crush through) |
| isMissile | Continuous | 0.0–1.0,默认值:0.0 | 该物体是否为抛射物 |
| isPlayer | Continuous | 0.0–1.0 | 该角色是否为玩家。**0.0** = NPC,**1.0** = 玩家 |
| Loop | Continuous | 0.0–1.0,默认值:0.0 | 事件(音乐/视频)是否循环播放 |
| mpMusicSwitcher | Continuous | 0.0–1.0,默认值:0.0 | 多人游戏状态音乐。**0.0** = 主菜单,**1.0** = 加载状态 |
| Occlusion | Continuous | 0.0–1.0,默认值:0.0 | 声音遮挡的程度。**0.0** = 无遮挡,**1.0** = 完全遮挡 |
| Size | Continuous | 0.0–1.0,默认值:0.0 | 物体的质量(影响水面碰撞声音) |
| Speed | Built-in: Speed (Relative) | 0.0–10.0 | 游戏对象的相对速度 |
| VibrationSend | Continuous | 0.0–1.0,默认值:1.0 | 手柄震动的强度 |

---

### War Sails 参数

这些参数仅存在于 War Sails DLC 模块中,若未安装该 DLC 则不可用。

| 名称 | 类型 | 范围 / 默认值 | 说明 |
|---|---|---|---|
| Campaign Ship Damage | Continuous | 0.0–1.0,默认值:0.0 | 战役地图上玩家船只所受到的损伤 |
| RowingPower | Continuous | 0.0–500.0,默认值:0 | 桨手施加的总合力 |
| RudderStress | Continuous | 0.0–1.0,默认值:0.0 | 船只在操纵时施加于舵上的应力 |
| SailRotation | Continuous | 0.0–1.0,默认值:0.0 | 船只桅杆的旋转速度 |
| ShipScrapingStatus | Labeled | 默认值:NotScraping | **Scraping** = 船只正在刮擦,**NotScraping** = 无刮擦 |
| ShipSpeed | Continuous | 0.0–1.0,默认值:0.0 | 船只当前的速度 |
| StormIntensity | Continuous | 0.0–2.0,默认值:0.0 | 战役地图上的暴风强度。**0.0** = 暴风雨,**1.0** = 雷暴,**2.0** = 飓风 |

---

## 效果预设 (Effects Presets)

效果预设(Effect presets)是预先配置好的 DSP 设置,涵盖常见使用场景,无需从零手动配置。你无需自行搭建每一条效果链,而是可以直接应用一个预设——例如压缩器、均衡器或混响——该预设自带针对特定用途设计的合理默认值。

预设可以让你立即获得效果,并在此基础上进行微调。它们能加快工作流程、确保项目内的一致性,并为大家提供一个关于常用效果的共同基准。你也可以创建自己的自定义预设,或修改现有的预设。

要浏览预设,请转到 **Window > Effect Presets** 或按 **Ctrl+8**。在预设浏览器(Preset Browser)中,选择 **Effects** 标签页,即可查看**《骑马与砍杀2:霸主》(Mount & Blade II: Bannerlord)** 中当前使用的所有预配置预设。

添加新预设时,你有以下几个选项:

| 选项 | 说明 |
|---|---|
| **New Effect** | 添加并配置单个 DSP 效果 |
| **New Send** | 添加并配置一个总线发送(bus send) |
| **New Sidechain** | 添加并配置一个侧链输入(sidechain input) |
| **New Effect Chain** | 构建由多个 DSP 效果组成的效果链,并统一进行配置 |

创建预设后,请为其指定一个唯一且含义明确的名称,以便在项目中易于识别和复用。

### 效果预设列表 (Effects Preset List)

| 名称 | 类型 | 驱动参数 |
|---|---|---|
| Alert Nod Spatializer | Spatializer | — |
| Alert Spatializer | Spatializer | Alert Distance |
| Ambient Arena Cheer | Spatializer | — |
| Ambient Arena | Spatializer | Distance Ambient 20 |
| Ambient Battle Gain | Gain | Distance Combat 500 |
| Ambient Battle | Spatializer | — |
| Ambient Big | Spatializer | — |
| Ambient Doors | Spatializer | — |
| Ambient Medium | Spatializer | — |
| Ambient Small | Spatializer | — |
| Animals Big | Spatializer | — |
| Animals Small | Spatializer | — |
| Bodyfall Spatializer | Spatializer | — |
| Campaign Ambient ADSR | Gain | — |
| Campaign Footsteps | Spatializer | — |
| Campaign Node | Spatializer | — |
| Combat Low Gain | Gain | Distance Combat 500 |
| Combat Low Spatializer | Spatializer | — |
| Combat Send Clean | Send | Distance Combat 500 |
| Combat Send Distant | Spatializer | Distance Combat 500 |
| Combat Spatializer | Spatializer | Distance Combat 500 |
| Combat Swing Foley | Spatializer | — |
| Foley Generic Distant | Spatializer | — |
| Foley Generic | Spatializer | — |
| Footstep Horse Send Clean with Direction | Send | Direction |
| Footstep Horse Send Clean | Send | Distance Gallop 500 |
| Footstep Horse Send Distance | Send | Distance Gallop 500 |
| Footstep Human Send Clean | Send | Distance Human Walk 150 |
| Footstep Human Send Distant | Send | Distance Human Walk 150 |
| Horse Gallop Gain | Gain | — |
| Horse Gallop Spatializer | Spatializer | Distance Gallop 500 |
| Horse Walk Gain with Direction | Gain | Direction |
| Horse Walk Gain | Gain | Distance Horse Walk 35 |
| Horse Gallop Spatializer (Duplicate) | Spatializer | — |
| Human Run Spatializer | Spatializer | — |
| Human Sneak | Spatializer | — |
| Human Walk Armor | Spatializer | — |
| Human Walk | Spatializer | — |
| Impact Material Gain | Gain | Distance Impact 75 |
| Impact Material Spatializer | Spatializer | — |
| isPlayer Send Foley | Send | isPlayer |
| isPlayer Send | Send | isPlayer |
| Physics Small | Spatializer | — |
| Quad Ambient Rotator | Panner | Direction |
| Quad to Stereo Mix | Channel Mix | — |
| Rainfall Gain | Gain | Rainfall |
| Siege Big Gain Clean | Gain | Distance Siege 500 |
| Siege Big Gain Distant | Gain | Distance Siege 500 |
| Siege Big Send Clean | Send | Distance Siege 500 |
| Siege Big Send Distant | Send | Distance Siege 500 |
| Siege Medium Spatializer | Spatializer | — |
| Siege Move ADSR | Gain | — |
| Siege-Big | Spatializer | Distance Siege 500 |
| Siege-Big-Updated | Spatializer | Distance Siege 500 |
| Siege-Medium | Spatializer | — |
| Spatializer (Generic) | Spatializer | — |
| Tavern Music Distancing | Effect Chain | SceneType |
| Vibration Combat High | Send | isPlayer |
| Vibration Combat Low | Send | isPlayer |
| Vibration Combat Med | Send | isPlayer |
| Vibration Gallops | Send | isPlayer |
| Vibration Notifications | Send | — |
| Vibration Siege Big | Send | Distance Siege 500 |
| Voice Horse Send Clean | Send | Distance Voice Long |
| Voice Horse Send Distance | Send | Distance Voice Long |
| Voice Long Clean Send | Send | Distance Voice Long |
| Voice Long Distance Send | Send | Distance Voice Long |
| Voice Long Spatializer | Spatializer | — |
| Voice Short Clean Send | Send | Distance |
| Voice Short Distance Send | Send | Distance |
| Voice Short Spatializer | Spatializer | — |
| Voice Tiny Spatializer | Spatializer | — |

---

## 快照 (Snapshots)

快照(Snapshots)让你能够根据游戏状态动态控制整体混音。如果你曾见过数字调音台上按下一个按钮就能让所有推子同时移动到新位置的场景——FMOD 快照的工作原理正是如此。

### 添加快照 (Adding Snapshots)

要添加快照,请通过 **Window > Mixer** 或按 **Ctrl+2** 打开混音器窗口(Mixer window)。在混音器左侧,切换到 **Snapshots** 标签页,即可查看现有快照或创建新快照。

在空白处右键单击以创建新快照。系统会要求你在两种类型中进行选择:

| 类型 | 说明 |
|---|---|
| **Overriding Snapshot** | 完全接管受影响的混音属性,替换现有值,直至被释放 |
| **Blending Snapshot** | 将其更改叠加到当前混音之上,与其他激活的快照相结合,实现更平滑的过渡 |

当多个快照同时激活时,优先级由它们在**优先级列表 (Priority List)** 中的位置决定。列表中位置更高的快照优先于位置较低的快照。例如,`GameMinimized` 在优先级列表中位于 `CampaignMap` 之上,这意味着每当游戏被最小化时,它会覆盖战役地图的音频规则。

当选中某个快照时,混音器中的推子会改变颜色——这表示你所调整的任何推子仅会在该快照激活时生效,而不会影响正常混音。这同样适用于 DSP 效果和总线发送——例如,你可以在一个返回总线(return bus)上添加单个算法混响,并按快照调整其属性。

在 `GameMinimized` 快照中,所有推子都被设置为 −∞ dB,因此每当玩家最小化游戏窗口时,所有声音都会被静音。一旦该快照失效,推子会自动恢复到其原始位置。

### 快照事件 (Snapshot Events)

快照可以由代码触发,但也可以由事件触发——这对场景中的混响区域尤其有用。有关混响区域的更多信息,请参阅[场景音频]({{< ref "audio-modding-scene-audio.md" >}})页面。

要添加快照事件,首先创建一个**时间轴事件 (timeline event)**(快照乐器无法放置在 action 事件中)。为该事件指定一个清晰、描述性的名称。

在你想要放置快照乐器的时间轴轨道上右键单击。如果已存在快照,你将看到其列在列表中;否则你可以创建一个新快照。对于混响控制,请始终使用**混合式快照 (blending snapshots)**。

放置完成后,快照乐器会出现在该轨道上。你可以拖动该乐器的左右边缘来添加淡入和淡出控制柄,从而使进入和退出快照的过渡更加平滑。

---

## 用户属性 (User Properties)

FMOD Studio 中的事件可以携带**用户属性 (User Properties)**——由你自定义的变量,用于向游戏传递额外信息。这些属性充当元数据标记,让游戏代码可以检测它们并在需要时应用特殊处理。

每个用户属性都有一个名称和一个值。名称始终是字符串(字母和/或数字)。值会被自动解析:如果它纯粹是数字,则被视为浮点数;如果包含任何非数字字符,则被视为字符串。

这一系统让音效设计师可以直接在事件内部嵌入灵活的、与游戏相关的数据,从而减少程序员硬编码规则的需求。用户属性在 FMOD Studio 中事件的卡片区域(deck area)内定义——每一行都有一个名称字段和一个值字段。

| 属性 | 说明 |
|---|---|
| **isQuad** | 用于环境声音。设为 `True` 时,系统将使用该环境音的四声道版本,而不是立体声回退版本。启用此项前必须已存在匹配的四声道设置。参见[四声道环境音]({{< ref "audio-modding-scene-audio.md#quadraphonic-ambients" >}})。 |
| **Pausable** | 由基于事件的暂停系统使用。默认值为 `True`。对于不应被暂停的持续性事件(如环境音或音乐),应设为 `False`。 |
| **priorityMultiplier** | 调整某个事件在优先级系统中的相对优先级——提高或降低其被剔除(cull)的可能性。参见[优先级系统]({{< ref "audio-modding-systems.md#priority-system" >}})。 |
| **maxLength** | 防止没有时间轴或乐器的时间轴事件产生构建错误。为 FMOD 定义一个时长,使其在没有时间轴轨道的情况下也拥有必要的长度数据。Action 事件无需此项。 |
| **battle_ambient_group_id** | 将某个事件分配到战斗环境声音系统(Battle Ambient Sound System,BASS)中的特定分组,从而可以对事件进行集中管理和优化。参见[战斗环境声音系统]({{< ref "audio-modding-systems.md#battle-ambient-sound-system" >}})。 |
| **customMaxDistance** | 覆盖某个 3D 事件的默认最大可听距离。 |
| **ignoreMaxDistance** | 忽略某个 3D 事件的最大距离限制。接受 `0`(False)或 `1`(True)。 |
