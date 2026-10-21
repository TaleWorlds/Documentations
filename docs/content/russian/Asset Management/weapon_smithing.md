+++
title = "Кузнечное дело и элементы крафта оружия"
weight = 15
ai_translated = true
+++

#### Введение
Экран кузницы позволяет создавать всё холодное и метательное оружие в игре (мечи, кинжалы, метательные ножи, метательные топоры, булавы, древковое оружие, пики, дротики).
<img src="/img/weapon_smithing/weapon_smithing_1.png" style="height:500px;"/>
<p style="text-align:center">Рисунок 1: Создание кавалерийского палаша из прекрасной стали на экране кузницы.</p>

#### Добавление оружия в систему кузницы
Чтобы иметь возможность создавать оружие на экране кузницы, все отдельные детали оружия должны быть экспортированы в игру по отдельности. Узнать, как экспортировать ассеты в редактор, можно в разделе [Asset Management]({{< ref "Asset Management" >}}). После того как меши добавлены в редактор, имя меша и характерные для добавленной детали оружия измерения нужно внести в соответствующий XML-документ. Добавление деталей оружия ниже объясняется на примере деталей меча и кинжала (остальные детали оружия добавляются в редактор по тому же принципу).

#### Мечи и кинжалы
Для создания меча (как и кинжала) требуется пять деталей. Это клинок, гарда, рукоять, навершие и, опционально, ножны. Точки опоры (pivot points) всех мешей должны находиться в геометрическом центре объекта, а положение объекта должно быть в начале координат мира (Рисунок 2, Рисунок 3). Благодаря этому мы можем экспортировать все детали в одном FBX-файле либо экспортировать каждую деталь отдельно, используя отдельные FBX-файлы. Например, мы экспортируем все клинки мечей в один FBX-файл. Остальные детали также экспортируются вместе в соответствующие им FBX-файлы (гарды, рукояти, навершия, ножны). (Рисунок 4)
<img src="/img/weapon_smithing/weapon_smithing_2.png" style="height:500px;"/>
<p style="text-align:center">Рисунок 2: Пример, меш battania_grip_1 в окне просмотра Blender перед экспортом.</p>
<img src="/img/weapon_smithing/weapon_smithing_3.png" style="height:500px;"/>
<p style="text-align:center">Рисунок 3: Все детали оружия аккуратно размещены в начале координат мира.</p>
<img src="/img/weapon_smithing/weapon_smithing_4.png" style="height:300px;"/>
<p style="text-align:center">Рисунок 4: Иерархия директорий деталей меча.</p>

#### Пример XML-узла CraftingPieces

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

##### Узел CraftingPieces/CraftingPiece
При создании детали крафта должна быть определена следующая информация.

* **id**: Уникальный строковый идентификатор детали. Каждая деталь должна иметь уникальный id, отличающий её от других деталей.
* **name**: Название детали, которое будет показано игрокам в игре.
* **piece_type**: Ссылка на «CraftingPiece.PieceTypes». PieceTypes — это определения, используемые для обозначения того, к какой части относится деталь. Каждая деталь крафта состоит из разных частей.
* **mesh**: Для определения визуальной формы детали крафта требуется уникальный идентификатор меша.
* **weight**: Вес детали крафта в килограммах.
* **length**: Измеренная длина детали в сантиметрах (точка опоры всегда центрирована).
* **culture (опционально)**: Определённая культура текущего предмета. Если предмет установлен для определённой культуры, он будет продаваться только на рынках той же культуры.
* **full_scale (опционально)**: Определяет коэффициенты масштабирования детали по измерениям. При значении "true" деталь должна масштабироваться по всем трём измерениям. Установка "false" масштабирует только в одном измерении — по оси построения.
* **appearance (опционально)**: Коэффициент расчёта стоимости (цены).
* **center_of_mass (опционально)**: Процент центра масс детали, обычно 0.5 (посередине).
* **tier (опционально)**: По умолчанию «1». Tier определяет качество детали крафта. Tier помогает устанавливать уровень оружия и сложность крафта.
* **is_default (опционально)**: При значении "true" деталь по умолчанию доступна для крафта без разблокировки. Если установлено "false", деталь должна быть разблокирована путём создания разного оружия.
* **is_hidden (опционально)**: При значении "true" деталь не будет отображаться в функции крафта. Соответственно, она не будет доступна для использования. Когда эта переменная не установлена или установлена как "false", деталь крафта доступна для функции крафта.
* **item_holster_pos_shift (опционально)**: Значение этого параметра задаёт смещение положения для ножен/кобуры.
* **excluded_item_usage_features (опционально)**: Значения, разделённые символом ":", обозначающие функции использования предмета, которые деталь не может использовать. Например, если для детали оружия в качестве исключения задано "thrust" (колющая атака), оружие с этой деталью не сможет совершать колющие атаки.

##### Узел CraftingPieces/CraftingPiece/BuildData
* **piece_offset**: Заданное значение устанавливает корректировку расстояния детали от начала координат оружия в сантиметрах.
* **next_piece_offset**: Заданное значение устанавливает расстояние до следующей детали в сантиметрах. При положительном значении расстояние до следующей детали уменьшается. Отрицательные значения можно задать, чтобы отдалить детали друг от друга.
* **previous_piece_offset**: Заданное значение устанавливает расстояние до предыдущей детали в сантиметрах. Положительные значения сближают детали, а отрицательные — отдаляют.

##### Узел CraftingPieces/CraftingPiece/Materials/Material
Material задаёт необходимое количество материалов, требуемых для создания детали. Материалы также используются в формуле переплавки. Результаты переплавки не могут превышать количество материала и не могут содержать материалы, не указанные в списке материалов. (Текущая формула в Bannerlord генерирует 1 материал более низкого качества из материала наивысшего качества, указанного в списке.) Для конкретных предметов можно задать несколько материалов. Для гарды меча может требоваться 3 единицы Iron2 и 1 единица Iron4.

* **id**: Ссылка на «CraftingMaterials». CraftingMaterials — это определения, используемые для частей, которые при объединении создают деталь крафта.
* **count**: Количество материала, необходимое для создания детали.

##### Узел CraftingPieces/CraftingPiece/Flags/Flag
Флаги используются для определения различных свойств, позволяющих созданным предметам иметь разные особенности. Есть две разные переменные, которые необходимо задать при установке флага;

**name**: Ссылка на «ItemFlags» или «WeaponFlags».

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

**type**: «ItemFlags» или «WeaponFlags». Если не указано, по умолчанию используется WeaponFlags.

#### Пример XML-узла CraftingTemplates

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

##### Узел CraftingTemplates/CraftingTemplate
При создании шаблона крафта должны быть определены следующие значения.

* **id**: Уникальный строковый идентификатор шаблона. Каждый шаблон должен иметь уникальный id, отличающий его от других шаблонов.
* **item_modifier_group**: Ссылка на группу модификаторов предмета из item_modifier_groups.xml.

Например, и двуручные булавы, и булавы попадают здесь под категорию "mace".

	item_modifier_group="mace"

* **item_holsters**: Определяет, где предмет может быть помещён в ножны/кобуру. Для предметов из нескольких деталей в игре будут использоваться общие ножны. Типы деталей должны разделяться символом «:». Разделённые ссылки можно найти в item_holsters.xml.
* **piece_type_to_scale_holster_with**: Определяет тип детали, по которой масштабируется меш ножен/кобуры (если он существует). Например, если для этого параметра установлено значение «Blade», клинок будет масштабировать ножны оружия. Остальные детали не будут учитываться.
* **hidden_piece_types_on_holster**: Значения «CraftingPiece.PieceTypes», разделённые символом ":", которые нужно скрыть в меше ножен.
* **default_item_holster_position_offset**: Смещение положения ножен по умолчанию. Задаётся в формате "x,y,z". Применяется ко всему оружию, использующему данный шаблон. Дополнительная настройка для каждой детали может быть применена через переменную item_holster_pos_shift у детали крафта.
* **use_weapon_as_holster_mesh**: При значении «true» у всего оружия, использующего шаблон, в качестве меша ножен будет выступать само оружие. Само оружие будет отображаться на месте ножен.
* **rotate_weapon_in_holster**: При значении «true» всё оружие, использующее шаблон, будет помещено в противоположном направлении в меш ножен. Полезно для дротиков, чтобы их наконечники торчали наружу.
* **always_show_holster_with_weapon**: При значении «true» меш оружия внутри меша ножен не будет скрываться, когда оружие вынуто. Эта функция наиболее полезна для оружия с несколькими стопками внутри ножен, например, колчанов.

##### Узел CraftingTemplates/CraftingTemplate/PieceDatas/PieceData
Определяет, какие типы деталей могут использоваться с шаблоном и в каком порядке они будут собираться.

* **piece_type**: Ссылка на «CraftingPiece.PieceTypes».
* **build_order**: Порядок, в котором строится деталь. Всё оружие строится вокруг деталей рукояти. Поскольку всё оружие должно иметь рукоять, порядок рукояти должен быть установлен на 0. Любая деталь, расположенная по одну сторону рукояти, должна иметь возрастающие положительные значения, а любая деталь, расположенная по другую сторону рукояти, — возрастающие отрицательные значения.

##### Узел CraftingTemplates/CraftingTemplate/WeaponDescriptions/WeaponDescription
WeaponDescription — это просто основное применение или один из альтернативных вариантов использования оружия. Они определяются в weapon_descriptions.xml и указываются в шаблоне.

* **id**: Уникальный строковый идентификатор описания. Каждое описание должно иметь уникальный id, отличающий его от других описаний.

##### Узел CraftingTemplates/CraftingTemplate/StatsData
Используется для определения того, какие базовые характеристики оружия будут показаны в инвентаре или на экране кузницы.

* **weapon_description (опционально)**: Если указано, данные будут использоваться только для определённого описания, а не для шаблона в целом. Если хотя бы один узел StatsData имеет этот опциональный атрибут, то либо все описания оружия, указанные в шаблоне, должны иметь собственные записи StatsData, либо перед конкретным узлом должен быть указан узел по умолчанию.

Пример приведён ниже;

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

##### Узел CraftingTemplates/CraftingTemplate/StatsData/StatData
* **stat_type**: Ссылка на «CraftingTemplate.CraftingStatTypes». Определяет различные характеристики оружия.
* **max_value**: Максимальное значение определяет верхний предел, который может иметь характеристика.

##### Узел CraftingTemplates/CraftingTemplate/UsablePieces/UsablePiece
* **piece_id**: Ссылка на «CraftingPiece.PieceTypes».

Пример: Чтобы включить spear_blade_7 в качестве детали дротика, его нужно указать под id «javelin». Та же деталь также должна быть указана в weapon_descriptions.xml в соответствующей части.

	<UsablePiece piece_id="spear_blade_7" />

#### Пример XML-узла WeaponDescriptions

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

##### Узел WeaponDescriptions/WeaponDescription
**Weapon description** используется для определения различных вариантов использования и особенностей. Детали, перечисленные в узлах шаблонов крафта, также должны быть указаны в weapon_descriptions.xml, чтобы их можно было использовать.

* **id**: Уникальный строковый идентификатор WeaponDescription.
* **weapon_class**: Ссылка на «WeaponClass». Определяет, какой тип оружия будет использоваться данным описанием оружия.
* **item_usage_features**: Значения функций использования предмета, разделённые символом «:», доступные для данного описания. Используется для определения возможных особенностей (частей, разделённых «_») набора item_usage_set (из item_usage_sets.xml).

Пример приведён ниже;

	item_usage_features="onehanded:block:shield:swing:thrust">

* **rotated_in_hand**: При значении «true» всё оружие, использующее это описание, будет держаться в руке с поворотом на 180 градусов. Обычно это применяется к метательному древковому оружию.
* **use_center_of_mass_as_hand_base**: При значении «true» вместо обычной точки опоры рукояти оружие будет удерживаться за рассчитанное положение центра масс. Это также используется для метательного древкового оружия.

##### Узел WeaponDescriptions/WeaponDescription/WeaponFlags/WeaponFlag
Флаги WeaponFlags по умолчанию, применяемые ко всему оружию данного описания.

* **value**: Ссылка на «WeaponFlags».

##### Узел WeaponDescriptions/WeaponDescription/AvailablePieces/AvailablePiece
Список доступных деталей.

* **id**: Ссылка на деталь крафта.

#### Пример: Добавление деталей крафта к существующим шаблонам оружия через XML и XSLT
**Пример ситуации**: Мы создали 8 деталей крафта, подходящих для одноручных мечей, со следующими именами мешей в файлах .fbx:

* yourforumusername_blade_1
* yourforumusername_blade_2
* yourforumusername_guard_1
* yourforumusername_guard_2
* yourforumusername_grip_1
* yourforumusername_grip_2
* yourforumusername_pommel_1
* yourforumusername_pommel_2

Мы также создали 4 детали крафта, подходящие для двуручных мечей:

* yourforumusername_blade_3
* yourforumusername_guard_3
* yourforumusername_grip_3
* yourforumusername_pommel_3

Мы **ещё не создали наш новый модуль**, поэтому мы запустили Mount & Blade II: Bannerlord Modding Kit, открыли редактор, нажали File->Create New Module, дали модулю название **«OurModule»** и нажали «Create».
<img src="/img/weapon_smithing/weapon_smithing_5.png" style="height:200px;"/>

Затем мы добавили **все меши и материалы** в наш модуль с помощью редактора. Для этого недостаточно просто добавить исходные файлы в папку AssetSources\element. Файлы затем нужно экспортировать в игру через браузер ресурсов (Resource browser) и опубликовать модуль.
<img src="/img/weapon_smithing/weapon_smithing_6.png" style="height:200px;"/>

Теперь мы хотим выполнить необходимые шаги, чтобы эти детали крафта **появились в игре**. Нам нужно создать **новый XML**-файл в нашем модуле:

* Modules\OurModule\ModuleData\Custom_crafting_pieces.xml

Нам также нужно изменить нативные файлы Crafting_templates.xml и Weapon_descriptions.xml с помощью XSLT. Поэтому нам нужно создать эти 2 файла в нашем модуле:

* Modules\OurModule\ModuleData\Crafting_templates.xsl
* Modules\OurModule\ModuleData\Weapon_descriptions.xsl

<img src="/img/weapon_smithing/weapon_smithing_7.png" style="height:200px;"/>

##### SubModule.xml
Нам также нужно добавить новые XML- и XSL-файлы в наш SubModule.xml:

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
В файле **Custom_crafting_pieces.xml** мы добавим 12 деталей крафта. Мы также определим все необходимые свойства этих деталей, как было объяснено выше в этом документе.

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
Теперь нам нужно добавить детали крафта в **Crafting_templates.xsl**:
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

Приведённый выше код XSLT изменяет два нативных шаблона крафта «OneHandedSword» и «TwoHandedSword». Использование XSLT необходимо для изменения существующих шаблонов. Если бы мы добавляли новый шаблон, например «Firearms», использование XSLT не потребовалось бы. Вместо этого мы могли бы просто создать новый custom_crafting_templates.xml и добавить туда новый шаблон.

##### Weapon_descriptions.xsl
Нам также нужно изменить **Weapon_descriptions.xsl** следующим образом:

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

Вот и всё. Наши детали крафта теперь появятся на экране кузницы в игре.

##### Скачать пример мода
Если вы хотите скачать пример модуля, представленный выше, [нажмите здесь](https://download3.taleworlds.com/OurModule.zip).

