+++
title = "使用 FMOD Studio 进行音频模组制作"
weight = 10
ai_translated = true
+++

_最后更新:2026 年 4 月 3 日_

---

## 简介

本指南并不是官方 FMOD Studio 手册的替代品。如果你完全不熟悉 FMOD Studio 或音频中间件,我们建议你在深入阅读本指南之前,先从 FMOD 官方网站上的官方文档开始学习。

本指南的目的是为你提供一份最新的、针对 Bannerlord 的专用参考资料,帮助你高效地使用 FMOD 进行工作。它重点关注 **Mount & Blade II: Bannerlord** 特有的工作流程、最佳实践和性能方面的考量。

借助对 FMOD Studio 的直接支持,模组制作者现在几乎可以使用游戏音频团队内部使用的所有工具。这意味着你可以:

- 添加和配置事件(events)
- 创建乐器(instruments)和图层(layers)
- 应用自动化(automations)和调制(modulations)
- 构建和管理音效库(soundbanks)
- 添加或重新路由总线(busses)
- 创建和调整快照(snapshots)
- 定义或修改参数(parameters)
- 插入 DSP 效果
- 实现或修改控制器震动

**Mount & Blade II: Bannerlord** 是一款对性能要求极高的游戏。你在 FMOD Studio 中所做的每一项更改都会实时反映在游戏中,而糟糕的优化设置既会损害音质,也会影响整体性能。因此,请将优化视为工作流程的一部分——而不是留到最后才处理的事情。

本指南有专门的一节介绍性能优化指南。我们强烈建议你在完成任何 FMOD 修改之前先阅读该部分内容。遵循这些做法将有助于你避免常见的陷阱,例如过多的声音数量(voice counts)、不必要的 DSP 负载,或低效的流式传输(streaming)设置。

---

## 快速入门

在任何内容出现在游戏中之前,你的模组需要先进行相应配置,以便 Bannerlord 知道去哪里查找你的声音数据。这涉及两个步骤:在你的 `.mbproj` 文件中注册所需的数据文件,以及使用所提供的 FMOD Studio 脚本生成这些文件。

### 1. 在你的 .mbproj 中注册声音文件

在你的模组的 `.mbproj` 文件的 `base` 作用域内添加以下几行:

```xml
<file id="soln_sound_files"          name="ModuleData/soundfiles.xml"            type="sound_files" />
<file id="soln_sound_event_data"     name="ModuleData/sound_event_data.gen.xml"  type="sound_event_data" />
<file id="soln_sound_parameter_data" name="ModuleData/sound_params.gen.xml"      type="sound_parameter_data" />
```

`name` 字段指定了相对于你的模组目录的 XML 文件路径。`id` 和 `type` 字段必须保持与示例中完全一致。

### 2. 生成数据文件

这三个 XML 文件——以及相关联的音效库(sound banks)——都是由项目中附带的 **SEDFGen.js** 脚本生成的。要运行它,请使用 FMOD Studio 内部的脚本接口:前往 **Scripts > Taleworlds**。

该脚本会输出:

- XML 数据文件至 `ExampleSoundMod/ModuleData/`
- 音效库文件至 `ExampleSoundMod/Sounds/`

提供了一个包含所有必需文件的示例目录结构供参考。

### 重要提示:不要包含 main.bank

在 `soundfiles.xml` 中,`main.bank` 被有意排除在外。**请勿**添加你自己的 `main.bank`。包含它可能会导致以下问题:

- 音量滑块无法正常工作
- 声音未按预期路由到对应的总线(buses)

只要你不修改基础游戏提供的任何现有总线和 VCA,你**可以**添加自己的 VCA 和总线。

### 覆盖现有声音事件

要覆盖游戏中已经存在的声音事件,你的事件必须与原始事件**完全**匹配——包括完整的事件路径,而不仅仅是事件名称。

例如,要覆盖 `event:/mission/combat/sword_hit`,你的事件必须使用那个确切的路径。

### 模组加载顺序

如果同时启用了多个音频模组,并且其中任何模组定义了具有相同路径的事件,则**最后加载的模组将具有优先权**。在发布你的模组或与其他音频模组一起测试时,请牢记这一点。

---

## 指南结构

本指南分为以下几个页面:

- **[事件设置(Event Setup)]({{< ref "audio-modding-event-setup.md" >}})** — 参数、效果预设、快照和用户属性
- **[场景音频(Scene Audio)]({{< ref "audio-modding-scene-audio.md" >}})** — 在场景中放置声音、混响区域(reverb zones)、动画与粒子音频、四声道环境音
- **[音频系统与优化(Audio Systems & Optimization)]({{< ref "audio-modding-systems.md" >}})** — 声音系统(voice system)、物理材质、优先级系统、战斗环境音系统,以及性能指南
</content>
