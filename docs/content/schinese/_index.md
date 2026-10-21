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
3. **[Merging Module XML Files with Native]({{< ref "merging_module_xml_files_with_native.md" >}})**：无需复制整个文件即可修改游戏数据。
4. **[上传/更新一个模组]({{< ref "uploading_updating_mod.md" >}})**：将你的 Mod 发布到 Steam 创意工坊。
5. **[常见问题解答]({{< ref "faq.md" >}})**：常见问题的解答。

## 我想要……

{{< cards >}}
{{< card title="制作场景和地形" icon="fa-map" >}}
- [地形创建]({{< ref "terrain_creation.md" >}})
- [导航网格]({{< ref "nav_mesh.md" >}})
- [编辑器快捷键]({{< ref "editor_shortcuts.md" >}})
- [Scene Performance Guide]({{< ref "scene_performance_guide.md" >}})
{{< /card >}}
{{< card title="制作任务场景" icon="fa-chess-rook" >}}
- [村庄场景]({{< ref "villages.md" >}})
- [攻城战场景]({{< ref "sieges.md" >}})
- [竞技场场景]({{< ref "arenas.md" >}})
- [藏身处场景]({{< ref "hideouts.md" >}})
{{< /card >}}
{{< card title="添加物品和武器" icon="fa-shield" >}}
- [Weapon Smithing & Crafting Pieces]({{< ref "weapon_smithing.md" >}})
- [网格]({{< ref "meshes.md" >}})
- [材质]({{< ref "materials.md" >}})
- [纹理]({{< ref "textures.md" >}})
{{< /card >}}
{{< card title="添加音效和音乐" icon="fa-music" >}}
- [Audio Modding with FMOD Studio]({{< ref "audio-modding-overview.md" >}})
- [Event Setup]({{< ref "audio-modding-event-setup.md" >}})
- [Scene Audio]({{< ref "audio-modding-scene-audio.md" >}})
- [Audio Systems & Optimization]({{< ref "audio-modding-systems.md" >}})
{{< /card >}}
{{< card title="制作船只和海战内容" icon="fa-ship" >}}
- [Ship Creation]({{< ref "ship_creation.md" >}})
- [Seaborne Raid Scenes]({{< ref "what_makes_seaborne_village_raid_scene.md" >}})
- [War Sails World Map]({{< ref "wsworldmap.md" >}})
{{< /card >}}
{{< card title="制作多人游戏内容" icon="fa-users" >}}
- [创建自定义游戏模式]({{< ref "custom_game_mode.md" >}})
- [Hosting a Custom Server]({{< ref "hosting_server.md" >}})
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
- [Sealed Class Extension]({{< ref "sealed_class_extension.md" >}})
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
- **[Bannerlord Documentation（社区）](https://docs.bannerlordmodding.com/)**：社区编写的指南，包括 Gauntlet UI 和为 Vortex 打包 Mod。
- **[BannerlordModding.LT（社区）](https://docs.bannerlordmodding.lt/)**：记录 Mod 制作流程、技巧和经验的社区百科。
- **[TaleWorlds 论坛 – The Smithy](https://forums.taleworlds.com/index.php?forums/the-smithy-mod-development.643/)**：官方 Mod 开发论坛。
- **[在 GitHub 上贡献](https://github.com/TaleWorlds/Documentations)**：为本文档提出修改建议或新页面。
