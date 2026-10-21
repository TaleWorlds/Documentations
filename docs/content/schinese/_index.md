+++
title = "首页"
description = "TaleWorlds 官方《骑马与砍杀2：霸主》Mod 制作文档。涵盖模块、资产、场景、编辑器、音频、多人游戏、War Sails 和 Steam 创意工坊的指南。"
weight = 1
+++

# 《骑马与砍杀2：霸主》Mod 制作文档

TaleWorlds 官方的《霸主》Mod 制作指南：模块、资产、场景、编辑器工具、音频、多人游戏和海战内容。代码参考请查看 [API 文档](https://apidoc.bannerlord.com/)。

## 快速开始

第一次制作《霸主》Mod？请按顺序完成以下步骤：

1. **[创建一个Mod - 快速入门]({{< ref "quickguide_create_a_mod.md" >}})**：创建并注册你的第一个模块。
2. **[添加与覆盖资产]({{< ref "overriding_assets.md" >}})**：添加新资产或替换现有资产。
3. **[将模块XML文件与原生数据合并]({{< ref "merging_module_xml_files_with_native.md" >}})**：无需复制整个文件即可修改游戏数据。
4. **[上传/更新一个模组]({{< ref "uploading_updating_mod.md" >}})**：将你的 Mod 发布到 Steam 创意工坊。
5. **[常见问题解答]({{< ref "faq.md" >}})**：常见问题的解答。

## 我想要……

{{< cards >}}
{{< card title="制作场景和地形" icon="fa-map" >}}
- [地形创建]({{< ref "terrain_creation.md" >}})
- [导航网格]({{< ref "nav_mesh.md" >}})
- [编辑器快捷键]({{< ref "editor_shortcuts.md" >}})
- [场景性能指南]({{< ref "scene_performance_guide.md" >}})
{{< /card >}}
{{< card title="制作任务场景" icon="fa-chess-rook" >}}
- [村庄场景]({{< ref "villages.md" >}})
- [攻城战场景]({{< ref "sieges.md" >}})
- [竞技场场景]({{< ref "arenas.md" >}})
- [藏身处场景]({{< ref "hideouts.md" >}})
{{< /card >}}
{{< card title="添加物品和武器" icon="fa-shield" >}}
- [武器锻造与制作部件]({{< ref "weapon_smithing.md" >}})
- [网格]({{< ref "meshes.md" >}})
- [材质]({{< ref "materials.md" >}})
- [纹理]({{< ref "textures.md" >}})
{{< /card >}}
{{< card title="添加音效和音乐" icon="fa-music" >}}
- [使用 FMOD Studio 进行音频模组制作]({{< ref "audio-modding-overview.md" >}})
- [事件设置]({{< ref "audio-modding-event-setup.md" >}})
- [场景音频]({{< ref "audio-modding-scene-audio.md" >}})
- [音频系统与优化]({{< ref "audio-modding-systems.md" >}})
{{< /card >}}
{{< card title="制作船只和海战内容" icon="fa-ship" >}}
- [船只创建]({{< ref "ship_creation.md" >}})
- [海上突袭场景的构成要素]({{< ref "what_makes_seaborne_village_raid_scene.md" >}})
- [War Sails 世界地图]({{< ref "wsworldmap.md" >}})
{{< /card >}}
{{< card title="制作多人游戏内容" icon="fa-users" >}}
- [创建自定义游戏模式]({{< ref "custom_game_mode.md" >}})
- [托管自定义服务器]({{< ref "hosting_server.md" >}})
- [多人游戏场景的构造]({{< ref "multiplayer_scenes.md" >}})
{{< /card >}}
{{< card title="修改界面、字体和旗帜" icon="fa-paint-brush" >}}
- [UI 精灵图集]({{< ref "generating_and_loading_ui_sprite_sheets.md" >}})
- [如何添加自定义字体]({{< ref "how_to_add_custom_fonts.md" >}})
- [旗帜图标和颜色]({{< ref "creating_custom_banner_icons.md" >}})
{{< /card >}}
{{< card title="编写代码" icon="fa-code" >}}
- [脚本]({{< ref "scripts.md" >}})
- [脚本组件回调函数]({{< ref "callbacks.md" >}})
- [密封类(Sealed Class)的扩展]({{< ref "sealed_class_extension.md" >}})
- [API 文档](https://apidoc.bannerlord.com/)
{{< /card >}}
{{< /cards >}}

## 所有章节

{{< cards >}}
{{< card title="资产管理" icon="fa-cubes" link="asset-management/" >}}
创建模块，添加或覆盖资产：网格、材质、纹理、动画、预制件等。
{{< /card >}}
{{< card title="编辑任务场景" icon="fa-flag" link="authoring-mission-scenes/" >}}
各类任务场景的要求，以及驱动游戏玩法的脚本组件和回调函数。
{{< /card >}}
{{< card title="编辑器" icon="fa-pen-to-square" link="editor/" >}}
使用场景编辑器和资源编辑器处理地形、导航网格、材质、骨骼和布料。
{{< /card >}}
{{< card title="Audio Modding" icon="fa-volume-up" link="audio-modding/" >}}
使用 FMOD Studio 添加音效和音乐，从事件设置到场景音频和优化。
{{< /card >}}
{{< card title="War Sails" icon="fa-anchor" link="war-sails/" >}}
为 War Sails 资料片制作船只、海上劫掠场景和世界地图内容。
{{< /card >}}
{{< card title="多人游戏" icon="fa-globe" link="multiplayer/" >}}
架设服务器、创建自定义游戏模式和制作多人游戏场景。
{{< /card >}}
{{< card title="最佳实践范例" icon="fa-check-circle" link="bestpractices/" >}}
XML 合并、XSLT、代码扩展和场景性能的推荐做法。
{{< /card >}}
{{< card title="Steam 创意工坊" icon="fa-brands fa-steam" link="steam-workshop/" >}}
在 Steam 创意工坊上传和更新你的 Mod。
{{< /card >}}
{{< /cards >}}

## 社区与资源

- **[API 文档](https://apidoc.bannerlord.com/)**：《霸主》代码参考。
- **[骑马与砍杀 Mod 制作 Discord](https://discord.gg/ykFVJGQ)**：提问并与其他 Mod 作者交流。
- **[Developer Workshop – Map Editor](https://www.youtube.com/watch?v=ovQiJfeQB8s)**：TaleWorlds 官方直播，演示如何使用战役地图编辑器（英文）。
- **[TaleWorlds 论坛 – The Smithy](https://forums.taleworlds.com/index.php?forums/the-smithy-mod-development.643/)**：官方 Mod 开发论坛。
- **[在 GitHub 上贡献](https://github.com/TaleWorlds/Documentations)**：为本文档提出修改建议或新页面。

## 社区资源

以下资源由社区制作和维护，并非由 TaleWorlds 提供。部分资源基于旧版游戏制作，细节可能与当前版本不同。大多数资源仅提供英文版本。

### 文档与指南

- **[Bannerlord Documentation](https://docs.bannerlordmodding.com/)**：社区编写的指南，包括 Gauntlet UI 和为 Vortex 打包 Mod。
- **[BannerlordModding.LT](https://docs.bannerlordmodding.lt/)**：记录 Mod 制作流程、技巧和经验的社区百科。
- **[Unofficial Bannerlord API Docs (BUTR)](https://bannerlordapi.butr.link/)**：根据游戏文件生成的各版本 API 参考。
- **[BUTR Documentation](https://butr.github.io/documentation)**：Harmony 调试、崩溃报告以及使用 GitHub Actions 发布 Mod 的操作指南。
- **[Documentation & Tutorials 论坛版块](https://forums.taleworlds.com/index.php?forums/documentation-tutorials.753/)**：社区在 TaleWorlds 论坛分享的教程。

### 社区指南（Google 文档）

- **[3D Asset Workflow](https://docs.google.com/document/d/1aHBsO3mzkT0JsbCt9aCOh6CWAFATXwKtSaVb__TYIoo/edit)**：为《霸主》准备 3D 资源。
- **[Asset Import Workflow](https://docs.google.com/document/d/11-J8HzS2FdnwwXfR7JmD_FQSQ6dWaJj_BZr1-vVW9Ks/edit)**：分步骤的资源导入流程。
- **[Importing Assets into BL Editor](https://docs.google.com/document/d/1ZnkRjNu6wUx3UM0exMiC8WhE8iDXPJKqYcbZdRh_q0o/edit)**：将你的资源导入《霸主》编辑器。
- **[Importing Material Maps in Editor](https://docs.google.com/document/d/1843jpWFYLylJya1-_-wQpkemV58KT3EomEoqUYKpZTo/edit)**：导入纹理和材质贴图。
- **[Basic World Mapping](https://docs.google.com/document/d/1npGJ9p1ySdu2RDU19P_2aE-OCsKWie_G02vcws36UIs/edit)**：制作自定义战役地图入门。
- **[Adding Custom Scenes to Custom Battle](https://docs.google.com/document/d/1Rwsd9pdv5QA5s3K4oOuJX16_K9A5NaoWh0p78IcUi1w/edit)**：在自定义战斗中测试你的场景。
- **[Adding Flora to flora_kinds](https://docs.google.com/document/d/1VGpct-__3s6hn15GXHo5P1TS-yMrGfDxCed1UZ3AaNI/edit)**：在 flora_kinds 中注册新植被。
- **[Bannerlord Layer Buttons, Options, and Settings](https://docs.google.com/document/d/1EiLvSZEJ_88fnva6d9s8H36XLH13YkVdim6jABe095s/edit)**（部分完成）：编辑器图层按钮、选项和设置的说明。

### 视频教程

- **[Lesser Scholar – Artisan Workshop Mod](https://www.youtube.com/playlist?list=PLzebdAxJeltRwfJ8jzsNolgHkRvLjoCRC)**：共 19 集的 C# 课程，涵盖环境配置、战役行为、对话、Gauntlet UI、Harmony 和发布。
- **[A_Jannik](https://www.youtube.com/playlist?list=PLXLt7zu34iHFzZVDzZpvareujNqbJiypj)**：C# 入口点、调试和 Harmony 补丁。
- **[Danqna & Gispry](https://www.youtube.com/watch?v=duvR9xFvu9Q)**：共 6 集的 C# 系列，涵盖 Visual Studio 配置、对话、存档和 MCM 菜单。
- **[Macbeth of Gondor](https://www.youtube.com/@MacbethofGondor)**：共 19 集的场景编辑器系列，涵盖地形、植被、导航网格、季节、预制件和屏障。
- **[Banner Lab](https://www.youtube.com/playlist?list=PLxhni8XI_dRDjRRDsCzEBZg4eUInzkzQT)**：无需代码的 XML Mod 制作：兵种、物品、文化、王国、英雄和定居点。
- **[Lykon Development](https://www.youtube.com/@LykonDevelopment/videos)**：XML 兵种、武器和王国，加载画面，以及 Blender 权重绘制。
- **[Adam Dotlačil](https://www.youtube.com/@enpremi)**：自定义弓、弩和箭袋，以及自定义模型的手部动画。
- **[BabyLettuce – Skeletons & Races](https://www.youtube.com/watch?v=eXHd8yjoxk0)**：自定义骨骼和种族的完整教程。

### 工具

- **[Bannerlord Scene Toolkit](https://github.com/fiefevictionnotice/BannerlordSceneToolkit)**（作者：FiefEvictionNotice）：在场景编辑器内运行的工具集，提供材质替换与重新着色、预制件创建、分布与镜像、场景分析和备份功能。参见[教程视频](https://www.youtube.com/watch?v=f1uzZ-qQm3c)（英文）。
- **[XBannerlord](https://forums.taleworlds.com/index.php?threads/tool-xbannerlord-an-ai-powered-xml-editor-for-bannerlord-mod-xmls.470278/)**（作者：cookgreen）：Windows 平台的 XML 编辑器，以树形结构显示《霸主》XML 文件，并可通过与 AI 模型对话来编辑所选节点。提供英文和中文界面。[GitHub 源代码](https://github.com/cookgreen/XBannerlord)。
- **[Bannerlord Crafting Tool](https://github.com/haterade22/TAOM/releases/tag/crafting-tool-v1.0)**（作者：haterade22）：Windows 工具，可在 2D 和 3D 中预览武器锻造部件，无需启动游戏即可调整部件偏移并检查武器长度。

### 入门资源包

- **[Campaign Map Prefab Starter Pack](https://www.nexusmods.com/mountandblade2bannerlord/mods/11608)**（作者：Lemmy1916）：带有预建定居点和脚本的现成战役地图，可用于制作新的世界地图。
- **[War Sails Campaign Map Prefab Starter Pack](https://www.nexusmods.com/mountandblade2bannerlord/mods/13602)**（作者：Lemmy1916）：为 War Sails 配置的同款入门地图。
