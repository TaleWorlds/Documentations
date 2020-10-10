+++
title = "给你的Mod添加音乐"
weight = 1
+++

《霸主》的音频系统是基于 FMOD 音频引擎专利 建立的。     
为了让音频引擎性能好同时大家也都可以用到，我们需要建立一个 中间层  (InterLayer)。

## 关键要素

* `...\Modules\*YOUR_MOD*\ModuleData\module_sounds.xml` 文件， 你可以在此添加你自己音乐的定义。
* `...\Modules\*YOUR_MOD*\ModuleSounds` 文件夹，你可以在此添加音频文件 （`.ogg` 或 `.wav`）。

你可以查看 Native Mod 中的例子。

## 基本指南

1. 复制样例的文件和文件夹到你的 Mod 目录下；
2. 添加新的音频文件到 ModuleSounds 文件夹；
3. 打开编辑你 Mod 下的 module_sounds.xml 文件；
4. 你会在 module_sounds.xml 文件中看到音频的目录，播放音乐的代码样例，以及样例的 module_sound 实体 (Entries)；
5. 在 module_sounds.xml 文件中为你的 Mod 添加新的音频实体；
6. 根据代码播放新的音频实体。

## 下一步

### 使用 module_sounds.xml 文件

```xml
    <module_sound name="example/combat/hit" is_2d="true" sound_category="mission_combat" path="example_sound_modders.ogg" />
```

* **'name'**: 任何你想要的唯一名字，这个是你音频的 ID。
    - 通过代码播放音乐的时候使用。
    - 想播放有声动画 (animation sound) 时，添加进动画 sound_code 特性 (attribute) 中。
* **'is_2d'**: 是否使用音频的空间属性 (spatial properties)。 3D 音频会有例如 位置、速度等属性。
* **'sound_category'**: 所有的音频必须被分配一个分类 (category) 来分配其在通信管道 (pipes) 中的路由 (route)。可用的分类有：
    - mission_ambient_bed (2D 环境声 (ambient loops) 比如基本风声 )
    - mission_ambient_3d_big (一般从远距离听到的音频，比如一个正在燃烧/战斗的城堡)
    - mission_ambient_3d_medium (一般从中距离听到的音频，比如烽火)
    - mission_ambient_3d_small (一般从附近近距离听到的音频，比如营火)
    - mission_material_impact (物理材质效果比如 *金属* 剑击打 *石* 墙)
    - mission_combat_trivial (造成不重要伤害时候的音频，比如低伤害或者无伤)
    - mission_combat (普通造成伤害的音频)
    - mission_foley (回转，移动以及动物移动的音频)
    - mission_voice_shout (一般被远距离听到的人物/动物的声音，比如战斗的呐喊)
    - mission_voice (人或者动物咕噜 (grunts) 或者击倒 (knockouts) 的音频。)
    - mission_voice_trivial (比较安静的发声，比如攀爬和跳跃)
    - mission_siege_loud (大型围城的声响，比如巨石冀中墙壁、火焰投石车以及城门破坏的音频)
    - mission_footstep (人类和小型动物的标准脚步)
    - mission_footstep_run (更大的脚步声，指那种可在一定距离的人群中能听到的声音)
    - mission_horse_gallop (马匹和骆驼疾驰的声音)
    - mission_horse_walk (马匹和骆驼慢走的声音)
    - ui (UI 和 提示的 2D 音频)
    - alert (伪3D音频 (Psuedo-3d sounds)，用于从中距离警告玩家)
    - campaign_node (位置性的声音节点，一般用于世界地图，农场，海和瀑布等)
    - campaign_bed (2D 环境声，一般用于世界地图，沙漠阵风和牧场的风等)
* **'path'**: 声音文件的路径。路径是相对于你 Mod 的 ModuleSounds 文件夹，你可以创建自己的子目录。

### 播放音频的代码样例 

```C#
    int soundIndex = SoundEvent.GetEventIdFromString("example/voice/charge"); //to avoid string operations in runtime soundIndex can be cached.
    if (playOneshot)
    {
        MakeSound(soundIndex, MainAgent.Position, false, true, -1, -1); //plays one shot sound at position with given parameters.
    }
    else
    {
        SoundEvent eventRef = SoundEvent.CreateEvent(soundIndex, Scene); //get a reference to sound and update parameters later.
        eventRef.SetPosition(MainAgent.Position);
        eventRef.Play();
    }
```

你有两种方式可以播放音频：

* 单触发 (one shot)    
  性能更好，控制的更少，发后即忘 (Fire and forget)。适合战斗相关的音频。
* 创建并维持一个音频引用 (reference)  
  性能稍差，可以控制声音的每一个参数，比如暂停和更新位置的时间。