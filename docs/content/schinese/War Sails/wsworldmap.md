+++
title = "War Sails 世界地图"
description = ""
weight = 10
ai_translated = true
+++

与 Bannerlord 相比,创建或修改 War Sails 世界地图涉及一些额外的要求。以下列出了这些要求。

## 导航网格(Navmesh)

随着 War Sails DLC 的推出,许多水域变得可通航,引入了几种超出基础游戏所使用的新导航网格(navmesh)类型。在创建或修改 War Sails 世界地图时,你可能需要使用以下导航网格类型:

* `CoastalSea`  
* `OpenSea`  
* `River`  
* `NonNavigableRiver`  
* `UnderBridge`  
* `Lake`

下图显示了对应的导航网格 ID 值。

<img src="/img/warsails_world_map/1.png" style="max-width: 800px;"/>

`CoastalSea` 和 `OpenSea` 都是可通航的水域类型,但它们服务于不同的游戏玩法目的。它们使用不同的移动速度修正系数,并且在海上消耗(sea attrition)系统中受到不同的对待,因此请根据预期的游戏玩法选择合适的类型。

对于桥梁正下方的面,以及通向桥梁出入口的相邻面,请使用 `UnderBridge` 导航网格类型。此导航网格类型不会影响移动速度或海上消耗。相反,它控制着特定于桥梁的行为:

* 船只在经过桥下时会自动折叠和展开船帆。  
* 当玩家在桥下航行时,桥梁会变得透明,以提高可见度。

在 War Sails 中,湖泊是不可通航的。`Lake` 导航网格类型相当于不可通行的地形,船只无法穿越。

## 流动图(Flowmap)

在 War Sails 中,风和水流会影响可通航水域中的移动。强度和方向由流动图(Flowmap)定义,该图可以在世界地图编辑器(World Map Editor)中直接编辑。

要编辑流动图:

1. 点击位于 Paint Flora(绘制植被)和 Navigation Mesh(导航网格)按钮之间的 Paint Flowmap(绘制流动图)按钮。  
2. 同时,打开 Inspector(检查器)并选择 Flowmap(流动图)选项卡,以便正确编辑它。

<img src="/img/warsails_world_map/2.png" style="max-width: 800px;"/>

流动图的绘制方式与地形纹理或高度图非常相似,但每一笔画都会同时定义一个方向。编辑器会显示彩色箭头来可视化流动图:

* 箭头方向表示风和水流的方向。  
* 箭头颜色表示风和水流的强度。  
  * 蓝色代表最弱的风和水流。  
  * 红色代表最强的风和水流。

流动图直接影响水体着色器(water shader)。因此,在相邻区域绘制方向截然相反的流动,可能会导致明显的拉伸或不真实的水体变形。如果你需要相邻区域具有相反的水流方向,应在它们之间创建平滑过渡,而不是绘制突兀的变化。这样可以产生更自然的水体外观,同时仍能保留不同的水流模式。

## 定居点设置

War Sails 为沿海定居点引入了若干额外实体。这些实体支持诸如上船/下船、海上封锁以及村庄登陆点等功能。

### 港口点(Port Points)

要允许海军队伍在沿海城镇上船和下船,请向该定居点添加一个名为 `town_port` 的子实体。

该实体必须:

* 带有 `main_map_city_port` 标签。  
* 放置在可通航的海军导航网格上,例如 `CoastalSea` 或 `River`。未正确放置将导致错误。

<img src="/img/warsails_world_map/3.png" style="max-width: 800px;"/>

**定居点 XML 配置**

在向沿海城镇添加 `town_port` 实体后,你还必须更新 `settlements.xml` 文件。

在定居点的 Buildings(建筑)部分中,添加船坞(Shipyard)建筑:

```xml
<Building
    id="building_shipyard"
    level="1" />
```

对于船坞场景,你应该在定居点的 Locations(地点)部分中添加船坞地点,如下所示:

```xml
<Location
    id="port"
    scene_name="aserai_shipyard" />
```

### 封锁点(Blockade Points)

当沿海城镇被围攻时,War Sails 会在定居点周围显示海上封锁。要定义封锁区域和船只位置,请添加以下内容:

* 作为子实体的 `town_blockade_start` 实体,并带有 `Blockade_Arc_Start` 标签  
* 作为子实体的 `town_blockade_end` 实体,并带有 `Blockade_Arc_End` 标签  
* 为该城镇实体添加 `BlockadePositionScript`

<img src="/img/warsails_world_map/4.png" style="max-width: 800px;"/>

添加这些内容后,编辑器将显示:

* 代表各个封锁船只位置的红色标记。  
* 一个表示封锁弧中心的球体。

移动起点和终点会改变封锁弧的范围,从而允许你调整封锁舰队的视觉位置。

`BlockadePositionScript` 还暴露了若干控制封锁外观的参数,包括:

* 船只数量。  
* 封锁弧数量。  
* 船只之间的间距。  
* 其他封锁布局设置。

调整这些数值以达到所需的视觉效果。

<img src="/img/warsails_world_map/5.png" style="max-width: 800px;"/>

### 卸货点(Drop Off Points)

沿海村庄使用卸货点(drop-off points)而非港口来支持上船和下船。

要添加卸货点,请创建一个名为 `drop_point` 的子实体,并为其分配 `main_map_village_dropoff` 标签。

与城镇港口一样,卸货点必须放置在可通航的海军导航网格上(例如 `CoastalSea` 或 `River`),才能正常工作。

<img src="/img/warsails_world_map/6.png" style="max-width: 800px;"/>

## 过渡(Transition)

除了海上航行与沿海定居点之间的过渡之外,War Sails 还支持可通航水域与陆地之间的直接过渡。

唯一的要求是,源导航网格和目标导航网格类型都必须是可通航的。

例如:

* 一支队伍可以从 `CoastalSea` 过渡到 `Plain`(平原)或 `Forest`(森林)。  
* 一支队伍不能过渡到不可通行的地形类型,例如 `Mountain`(山地)。

这使你可以在任何合适的可通航海岸线上定义上船和下船地点,而不仅限于定居点。

## 脚本

世界地图场景中最重要的组件之一是位于 `settlement_scripts` 实体下的 `SettlementPositionScript`。

每当你进行影响导航或定居点位置的更改时,都必须重新生成定居点距离缓存(Settlement Distance Cache)。这包括诸如编辑导航网格或移动定居点(包括 `town_gate`、`town_port` 或 `drop_point`)之类的更改。

要安全地重新生成缓存,请按顺序执行以下步骤:

1. 在重新构建定居点距离缓存之前,请确认以下内容已被选中:  
   * `_partyNavigationModelOverridenClassName` → `NavalPartyNavigationModel`  
   * `_distanceModelOverridenClassName` → `NavalDLCMapDistanceModel`  
2. Check Positions(检查位置)  
   * 验证与定居点相关的位置,并将摄像机移动到任何有问题的位置,以便更容易识别和修复。  
3. Save Positions(保存位置)  
   * 保存当前的定居点位置和所有相关数据。  
4. `ComputeAndSaveSettlementDistanceCache`  
   * 重新构建定居点距离缓存。根据你的硬件配置,这最后一步可能需要相当长的时间。在此过程中,编辑器会计算每个定居点与所有其他定居点之间的寻路路线,然后将结果存储到缓存中。

<img src="/img/warsails_world_map/7.png" style="max-width: 800px;"/>

## 水面与材质

War Sails 不使用引擎自动生成的场景水体。相反,它使用带有水体材质的自定义平面网格。

内置的场景水体是为任务场景设计的,具有固定的缩放和行为,不适合战役世界地图所需的灵活性。自定义水面使你能够精确控制可通航水域的大小、位置和外观。

标准的 War Sails 水面使用以下配置:

* 材质:`naval_worldmap_water`  
* 脚本:  
  * `water_flowmap`  
  * `CampaignMapAmbientOccluder`  
* 标签:`snapped_water_body`

下图展示了世界地图主水面所需的组件和参数。

注意:世界地图场景中还包含用于湖泊的其他 `water_plane` 实体。在进行任何更改之前,请确保你已选中正确的水面。

<img src="/img/warsails_world_map/8.png" style="max-width: 800px;"/>

### 创建新的水面

要创建新的水面:

1. 将 `water_plane` 预制件(prefab)添加到场景中。  
2. 根据需要对其进行定位、旋转和缩放。  
3. 在 Inspector(检查器)中,打开 Materials(材质)选项卡,并分配所需的水体材质(通常为 `naval_worldmap_water`)。  
4. 如果该水面要作为可通航的世界地图水体,请确保存在所需的脚本和标签。

配置完成后,该水面将与 War Sails 的水体渲染和流动图系统集成。

## 风暴系统

War Sails 具有一个动态风暴系统,可在开阔水域上生成风暴。

世界地图被划分为 32 × 32 单位的网格单元。对于每个中心位于 `OpenSea` 导航网格上的单元,游戏会定期检查是否应生成风暴。

有三种可用的风暴类型:

* `Storm`(风暴)  
* `ThunderStorm`(雷暴)  
* `Hurricane`(飓风)

生成的风暴类型取决于所选位置的流动图数据。每种风暴类型都有自己的移动速度、半径和伤害特性。

### 配置风暴

可以通过重写 `StormModel`(通过代码,而非在编辑器中)来自定义风暴行为。这允许你调整以下参数:

* 每小时生成概率  
* 最大活动风暴数量  
* 风暴类型配置  
* 风暴持续时间

### 风暴移动

风暴不遵循预定义的路径。相反,它们由流动图驱动。

当风暴在世界地图上移动时,它会持续沿着其当前位置的流动图所定义的流动方向移动。这使得风暴的移动能够自然地与你在地图中绘制的水流模式相匹配。

### 流动图注意事项

当风暴长时间停留在陆地导航网格上时,它们会逐渐减弱并最终消散。

因此,在沿海地区绘制流动图时,建议将水流方向指向远离陆地、朝向开阔水域的方向。这有助于让风暴停留在海上,并防止它们在生成后或靠近海岸漂移时立即消散。

## 海盗生成点

War Sails 使用专门的海盗生成点来控制海盗队伍出现的位置以及它们随时间巡逻的区域。

每个海盗生成点都必须附加一个 `PirateSpawnPoint` 脚本。在该脚本中,将 Clan String ID(氏族字符串 ID)设置为相应的海盗氏族。War Sails 提供两个可用氏族:

* `northern_pirates`  
* `southern_pirates`

如果你希望添加新的氏族,应先在 `clans.xml` 中定义它们,然后再将其添加到世界地图中。

<img src="/img/warsails_world_map/9.png" style="max-width: 800px;"/>
