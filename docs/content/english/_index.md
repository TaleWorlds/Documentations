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
- **[Developer Workshop – Map Editor](https://www.youtube.com/watch?v=ovQiJfeQB8s)**: an official TaleWorlds stream showing how to work with the campaign map editor.
- **[TaleWorlds Forums – The Smithy](https://forums.taleworlds.com/index.php?forums/the-smithy-mod-development.643/)**: the official mod development forum.
- **[Contribute on GitHub](https://github.com/TaleWorlds/Documentations)**: suggest fixes or new pages for this documentation.

## Community-Made Resources

These resources are made and maintained by the community, not by TaleWorlds. Some were made for older game versions, so details may differ in the current version.

### Documentation & Guides

- **[Bannerlord Documentation](https://docs.bannerlordmodding.com/)**: community-written guides, including Gauntlet UI and packaging mods for Vortex.
- **[BannerlordModding.LT](https://docs.bannerlordmodding.lt/)**: a community wiki of modding processes, techniques and tips.
- **[Unofficial Bannerlord API Docs (BUTR)](https://bannerlordapi.butr.link/)**: API reference for each game version, generated from the game files.
- **[BUTR Documentation](https://butr.github.io/documentation)**: how-tos for Harmony debugging, crash reports and publishing mods with GitHub Actions.
- **[Documentation & Tutorials forum](https://forums.taleworlds.com/index.php?forums/documentation-tutorials.753/)**: tutorials shared by the community on the TaleWorlds Forums.

### Community Guides (Google Docs)

- **[3D Asset Workflow](https://docs.google.com/document/d/1aHBsO3mzkT0JsbCt9aCOh6CWAFATXwKtSaVb__TYIoo/edit)**: preparing 3D assets for Bannerlord.
- **[Asset Import Workflow](https://docs.google.com/document/d/11-J8HzS2FdnwwXfR7JmD_FQSQ6dWaJj_BZr1-vVW9Ks/edit)**: step-by-step workflow for importing assets.
- **[Importing Assets into BL Editor](https://docs.google.com/document/d/1ZnkRjNu6wUx3UM0exMiC8WhE8iDXPJKqYcbZdRh_q0o/edit)**: getting your assets into the Bannerlord editor.
- **[Importing Material Maps in Editor](https://docs.google.com/document/d/1843jpWFYLylJya1-_-wQpkemV58KT3EomEoqUYKpZTo/edit)**: importing textures and material maps.
- **[Basic World Mapping](https://docs.google.com/document/d/1npGJ9p1ySdu2RDU19P_2aE-OCsKWie_G02vcws36UIs/edit)**: an introduction to building your own campaign map.
- **[Adding Custom Scenes to Custom Battle](https://docs.google.com/document/d/1Rwsd9pdv5QA5s3K4oOuJX16_K9A5NaoWh0p78IcUi1w/edit)**: testing your own scenes in Custom Battle.
- **[Adding Flora to flora_kinds](https://docs.google.com/document/d/1VGpct-__3s6hn15GXHo5P1TS-yMrGfDxCed1UZ3AaNI/edit)**: registering new flora in flora_kinds.
- **[Bannerlord Layer Buttons, Options, and Settings](https://docs.google.com/document/d/1EiLvSZEJ_88fnva6d9s8H36XLH13YkVdim6jABe095s/edit)** (partly finished): what the editor's layer buttons, options and settings do.

### Video Tutorials

- **[Lesser Scholar – Artisan Workshop Mod](https://www.youtube.com/playlist?list=PLzebdAxJeltRwfJ8jzsNolgHkRvLjoCRC)**: a 19-part C# course covering setup, campaign behaviors, dialogs, Gauntlet UI, Harmony and publishing.
- **[A_Jannik](https://www.youtube.com/playlist?list=PLXLt7zu34iHFzZVDzZpvareujNqbJiypj)**: C# entry points, debugging and Harmony patching.
- **[Danqna & Gispry](https://www.youtube.com/watch?v=duvR9xFvu9Q)**: a 6-part C# series covering Visual Studio setup, dialogue, saving and MCM menus.
- **[Macbeth of Gondor](https://www.youtube.com/@MacbethofGondor)**: a 19-part Scene Editor series covering terrain, flora, navmesh, seasons, prefabs and barriers.
- **[Banner Lab](https://www.youtube.com/playlist?list=PLxhni8XI_dRDjRRDsCzEBZg4eUInzkzQT)**: XML modding without code: troops, items, cultures, kingdoms, heroes and settlements.
- **[Lykon Development](https://www.youtube.com/@LykonDevelopment/videos)**: XML troops, weapons and kingdoms, loading screens and weight painting in Blender.
- **[Adam Dotlačil](https://www.youtube.com/@enpremi)**: custom bows, crossbows and quivers, and hand animations for custom meshes.
- **[BabyLettuce – Skeletons & Races](https://www.youtube.com/watch?v=eXHd8yjoxk0)**: a full tutorial on custom skeletons and races.

### Tools

- **[Bannerlord Scene Toolkit](https://github.com/fiefevictionnotice/BannerlordSceneToolkit)** by FiefEvictionNotice: tools that run inside the Scene Editor for material swaps and recolors, prefab creation, distribution and mirroring, scene analysis and backups. See the [tutorial video](https://www.youtube.com/watch?v=f1uzZ-qQm3c).
- **[XBannerlord](https://forums.taleworlds.com/index.php?threads/tool-xbannerlord-an-ai-powered-xml-editor-for-bannerlord-mod-xmls.470278/)** by cookgreen: a Windows XML editor that shows Bannerlord XML files as a tree and lets you edit the selected node by chatting with an AI model. English and Chinese interface. [Source on GitHub](https://github.com/cookgreen/XBannerlord).
- **[Bannerlord Crafting Tool](https://github.com/haterade22/TAOM/releases/tag/crafting-tool-v1.0)** by haterade22: a Windows tool that previews weapon crafting pieces in 2D and 3D, so you can tune their offsets and check weapon length without launching the game.

### Starter Packs

- **[Campaign Map Prefab Starter Pack](https://www.nexusmods.com/mountandblade2bannerlord/mods/11608)** by Lemmy1916: a ready-to-use campaign map with pre-built settlements and scripts, to start a new world map.
- **[War Sails Campaign Map Prefab Starter Pack](https://www.nexusmods.com/mountandblade2bannerlord/mods/13602)** by Lemmy1916: the same starter map set up for War Sails.
