+++
title = "What Makes an Arena Scene"
description = ""
weight = 1
+++

#### Intro

* We are going to answer the “How to create an arena scene?” and “What should we take into consideration when creating an arena scene?” questions in this documentation.

#### Scene Preparation

* The first topic that needs to be highlighted is that the terrain for the arena scene should not be too big. Fewer terrain nodes can be used in arena scenes. Far less than you need on other types of scenes.

#### Terrain and scene models
* In an arena scene, the terrain should be flat or near flat with a few uneven parts (it is up to the scene author’s taste).
* Models should be placed before with modular parts (stands and lounges).
	* Example: A Sturgian arena scene has `sturgia_arena_grandstand_a`, `sturgia_arena_grandstand_b`, `sturgia_arena_grandstand_c`, `sturgia_arena_grandstand_d` modular mesh parts.
* Fake houses should be used because we don’t want the background of the stands and the inner city view to be empty. We can do this by referencing the `Adam0` model’s head height view in the fighting areas and lounges.
* Each faction has unique models. These models should be used accordingly and should be placed on the appropriate parts of the scene.

#### Required spawn points
* In the active fighting area:
	* `tournament_practice_set`
	* `tournament_fight_set`
* In the lounge area:
	* `sp_tournament_master`
	* `sp_player_near_arena_master`
	* `_barrier_passage_center` (needs to be placed at the door or the lounge entry points)
	* `sp_player`

#### Step-by-step arena creation with screenshots
* Terrain features: One node (Color Map Resolution: 512x512), LOD Multiplier (1)
* The fighting area is now specified. We have also done the terrain painting (we suggest you use `adam0` mesh to help with proportions).

|  |  |
| ------ | ----------- |
| <img src="/img/arena_scenes/1.jpg"/> | <img src="/img/arena_scenes/2.jpg"/> |


* After designating the arena place, the lounges and the stands should be placed (if you have your own custom models you can use them at this stage, otherwise use existing models in the prefab tab, like `arena_main_building`).
* In addition to the environmental elements, you can place various meshes for visual beautification (stones, broken barrels, logs, etc.).

<img src="/img/arena_scenes/3.jpg" width="1200px" />

* Torches and light sources should also be placed on the scene.

<img src="/img/arena_scenes/4.jpg" width="1200px" />

* Search for `arena_audience_mid_point` in the prefab tab. Place it in the middle of the scene periodically.

<img src="/img/arena_scenes/5.jpg" width="1200px" />

* Search for `crowd_man` in the prefab tab. Place the three variants as you like on the stands.

<img src="/img/arena_scenes/6.jpg" width="1200px" />

* This stage is one of the most important ones. The spawn points that should be placed in the arena's main building which we call lounges are the following:
	* `sp_tournament_master`
	* `sp_player_near_arena_master`
	* `_barrier_passage_center`
	* `sp_player`
* `sp_tournament_master` should be placed facing back to the fighting area. In front of this spawn point, you need to place `sp_player_near_arena_master` because they need to face each other. Besides this, `camera_height_limiter` needs to be placed as the lens should see the lounge area.
* Barries need to be placed in the lounge.

| Spawn point placements | Spawn point placements and placed barriers |
| ------ | ----------- |
| <img src="/img/arena_scenes/7.jpg"/> | <img src="/img/arena_scenes/8.jpg"/> |

| Another angle of the placed spawn points | The level of the Camera Height Limiter, place, and lens’ target |
| ------ | ----------- |
| <img src="/img/arena_scenes/9.jpg"/> | <img src="/img/arena_scenes/10.jpg"/> |

* `envmap_prop` should be placed in the arena centre. The height of this is important. It is suggested to use the `Adam0` model for proportioning.

<img src="/img/arena_scenes/11.jpg" width="1200px" />

* If there are any areas that we don’t want the player or the AI to go to, we should place barriers.

<img src="/img/arena_scenes/12.jpg" width="1200px" />

* A path should be drawn along the stands. This path is used for the stand audio. Don’t forget to name the path.
	* Search for `arena_path_sound` in the prefab tab. Place the prefab on the scene wherever you want. Enlarge the `Scripts` drop-down menu on the `Entity Inspector` tab. You should see the `path_converger` script. Enter the path name you entered before into the `Path Name` field in the `path_converger` script.

|  |  |
| ------ | ----------- |
| <img src="/img/arena_scenes/13.jpg"/> | <img src="/img/arena_scenes/14.jpg"/> |

* A general camera needs to be placed on the scene. You can search for `camera_instance` in the prefabs tab. WARNING! There are two Camera Instances in the prefabs tab. The one we are going to use is the one named with lowercase letters. You can add your camera to the scene as shown in the screenshot.

<img src="/img/arena_scenes/15.jpg" width="1200px" />

* For the arena fighting area, you need to place two spawn points. These are:
	* `tournament_practice_set` (used for “Practice fight” campaign option)
	* `tournament_fight_set` (used for “Join the tournament” campaign option)
* After placing these two sets you need to place child spawn points. You can check the screenshot for details.

|  |  |
| ------ | ----------- |
| <img src="/img/arena_scenes/16.jpg"/> | <img src="/img/arena_scenes/17.jpg"/> |

* You need to place `border_soft` around the fighting area (not necessary around the stands).

<img src="/img/arena_scenes/18.jpg" width="1200px" />

* The last stage consists of creating the navmesh for the lounge and the fighting area.

|  |  |
| ------ | ----------- |
| <img src="/img/arena_scenes/19.jpg"/> | <img src="/img/arena_scenes/20.jpg"/> |