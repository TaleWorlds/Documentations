+++
title = "动画"
description = ""
weight = 1
+++

### 修改动画系统 

#### 为 Bannerlord 导出动画

##### 默认动画设置

* 帧速率： 30 FPS（最佳）或 60 FPS
* 人形 (Humanoid) 角色或生物骨骼(Rig)设置
* 支持的骨骼数上限： 64
* 未使用的骨骼应在名称字符串末尾包含"_notused"。此外，根骨骼（最高等级的骨骼）应该只包含动画。
![](/img/animation_system/image2.jpg)

##### FBX 导出设置 (Autodesk Maya)
这些设置适用于Maya。类似的软件可能包含相同的设置。当我们首次导出新rig时，导出的FBX文件应包含骨骼和网格。

##### 首次设置（骨架+网格）
![](/img/animation_system/image4.jpg)
![](/img/animation_system/image3.jpg)

##### 仅导出动画设置
在导出动画之前，我们确保禁用网格和皮肤相关选项。"Use scene name"对于动画和rig导出时的检查非常重要。还要确保根骨骼在字符串末端包含"_notused"。
![](/img/animation_system/image6.jpg)

我们确保我们不发送任何类型的"Constraints"和"Skeleton Definitions"。约束(Constraints)、连接(Connections)和单位(Unit)应设置为下图。我们的引擎使用"Z"作为上轴。
![](/img/animation_system/image5.jpg)

##### 定义新动画
导出你的动画后，要在游戏中引用它，你需要从资源浏览器中添加新的动画剪辑，它引用该动画。要做到这一点，你应该使用 "Create" 父构建内的 "Animation Clip" 按钮。这些片段最重要的属性是

* id: 用于其他系统的动画剪辑的ID（唯一名称）
* source1: 动画剪辑的启动关键帧
* source2: 动画剪辑的末端关键帧
* anim_data_name: 这个片段的源动画资源被导入到引擎中
* duration: 此动画剪辑的持续时间，以秒为单位

一个典型的动画也包含一些可选的属性。最常见的是blend_in_period，它设置了与现有动画混合并达到100%权重的持续时间，blend_out_period与这个混合相反，但它有一个重要的区别。Blending out实际上是指动画结束的时间早于给定的持续时间，剩下的动画将只用于向另一个动画进行混合。但混合持续时间只由 blend_in_period 设置。拥有比下一个动画的blend_in_period更长的blend_out_period并不会延长这个混合持续时间。它只是帮助混合看起来更顺畅，因为在该混合期间，如果两个动画同时播放，在视觉上看起来更有吸引力。blend_out_period为0的动画只是在混合到下一个动画的过程中暂停，它会导致骨骼旋转的突然停止/速度变化。

一个动画还有几个可选的属性:

* priority: 优先级只表示允许/不允许在另一个动画进行时作为中断播放动画。优先级较高的动画将作为中断在优先级较低或同等的动画上播放。
* param1, param2, param3: 参数用于引擎需要额外数据的情况下。它们的含义可能大相径庭。
* sound_code: 动画播放时的声音代码。
* step_points: 声音的步进点。
* voice_code: 播放动画时播放语音。
* facial_anim_id: 在播放动画时，将脸部变形为指定表情。
* left_hand_pose, right_hand_pose: 当播放动画时，这些手会变形为指定姿势。
* combat_parameter_id: 这给引擎提供了一组额外的信息(详见combat_parameters.xml)
* blends_with_action: 该属性引用另一个动作（警告：动作，不是动画）来混合动画。只有当引擎要求混合两个动画时，此属性才有效（如盾牌上/下阻挡，武器挥舞需要平衡和非平衡版本等）。
* continue_to_action: 这个属性在这个动画结束后会调用另一个动作（警告：动作，不是动画）来播放。当达到持续时间(blend_out_period)时，动画被确认为已经结束。

动画通常包含另外两个节点：flags和clip_usage_data。clip_usage_data是一个常见的数据指针，可以参考blend_data、displacement_data、bipedal_movement_and_ik_data和quadrupedal_movement_data。它们主要是针对特定情况，其细节不在本解释的范围内。不过几乎所有的动画都会用到flag，需要做一些解释。可能用于动画的标志有。

* disable_agent_agent_collisions: 禁用agent之间的碰撞。
* ignore_all_collisions: 禁用所有碰撞。
* Ignore_static_body_collisions: 禁用与静态物体的碰撞。
* use_last_step_point_as_data: 第四步点被认为是数据而不是声音点。
* make_bodyfall_sound: 当身体接触地面时，发出坠落的声音。
* client_prediction: 防止动画通过网络发送。
* keep: 动画完成后不会结束动画，而是将其保持为暂停状态。
* restart: 如果同一动画已经被该骨架播放，则强制从头开始播放。
* client_owner_prediction: 防止动画只通过网络向该客户端控制的agent发送。
* make_walk_sound: 播放硬编码的步行声。
* disable_hand_ik: 防止在动画中应用手部反运动学
* blends_according_to_look_slope: 允许根据外观坡度将动画与另一个动画混合，这个动画是向下的。
* synch_with_horse: 允许在播放动画时不使用其原始的持续时间。播放动画时不使用原来的持续时间，而是与坐骑的动画进度匹配。
* use_left_hand_during_attack: 允许战斗系统在攻击时将左手作为准星进行检查。
* lock_camera: 防止玩家在此动画中控制摄影机。
* lock_movement:  防止agent在此动画中移动。
* synch_with_movement: 播放动画时，不使用原来的持续时间，而是与agent的移动动画进度相匹配。
* enable_hand_spring_ik: 允许将类似弹簧的反向运动学应用于手部，以便将下半身运动的力施加在手部。
* enable_hand_blend_ik: 允许反运动学通过混合原始位置和动画位置，在这个动画开始时，尽量让手的起始位置保持同一点。
* synch_with_ladder_movement: 播放动画时不使用其原始的持续时间，而是与agent在梯子上的移动进度相匹配。
* do_not_keep_track_of_sound: 防止引擎在播放声音时保持对声音的引用。
* reset_camera_height: 降低该动画的额外相机高度。
* disable_auto_increment_progress: 防止动画播放，并将其暂停在当前进度上。进度可能需要从代码中手动设置。
* enforce_lowerbody: 防止之前的频道和移动动画在此动画期间播放。
* enforce_all: 仅适用于通道0。阻止在此动画期间播放通道 1 和移动动画。
* cyclic: 动画循环，永远不会结束。
* enforce_root_rotation: 腹部(root)的旋转是从这个动画中提取的，而不是以前的通道或运动动画进行内部计算。
* allow_head_movement: 允许agent的头部根据看的方向移动。
* disable_foot_ik: 禁用此动画的脚部反向运动学。
* affected_by_movement: 允许在此动画上添加运动加成动画，以获得更好的摇晃感。
* update_bounding_volume: 禁用边界盒优化，当agent在其常规边界外移动时应该使用此动画。
* align_with_ground:在这个动画中，将agent的框架与地面对齐。
* ignore_slope: 防止四足agent在动画中与地面对齐。
* displace_position: 在动画中使用位移数据更新agent的世界位置。
* enable_left_hand_ik: 强制左手停留在此动画的目标帧上，即使在与其他动画混合时使用反向运动学。
* ignore_scale_on_root_position:忽略根部位置的缩放。允许腹部（root）的位置与原始比例保持在同一位置上，让agent与物体更好地互动。
* randomization_weight: 用这个值将动画随机化在其备选组内。较高的数值可以让动画被更频繁的选择。

##### 修改/添加新操作 
agent动画作为动作被映射到动作集。为了给现有的动作设置一个新的动画，首先需要通过资源浏览器定义一个新的动画片段。动画剪辑定义了动画的开始和结束秒数、FPS和各种属性。然后你需要将其映射到特定动作集的action_sets.xml下。如果需要创建一个新的动作，首先需要在action_types.xml下将其添加为新的行，然后再进行上面同样的步骤。

非agent动画不被映射为动作。对于这些，你只需要通过资源浏览器添加动画片段，然后在代码中开始使用它。

每个动作都有几个属性。这些属性是硬编码的，以便引擎能够理解动作的某些属性。这些属性是

类型（默认：actt_other）：

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

usage_direction (可选):

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


action_stage (可选):

* as_attack_ready,
* as_attack_quick_ready,
* as_attack_release,
* as_reload_phase_1,
* as_reload_phase_2,
* as_defend,
* as_defend_parry


使用修改后的动作非常直接，你只需要在action_sets.xml下修改动作到动画的映射就可以了。但是如果你想创建一个新的动作，或者为现有的动作创建一个新的行为，可能的整合它到游戏中的方法有：

*  从代码中调用动作。Agent类有必要的函数。为了保证性能，请确保使用ActionIndexCache类来缓存动作的索引。
* Using it in movement_sets.xml: 这个文件包含两个集合： movement_sets 和 full_movement_sets。一个 movement_set 包含了一个角色在单一姿态和状态下向所有方向移动所需的所有动画。一个 full_movement_set 包含一组动作集，以满足所有姿态和所有状态：行走、奔跑、蹲下行走和蹲下奔跑的左右姿态。请注意，蹲下没有左姿态，因此有些武器的使用在任何情况下都只能使用右姿态（例如Native中的范围武器）。
* Using it in item_usage_sets.xml: 只要不需要改变战斗系统，新的战斗动作应该从这里给出。自然状态、防守姿态、武器使用、踢击使用动作可以从这里为每个物品设置一定条件。除此之外，movement_sets.xml下定义的动作也是从这里引用的。usage_sets的条件和属性太多，这里无法解释，但现有的例子应该能帮助你理解一切的工作原理。一个重要而又不那么简单的细节是，这里定义的所有用法都是从上到下遍历的，第一个满足条件的用法被使用。所以，重要的是要把限制较多的用法放在列表的顶部，而把后备用法放在底部。
* Using it in monster_usage_sets.xml: 就像 item_usage_sets.xml一样，这个文件包含了一些可能的动作，agent可以根据物品类型不做任何动作。这些动作可以是打击、跳跃、摔倒和骑乘。对于四足动物agent来说，还有一些可能的动作：上半身动作、动作和动作添加器。这个文件需要更仔细的解释，但它的结构类似于 item_usage_sets.xml，其中的例子应该是不言自明的。同样，对于所有的情况，用法都是从头开始遍历，首先使用满足条件的用法。由于不同的动作条件，条件变化很大，有时一个条件的使用可能会超出它的含义（例如is_heavy的含义变成了四足跌倒和击打的速度条件）。而且有些方向可能不适用某些条件（有些动作会检查4个方向，有些会检查front_left和front_right而不是front，有些只检查交叉方向：front_left，front_right，back_left和back_right），所以如果你想超出Native代码给你的范围，建议你做一下实验。关于全部可能的body_parts，请查看bone_body_types.xml，里面主要保存了一些与战斗碰撞检查相关的身体部位的属性。

