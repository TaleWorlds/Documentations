+++
title = "Adding Sounds to Your Module"
weight = 1
+++

Bannerlord audio system is built on proprietary FMOD Sound system.
To keep audio engine performant while making it accessible to anyone, we needed to create an interlayer.

## Key Elements

* `...\Modules\*YOUR_MOD*\ModuleData\module_sounds.xml` file, where you add custom definitions for your own sounds
* `...\Modules\*YOUR_MOD*\ModuleSounds folder where you` put audio files (`.ogg`, `.wav`)

You can see examples in 'Native' module.

## Basic Guide

1. Copy example files and folder to your own module
2. Add new sounds into the ModuleSounds folder
3. Open the module_sounds.xml of your module
4. You will see sound categories, code example for playing sounds and example module_sound entries in the original module_sounds.xml file
5. Add new entry to your mod's module_sounds.xml
6. Play the new sound entry from the code

## Moving Further

### Using module_sounds.xml

```xml
    <module_sound name="example/combat/hit" is_2d="true" sound_category="mission_combat" path="example_sound_modders.ogg" />
```

* **'name'**: Any unique name you want. This is the identifier for your sound.
    - Use while playing sound from the code.
    - Use to play animation sound. Add to animation's 'sound_code' attribute.
* **'is_2d'**: If the sound's spatial properties won't be used. 3d sounds have properties as position, velocity etc.
* **'sound_category'**: All sounds must be assigned to a category to route it correctly through our pipes. Available categories are,
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
* **'path'**: The sound file to be played. Path is relative to your module's ModuleSounds folder. You can create child folders.


### Playing Sound from Code Example

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

You have two ways to play sound:

* One Shot
    Better performance less control. Fire and forget. Good for combat-related sounds.
* Creating and holding a reference
    Worse performance. Control every parameter of sound whenever you want. i.e. Pause, Update position.