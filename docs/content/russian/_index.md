+++
title = "Главная"
description = "Официальная документация TaleWorlds по моддингу Mount & Blade II: Bannerlord. Руководства по модулям, ассетам, сценам, редактору, звуку, мультиплееру, War Sails и Steam Workshop."
weight = 1
+++

# Документация по моддингу Mount & Blade II: Bannerlord

Официальные руководства TaleWorlds по созданию модов для Bannerlord: модули, ассеты, сцены, инструменты редактора, звук, мультиплеер и морской контент. Справочник по коду: [документация API](https://apidoc.bannerlord.com/).

## С чего начать

Впервые занимаетесь моддингом Bannerlord? Пройдите эти шаги по порядку:

1. **[Создание модуля - Краткое руководство]({{< ref "quickguide_create_a_mod.md" >}})**: создайте и зарегистрируйте свой первый модуль.
2. **[Добавление и переопределение ассетов]({{< ref "overriding_assets.md" >}})**: добавляйте новые ассеты или заменяйте существующие.
3. **[Merging Module XML Files with Native]({{< ref "merging_module_xml_files_with_native.md" >}})**: изменяйте игровые данные, не копируя файлы целиком.
4. **[Uploading/Updating a Mod]({{< ref "uploading_updating_mod.md" >}})**: опубликуйте мод в Steam Workshop.
5. **[Часто задаваемые вопросы]({{< ref "faq.md" >}})**: ответы на частые проблемы.

## Я хочу...

{{< cards >}}
{{< card title="Создавать сцены и ландшафт" icon="fa-map" >}}
- [Terrain Creation]({{< ref "terrain_creation.md" >}})
- [Navmesh]({{< ref "nav_mesh.md" >}})
- [Editor Shortcuts]({{< ref "editor_shortcuts.md" >}})
- [Руководство по производительности сцены]({{< ref "scene_performance_guide.md" >}})
{{< /card >}}
{{< card title="Создавать сцены миссий" icon="fa-chess-rook" >}}
- [Сцены деревень]({{< ref "villages.md" >}})
- [Сцены осады]({{< ref "sieges.md" >}})
- [Сцены арены]({{< ref "arenas.md" >}})
- [Сцены укрытий]({{< ref "hideouts.md" >}})
{{< /card >}}
{{< card title="Добавлять предметы и оружие" icon="fa-shield" >}}
- [Weapon Smithing & Crafting Pieces]({{< ref "weapon_smithing.md" >}})
- [Сетки]({{< ref "meshes.md" >}})
- [Материалы]({{< ref "materials.md" >}})
- [Текстуры]({{< ref "textures.md" >}})
{{< /card >}}
{{< card title="Добавлять звуки и музыку" icon="fa-music" >}}
- [Audio Modding with FMOD Studio]({{< ref "audio-modding-overview.md" >}})
- [Event Setup]({{< ref "audio-modding-event-setup.md" >}})
- [Scene Audio]({{< ref "audio-modding-scene-audio.md" >}})
- [Audio Systems & Optimization]({{< ref "audio-modding-systems.md" >}})
{{< /card >}}
{{< card title="Создавать корабли и морской контент" icon="fa-ship" >}}
- [Ship Creation]({{< ref "ship_creation.md" >}})
- [Seaborne Raid Scenes]({{< ref "what_makes_seaborne_village_raid_scene.md" >}})
- [War Sails World Map]({{< ref "wsworldmap.md" >}})
{{< /card >}}
{{< card title="Создавать контент для мультиплеера" icon="fa-users" >}}
- [Creating a Custom Game Mode]({{< ref "custom_game_mode.md" >}})
- [Hosting a Custom Server]({{< ref "hosting_server.md" >}})
- [Multiplayer Scenes]({{< ref "multiplayer_scenes.md" >}})
{{< /card >}}
{{< card title="Изменять интерфейс, шрифты и баннеры" icon="fa-paint-brush" >}}
- [UI таблицы спрайтов]({{< ref "generating_and_loading_ui_sprite_sheets.md" >}})
- [Собственные шрифты]({{< ref "how_to_add_custom_fonts.md" >}})
- [Значки и цвета баннеров]({{< ref "creating_custom_banner_icons.md" >}})
{{< /card >}}
{{< card title="Писать код" icon="fa-code" >}}
- [Скрипты]({{< ref "scripts.md" >}})
- [Обратные вызовы компонентов сценария]({{< ref "callbacks.md" >}})
- [Расширение запечатанных классов]({{< ref "sealed_class_extension.md" >}})
- [Документация API](https://apidoc.bannerlord.com/)
{{< /card >}}
{{< /cards >}}

## Все разделы

{{< cards >}}
{{< card title="Управление ассетами" icon="fa-cubes" link="asset-management/" >}}
Создание модулей, добавление и переопределение ассетов: сетки, материалы, текстуры, анимации, префабы и многое другое.
{{< /card >}}
{{< card title="Миссии Bannerlord" icon="fa-flag" link="authoring-mission-scenes/" >}}
Что нужно каждой сцене миссии, а также компоненты сценариев и обратные вызовы, на которых построен геймплей.
{{< /card >}}
{{< card title="Редактор" icon="fa-pen-to-square" link="editor/" >}}
Редактор сцен и редакторы ресурсов: ландшафт, навмеши, материалы, скелеты и ткань.
{{< /card >}}
{{< card title="Audio Modding" icon="fa-volume-up" link="audio-modding/" >}}
Добавление звуков и музыки с помощью FMOD Studio: от настройки событий до звука сцен и оптимизации.
{{< /card >}}
{{< card title="War Sails" icon="fa-anchor" link="war-sails/" >}}
Создание кораблей, сцен морских набегов и контента карты мира для дополнения War Sails.
{{< /card >}}
{{< card title="Multiplayer" icon="fa-globe" link="multiplayer/" >}}
Запуск сервера, создание собственных режимов игры и сцен для мультиплеера.
{{< /card >}}
{{< card title="Лучшие практики" icon="fa-check-circle" link="bestpractices/" >}}
Рекомендуемые подходы к слиянию XML, XSLT, расширению кода и производительности сцен.
{{< /card >}}
{{< card title="Steam Workshop" icon="fa-brands fa-steam" link="steam-workshop/" >}}
Загрузка и обновление мода в Steam Workshop.
{{< /card >}}
{{< /cards >}}

## Сообщество и ресурсы

- **[Документация API](https://apidoc.bannerlord.com/)**: справочник по коду Bannerlord.
- **[Discord сообщества моддинга Mount & Blade](https://discord.gg/ykFVJGQ)**: задавайте вопросы и общайтесь с другими моддерами.
- **[Bannerlord Documentation (сообщество)](https://docs.bannerlordmodding.com/)**: руководства от сообщества, включая Gauntlet UI и упаковку модов для Vortex.
- **[BannerlordModding.LT (сообщество)](https://docs.bannerlordmodding.lt/)**: вики сообщества о процессах, техниках и советах по моддингу.
- **[Форумы TaleWorlds – The Smithy](https://forums.taleworlds.com/index.php?forums/the-smithy-mod-development.643/)**: официальный форум разработки модов.
- **[Участие на GitHub](https://github.com/TaleWorlds/Documentations)**: предлагайте исправления или новые страницы для этой документации.
