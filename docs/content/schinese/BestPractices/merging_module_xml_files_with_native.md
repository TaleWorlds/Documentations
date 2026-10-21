+++
title = "将模块XML文件与原生数据合并"
ai_translated = true

[menu.main]
identifier = "merging_module_xml_files_with_native"
parent = "bestpractices"
+++

在Bannerlord v1.3中，我们实现了一种XML合并算法，可以在不使用XSLT的情况下，帮助将其他模块的模块数据中定义的XML文件进行合并。我们可以在合并过程中添加新元素或更改某些属性，这些操作会利用这些元素的唯一属性以及从XSD中收集到的其他信息。请按照以下步骤启用合并算法：

1. 创建一个需要与基础游戏合并的XML文件
2. 添加包含模组内容的新元素；它们将被添加到最终合并后的XML文件中的相应位置，该文件将被游戏使用
3. 更改基础游戏中已经存在的元素

在引擎中，原生数据与其他模块数据的合并有两种方式。

## 与原生数据的合并

这些是以"soln"开头的XML文件。在ModuleData中，它们在"project.mbproj"文件中定义。

在下面的代码中，我们可以看到该模块注册了：

* action_sets（动作集）
* action_types（动作类型）
* movement_sets（移动集）
* full_movement_sets（完整移动集）
* combat_system（战斗系统）
* skins（皮肤）

```xml
<?xml version="1.0" encoding="utf-8"?>
<base xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" type="solution">
  <outputDirectory>../MBModule/MBModule/</outputDirectory>
  <XMLDirectory>../WOTS/Modules/Naval DLC/</XMLDirectory>
  <ModuleAssemblyDirectory>../WOTS/bin/</ModuleAssemblyDirectory>
  <file id="soln_action_sets" name="ModuleData/action_sets.xml" type="action_set" />
  <file id="soln_action_types" name="ModuleData/action_types.xml" type="action_type" />
  <file id="soln_movement_sets" name="ModuleData/movement_sets.xml" type="movement_set" />
  <file id="soln_full_movement_sets" name="ModuleData/full_movement_sets.xml" type="full_movement_set" />
  <file id="soln_combat_system" name="ModuleData/native_parameters.xml" type="native_parameters" />
  <file id="soln_skins" name="ModuleData/skins.xml" type="skin" />
</base>
```

系统会自动找到这些文件并将其与原生数据合并。

## 托管XML文件

另一种合并方式是针对托管XML文件进行的，例如items.xml、heroes.xml和settlements.xml。它们在位于模块根目录的SubModule.xml文件中定义。以下是一个SubModule文件的示例：

```xml
<?xml version="1.0" encoding="utf-8"?>
<Module>
  <Name value="NavalDLC" />
  <Id value="NavalDLC" />
  <Version value="v1.3.0" />
  <DefaultModule value="false" />
  <ModuleCategory value="Singleplayer" />
  <ModuleType value="OfficialOptional" />
  <DependedModules>
    ...
  </DependedModules>
  <SubModules>
    ...
  </SubModules>
  <Xmls>
    <XmlNode>
      <XmlName id="Items" path="items" />
      <IncludedGameTypes>
        <GameType value="Campaign" />
        <GameType value="CampaignStoryMode" />
      </IncludedGameTypes>
    </XmlNode>
  </Xmls>
</Module>
```

在上面的示例中，我们已经向游戏注册了一个id="Items"的XMLNode。因此，当需要进行合并时，基础游戏中的items.xml将与模组中的items.xml合并。唯一需要做的就是像往常一样实现items.xml文件，它们就会被自动合并。

让我们看看位于原生"items.xml"中的火把（Torch）物品：

```xml
<Item
    id="torch"
    name="{=ErOLa263}Torch"
    is_merchandise="false"
    body_name="bo_mace_a"
    recalculate_body="true"
    mesh="torch_g"
    prefab="torch_a_wm_only_flame"
    culture="Culture.empire"
    value="4"
    weight="0.2"
    Type="OneHandedWeapon"
    item_holsters="abdomen_left">
    <ItemComponent>
        <Weapon
            weapon_class="OneHandedAxe"
            weapon_balance="100"
            thrust_speed="78"
            speed_rating="97"
            missile_speed="0"
            weapon_length="65"
            swing_damage="6"
            swing_damage_type="Blunt"
            item_usage="banner"
            physics_material="metal_weapon">
            <WeaponFlags MeleeWeapon="true" />
        </Weapon>
    </ItemComponent>
    <Flags
        DropOnWeaponChange="true"
        ForceAttachOffHandPrimaryItemBone="true"
        HeldInOffHand="true"
        HasToBeHeldUp="true" />
</Item>
```

我们可以通过在自己的模块中重写该物品来更改它的某些属性。当合并算法运行时，它会遍历XML文件并查看该元素的"唯一"属性（在本例中为"id"）。如果找到唯一属性，则会更改该元素；如果没有找到，则会将新物品添加到XML文件中。假设我们想更改上面的Torch物品，它的唯一属性id为"torch"。我们希望让它在商店中可用，将其swing_damage更改为9，并将DropOnWeaponChange标志设置为false。我们需要在模块的items.xml中插入以下代码：

```xml
<Item
    id="torch"
    is_merchandise="true"
    body_name="bo_mace_a">
    <ItemComponent>
        <Weapon swing_damage="9">
        </Weapon>
    </ItemComponent>
    <Flags DropOnWeaponChange="false" />
</Item>
```

然后，算法会遍历所有物品，找到一个在原生文件中已经存在相同唯一属性的物品。接着，它开始进行合并处理。这是合并后的结果物品：

```xml
<Item
    id="torch"
    name="{=ErOLa263}Torch"
    is_merchandise="true"
    body_name="bo_mace_a"
    recalculate_body="true"
    mesh="torch_g"
    prefab="torch_a_wm_only_flame"
    culture="Culture.empire"
    value="4"
    weight="0.2"
    Type="OneHandedWeapon"
    item_holsters="abdomen_left">
    <ItemComponent>
        <Weapon
            weapon_class="OneHandedAxe"
            weapon_balance="100"
            thrust_speed="78"
            speed_rating="97"
            missile_speed="0"
            weapon_length="65"
            swing_damage="9"
            swing_damage_type="Blunt"
            item_usage="banner"
            physics_material="metal_weapon">
            <WeaponFlags MeleeWeapon="true" />
        </Weapon>
    </ItemComponent>
    <Flags
        DropOnWeaponChange="false"
        ForceAttachOffHandPrimaryItemBone="true"
        HeldInOffHand="true"
        HasToBeHeldUp="true" />
</Item>
```

对于每个XML文件，都有一个XSD模式文件，提供关于该XML文件结构的信息。XSD文件位于XmlSchemas文件夹中。这些文件还会告诉我们元素的哪些属性是唯一属性。而且有一些元素，算法总是更倾向于进行合并。在上面的XML文件中，如果我们查看相应的XSD模式，会发现对于元素"Item"，唯一属性是"id"；对于元素"ItemComponent"，我们应该总是优先进行合并，因为规定每个"Item"只能有一个"ItemComponent"元素。所有这些信息都是算法从xsd文件中读取的。例如，让我们看一下"ShipHulls"的xsd模式：

```xml
<?xml version='1.0' encoding='UTF-8'?>
<xs:schema xmlns=""
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:msdata="urn:schemas-microsoft-com:xml-msdata" id="ShipHulls">
  <xs:simpleType name="positiveIntType">
    <xs:restriction base="xs:int">
      <xs:minExclusive value="0"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:element name="ShipHulls" msdata:IsDataSet="true">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="ShipHull" maxOccurs="unbounded" minOccurs="0">
          <xs:complexType>
            <xs:sequence>
              <xs:element name="AvailableSlots" maxOccurs="1">
                <xs:annotation>
                  <xs:appinfo>
                    <appSpecificNote>AlwaysPreferMerge</appSpecificNote>
                  </xs:appinfo>
                </xs:annotation>
                <xs:complexType>
                  <xs:sequence>
                    <xs:element name="ShipSlot" maxOccurs="unbounded" minOccurs="0">
                      <xs:complexType>
                        <xs:attribute type="xs:string" name="id" use="required"/>
                        <xs:attribute type="xs:string" name="tag_id" use="required"/>
                      </xs:complexType>
                    </xs:element>
                  </xs:sequence>
                </xs:complexType>
                <!-- id attribute is unique for ShipSlot -->
                <xs:unique name="ShipSlot_unique_attribute">
                  <xs:selector xpath="ShipSlot"/>
                  <xs:field xpath="@tag_id"/>
                </xs:unique>
              </xs:element>
            </xs:sequence>
            <xs:attribute type="xs:string" name="id" use="required"/>
            <xs:attribute type="xs:string" name="mission_ship" use="required"/>
            <xs:attribute type="xs:string" name="name" use="required"/>
            <xs:attribute type="xs:string" name="ship_type" use="required"/>
            <xs:attribute type="xs:float" name="base_speed" use="required"/>
            <xs:attribute type="xs:int" name="value" use="required"/>
            <xs:attribute type="xs:string" name="default_group" use="required"/>
            <xs:attribute type="xs:boolean" name="can_navigate_shallow_water" use="required"/>
            <xs:attribute type="xs:float" name="production_build_weight" use="required"/>
            <xs:attribute type="xs:int" name="sea_worthiness" use="required"/>
            <xs:attribute type="xs:int" name="inventory_capacity" use="required"/>
            <xs:attribute type="xs:float" name="map_visual_scale" use="required"/>
            <!-- Ship's maximum hitpoints. -->
            <xs:attribute name="max_hitpoints" type="positiveIntType" use="required"/>
            <!-- Ship's total crew capacity. Including both the crew on ship's main deck and also the reserves within ship's lower decks -->
            <xs:attribute name="total_crew_capacity" type="positiveIntType" use="required"/>
            <!-- Ship's main deck crew capacity. Must match the count of crew spawn entities in ship's prefab -->
            <xs:attribute name="main_deck_crew_capacity" type="positiveIntType" use="required"/>
            <!-- Skeletal crew capacity. Minimum crew count to operate the ship -->
            <xs:attribute name="skeletal_crew_capacity" type="positiveIntType" use="required"/>
          </xs:complexType>
        </xs:element>
      </xs:sequence>
    </xs:complexType>
    <!-- id attribute is unique for ShipHull -->
    <xs:unique name="ShipHull_unique_attribute">
      <xs:selector xpath="ShipHull"/>
      <xs:field xpath="@id"/>
    </xs:unique>
  </xs:element>
</xs:schema>
```

在上面的模式中，我们可以看到"xs:unique"元素告诉我们由"xpath"指定的元素的哪些属性是唯一的。例如，让我们看看：

```xml
<!-- id attribute is unique for ShipHull -->
<xs:unique name="ShipHull_unique_attribute">
  <xs:selector xpath="ShipHull"/>
  <xs:field xpath="@id"/>
</xs:unique>
```

这表明元素"ShipHull"的"id"属性是唯一的。因此，合并算法在合并时会检查这个"id"字段。在xsd文件中还可以看到一些注解，例如：

```xml
<xs:element name="AvailableSlots" maxOccurs="1">
  <xs:annotation>
    <xs:appinfo>
      <appSpecificNote>AlwaysPreferMerge</appSpecificNote>
    </xs:appinfo>
  </xs:annotation>
```

这告诉我们"AvailableSlots"元素在其父元素中只出现一次，当算法在对父项进行合并修改时遇到"AvailableSlots"项时，它知道我们试图合并的另一个元素中存在的"AvailableSlots"会直接与现有的"AvailableSlots"合并，而不会产生两个"AvailableSlots"元素。以这种方式注解的元素也不需要唯一id，因为我们不需要它。
