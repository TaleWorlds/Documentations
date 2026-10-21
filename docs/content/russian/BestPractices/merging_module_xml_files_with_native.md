+++
title = "Слияние XML-файлов модуля с нативными файлами"
ai_translated = true

[menu.main]
identifier = "merging_module_xml_files_with_native"
parent = "bestpractices"
+++

Начиная с Bannerlord v1.3, мы реализовали алгоритм слияния XML, который помогает объединять XML-файлы, определённые в данных модулей (module data) других модулей, без использования XSLT. Во время слияния мы можем добавлять новые элементы в XML или изменять некоторые атрибуты, используя их уникальные атрибуты и другую информацию, полученную из XSD. Выполните следующие шаги, чтобы включить алгоритм слияния:

1. Создайте XML-файл, который необходимо объединить с базовой игрой
2. Добавьте новые элементы с содержимым мода; они будут добавлены в соответствующие места в итоговом объединённом XML-файле, который будет использоваться игрой
3. Измените элементы, которые уже присутствуют в базовой игре

В движке слияние данных нативной игры и других модулей выполняется двумя способами.

## Слияние для нативной игры (Native)

Это XML-файлы, имена которых начинаются с "soln". В ModuleData они определяются в файле "project.mbproj".

В приведённом ниже коде видно, что этот модуль регистрирует:

* action_sets
* action_types
* movement_sets
* full_movement_sets
* combat_system
* skins

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

Эти файлы автоматически обнаруживаются системой и объединяются с нативными данными.

## Управляемые XML-файлы (Managed XML Files)

Другой вид слияния выполняется для управляемых (managed) XML-файлов, таких как items.xml, heroes.xml и settlements.xml. Они определяются в файле SubModule.xml, расположенном в корне модуля. Вот пример файла SubModule:

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

В приведённом выше примере мы зарегистрировали в игре XMLNode с id="Items". Поэтому при слиянии items.xml из базовой игры будет объединён с items.xml из мода. Всё, что нужно сделать — это реализовать файл items.xml как обычно, и они будут объединены.

Рассмотрим предмет Torch (факел), расположенный в нативном файле "items.xml":

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

Мы можем изменить некоторые свойства этого предмета, переписав его в нашем собственном модуле. Когда запускается алгоритм слияния, он проходит по XML-файлу и просматривает "уникальные" атрибуты данного элемента (в данном случае это "id"). Если уникальный атрибут найден, этот элемент изменяется; если не найден, новый элемент добавляется в XML-файл. Предположим, мы хотим изменить указанный выше предмет Torch, у которого уникальный атрибут id равен "torch". Мы хотим сделать его доступным в магазинах, изменить его swing_damage на 9 и установить флаг DropOnWeaponChange в false. Для этого мы вставим следующий код в items.xml нашего модуля:

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

Затем алгоритм проходит по предметам и находит предмет с уникальным атрибутом, который уже присутствует в нативных файлах. После этого начинается процесс слияния. Вот итоговый предмет:

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

Для каждого XML-файла существует файл схемы XSD, который предоставляет информацию о структуре XML-файла. Файлы XSD находятся в папке XmlSchemas. Эти файлы также сообщают нам, какие атрибуты элемента являются уникальными. Кроме того, существуют элементы, для которых алгоритм всегда предпочитает слияние. В приведённых выше XML-файлах, если посмотреть на соответствующие XSD-схемы, можно увидеть, что для элемента "Item" уникальным атрибутом является "id", а для элемента "ItemComponent" всегда следует предпочитать слияние, поскольку установлено ограничение, что для каждого "Item" может быть только один элемент "ItemComponent". Вся эта информация считывается алгоритмом из xsd-файлов. Например, рассмотрим xsd-схему для "ShipHulls":

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

В приведённой выше схеме видно, что элементы "xs:unique" сообщают нам, какие атрибуты элемента, указанного в "xpath", являются уникальными. Например, рассмотрим:

```xml
<!-- id attribute is unique for ShipHull -->
<xs:unique name="ShipHull_unique_attribute">
  <xs:selector xpath="ShipHull"/>
  <xs:field xpath="@id"/>
</xs:unique>
```

Это означает, что атрибут "id" элемента "ShipHull" является уникальным. Таким образом, алгоритм слияния при объединении проверяет именно это поле "id". В xsd-файлах также можно встретить некоторые аннотации, например:

```xml
<xs:element name="AvailableSlots" maxOccurs="1">
  <xs:annotation>
    <xs:appinfo>
      <appSpecificNote>AlwaysPreferMerge</appSpecificNote>
    </xs:appinfo>
  </xs:annotation>
```

Это сообщает нам, что элемент "AvailableSlots" встречается в своём родительском элементе только один раз, и когда алгоритм при слиянии родительского элемента встречает элемент "AvailableSlots", он понимает, что "AvailableSlots" в другом элементе, с которым мы пытаемся выполнить слияние, напрямую объединяется с существующим "AvailableSlots", не создавая при этом два элемента "AvailableSlots". Элементы, аннотированные таким образом, также не имеют уникальных идентификаторов, поскольку они нам не нужны.
