+++
title = "What Makes a Multiplayer Scene"
description = ""
weight = 1
+++

### Introduction
This technical introduction should enable you to create a custom multiplayer scene, for a specific gamemode. It goes into details on what requirements your MP scene needs to meet so that it doesn't crash. This is not a design guideline or best practice document.

### Gamemode Specifics
Each Gamemode in Bannerlord will require a few different setups of relevant prefabs.

{{% notice tip %}}
It is possible to make scenes compatible with multiple game modes by including all needed prefabs. Scenes cannot be compatible with modes that use a different spawning system, for example a TDM scene can't be compatible with a Captain scene, but a Captain scene can also be used for Skirmish if it has a proper respawn setup.
{{% /notice %}}

#### Game Objects
Gameobjects found as prefabs that are needed for the gamemode to work in your scene. You can find these in the “Prefabs” window.

##### General
###### mp_camera_start_pos
Initial camera position, that is set for joining players. It basically defines the backdrop for choosing the faction upon joining a custom server. It will also be the first thing people see of your scene. Make sure you rotate it slightly (it is initially rotated downwards). Only place one!

###### border_soft
Define the soft border around your scene. If players cross they have a few seconds to return back. This border is needed to set the scene boundaries. Make sure the border does not cross into your playbale area. You define the border (best practice is to do a hexagon shape) by placing the border probes around your map. The probes will always try to connect to the 2 closest probes to them.

{{% notice tip %}}
You can check your resulting border by enabling “Borders” in the Visibility window, sometimes it is good to reload the scene before doing that.
{{% /notice %}}

###### flee_line
The lines that AI (in our gamemodes only AI horses) uses to leave the battlefield. They will try to find these using the navmesh. So these positions need to be placed where AI can reach them via the navmesh. Once they reach it they will fade out after a short period. You can place multiple instances of these.

{{% notice tip %}}
For siege, make sure there are flee lines inside the castle as well, so horses that got inside can get out without trying to pass the gate. Navmesh and AI can not dıstinguish between stairs and ramps, and horses can not traverse stairs. You might need to adjust or remove navigation meshes on stairs to avoid riderless horses blocking them.
{{% /notice %}}

###### envmap_prop
Should already be there when you create a new scene, if it’s not place it and set it to “IsGlobal” in the “Inspector” window. Also make sure it's in a valid position. You can of course have multiple probes, but use the local_envmap_probe for further probes.

##### Flag Domination (Skirmish, Battle, Captain)

###### Flags
Each of these gamemodes use 3 flags. Don't be put off by their naming but all game modes use the same prefabs!

Their prefabs: flag_pole_big_sergeant_A, flag_pole_big_sergeant_B, flag_pole_big_sergeant_C

Flag Domination modes need three individual flags, so don't duplicate the A flag 2 times.

##### Siege
###### Flags
Uses the same flags as Flag Domination, but more of them (obviously). Place all flags from A to F and the main flag which is G.

Their prefabs: flag_pole_big_sergeant_A, flag_pole_big_sergeant_B, flag_pole_big_sergeant_C, flag_pole_big_sergeant_D, flag_pole_big_sergeant_E, flag_pole_big_sergeant_F, flag_pole_big_sergeant_main

###### Siege Engines
Technically they work in the same way as for singleplayer sieges. Still there are some significant differences. First of all most of them use different prefabs for multiplayer, make sure you are using those!

There is also no minimum (or maximum) amount of siege engines needed in your scene, and no need for deployment points, since the siege engines are set by your scene and not by the sandbox campaign. Also you don't need to do extensive navmesh work for your siege tower, rams and ladders. So you can ignore all the nav mesh inputs in the Inspector.

Rams and siege towers will still need a path to move along though. Simply create a path, remember its name and set it in the script in the inspector as “PathEntityName”.

Multiplayer specific prefabs: siege_tower_5m_spawnerMP, siege_tower_9m_spawnerMP, siege_tower_12m_spawnerMP, batteringram_a_spawnerMP, mangonel_a_spawnerMP, mangonel_a_spawnerFireMP, mangonel_b_spawnerMP, mangonel_b_spawnerFireMP, mangonel_a_spawnerMP, mangonel_a_spawnerFireMP, ballista_a_spawnerMP, ballista_a_spawnerFireMP, ballista_b_spawnerMP, ballista_b_spawnerFireMP

{{% notice tip %}}
Prefabs for gates and ladders are the same as for singleplayer.
{{% /notice %}}

###### arrow_barrel
You can place this prefab anywhere in your scene. Players can use it to refill their ammunition.

###### rock_pile
Placing this prefab allows players to pick up rocks, they work the same way as the ones coming with siege engines by default. In the StonePile script you can set how many rocks this prefab comes with. There is also a firepot version of this prefab: “pot_pile”

The prefab comes with children “icon_man” that define the positions you can pick up the rocks from. You can delete those children if you don't want your pile to be accessible from any direction.

Rock_pile and pot_pile prefabs can also be used with mangonels and trebuchets. If you want to give players the option to choose ammunation, you can simply place piles next to siege engines.

##### Duel
For duel mode you will need to create landmarks by hand. There are two kinds of landmarks, three that define the troop types and 16 smaller ones that define the arenas and which type they belong to.

###### Big landmarks
You can use any prefab for this, it will need to have these two tags: “duel_zone_landmark” and “flag_x”. The x stands for the troop type so replace it with either: “infantry”, ”cavalry” or ”archery”.

You also need to define the zone's troop type (again) with a script. For that, add the “DuelZoneLandmark” to your prefab and set it to whatever troop type you intend to spawn here.

###### Arena landmarks
These landmarks define the arenas that are grouped by the big landmarks. Again you can use any prefab as a base for this. It will need two tags set, the first one “flag_x” is used to reference it to the big landmark. So if you want this arena to be used for Cavalry fights, you should use the tag “flag_cavalry”.

Your landmark will also need a tag that references the actual arena area (described below), basically serving as an ID. For that, use the tag “area_flag_x”, x being the ID of your arena. So if you have 16 arenas, each of them should have their own tag, ranging from “area_flag_1” to “area_flag_16”.

###### volume_box
This box defines the area where combatants duel in your arena. All dropped weapons and bodies will be cleared inside this box after each duel. Make sure that it is slightly bigger than the physical arena you have built in the scene editor. You can use the volume_box prefab and scale it to your liking. The box will need a tag referencing the ID of your arena: “area_box_x”, x being the ID of your arena.

So if the tag for your arena was “area_flag_5”, you should tag your volmue_box with “area_box_5”.

The spawn points for both combatants need to be placed within this volume. Check below.

#### Spawn Points
Points where players start the round, or respawn during that round. Flag Domination modes (Captain, Skirmish, Battle) use nearly the same spawning system and scenes are compatible between each other with a little bit of work. Compatible in a technical sense that is.

Most spawn points require the right side tag to be set. The prefabs come with default tags that are either “attacker” or “defender”. You will obviously need to duplicate those and adjust all tags on the prefabs and its children for the opposite team. Sometimes if a tag is not yet present in your scene you need to manually add it to the list, it won’t show up in the drop down menu otherwise!

##### General
###### spawn_visual
Position in which the class and perk selection happens. The prefab has 6 child objects, one for the player and 5 for their teammates. For most game modes (every gamemode except skirmish and captain), only the child with the tag “sp_visual_0” is used, since we don't have a set amount of team mates.

During the class/perk selection a camera will be placed in front of the “sp_visual_0” child object.

{{% notice tip %}}
You can ignore the “attacker” tag on the child objects. Unlike many other spawn positions, this one does not need to be duplicated for the defender team.
{{% /notice %}}

##### Flag Domination (Skirmish, Battle, Captain)
###### skirmish_start_spawn
Prefab that defines the initial spawn. Don't be put off by the name of the prefab, it can be used for all 3 Flag Domination game modes.

Comes with 9 child spawns, but you can duplicate those to have more possible spawn positions (e.g. if you don't want people to spawn on top of each other for a 50 vs 50 battle mode). All children need to have the “spawnpoint” and “attacker” or “defender” tag. The main zone’s tags “starting” and “spawn_zone” should not be touched.

{{% notice tip %}}
Make sure that the points are not below the terrain and ground assets you are using. Also remember that horses that spawn will require more space around them. So don't place your spawns too close to each other and other prefabs.
{{% /notice %}}

###### skirmish_respawn
Prefab that defines the respawn positions for skirmish mode. So players spawn here after they have died. If you don't place these positions, players will spawn at the start spawn when respawning.

You can place up to 3 of these per side. Just like with the start spawn it is important you make duplicates for both sides “attacker” and “defender”. The main zone’s tag “spawn_zone” should not be touched.

Spawn point selection system relies on the location of the parent entity while checking for nearby enemies, while players will spawn in the child entities. You can use this to your advantage to adjust spawn location biases.

##### Siege
The spawns in siege are fundamentally different to other modes. Spawnzones in siege are inactive or active depending on how many flags have been removed in the match. Each spawn zone is connected to this gamemode logic via the tag sp_zone_x (x is a number between 0 and 6)

The tag in question is set in the main spawn point prefab, which has the single spawn points “mp_spawnpoint” as children. The “x” of the tag defines how many flags need to be captured (and removed) by the attackers, for this spawn area to be active. So at the start of the siege players will spawn in the zone with the tag sp_zone_0, once the first flag is removed they will spawn in the zone with the tag sp_zone_1, so and so on. If only G (the main flag) is left, players will spawn in the zone with the tag sp_zone_6.

You can put multiple of these tags on the same spawn zone, so you can have a spawn zone for the first two flags, by simply giving it the sp_zone_0 and sp_zone_1 tags.

Make sure to tag the children of the spawn zones with the “spawnpoint” and “attacker” or “defender” tag. Just like in the other modes.

There is no prefab for this spawnpoint, so you'll need to set most tags by yourself. I suggest you use the “skirmish_start_spawn” prefab. For that you need to delete the “starting” tag from the zone and replace it with the “sp_zone_x” tag / tags.

Don't forget to place attacker and defender spawns!

{{% notice tip %}}
You can use special tags on the “mp_spawnpoint” children of the spawn zones to adjust which troops can spawn there. The self explanatory tags for this are: “exclude_mounted” and “exclude_footmen”.
{{% /notice %}}

##### TDM
TDM doesn't use spawn zones, spawn points are placed around the scene without side tags. Use the “mp_spawnpoint” prefab for that. Make sure they are not a child to another prefab and only have the tag “spawnpoint”.

##### Duel
Duel doesn't use spawn zones, spawn points are placed around the scene (preferably a sort of lobby area) without side tags. Use the “mp_spawnpoint” prefab for that. Make sure they are not a child to another prefab and only have the tag “spawnpoint”.

Remember to also place two mp_spawnpoints inside each arena. They need to be tagged linking to the arena landmark. So with “spawnpoint_area_x”, x being the ID of the arena they belong to. Also make sure they are placed inside the volume_box of that arena.

#### Navigation Mesh
In general Navmesh is much less important in multiplayer, as most Native gamemodes don’t use AI soldiers. Still the navmesh is used for espacing horses, to find their way to flee lines and also it is used for baking GI.

For how to create a proper navmesh refer to our [existing documentation]({{< ref "nav_mesh" >}}).

You can ignore specific IDs for AI scripting.

##### Captain
Generally for captain mode the same thing applies as for singleplayer battle terrain navmesh work. You will have to cover a relatively huge scene, with very accurate navmesh. You dont need to worry about IDs. You can use navmesh cost just like in singleplayer, to deter agents from using certain navmesh faces.

{{% notice info %}}
Keep in mind: Much more important than in singleplayer, areas that are reachable for players but don't have navmesh on them, bear a huge exploit potential. Try to avoid having spots like that.
{{% /notice %}}

##### Siege
The castle gates will need proper navmesh to be set in the scripts. Just like in singleplayer (refer to the documentation linked above). If you don't create a proper navmesh for these, horses will be confused and get stuck in your gates. Additionally we ignore the navmesh castle gates for GI generation, this will prevent light leakage into the body of your gatehouse.

Also make sure that horses have access to flee lines inside and outside of the castle. Keep in mind that horses will always choose the closest “flee_line” to flee too, if that “flee_line” happens to be outside of the castle they will try to find a way out, leading them to get stuck if you haven't set up your ladders and gates correctly.

### Other
###### Atmosphere
Unlike in singleplayer, multiplayer scenes only ever use one atmosphere. Don't forget to save it when making edits.

###### Label
In the “SceneOptions” window, you can set a Label for your scene. This is helpful if you scan your scene for problems (2nd to last button in the top icon bar). If you set this label to “mp” it will filter out all singleplayer related problems.

###### Avoid animation point prefab
Using certain prefabs that are meant for singleplayer can cause your scene to crash. Watch out you are not placing any assets with animation points attached. This is important for chairs and the like, but also for any shop_prop prefabs that might have an animation attached.

Usually all these prefabs have a non animation point version of themselves. Otherwise you can always use those assets by simply deleting the animation point child and removing all tags and script from the prefab.

###### Avoid destructible objects outside of siege
Destructible objects are only properly synced with our siege gamemode. Placing breakable objects like barricades, or siege engines in other modes will probably crash your game or cause other problems.

The same goes for merlons on walls or destructible roofs.
