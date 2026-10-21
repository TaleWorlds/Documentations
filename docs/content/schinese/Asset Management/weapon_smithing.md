+++
title = "武器锻造与制作部件"
weight = 15
ai_translated = true
+++

#### 简介
锻造界面（Smithing screen）允许创建游戏中所有的近战和投掷武器（剑、匕首、飞刀、飞斧、钉锤、长柄武器、长枪、标枪）。
<img src="/img/weapon_smithing/weapon_smithing_1.png" style="height:500px;"/>
<p style="text-align:center">图1：在锻造界面上创建精钢骑兵阔剑。</p>

#### 将武器添加到锻造系统
要能够在锻造界面上创建武器，所有单独的武器部件都需要单独导出到游戏中。你可以在[资源管理（Asset Management）]({{< ref "Asset Management" >}})中了解如何将资源导出到编辑器。网格被添加到编辑器后，需要将网格名称以及该武器部件特有的尺寸信息填入相应的XML文档中。下面以剑和匕首的部件为例说明如何添加武器部件（其他武器部件也可以使用相同的流程添加到编辑器中）。

#### 剑和匕首
制作一把剑（与匕首类似）需要五个部件。它们分别是刀身（blade）、护手（guard）、握柄（grip）、剑柄头（pommel），以及可选的剑鞘（scabbard）。所有网格的轴心点（pivot point）都需要位于物体的数值中心，并且物体的位置需要位于世界原点（图2、图3）。这样我们就可以将所有部件导出到单个FBX文件中，或使用单独的FBX文件分别导出每个部件。例如，我们将所有的剑刀身导出到一个FBX文件中。其他部件也会一起导出到各自对应的FBX文件中（护手、握柄、剑柄头、剑鞘）。（图4）
<img src="/img/weapon_smithing/weapon_smithing_2.png" style="height:500px;"/>
<p style="text-align:center">图2：示例，battania_grip_1网格在导出前于Blender视口中的样子。</p>
<img src="/img/weapon_smithing/weapon_smithing_3.png" style="height:500px;"/>
<p style="text-align:center">图3：所有武器部件整齐地定位在世界原点处。</p>
<img src="/img/weapon_smithing/weapon_smithing_4.png" style="height:300px;"/>
<p style="text-align:center">图4：剑部件目录层级结构。</p>

#### CraftingPieces XmlNode 示例

```
<CraftingPieces>
  <CraftingPiece id="empire_blade_3"
                 name="{=kuROzU1J}Simple Warsword Blade"
                 tier="1"
                 piece_type="Blade"
                 mesh="empire_blade_3"
                 culture="Culture.empire"
                 length="91.3"
                 weight="0.93"
                 is_default="true">
    <BuildData previous_piece_offset="-0.4" />
    <BladeData stack_amount="3"
               physics_material="metal_weapon"
               body_name="bo_sword_one_handed"
               holster_mesh="empire_blade_3_scabbard_3">
      <Thrust damage_type="Pierce"
              damage_factor="2.4" />
      <Swing damage_type="Cut"
             damage_factor="2.8" />
    </BladeData>
    <Flags>
      <Flag name="Civilian"
            type="ItemFlags" />
    </Flags>
    <Materials>
      <Material id="Iron2"
                count="3" />
    </Materials>
  </CraftingPiece>
</CraftingPieces>
```

##### CraftingPieces/CraftingPiece 节点
创建制作部件（crafting piece）时，需要定义以下信息。

* **id**：部件的唯一字符串ID。每个部件都必须拥有唯一的ID，以区别于其他部件。
* **name**：该部件在游戏中向玩家显示的名称。
* **piece_type**：引用"CraftingPiece.PieceTypes"。PieceTypes是用于标记该部件所属类别的定义。每个制作部件都由不同的部件组成。
* **mesh**：需要一个唯一的网格ID来定义制作部件的视觉形状。
* **weight**：制作部件的重量，单位为千克。
* **length**：部件的测量长度，单位为厘米（轴心点始终位于中心）。
* **culture（可选）**：当前物品所属的文化。如果为物品设置了文化，该物品将只会在相同文化的市场上出售。
* **full_scale（可选）**：定义该部件在各维度上的缩放系数。设置为"true"时，部件会在所有三个维度上进行缩放。设置为"false"则只在单一维度（即构建轴）上缩放。
* **appearance（可选）**：一个价值（价格）计算系数。
* **center_of_mass（可选）**：部件的质心百分比，通常为0.5（即居中）。
* **tier（可选）**：默认值为"1"。Tier定义了制作部件的品质。Tier有助于设定武器的等级和制作难度。
* **is_default（可选）**：设置为"true"时，该部件在制作功能中默认处于解锁状态；如果设置为"false"，则该部件必须通过制作不同的武器来解锁。
* **is_hidden（可选）**：设置为"true"时，该部件不会出现在制作功能中，因此无法使用。当未设置该变量或将其设置为"false"时，该制作部件可用于制作功能。
* **item_holster_pos_shift（可选）**：为该参数赋值可设置挂载位置（holster）的位置偏移。
* **excluded_item_usage_features（可选）**：以":"分隔的值，表示该部件无法使用的物品使用特性（item usage features）。例如，当武器部件上定义了排除"thrust"（突刺）时，使用该部件的武器将无法进行突刺攻击。

##### CraftingPieces/CraftingPiece/BuildData 节点
* **piece_offset**：给定的值以厘米为单位，设置该部件相对于武器原点的距离调整。
* **next_piece_offset**：给定的值以厘米为单位，设置与下一个部件之间的距离。设置为正数时，与下一个部件的距离会更近。可以设置负值使部件进一步分离。
* **previous_piece_offset**：给定的值以厘米为单位，设置与上一个部件之间的距离。正值会使部件靠拢，负值则会使部件进一步分离。

##### CraftingPieces/CraftingPiece/Materials/Material 节点
Material用于设置制作该部件所需的材料数量。材料同时也用于熔炼公式（smelting formula）。熔炼的结果不能超过材料数量，也不能产生材料列表中未列出的材料。（Bannerlord中当前的公式会生成1个品质低于所定义最高品质材料的材料）可以为特定物品设置多种材料。例如，一个剑护手可能需要3个Iron2和1个Iron4。

* **id**：引用"CraftingMaterials"。CraftingMaterials是用于组合生成制作部件的材料定义。
* **count**：制作该部件所需的材料数量。

##### CraftingPieces/CraftingPiece/Flags/Flag 节点
Flags用于定义允许已制作物品拥有不同特性的各种属性。设置Flag时需要两个不同的变量；

**name**：引用"ItemFlags"或"WeaponFlags"。

* ItemFlags
	* ForceAttachOffHandPrimaryItemBone
	* ForceAttachOffHandSecondaryItemBone
	* AttachmentMask
	* NotUsableByFemale
	* NotUsableByMale
	* DropOnWeaponChange
	* DropOnAnyAction
	* CannotBePickedUp
	* CanBePickedUpFromCorpse
	* QuickFadeOut
	* WoodenAttack
	* WoodenParry
	* HeldInOffHand
	* HasToBeHeldUp
	* UseTeamColor
	* Civilian
	* DoNotScaleBodyAccordingToWeaponLength
	* DoesNotHideChest
	* NotStackable
* WeaponFlags
	* MeleeWeapon
	* RangedWeapon
	* WeaponMask
	* FirearmAmmo
	* NotUsableWithOneHand
	* NotUsableWithTwoHand
	* HandUsageMask
	* WideGrip
	* AttachAmmoToVisual
	* Consumable
	* HasHitPoints
	* DataValueMask
	* HasString
	* StringHeldByHand
	* UnloadWhenSheathed
	* AffectsArea
	* AffectsAreaBig
	* Burning
	* BonusAgainstShield
	* CanPenetrateShield
	* CantReloadOnHorseback
	* AutoReload
	* TwoHandIdleOnMount
	* NoBlood
	* PenaltyWithShield
	* CanDismount
	* MissileWithPhysics
	* MultiplePenetration
	* CanKnockDown
	* CanBlockRanged
	* LeavesTrail
	* CanCrushThrough
	* UseHandAsThrowBase
	* AmmoBreaksOnBounceBack
	* AmmoCanBreakOnBounceBack
	* AmmoBreakOnBounceBackMask
	* AmmoSticksWhenShot

**type**："ItemFlags"或"WeaponFlags"。如果省略，则默认为WeaponFlags。

#### CraftingTemplates XmlNode 示例

```
<CraftingTemplates>

  <CraftingTemplate id="OneHandedSword"
                    item_modifier_group="sword"
                    item_holsters="sword_left_hip_3:sword_left_hip:sword_left_hip_2:sword_back"
                    piece_type_to_scale_holster_with="Blade"
                    hidden_piece_types_on_holster="Blade"
                    default_item_holster_position_offset="0,0,-0.1">
    <PieceDatas>
      <PieceData piece_type="Handle"
                 build_order="0" />
      <PieceData piece_type="Guard"
                 build_order="1" />
      <PieceData piece_type="Blade"
                 build_order="2" />
      <PieceData piece_type="Pommel"
                 build_order="-1" />
    </PieceDatas>
    <WeaponDescriptions>
      <WeaponDescription id="OneHandedSword" />
    </WeaponDescriptions>
    <StatsData>
      <StatData stat_type="Weight"
                max_value="7.0" />
      <StatData stat_type="WeaponReach"
                max_value="300" />
      <StatData stat_type="ThrustSpeed"
                max_value="200" />
      <StatData stat_type="SwingSpeed"
                max_value="200" />
      <StatData stat_type="ThrustDamage"
                max_value="500" />
      <StatData stat_type="SwingDamage"
                max_value="500" />
      <StatData stat_type="Handling"
                max_value="200" />
      <!--<StatData stat_type="FollowUp" max_value="200" />-->
    </StatsData>
    <UsablePieces>
      <UsablePiece piece_id="empire_blade_1" />
      <UsablePiece piece_id="empire_noble_blade_1" />
      <UsablePiece piece_id="empire_noble_blade_2" />
      <UsablePiece piece_id="mp_vlandian_arming_sword_blade"
                   mp_piece="true" />
      <UsablePiece piece_id="mp_vlandian_arming_sword_guard"
                   mp_piece="true" />
    </UsablePieces>
  </CraftingTemplate>
</CraftingTemplates>
```

##### CraftingTemplates/CraftingTemplate 节点
生成制作模板（crafting template）时必须定义以下值。

* **id**：模板的唯一字符串ID。每个模板都必须拥有唯一的ID，以区别于其他模板。
* **item_modifier_group**：引用item_modifier_groups.xml中的一个物品修饰符组（item modifier group）。

例如，双手钉锤和单手钉锤在这里都属于钉锤（mace）类别。

	item_modifier_group="mace"

* **item_holsters**：定义该物品可以挂载（holster）的位置。对于由多个部件组成的物品，游戏中会使用通用的挂载点。部件类型之间应以":"分隔。可以在item_holsters.xml中找到可引用的分隔值。
* **piece_type_to_scale_holster_with**：定义用于缩放挂载网格（如果存在）的部件类型。例如，如果此参数设置为"Blade"，则刀身部件将用于缩放武器的挂载网格。其他部件将被忽略。
* **hidden_piece_types_on_holster**：以":"分隔的"CraftingPiece.PieceTypes"值，表示在挂载网格中应隐藏的部件类型。
* **default_item_holster_position_offset**：挂载点的默认位置偏移。格式为"x,y,z"。适用于所有使用该模板的武器。每个部件还可以通过制作部件下的item_holster_pos_shift变量进行进一步调整。
* **use_weapon_as_holster_mesh**：设置为"true"时，所有使用该模板的武器都会以自身作为挂载网格。武器本身会出现在挂载位置。
* **rotate_weapon_in_holster**：设置为"true"时，所有使用该模板的武器在挂载网格中会以相反方向放置。这对于需要刀身露出的标枪很有用。
* **always_show_holster_with_weapon**：设置为"true"时，当武器被拔出时，挂载网格内的武器模型不会被隐藏。此特性对于箭袋等在挂载处有多层堆叠的武器最为有用。

##### CraftingTemplates/CraftingTemplate/PieceDatas/PieceData 节点
定义可与该模板一起使用的部件类型及其组装顺序。

* **piece_type**：引用"CraftingPiece.PieceTypes"。
* **build_order**：部件的构建顺序。所有武器都是围绕握柄部件构建的。由于所有武器都必须拥有握柄，握柄的顺序应设置为0。位于握柄一侧的部件应使用递增的正值，位于握柄另一侧的部件应使用递减的负值。

##### CraftingTemplates/CraftingTemplate/WeaponDescriptions/WeaponDescription 节点
WeaponDescription即武器的主要用途或其中一种替代用途。它们在weapon_descriptions.xml中定义，并在模板中被引用。

* **id**：描述的唯一字符串ID。每个描述都必须拥有唯一的ID，以区别于其他描述。

##### CraftingTemplates/CraftingTemplate/StatsData 节点
用于定义将在库存界面或制作界面上显示的武器基础属性。

* **weapon_description（可选）**：如果指定，给定的数据将仅用于所定义的描述，而非整个模板。当至少有一个StatsData节点定义了此可选属性时，模板中引用的所有武器描述要么必须拥有各自的StatsData条目，要么必须在特定条目之前提供一个默认条目。

下面给出一个示例；

    <StatsData usage_data="Javelin">
		<StatData stat_type="Weight"
			max_value="7.0" />
		<StatData stat_type="WeaponReach"
			max_value="300" />
		<StatData stat_type="MissileDamage"
			max_value="500" />
		<StatData stat_type="MissileSpeed"
			max_value="200" />
		<StatData stat_type="Accuracy"
			max_value="100" />
		<StatData stat_type="StackAmount"
			max_value="5" />
	</StatsData>

##### CraftingTemplates/CraftingTemplate/StatsData/StatData 节点
* **stat_type**：引用"CraftingTemplate.CraftingStatTypes"。定义武器的不同特性。
* **max_value**：最大值定义了某项属性可达到的上限。

##### CraftingTemplates/CraftingTemplate/UsablePieces/UsablePiece 节点
* **piece_id**：引用"CraftingPiece.PieceTypes"。

示例：要将spear_blade_7启用为标枪（javelin）部件，必须将其列在"javelin" id下。同一部件也必须在weapon_descriptions.xml中列在相关部分下。

	<UsablePiece piece_id="spear_blade_7" />

#### WeaponDescriptions XmlNode 示例

```
<WeaponDescriptions>
  <WeaponDescription id="OneHandedSword"
                     weapon_class="OneHandedSword"
                     item_usage_features="onehanded:block:shield:swing:thrust">
    <WeaponFlags>
      <WeaponFlag value="MeleeWeapon"/>
    </WeaponFlags>
    <AvailablePieces>
      <AvailablePiece id="empire_blade_1"/>
      <AvailablePiece id="empire_noble_blade_1"/>
      <AvailablePiece id="empire_noble_blade_2"/>
	  ...
    </AvailablePieces>
  </WeaponDescription>
</WeaponDescriptions>
```

##### WeaponDescriptions/WeaponDescription 节点
**Weapon description（武器描述）**用于定义不同的用途和特性。在制作模板节点下列出的部件，也必须在weapon_descriptions.xml中列出才能使用。

* **id**：WeaponDescription的唯一字符串ID。
* **weapon_class**：引用"WeaponClass"。定义该武器描述将使用哪种武器类型。
* **item_usage_features**：以":"分隔的物品使用特性值，表示该描述可用的特性。这用于定义item_usage_set（来自item_usage_sets.xml）的可能特性（以"_"分隔的部件）。

下面列出一个示例；

	item_usage_features="onehanded:block:shield:swing:thrust">

* **rotated_in_hand**：设置为"true"时，所有使用该描述的武器在手中会旋转180度持握。此特性常用于可投掷的长柄武器。
* **use_center_of_mass_as_hand_base**：设置为"true"时，武器将以计算出的质心位置持握，而不是通常的握柄轴心。这同样也用于可投掷的长柄武器。

##### WeaponDescriptions/WeaponDescription/WeaponFlags/WeaponFlag 节点
该描述下所有武器使用的默认WeaponFlags。

* **value**：引用"WeaponFlags"。

##### WeaponDescriptions/WeaponDescription/AvailablePieces/AvailablePiece 节点
可用部件列表。

* **id**：对制作部件的引用。

#### 示例：通过XML和XSLT向现有武器模板添加制作部件
**示例情况**：我们已经创建了8个适用于单手剑的制作部件，其在.fbx文件中的网格名称如下：

* yourforumusername_blade_1
* yourforumusername_blade_2
* yourforumusername_guard_1
* yourforumusername_guard_2
* yourforumusername_grip_1
* yourforumusername_grip_2
* yourforumusername_pommel_1
* yourforumusername_pommel_2

我们还创建了4个适用于双手剑的制作部件：

* yourforumusername_blade_3
* yourforumusername_guard_3
* yourforumusername_grip_3
* yourforumusername_pommel_3

我们**尚未创建自己的新模组**，因此我们启动了《骑马与砍杀2:领主》模组制作工具包（Modding Kit），打开编辑器（Editor），点击File->Create New Module，为我们的模组命名为**"OurModule"**，然后点击"Create"。
<img src="/img/weapon_smithing/weapon_smithing_5.png" style="height:200px;"/>

然后我们借助编辑器将**所有网格和材质**添加到了我们的模组中。这不仅仅是将源文件添加到AssetSources\element文件夹那么简单。这些文件还需要通过资源浏览器（Resource browser）导出到游戏中，并发布模组。
<img src="/img/weapon_smithing/weapon_smithing_6.png" style="height:200px;"/>

现在，我们需要执行必要的步骤，使这些制作部件能够**在游戏中显示**。我们需要在模组中创建一个**新的XML**文件：

* Modules\OurModule\ModuleData\Custom_crafting_pieces.xml

我们还需要通过XSLT修改原生的Crafting_templates.xml和Weapon_descriptions.xml。因此我们需要在模组中创建以下这2个文件：

* Modules\OurModule\ModuleData\Crafting_templates.xsl
* Modules\OurModule\ModuleData\Weapon_descriptions.xsl

<img src="/img/weapon_smithing/weapon_smithing_7.png" style="height:200px;"/>

##### SubModule.xml
我们还需要将新的XML和XSL文件添加到我们的SubModule.xml中：

	<Xmls>
		<XmlNode>
			<XmlName id="CraftingPieces" path="custom_crafting_pieces"/>
			<IncludedGameTypes>
				<GameType value="Campaign"/>
				<GameType value="CampaignStoryMode"/>
			</IncludedGameTypes>
		</XmlNode>
		<XmlNode>                
			<XmlName id="CraftingTemplates" path="crafting_templates"/>
			<IncludedGameTypes>
				<GameType value="Campaign"/>
				<GameType value="CampaignStoryMode"/>
			</IncludedGameTypes>
		</XmlNode>
		<XmlNode>                
			<XmlName id="WeaponDescriptions" path="weapon_descriptions"/>
			<IncludedGameTypes>
				<GameType value="Campaign"/>
				<GameType value="CampaignStoryMode"/>
			</IncludedGameTypes>
		</XmlNode>         		
	</Xmls>

##### Custom_crafting_pieces.xml
在**Custom_crafting_pieces.xml**中，我们将添加12个制作部件。我们还将按照本文档前面说明的方式，定义这些部件所需的所有属性。

```
<?xml version="1.0" encoding="utf-8"?>
<CraftingPieces>
  <!-- #Blades -->
  <CraftingPiece id="yourforumusername_blade_1"
                 name="{=}Cool Blade 1"
                 tier="1"
                 piece_type="Blade"
                 mesh="yourforumusername_blade_1"
                 culture="Culture.battania"
                 length="80.8"
                 weight="0.81">
    <BladeData physics_material="metal_weapon"
               body_name="bo_sword_one_handed"
               holster_mesh="yourforumusername_blade_scabbard_1">
      <Thrust damage_type="Pierce"
              damage_factor="3.1" />
      <Swing damage_type="Cut"
             damage_factor="4.1" />
    </BladeData>
    <Flags>
      <Flag name="Civilian"
            type="ItemFlags" />
    </Flags>
    <Materials>
      <Material id="Iron6"
                count="2" />
    </Materials>
  </CraftingPiece>
  <CraftingPiece id="yourforumusername_blade_2"
                 name="{=}Cool Blade 2"
                 tier="1"
                 piece_type="Blade"
                 mesh="yourforumusername_blade_2"
                 culture="Culture.battania"
                 length="80.8"
                 weight="1.5">
    <BladeData physics_material="metal_weapon"
               body_name="bo_sword_one_handed"
               holster_mesh="yourforumusername_blade_scabbard_2">
      <Thrust damage_type="Pierce"
              damage_factor="2.2" />
      <Swing damage_type="Cut"
             damage_factor="3.1" />
    </BladeData>
    <Flags>
      <Flag name="Civilian"
            type="ItemFlags" />
    </Flags>
    <Materials>
      <Material id="Iron3"
                count="3" />
    </Materials>
  </CraftingPiece>
  <CraftingPiece id="yourforumusername_blade_3"
                 name="{=}Cool Blade 3"
                 tier="2"
                 piece_type="Blade"
                 mesh="yourforumusername_blade_3"
                 culture="Culture.battania"
                 length="80.8"
                 weight="1.5">
    <BladeData physics_material="metal_weapon"
               body_name="bo_sword_one_handed"
               holster_mesh="yourforumusername_blade_scabbard_3">
      <Thrust damage_type="Pierce"
              damage_factor="2.2" />
      <Swing damage_type="Cut"
             damage_factor="3.1" />
    </BladeData>
    <Flags>
      <Flag name="Civilian"
            type="ItemFlags" />
    </Flags>
    <Materials>
      <Material id="Iron3"
                count="3" />
    </Materials>
  </CraftingPiece>
  <!-- #Guards -->
  <CraftingPiece id="yourforumusername_guard_1"
                 name="{=}Cool Guard 1"
                 tier="1"
                 piece_type="Guard"
                 mesh="yourforumusername_guard_1"
                 culture="Culture.battania"
                 length="5.3"
                 weight="0.097">
    <BuildData next_piece_offset="1.8" />
    <StatContributions armor_bonus="3" />
    <Materials>
      <Material id="Iron5"
                count="1" />
    </Materials>
  </CraftingPiece>
  <CraftingPiece id="yourforumusername_guard_2"
                 name="{=}Cool Guard 2"
                 tier="1"
                 piece_type="Guard"
                 mesh="yourforumusername_guard_2"
                 culture="Culture.battania"
                 length="5.7"
                 weight="0.300">
    <BuildData next_piece_offset="1.8" />
    <StatContributions armor_bonus="3" />
    <Materials>
      <Material id="Iron1"
                count="1" />
    </Materials>
  </CraftingPiece>
  <CraftingPiece id="yourforumusername_guard_3"
                 name="{=}Cool Guard 3"
                 tier="1"
                 piece_type="Guard"
                 mesh="yourforumusername_guard_3"
                 culture="Culture.battania"
                 length="2.6"
                 weight="0.086">
    <BuildData next_piece_offset="0.3" />
    <StatContributions armor_bonus="1" />
    <Materials>
      <Material id="Iron1"
                count="1" />
    </Materials>
  </CraftingPiece>
  <!-- #Grips -->
  <CraftingPiece id="yourforumusername_grip_1"
                 name="{=}Cool Grip 1"
                 tier="1"
                 piece_type="Handle"
                 mesh="yourforumusername_grip_1"
                 culture="Culture.battania"
                 length="19.17"
                 weight="0.225"
                 item_holster_pos_shift="0,0,-0.03">
    <BuildData piece_offset="-1.88"
               previous_piece_offset="0.1"
               next_piece_offset="0.1" />
    <Materials>
      <Material id="Iron5"
                count="2" />
    </Materials>
  </CraftingPiece>
  <CraftingPiece id="yourforumusername_grip_2"
                 name="{=}Cool Grip 2"
                 tier="1"
                 piece_type="Handle"
                 mesh="yourforumusername_grip_2"
                 culture="Culture.aserai"
                 length="19.855"
                 weight="0.165">
    <BuildData piece_offset="-2.18"
               previous_piece_offset="0.2"
               next_piece_offset="0.2" />
    <Materials>
      <Material id="Iron2"
                count="3" />
    </Materials>
  </CraftingPiece>
  <CraftingPiece id="yourforumusername_grip_3"
                 name="{=}Cool Grip 3"
                 tier="2"
                 piece_type="Handle"
                 mesh="yourforumusername_grip_3"
                 culture="Culture.sturgia"
                 length="29.4"
                 weight="0.1">
    <BuildData piece_offset="-9.9"
               next_piece_offset="0.1"
               previous_piece_offset="0.3" />
    <Materials>
      <Material id="Iron2"
                count="2" />
    </Materials>
  </CraftingPiece>
  <!-- #Pommels -->
  <CraftingPiece id="yourforumusername_pommel_1"
                 name="{=}Cool Pommel 1"
                 tier="1"
                 piece_type="Pommel"
                 mesh="yourforumusername_pommel_1"
                 culture="Culture.battania"
                 length="2.5"
                 weight="0.14">
    <Materials>
      <Material id="Iron5"
                count="1" />
    </Materials>
  </CraftingPiece>
  <CraftingPiece id="yourforumusername_pommel_2"
                 name="{=}Cool Pommel 2"
                 tier="1"
                 piece_type="Pommel"
                 mesh="yourforumusername_pommel_2"
                 culture="Culture.battania"
                 length="4.027"
                 weight="0.12">
    <Materials>
      <Material id="Iron2"
                count="1" />
    </Materials>
  </CraftingPiece>
  <CraftingPiece id="yourforumusername_pommel_3"
                 name="{=}Cool Pommel 3"
                 tier="2"
                 piece_type="Pommel"
                 mesh="yourforumusername_pommel_3"
                 culture="Culture.sturgia"
                 length="3.76"
                 weight="0.15">
    <Materials>
      <Material id="Iron2"
                count="1" />
    </Materials>
  </CraftingPiece>
</CraftingPieces>
```

##### Crafting_templates.xsl
现在，我们需要将这些制作部件添加到**Crafting_templates.xsl**中：
```
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
    <xsl:output omit-xml-declaration="yes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="CraftingTemplate[@id='OneHandedSword']/UsablePieces/UsablePiece[1]">
        <UsablePiece piece_id="yourforumusername_blade_1"/>
        <UsablePiece piece_id="yourforumusername_blade_2"/>
        <UsablePiece piece_id="yourforumusername_guard_1"/>
        <UsablePiece piece_id="yourforumusername_guard_2"/>
        <UsablePiece piece_id="yourforumusername_grip_1"/>
        <UsablePiece piece_id="yourforumusername_grip_2"/>
        <UsablePiece piece_id="yourforumusername_pommel_1"/>
        <UsablePiece piece_id="yourforumusername_pommel_2"/>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

<xsl:template match="CraftingTemplate[@id='TwoHandedSword']/UsablePieces/UsablePiece[1]">
        <UsablePiece piece_id="yourforumusername_blade_3"/>
        <UsablePiece piece_id="yourforumusername_guard_3"/>
        <UsablePiece piece_id="yourforumusername_grip_3"/>
        <UsablePiece piece_id="yourforumusername_pommel_3"/>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>
```

上面的XSLT代码修改了两个原生制作模板"OneHandedSword"和"TwoHandedSword"。要修改现有模板，必须使用XSLT。如果我们要添加一个新模板，例如"Firearms"，则不需要使用XSLT。相反，我们只需简单地创建一个新的custom_crafting_templates.xml并在其中添加新模板即可。

##### Weapon_descriptions.xsl
我们还需要按照以下内容修改**Weapon_descriptions.xsl**：

```
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
    <xsl:output omit-xml-declaration="yes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="WeaponDescription[@id='OneHandedSword']/AvailablePieces/AvailablePiece[1]">
        <AvailablePiece id="yourforumusername_blade_1"/>
        <AvailablePiece id="yourforumusername_blade_2"/>
        <AvailablePiece id="yourforumusername_guard_1"/>
        <AvailablePiece id="yourforumusername_guard_2"/>
        <AvailablePiece id="yourforumusername_grip_1"/>
        <AvailablePiece id="yourforumusername_grip_2"/>
        <AvailablePiece id="yourforumusername_pommel_1"/>
        <AvailablePiece id="yourforumusername_pommel_2"/>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

<xsl:template match="WeaponDescription[@id='TwoHandedSword']/AvailablePieces/AvailablePiece[1]">
        <AvailablePiece id="yourforumusername_blade_3"/>
        <AvailablePiece id="yourforumusername_guard_3"/>
        <AvailablePiece id="yourforumusername_grip_3"/>
        <AvailablePiece id="yourforumusername_pommel_3"/>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>
```

就是这样。我们的制作部件现在将在游戏中的锻造界面上显示出来。

##### 示例模组下载
如果你想下载上文展示的示例模组，请[点击这里](https://download3.taleworlds.com/OurModule.zip)。
