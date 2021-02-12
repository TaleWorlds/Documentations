+++
title = "Animations"
description = ""
weight = 1
+++

### Modding the Animation System

#### Exporting Animation for Bannerlord 

##### Default Animation Settings

* Frame rate: 30 FPS(Optimal) or 60 FPS
* Humanoid or Creature Skeleton(Rig) Settings
* Max supported bone count: 64
* Bones that are not used should contain “_notused” at the end of the string. Also root bone (highest bone in the hierarchy) should contain this only for the animations. 
![](/img/animation_system/image2.jpg)

##### FBX export settings (Autodesk Maya)
These settings are applied to Maya. Similar kind of softwares might contain the same settings. When we export the new rig for the first time, the exported FBX file should contain the skeleton and mesh.

##### First time setup (Skeleton + Mesh)
![](/img/animation_system/image4.jpg)
![](/img/animation_system/image3.jpg)

##### Exporting Animation Only Settings
We make sure to disable mesh and skin related options before we export the animations. ”Use scene name” is very important to check when exporting for both animations and rigs. Also make sure that the root bone contains “_notused” at the end of the string.
![](/img/animation_system/image6.jpg)

We make sure that we don’t send any kind of “Constraints and Skeleton Definitions”. Constraints, Connections and Unit settings should be set as the image below. Also our engine uses the “Z” as the up axis.
![](/img/animation_system/image5.jpg)

##### Defining New Animations
After exporting your animation, to reference it in the game, you need to add new animation clips from the resources browser which references that animation. To do so, you should use the "Animation Clip" button inside the " Create" parent build. Most important properties of these clips are:

* id: ID(unique name) of the anim clip to be used at other systems
* source1: Start keyframe of the animation clip 
* source2: End keyframe of the animation clip 
* anim_data_name: The source animation resource that was imported to the engine for this clip
* duration: Duration of this animation clip in seconds

A typical animation contains some optional attributes as well. Most common one is blend_in_period, which sets the duration for blending to the existing animation and reaching 100% weight. blend_out_period is the opposite of this blending, but it has an important difference. Blending out actually means that the animation ends earlier than the given duration, and the rest of the animation will only be used for blending out to another animation. But blend duration is only set by blend_in_period. Having a longer blend_out_period than the next animation’s blend_in_period doesn’t extend this blend duration. It just helps the blend to look smoother, since during that blend, if both animations play at the same time, it looks visually more appealing. An animation with 0 blend_out_period simply pauses during the blending to the next animation, and it causes a sudden stop/velocity change in bone rotations.

An animation has several more optional attributes:

* priority: Priority simply allows/disallows animations to be played as an interrupt while another animation is in progress. Higher priority animations are played over lower or equal priorities as interrupts.
* param1, param2, param3: Params are used for cases that the engine requires additional data. They may have quite different meanings.
* sound_code: Plays a sound when the animation is played. 
* step_points: These are step points for sound.
* voice_code: Plays a voice when the animation is played.
* facial_anim_id: Morphs the face to this when the animation is played.
* left_hand_pose, right_hand_pose: These morph the hands to their values when the animation is played.
* combat_parameter_id: This gives an additional set of information to the engine (see combat_parameters.xml)
* blends_with_action: This attribute references another action (warning: action, not animation) to blend the animation with. This is valid only when the engine requires two animations to be blended with (i.e. shield blocking up/down, weapon swings requiring balanced and unbalanced versions etc.).
* continue_to_action: This attribute calls another action (warning: action, not animation) to be played soon after this animation is finished. Animation is considered to be finished always when (duration - blend_out_period) is reached.

Animations usually contain two other nodes: flags and clip_usage_data. clip_usage_data is a common data pointer that may refer to blend_data, displacement_data, bipedal_movement_and_ik_data, and quadrupedal_movement_data. Their usage is mostly for specific cases and their details are out of this explanation’s scope. Flags are used for nearly all animations though and require some explanation. Possible flags that can be used for an animation are:

* disable_agent_agent_collisions: Disables collisions between agents.
* ignore_all_collisions: Disable all collisions.
* Ignore_static_body_collisions: Disables collisions with static bodies.
* use_last_step_point_as_data: 4th step point is considered as data instead of a sound point.
* make_bodyfall_sound: Creates a fall sound when the body touches the ground.
* client_prediction: Prevents animations from being sent through the network.
* keep: Doesn’t end the animation when it is finished, and keeps it as paused instead.
* restart: Forces the animation to start from beginning if the same animation is already being played by that skeleton.
* client_owner_prediction: Prevents animations from being sent through the network only for the agents that are controlled by that client.
* make_walk_sound: Plays hardcoded walk sounds.
* disable_hand_ik: Prevents hand inverse kinematics to be applied during the animation.
* blends_according_to_look_slope: Allows animation to be blended with another animation according to look slope, with this one being downward.
* synch_with_horse: Plays the animation without using its original duration, but instead matching the progress with the mount’s animation.
* use_left_hand_during_attack: Allows the combat system to check the left hand as the collider during an attack.
* lock_camera: Prevents players from controlling the camera during this animation.
* lock_movement: Prevents agents to move during this animation.
* synch_with_movement: Plays the animation without using its original duration, but instead matching the progress with the agent’s movement animations.
* enable_hand_spring_ik: Allows a spring like inverse kinematics to be applied on hands for applying lower body movement’s forces on them.
* enable_hand_blend_ik: Allows inverse kinematics to try to keep the hands a bit at the starting location when this animation starts by blending the original position and the animation position.
* synch_with_ladder_movement: Plays the animation without using its original duration, but instead matching the progress with the agent’s movement on ladder.
* do_not_keep_track_of_sound: Prevents engine to hold a reference to the sound when it is played.	 
* reset_camera_height: Reduces the additional camera height for this animation.
* disable_auto_increment_progress: Prevents animation to be played and keeps it paused at the current progress instead. Progress might have to be set manually from the code.
* enforce_lowerbody: Prevents previous channel and movement animations to be played during this animation.
* enforce_all: Valid for channel 0 only. Prevents channel 1 and movement animations to be played during this animation.
* cyclic: Animation loops and never ends.
* enforce_root_rotation: Abdomen (root) rotation is taken from this animation instead of the previous channel or movement animation for internal calculations.
* allow_head_movement: Allows agent’s head to move according to look direction.
* disable_foot_ik: Disables foot inverse kinematics for this animation.
* affected_by_movement: Allows movement adder animations to be added on top of this animation to give a better shaky feeling.
* update_bounding_volume: Disables bounding box optimization, should be used when the agent moves outside its regular boundaries with this animation.
* align_with_ground: Aligns agent frame with ground during this animation.
* ignore_slope: Prevents quadruped agents to align with ground during this animation.
* displace_position: Updates world position of the agent during the animation using the displacement data.
* enable_left_hand_ik: Forces the left hand to stay on this animation’s target frame even during blending with other animations using inverse kinematics.
* ignore_scale_on_root_position: Allows abdomen (root) position to keep at the same position with the original scale, allowing the agents to interact with objects better.
* randomization_weight: Randomizes the animation inside its alternative group with this value. Higher value allows the animation to be selected more frequently.

##### Modifying/Adding New Actions
Agent animations are mapped to action sets as actions. In order to set a new animation to an existing action, first you need to define a new animation clip through the resource browser. Animation clips define the animation start and end seconds, FPS and various properties. Then you need to map it under action_sets.xml for the specific action set. If a new action is needed to be created, first you need to add it as a new line under action_types.xml, and then do the same steps above.

Non-agent animations are not mapped as actions. For those, you just need to add the animation clips through the resource browser and then start using it in the code.

Each action has several attributes. These attributes are hardcoded so that the engine can understand certain properties of the action. The attributes are:

type (default: actt_other):

* actt_other,
* actt_defend_fist,
* actt_defend_shield,
* actt_defend_forward_2h,
* actt_defend_up_2h,
* actt_defend_right_2h,
* actt_defend_left_2h,
* actt_defend_forward_1h,
* actt_defend_up_1h,
* actt_defend_right_1h,
* actt_defend_left_1h,
* actt_defend_forward_staff,
* actt_defend_up_staff,
* actt_defend_right_staff,
* actt_defend_left_staff,
* actt_ready_ranged,
* actt_release_ranged,
* actt_release_throwing,
* actt_reload,
* actt_ready_melee,
* actt_release_melee,
* actt_parried_melee,
* actt_blocked_melee,
* actt_fall,
* actt_jump_start,
* actt_jump,
* actt_jump_end,
* actt_jump_end_hard,
* actt_kick,
* actt_weapon_bash,
* actt_passive_usage,
* actt_equip_unequip,
* actt_idle,
* actt_guard,
* actt_mount,
* actt_dismount,
* actt_dash,
* actt_mount_quick_stop,
* actt_hit_object,
* actt_sit,
* actt_sit_on_the_floor,
* actt_ladder_raise,
* actt_ladder_raise_end,
* actt_rear,
* actt_strike_light,
* actt_strike_medium,
* actt_strike_heavy,
* actt_strike_knock_back,
* actt_mount_strike

usage_direction (optional):

* ud_attack_up,
* ud_attack_down,
* ud_attack_left,
* ud_attack_right,
* ud_defend_up,
* ud_defend_down,
* ud_defend_left,
* ud_defend_right,
* ud_defend_any,
* ud_attack_any


action_stage (optional):

* as_attack_ready,
* as_attack_quick_ready,
* as_attack_release,
* as_reload_phase_1,
* as_reload_phase_2,
* as_defend,
* as_defend_parry


Using the modified actions is pretty straightforward, you just need to change the action to animation mapping under action_sets.xml and that would probably be enough. But if you want to create a new action, or create a new behavior for an existing action, possible ways of integrating it within the game would be:

* Calling the action from the code: Agent class has the necessary functions to do that. For performance reasons, make sure to cache the index of the action using ActionIndexCache class.
* Using it in movement_sets.xml: This file contains two sets: movement_sets and full_movement_sets. A movement_set contains all the animations required for a character to move in all directions in a single stance and state. A full_movement_set contains a group of movemen_sets in order to satisfy all stances and all states: walking, running, crouch walking and crouch running with left and right stances. Please keep in mind that crouch does not have a left stance, and some weapon usages enforce only right stance to be used in all cases (i.e. ranged weapons in Native). full_movement_sets contain their conditions as attributes: left_stance and movement_mode.
* Using it in item_usage_sets.xml: new combat actions should be given from here as long as it doesn’t require a combat system change. Idle, guard, weapon usage, kick usage actions can be set from here for every item with certain conditions. In addition to that the actions defined under movement_sets.xml are also referenced from here. There are lots of conditions and attributes to talk about for the usage_sets within this file, and it might require another whole page to explain all the details. But the existing examples could help you a lot in understanding how everything works. One important and not so straightforward detail is that, all of the usages defined here are traversed from top to bottom, and the first usage that satisfies the condition is used. So it is important to keep the usages that have more limits at the top of the list, and fallback usages at the bottom.
* Using it in monster_usages.xml: Just like item_usage_sets.xml, this file contains possible actions that agents can do without depending on an item type. Those can be strikes, jumps, falls and mountings. For quadruped agents there are a few more possibilities: upper_body_movements, movements and movement_adders. This file as well requires closer attention, but its structure is close to how item_usage_sets.xml work and the examples could be self explanatory. Again for all cases, usages are traversed from the top and first usage that satisfies the conditions is used. Since the conditions vary a lot for different conditions of actions, sometimes a condition can be used outside its meaning (i.e. meaning of is_heavy becomes a speed condition for quadruped falls and strikes). And some directions may not be applied for certain conditions (some actions check 4 directions, some check front_left and front_right instead of front, and some check only cross directions: front_left, front_right, back_left and back_right), so it is advised that you experiment a bit if you try to go beyond what Native code gives you. For the full possible body_parts, please check bone_body_types.xml, which mainly holds some attributes for body parts related to combat collision checks.

