+++
title = "Добавление звуков в ваш модуль"
weight = 1
+++

Аудиосистема Bannerlord построена на собственной звуковой системе FMOD.
Чтобы сохранить производительность звукового движка и сделать его доступным для всех, нам потребовалось создать прослойку.

## Ключевые элементы

* `...\Modules\*YOUR_MOD*\ModuleData\module_sounds.xml` файл, в который вы добавляете пользовательские определения для ваших собственных звуков.
* `...\Modules\*YOUR_MOD*\ModuleSounds` папка, в которую вы помещаете аудиофайлы (`.ogg`, `.wav`)

Вы можете посмотреть пример в модуле 'Native'.

## Основное руководство

1. Скопируйте файлы примеров и папку в свой собственный модуль
2. Добавьте новые звуки в папку ModuleSounds
3. Откройте module_sounds.xml в вашем модуле
4. Вы увидите категории звуков, пример кода для воспроизведения звуков и примеры записей module_sound в исходном файле module_sounds.xml.
5. Добавьте новую запись в файл вашего мода module_sounds.xml
6. Воспроизведите новый звук из кода

## Двигаемся дальше

### Использование module_sounds.xml

```xml
    <module_sound name="example/combat/hit" is_2d="true" sound_category="mission_combat" path="example_sound_modders.ogg" />
```

* **'name'**: Любое уникальное имя по вашему желанию. Это идентификатор вашего звука.
    - Используйте при воспроизведении звука из кода.
    - Используйте для воспроизведения звука анимации. Добавьте к анимации атрибут 'sound_code'.
* **'is_2d'**: Если пространственные свойства звука не будут использоваться. 3D-звуки имеют такие свойства, как положение, скорость и т.д.
* **'sound_category'**: Все звуки должны быть отнесены к категории, чтобы они правильно проходили через наши трубы. Доступные категории:
    - mission_ambient_bed (2D ambient loops like base wind)
    - mission_ambient_3d_big (Sounds that should be heard from long distance, like a burning castle)
    - mission_ambient_3d_medium (Sounds that should be heard from medium distance, like bonfires)
    - mission_ambient_3d_small (Sounds that should be heard from nearby, like campfires)
    - mission_material_impact (Physics material impacts like *metal* sword hitting *stone* wall)
    - mission_combat_trivial (Unimportant damage sounds, like low/no damage)
    - mission_combat (Damage sounds)
    - mission_foley (Swings, movement sounds, animal movements)
    - mission_voice_shout (Human/Animal voices that should be heard from long distance like battle yells)
    - mission_voice (Human/Animal grunts, knockouts etc.)
    - mission_voice_trivial (Quiet vocalizations like climbing, jumping)
    - mission_siege_loud (Big siege sounds like boulder hits wall, Catapult fires, Door breaks)
    - mission_footstep (Standard footsteps for humans and smaller animals)
    - mission_footstep_run (Louder footsteps that could be head from distance when in crowds)
    - mission_horse_gallop (Horse, camel gallops)
    - mission_horse_walk (Horse, camel single soft footstep)
    - ui (2D sounds for UI and notifications)
    - alert (Psuedo-3d sounds for alerting the player from mid distance)
    - campaign_node (Positional sound nodes for World Map, farms, seas, waterfalls)
    - campaign_bed (2D ambient sounds for World Map, desert gusts, pasture winds etc.)
* **'path'**: Звуковой файл для воспроизведения. Путь указывается относительно папки ModuleSounds вашего модуля. Вы можете создавать дочерние папки.


### Воспроизведение звука в примере кода

```C#
    int soundIndex = SoundEvent.GetEventIdFromString("example/voice/charge"); //чтобы избежать строковых операций во время выполнения, soundIndex можно кэшировать.
    if (playOneshot)
    {
        MakeSound(soundIndex, MainAgent.Position, false, true, -1, -1); //воспроизводит звук одного выстрела в позиции с заданными параметрами.
    }
    else
    {
        SoundEvent eventRef = SoundEvent.CreateEvent(soundIndex, Scene); //получить ссылку на звук и обновить параметры позже.
        eventRef.SetPosition(MainAgent.Position);
        eventRef.Play();
    }
```

У вас есть два способа воспроизвести звук:

* Один выстрел
    Лучшая производительность меньше контроля. Стреляй и забудь. Подходит для звуков, связанных с боем.
* Создание и хранение ссылки
  Хуже производительность. Контролируйте каждый параметр звука, когда захотите. т.е. пауза, обновление позиции. 