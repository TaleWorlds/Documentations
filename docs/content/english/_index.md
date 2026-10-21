+++
title = "Home"
description = "Official Mount & Blade II: Bannerlord modding documentation by TaleWorlds. Guides for modules, assets, scenes, editor tools, audio, multiplayer, War Sails and the Steam Workshop."
weight = 1
+++

# Mount & Blade II: Bannerlord Modding Documentation

Official guides from TaleWorlds for creating Bannerlord mods: modules, assets, scenes, editor tools, audio, multiplayer and naval content. For code reference, see the [API documentation](https://apidoc.bannerlord.com/).

## Getting Started

New to Bannerlord modding? Follow these steps in order:

1. **[Creating a Module - Quick Guide]({{< ref "quickguide_create_a_mod.md" >}})**: create and register your first module.
2. **[Adding & Overriding Assets]({{< ref "overriding_assets.md" >}})**: add new assets or replace existing ones.
3. **[Merging Module XML Files with Native]({{< ref "merging_module_xml_files_with_native.md" >}})**: change game data without copying whole files.
4. **[Uploading/Updating a Mod]({{< ref "uploading_updating_mod.md" >}})**: publish your mod on the Steam Workshop.
5. **[Frequently Asked Questions]({{< ref "faq.md" >}})**: answers to common problems.

## I Want To...

{{< cards >}}
{{< card title="Build scenes & terrain" icon="fa-map" >}}
- [Terrain Creation]({{< ref "terrain_creation.md" >}})
- [Navmesh]({{< ref "nav_mesh.md" >}})
- [Editor Shortcuts]({{< ref "editor_shortcuts.md" >}})
- [Scene Performance Guide]({{< ref "scene_performance_guide.md" >}})
{{< /card >}}
{{< card title="Make mission scenes" icon="fa-chess-rook" >}}
- [Village Scenes]({{< ref "villages.md" >}})
- [Siege Scenes]({{< ref "sieges.md" >}})
- [Arena Scenes]({{< ref "arenas.md" >}})
- [Hideout Scenes]({{< ref "hideouts.md" >}})
{{< /card >}}
{{< card title="Add items & weapons" icon="fa-shield" >}}
- [Weapon Smithing & Crafting Pieces]({{< ref "weapon_smithing.md" >}})
- [Meshes]({{< ref "meshes.md" >}})
- [Materials]({{< ref "materials.md" >}})
- [Textures]({{< ref "textures.md" >}})
{{< /card >}}
{{< card title="Add sounds & music" icon="fa-music" >}}
- [Audio Modding with FMOD Studio]({{< ref "audio-modding-overview.md" >}})
- [Event Setup]({{< ref "audio-modding-event-setup.md" >}})
- [Scene Audio]({{< ref "audio-modding-scene-audio.md" >}})
- [Audio Systems & Optimization]({{< ref "audio-modding-systems.md" >}})
{{< /card >}}
{{< card title="Create ships & naval content" icon="fa-ship" >}}
- [Ship Creation]({{< ref "ship_creation.md" >}})
- [Seaborne Raid Scenes]({{< ref "what_makes_seaborne_village_raid_scene.md" >}})
- [War Sails World Map]({{< ref "wsworldmap.md" >}})
{{< /card >}}
{{< card title="Make multiplayer content" icon="fa-users" >}}
- [Creating a Custom Game Mode]({{< ref "custom_game_mode.md" >}})
- [Hosting a Custom Server]({{< ref "hosting_server.md" >}})
- [Multiplayer Scenes]({{< ref "multiplayer_scenes.md" >}})
{{< /card >}}
{{< card title="Change UI, fonts & banners" icon="fa-paint-brush" >}}
- [UI Sprite Sheets]({{< ref "generating_and_loading_ui_sprite_sheets.md" >}})
- [Custom Fonts]({{< ref "how_to_add_custom_fonts.md" >}})
- [Banner Icons & Colors]({{< ref "creating_custom_banner_icons.md" >}})
{{< /card >}}
{{< card title="Write code" icon="fa-code" >}}
- [Scripts]({{< ref "scripts.md" >}})
- [Script Component Callbacks]({{< ref "callbacks.md" >}})
- [Sealed Class Extension]({{< ref "sealed_class_extension.md" >}})
- [API Documentation](https://apidoc.bannerlord.com/)
{{< /card >}}
{{< /cards >}}

## All Sections

{{< cards >}}
{{< card title="Asset Management" icon="fa-cubes" link="asset-management/" >}}
Create modules and add or override assets: meshes, materials, textures, animations, prefabs and more.
{{< /card >}}
{{< card title="Bannerlord Missions" icon="fa-flag" link="authoring-mission-scenes/" >}}
What each mission scene needs, plus the script components and callbacks behind gameplay.
{{< /card >}}
{{< card title="Editor" icon="fa-pen-to-square" link="editor/" >}}
Use the Scene Editor and resource editors for terrain, navmeshes, materials, skeletons and cloth.
{{< /card >}}
{{< card title="Audio Modding" icon="fa-volume-up" link="audio-modding/" >}}
Add sounds and music with FMOD Studio, from event setup to scene audio and optimization.
{{< /card >}}
{{< card title="War Sails" icon="fa-anchor" link="war-sails/" >}}
Create ships, seaborne raid scenes and world map content for the War Sails expansion.
{{< /card >}}
{{< card title="Multiplayer" icon="fa-globe" link="multiplayer/" >}}
Host a server, create custom game modes and build multiplayer scenes.
{{< /card >}}
{{< card title="Best Practices" icon="fa-check-circle" link="bestpractices/" >}}
Recommended approaches for XML merging, XSLT, code extension and scene performance.
{{< /card >}}
{{< card title="Steam Workshop" icon="fa-brands fa-steam" link="steam-workshop/" >}}
Upload and update your mod on the Steam Workshop.
{{< /card >}}
{{< /cards >}}

## Community & Resources

- **[API Documentation](https://apidoc.bannerlord.com/)**: reference for the Bannerlord code base.
- **[Mount & Blade Modding Discord](https://discord.gg/ykFVJGQ)**: ask questions and talk with other modders.
- **[Bannerlord Documentation (community)](https://docs.bannerlordmodding.com/)**: community-written guides, including Gauntlet UI and packaging mods for Vortex.
- **[BannerlordModding.LT (community)](https://docs.bannerlordmodding.lt/)**: a community wiki of modding processes, techniques and tips.
- **[TaleWorlds Forums – The Smithy](https://forums.taleworlds.com/index.php?forums/the-smithy-mod-development.643/)**: the official mod development forum.
- **[Contribute on GitHub](https://github.com/TaleWorlds/Documentations)**: suggest fixes or new pages for this documentation.
