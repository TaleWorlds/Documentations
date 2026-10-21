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
3. **[Слияние XML-файлов модуля с нативными файлами]({{< ref "merging_module_xml_files_with_native.md" >}})**: изменяйте игровые данные, не копируя файлы целиком.
4. **[Загрузка/обновление мода]({{< ref "uploading_updating_mod.md" >}})**: опубликуйте мод в Steam Workshop.
5. **[Часто задаваемые вопросы]({{< ref "faq.md" >}})**: ответы на частые проблемы.

## Я хочу...

{{< cards >}}
{{< card title="Создавать сцены и ландшафт" icon="fa-map" >}}
- [Создание рельефа]({{< ref "terrain_creation.md" >}})
- [Навмеш]({{< ref "nav_mesh.md" >}})
- [Горячие клавиши редактора]({{< ref "editor_shortcuts.md" >}})
- [Руководство по производительности сцены]({{< ref "scene_performance_guide.md" >}})
{{< /card >}}
{{< card title="Создавать сцены миссий" icon="fa-chess-rook" >}}
- [Сцены деревень]({{< ref "villages.md" >}})
- [Сцены осады]({{< ref "sieges.md" >}})
- [Сцены арены]({{< ref "arenas.md" >}})
- [Сцены укрытий]({{< ref "hideouts.md" >}})
{{< /card >}}
{{< card title="Добавлять предметы и оружие" icon="fa-shield" >}}
- [Кузнечное дело и элементы крафта оружия]({{< ref "weapon_smithing.md" >}})
- [Сетки]({{< ref "meshes.md" >}})
- [Материалы]({{< ref "materials.md" >}})
- [Текстуры]({{< ref "textures.md" >}})
{{< /card >}}
{{< card title="Добавлять звуки и музыку" icon="fa-music" >}}
- [Моддинг звука с помощью FMOD Studio]({{< ref "audio-modding-overview.md" >}})
- [Настройка событий (Event Setup)]({{< ref "audio-modding-event-setup.md" >}})
- [Звук сцены]({{< ref "audio-modding-scene-audio.md" >}})
- [Аудиосистемы и оптимизация]({{< ref "audio-modding-systems.md" >}})
{{< /card >}}
{{< card title="Создавать корабли и морской контент" icon="fa-ship" >}}
- [Создание корабля]({{< ref "ship_creation.md" >}})
- [Из чего состоит сцена морского набега]({{< ref "what_makes_seaborne_village_raid_scene.md" >}})
- [Карта мира War Sails]({{< ref "wsworldmap.md" >}})
{{< /card >}}
{{< card title="Создавать контент для мультиплеера" icon="fa-users" >}}
- [Создание пользовательского игрового режима]({{< ref "custom_game_mode.md" >}})
- [Размещение пользовательского сервера]({{< ref "hosting_server.md" >}})
- [Что делает сцену многопользовательской]({{< ref "multiplayer_scenes.md" >}})
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
- **[Developer Workshop – Map Editor](https://www.youtube.com/watch?v=ovQiJfeQB8s)**: официальная трансляция TaleWorlds о работе с редактором карты кампании (на английском языке).
- **[Форумы TaleWorlds – The Smithy](https://forums.taleworlds.com/index.php?forums/the-smithy-mod-development.643/)**: официальный форум разработки модов.
- **[Участие на GitHub](https://github.com/TaleWorlds/Documentations)**: предлагайте исправления или новые страницы для этой документации.

## Ресурсы от сообщества

Эти ресурсы созданы и поддерживаются сообществом, а не TaleWorlds. Некоторые из них сделаны для старых версий игры, поэтому детали могут отличаться в текущей версии. Большинство материалов доступно только на английском языке.

### Документация и руководства

- **[Bannerlord Documentation](https://docs.bannerlordmodding.com/)**: руководства от сообщества, включая Gauntlet UI и упаковку модов для Vortex.
- **[BannerlordModding.LT](https://docs.bannerlordmodding.lt/)**: вики сообщества о процессах, техниках и советах по моддингу.
- **[Unofficial Bannerlord API Docs (BUTR)](https://bannerlordapi.butr.link/)**: справочник API для каждой версии игры, созданный на основе файлов игры.
- **[BUTR Documentation](https://butr.github.io/documentation)**: инструкции по отладке Harmony, отчётам о сбоях и публикации модов через GitHub Actions.
- **[Форум Documentation & Tutorials](https://forums.taleworlds.com/index.php?forums/documentation-tutorials.753/)**: руководства от сообщества на форумах TaleWorlds.

### Руководства сообщества (Google Docs)

- **[3D Asset Workflow](https://docs.google.com/document/d/1aHBsO3mzkT0JsbCt9aCOh6CWAFATXwKtSaVb__TYIoo/edit)**: подготовка 3D-ассетов для Bannerlord.
- **[Asset Import Workflow](https://docs.google.com/document/d/11-J8HzS2FdnwwXfR7JmD_FQSQ6dWaJj_BZr1-vVW9Ks/edit)**: пошаговый процесс импорта ассетов.
- **[Importing Assets into BL Editor](https://docs.google.com/document/d/1ZnkRjNu6wUx3UM0exMiC8WhE8iDXPJKqYcbZdRh_q0o/edit)**: как добавить свои ассеты в редактор Bannerlord.
- **[Importing Material Maps in Editor](https://docs.google.com/document/d/1843jpWFYLylJya1-_-wQpkemV58KT3EomEoqUYKpZTo/edit)**: импорт текстур и карт материалов.
- **[Basic World Mapping](https://docs.google.com/document/d/1npGJ9p1ySdu2RDU19P_2aE-OCsKWie_G02vcws36UIs/edit)**: введение в создание собственной карты кампании.
- **[Adding Custom Scenes to Custom Battle](https://docs.google.com/document/d/1Rwsd9pdv5QA5s3K4oOuJX16_K9A5NaoWh0p78IcUi1w/edit)**: проверка собственных сцен в режиме «Своя битва».
- **[Adding Flora to flora_kinds](https://docs.google.com/document/d/1VGpct-__3s6hn15GXHo5P1TS-yMrGfDxCed1UZ3AaNI/edit)**: регистрация новой растительности в flora_kinds.
- **[Bannerlord Layer Buttons, Options, and Settings](https://docs.google.com/document/d/1EiLvSZEJ_88fnva6d9s8H36XLH13YkVdim6jABe095s/edit)** (не завершено): назначение кнопок слоёв, параметров и настроек редактора.

### Видеоуроки

- **[Lesser Scholar – Artisan Workshop Mod](https://www.youtube.com/playlist?list=PLzebdAxJeltRwfJ8jzsNolgHkRvLjoCRC)**: курс по C# из 19 частей: настройка, поведения кампании, диалоги, Gauntlet UI, Harmony и публикация.
- **[A_Jannik](https://www.youtube.com/playlist?list=PLXLt7zu34iHFzZVDzZpvareujNqbJiypj)**: точки входа C#, отладка и патчи Harmony.
- **[Danqna & Gispry](https://www.youtube.com/watch?v=duvR9xFvu9Q)**: серия по C# из 6 частей: настройка Visual Studio, диалоги, сохранения и меню MCM.
- **[Macbeth of Gondor](https://www.youtube.com/@MacbethofGondor)**: серия из 19 частей по редактору сцен: ландшафт, растительность, navmesh, сезоны, префабы и барьеры.
- **[Banner Lab](https://www.youtube.com/playlist?list=PLxhni8XI_dRDjRRDsCzEBZg4eUInzkzQT)**: моддинг XML без кода: войска, предметы, культуры, королевства, герои и поселения.
- **[Lykon Development](https://www.youtube.com/@LykonDevelopment/videos)**: войска, оружие и королевства в XML, экраны загрузки и рисование весов в Blender.
- **[Adam Dotlačil](https://www.youtube.com/@enpremi)**: собственные луки, арбалеты и колчаны, а также анимации рук для собственных моделей.
- **[BabyLettuce – Skeletons & Races](https://www.youtube.com/watch?v=eXHd8yjoxk0)**: полное руководство по собственным скелетам и расам.

### Инструменты

- **[Bannerlord Scene Toolkit](https://github.com/fiefevictionnotice/BannerlordSceneToolkit)** от FiefEvictionNotice: инструменты, работающие внутри редактора сцен: замена и перекраска материалов, создание, распределение и отражение префабов, анализ сцен и резервные копии. См. [видеоурок](https://www.youtube.com/watch?v=f1uzZ-qQm3c) (на английском языке).
- **[XBannerlord](https://forums.taleworlds.com/index.php?threads/tool-xbannerlord-an-ai-powered-xml-editor-for-bannerlord-mod-xmls.470278/)** от cookgreen: редактор XML для Windows, который показывает XML-файлы Bannerlord в виде дерева и позволяет изменять выбранный узел в диалоге с ИИ-моделью. Интерфейс на английском и китайском языках. [Исходный код на GitHub](https://github.com/cookgreen/XBannerlord).
- **[Bannerlord Crafting Tool](https://github.com/haterade22/TAOM/releases/tag/crafting-tool-v1.0)** от haterade22: инструмент для Windows, который показывает части оружия для ковки в 2D и 3D, позволяя настроить их смещения и проверить длину оружия без запуска игры.

### Стартовые наборы

- **[Campaign Map Prefab Starter Pack](https://www.nexusmods.com/mountandblade2bannerlord/mods/11608)** от Lemmy1916: готовая карта кампании с поселениями и скриптами для создания новой карты мира.
- **[War Sails Campaign Map Prefab Starter Pack](https://www.nexusmods.com/mountandblade2bannerlord/mods/13602)** от Lemmy1916: та же стартовая карта, настроенная для War Sails.
