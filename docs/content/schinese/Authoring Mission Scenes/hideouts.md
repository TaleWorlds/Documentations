+++
title = "What Makes a Hideout Scene"
description = ""
weight = 1
+++

#### Introduction
This list of checkpoints should aid you in creation of hideout scenes and provide you with an insight into what we pay attention to when creating them. Unlike many other of our scenes, hideouts are only used for fighting missions and usually have a very strict one way layout.

#### Navigation Mesh
* [Works similarly to how it does with village scenes.]({{< ref "villages.md/#navigation-mesh" >}})
* No need to have special ID’s on paths or around animal enclosures.
* Take special care to define the costs of navmeshes off the path correctly, to avoid having AI run sharply around rocks, or run through rough terrain like swamps, forests and such.

#### Spawn Points
##### General
* Don't use any animal spawns.

##### Player Party
* Troop Prefab: **sp_hideout_group_attacker**.
* Player Prefab: **sp_player**.
* You will need a battle entry point for the players party. Make sure you have enough space around it to spawn in the other attacking troops.

![](/img/hideout_scenes/hideout_scenes_1.png)

##### Bandit Areas
* Hideout scenes are in essence a set of multiple Bandit Areas.
* Having these positions in a linear layout is generally the best idea, to avoid backtracking of players or them totally overlooking a position in general.
* Players need to clear every position for the battle to be over.
* Each Hideout Scene should contain between 6 and 8 common_area positions.
	* Prefab: **common_area_x**.
	* The defending bandit party will be split amongst these positions.
	* Not every position is always defended (if the defender count is low).
	* Make sure to have a sensible spacing in between.
		* Having the positions close to each other might trigger defending agents of both positions to attack the player as they approach.
		* If they are too far apart, the mission loses its pace.
		* Keep in mind that the troops in most campaigns are probably going to have higher athletics than the player, hence run faster.
	* You can increase the spawning radius of units by scaling the common area prefab.
	* Make sure that there is some indication of where the defending units could be so that the player has a chance of finding them (especially at night).

![](/img/hideout_scenes/hideout_scenes_2.png)

* Have around 10 to 15 spawnpoints per common area.
	* Use **sp_npc_x** spawnpoints. Do not have them do chores like farming/smithing though.
	* Use civilian animation points as spawn points for bandits, some suggestions: “**sp_npc_wait_wall, lookout, sp_npc_argue_set, sp_npc_wait**”.
	* All spawn points in the radius will spawn bandits.

![](/img/hideout_scenes/hideout_scenes_3.png)

* You can also use patrol spawnpoints: “**sp_guard_patrol_simple, sp_guard_patrol**”.
	* These have a chance to spawn bandits.
	* Can be used outside of the common area.

##### Boss Fight

![](/img/hideout_scenes/hideout_scenes_4.png)

* Prefab: **hideout_boss_fight**.
* At the end of each Hideout mission there is a boss fight.
* The position of it should be inside the last Bandit Area (common_area). Make sure that it’s likely for the player to end up around there in the normal fighting mission, so that they are not teleported around the map into a totally different area.
* How the boss fight works:
	* Both parties spawn at their outer radius positions.
	* They then move towards each other right up to the inner radius positions.
	* You can adjust the distance between the outer and the inner radius with the "WalkDistance" property on the prefab.
* Inside the prefab you can toggle a preview of the positions.
* Make sure that the path is clear for both parties between those positions.
* Also make sure that the camera position isn't too close to other objects.
	* You can’t adjust the camera in the editor, you will need to test the scene for this.
	* Keep big prefabs out of the area shown by the preview and you will be fine.

#### Soft Border
* [Works in the same manner as it does with village scenes.]({{< ref "villages.md/#soft-border" >}})

#### Sounds
* [Works in the same manner as it does with village scenes.]({{< ref "villages.md/#sounds" >}})
* Make sure to not use any sounds with civilian life elements in them (like chatter, or town sounds).

#### Lights
* [Works in the same manner as it does with village scenes.]({{< ref "villages.md/#lights" >}})
* Take extra care that your scene works properly at night.
* Place enough torches along the paths and light up the bandit areas.

![](/img/hideout_scenes/hideout_scenes_5.png)

#### Atmosphere
* [Works in the same manner as it does with village scenes.]({{< ref "villages.md/#atmosphere" >}})

#### Gameplay Design Hints
You should keep in mind the following hints to ensure proper gameplay of your hideout scene.

* **Use a linear layout**. Giving the players many options for choosing paths and to experience your scene in itself is not a bad thing. Keep in mind though that the mission is designed to be linear. Bandits might or might not spawn in bandit areas or patrol paths. If your scene branches off too much the player might find themselves not knowing where the next bandit area might be or might be forced to backtrack the scene to find the remaining bandits.
* Only if all bandits are killed the mission is successful. **Your first priority should be to make sure the player finds them**. Spend extra detail & time on the navmesh on the paths and where the fights will be.
* **Make sure to keep the scene tight** so that the player doesn't accidently flank around bandit areas. Best practice is to border your scene with impassable props like cliffs, rather than with the artificial soft borders.
* **Make sure the scene works well at night**. It might be a little counterintuitive that bandits would blast hundreds of fires to light up their hideout but players will thank you for guiding them with those.
* **Take extra care to make the Bandit Boss fighting location great**. It's one of the few positions you can be sure that the player will always fight in. Also make sure that the Bandit Boss fight location is close to your last expected fighting position.
* **Focus your environmental storytelling around the paths and inside the bandit areas**. Since this mission has no civilian part, players will not have much time to explore the scene off the paths.

![](/img/hideout_scenes/hideout_scenes_6.png)