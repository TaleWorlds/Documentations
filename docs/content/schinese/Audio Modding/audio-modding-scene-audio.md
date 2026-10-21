+++
title = "场景音频"
weight = 30
ai_translated = true
+++

_最后更新:2026 年 4 月 3 日_

---

## 添加声音实体 (Adding Sound Entities)

在我们的专有游戏引擎中,将声音放入场景非常简单。首先在场景中创建一个**空实体 (empty entity)**。

添加实体后,在场景层级结构中选中它以打开**检查器窗口 (Inspector Window)**。如果检查器未显示,可通过 **Window > Inspector Window** 启用它。

在检查器中,展开 **Scripts** 下拉菜单并选择 **Add New Script**。在弹出的对话框中,选择 **AmbientSoundEmitter** 以将声音发射器脚本附加到该实体上。

该脚本提供了若干用于控制播放的选项:

| 属性 | 说明 |
|---|---|
| **Event Path** | 要在场景中播放的声音的 FMOD 事件路径 |
| **Play On Startup** | 若启用,场景加载时声音会自动播放。适用于环境音或持续性声音 |
| **Is Static** | 将该发射器标记为固定不动。静态发射器处理成本更低,因为引擎无需动态追踪其位置 |
| **Override Sound** | 为特定的 3D 声音事件启用对某些 FMOD 参数的覆盖 |
| **Override Volume Multiplier** | 通过一个乘数调整播放音量。小数值请使用逗号(`,`)而非句点(`.`) |
| **Override Max Distance** | 为该事件设置自定义的最大可听距离 |
| **Override Min Distance** | 为该事件设置自定义的最小可听距离 |
| **Is Master Sound** | 将该发射器标记为主声音(master sound),用于全局混音行为 |
| **Is Master Suppressor** | 当在触发体积内激活时,压低(降低)所有被标记为主声音的声音 |
| **Is Triggered** | 将发射器配置为触发体积,仅当监听者进入定义的空间时才播放 |
| **Trigger Shape** | 定义触发体积的形状(box 或 sphere) |

---

## 混响区域 (Reverb Zones)

向场景添加混响区域的流程是一样的。在 FMOD 中,混响是可以像标准声音事件一样通过触发体积触发的快照事件(snapshot events)。

设置步骤如下:

1. 在场景中创建一个新实体
2. 附加一个 **AmbientSoundEmitter** 脚本
3. 输入混响快照事件的路径
4. 启用 **Is Triggered**
5. 选择合适的触发形状
6. 使用变换工具调整体积大小,以覆盖所需区域

以下快照事件路径是开箱即用的。你也可以自由创建和添加自己的快照及快照事件。

- `event:/mission/ambient/reverb/alley`
- `event:/mission/ambient/reverb/caves`
- `event:/mission/ambient/reverb/courtyard`
- `event:/mission/ambient/reverb/dungeon`
- `event:/mission/ambient/reverb/forest`
- `event:/mission/ambient/reverb/gatehouse`
- `event:/mission/ambient/reverb/keep`
- `event:/mission/ambient/reverb/stone_corridor`
- `event:/mission/ambient/reverb/stone_interior`
- `event:/mission/ambient/reverb/valley`
- `event:/mission/ambient/reverb/wood_interior`

---

## 路径 (Paths)

路径是你可以放置在场景中供实体跟随的路线。当你希望声音发射器沿着相对于监听者定义的轨迹移动时非常有用——例如,模拟河流流淌而过的效果。

### 创建路径

1. 在任务栏上点击 **Add New Path**
2. 为路径指定名称
3. 点击 **Add Component**
4. 在场景中放置路径点——它们会按顺序自动连接

要将声音发射器附加到路径上,请选中声音发射器实体,转到 **Scripts** 标签页,点击 **Add New Script**,然后添加 **path_converger** 脚本。这将使该实体能够沿着定义的路径移动。

**path_converger** 脚本提供了几个选项:

| 属性 | 说明 |
|---|---|
| **Path Name** | 发射器应跟随的路径名称。必须与你创建的路径名称完全一致 |
| **Rotate To Camera** | 若启用,发射器在沿路径移动时会面向监听者的摄像机旋转 |
| **Apply Scale** | 决定发射器是否继承路径的缩放变换 |

---

## 修改发射器变换 (Modifying Emitter Transforms)

要查看声音发射器的触发体积形状及其最小/最大距离球体,你需要启用 **Sound Entities** 可见性。如果 **Visibility** 标签页不可见,可通过 **Window > Visibility Window** 打开它。

在 **Visibility** 标签页中,进入 **Visibility Masks** 并勾选 **Sound Entities** 旁边的复选框。这将启用场景视图中声音相关组件的显示。启用后,触发体积(box 或 sphere 线框)以及代表最小和最大可听范围的两个同心距离球体会直接显示在场景中,从而大大方便了发射器的定位和调整大小。

---

## 为动画片段添加声音事件 (Adding Sound Events to Animation Clips)

要将声音附加到动画片段,请通过 **Window > Show Resource Browser** 打开**资源浏览器 (Resource Browser)**。资源浏览器可让你浏览、筛选和搜索项目资源。

你可以按资源类别进行筛选以缩小结果范围。如果你不确定某个资源的位置,可以使用搜索栏——只需确保你是在正确的目录内进行搜索。找到动画片段后,选中它以打开**动画片段检查器 (Animation Clip Inspector)**。

在**动画片段检查器**中,你可以查看和调整与所选片段相关联的所有参数。对于音频,请关注与声音相关的参数:

| 属性 | 说明 |
|---|---|
| **Step Points** | X 轴值定义了片段内的时间偏移。如果未附加声音,默认值为 `−1.00`。将其设为 `0.00` 或进行调整以使声音与动画同步 |
| **Sound Code** | 要附加的 FMOD 事件路径。输入有效路径可确保声音在动画时间轴上的正确位置播放 |
| **Voice Code** | 要附加到动画的战斗语音类型。请参阅下方的内置类型,或按照 [语音系统]({{< ref "audio-modding-systems.md#voice-system" >}}) 一节所述添加自定义类型 |

**内置语音代码 (Built-in Voice Codes):**

| 语音代码 |
|---|
| Grunt |
| Jump |
| Yell |
| Pain |
| Death |
| Stun |
| Fear |
| Climb |
| Focus |
| Debacle |
| Victory |
| HorseStop |
| HorseRally |
| Drown |

**动画声音标志 (Animation sound flags):**

| 标志 | 说明 |
|---|---|
| `make_bodyfall_sound` | 在该动画点触发身体倒地声音 |
| `make_walk_sound` | 在该动画点触发脚步声 |
| `do_not_keep_track_of_sound` | 阻止引擎追踪该声音的播放状态 |
| `attach_sound_to_agent` | 将声音直接附加到角色(agent)上,而不是世界坐标位置 |

---

## 为粒子添加声音事件 (Adding Sound Events to Particles)

与动画片段一样,粒子资源也可以通过**资源浏览器**访问。筛选资源列表仅显示粒子,或使用搜索栏在目录中定位特定粒子。找到后,双击它以打开**检查器窗口**。

在检查器中,你可以查看该粒子的层(layers)、LOD 以及参数。在附加音频之前,请确保你已选中粒子正确的**层**和 **LOD**。

> 请记住:如果某个效果在视觉上不够突出,不足以在更高的 LOD 下渲染,那么它也不足以配上声音。在这种情况下,仅在 **LOD 0** 保留音频即可。

选中正确的层和 LOD 后,打开 **Sound** 标签页:

| 属性 | 说明 |
|---|---|
| **Continuous sound** | 用于循环声音。输入循环事件的 FMOD 事件路径 |
| **One shot sound** | 用于单次播放的声音。输入单次事件的 FMOD 事件路径 |
| **Size Parameter** | 应用一个乘数,以覆盖 3D 声音事件的大小 |

---

## 四声道环境音 (Quadraphonic Ambients) {#quadraphonic-ambients}

**《骑马与砍杀2:霸主》(Mount & Blade II: Bannerlord)** 是一款对性能要求极高的游戏。在场景中添加数百个 3D 声音发射器会迅速耗尽 CPU、内存和磁盘 I/O 资源——尤其是在拥有数千个活跃角色的大规模战斗中。为了在不牺牲性能的前提下保持沉浸感,我们使用了**四声道环境音 (quadraphonic ambients)**。

四声道(Quadraphonic)是一种四声道环绕格式,它能在实际上仅使用四个声道的情况下,营造出被众多发射器环绕的错觉。我们没有依赖 FMOD 内置的四声道系统,而是实现了自己的方案。虽然设置起来稍微复杂一些,但一旦理解其原理,它会比 FMOD 的内部方案更灵活。

该系统会在监听者周围固定位置生成**四个 3D 发射器**:相对于监听者朝向的 **0°、90°、180° 和 270°**。这些发射器会随监听者的位置移动,但它们与监听者的距离保持不变。当监听者转向时,他们会持续从周围的发射器接收到不同的信号——从而在无需使用数十个独立声源的情况下,营造出动态变化环境的错觉。

### 设置四声道环境音

首先,创建一个**立体声环境事件 (stereo ambient event)**。这一步**并非可选**——它充当了四声道设置失败或未找到时的回退方案。如果没有它,游戏过程中可能会缺失环境音。

例如,创建一个名为 `plains` 的 2D 事件。

接下来,创建一个与立体声事件**同名的文件夹**(本例中为 `plains`)。这个命名至关重要——系统会根据名称将立体声事件与对应的四声道替代方案进行匹配。该文件夹内的事件将被视为四声道通道。

在该文件夹内,创建四个 3D 事件,名称必须严格为:

- `north`
- `east`
- `south`
- `west`

> 这些名称**区分大小写**,必须全部为**小写**。事件的顺序无关紧要。

对于这四个四声道事件中的每一个,打开**空间化器 (Spatializer)** 并**禁用距离衰减 (distance attenuation)**。这些发射器应无论与监听者的距离如何,都发出一致的信号。如果衰减保持开启,音量可能会因距离设置而被错误地降低。

最后,返回立体声事件(`plains`),设置一个**用户属性 (User Property)**:

| 属性 | 值 |
|---|---|
| `isQuad` | `True` |

该标志会告知系统去查找匹配的四声道设置。如果找到,则播放四声道版本;如果未找到,则播放立体声事件作为回退方案。
