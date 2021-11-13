+++
title = "Тактические позиции миссии"
description = ""
weight = 1
+++

### Тактические позиции и тактические регионы

Это скриптовые сущности, которые сообщают ИИ об особенностях местности. Они не работают как осада, ИИ не всегда будет использовать тактические позиции или регионы, которые вы можете разместить. Они могут использовать их в условиях, благоприятствующих их использованию.

В зависимости от движения игрока и рандомизации пути появления существует очень большое количество сценариев, которые могут возникнуть во время сражений. Из-за этого лучше иметь как можно больше значимых позиций и регионов, отмеченных, насколько это возможно, но их отсутствие или отсутствие отметки некоторых значимых позиций не приведет к очевидным ошибкам, как при осаде, но приведет к менее интересным битвам, потому что ИИ не узнает об их окружении. Типы и способы использования разных тактических позиций и регионов:

#### Тактические позиции
##### Возвышенность, направление движения по склону

Они предназначены для удобных позиций на возвышенности, обращенных в одном направлении. ИИ может удерживать эти позиции, если противник приближается со стороны тактической позиции.
Направление - самая важная часть. Позиция для защиты будет смотреть вперед (зеленая стрелка в редакторе) позиции. Параметры следующие:

{{% notice info %}}
* _width: the AI will try to form itself to the full extent of the width and if it's too narrow and AI has too many troops or if it's too wide and AI doesn't have enough troops AI may think it's a poorly suitable position.
* _slope: is also important for choosing between positions, it is in degrees and maximum of 60 degrees of slope is recognised by AI. It should roughly estimate the steepness of the position.
* _isInsurmountable: false
* _isOuterEdge: false
* _tacticalPositionType: HighGround
* _tacticalPositionMembership: Forest, Opening or Difficult Terrain depending on surroundings.
* _tacticalPositionSide: BehaviorSideNotSet
{{% /notice %}}

![](/img/tactical_positions/1.png)

##### Вершина холма, защищаемая со всех сторон

Это для высоких позиций на вершине холмов, которые легко защищать со всех сторон. ИИ может удерживать эти позиции независимо от направления приближения врага. ИИ будет позиционировать себя на вершине холма в соответствии с позицией врага. Направление не важно.

{{% notice info %}}
* _width is important, should be roughly equal to the radius of the top of the hill.
* _slope is also important for choosing between positions, it is in degrees and a maximum of 60 degrees of slope is recognised by AI. It should roughly estimate the steepness of the position.
* _isInsurmountable => true	this is what defines the property of this type of position
* _isOuterEdge => false
* _tacticalPositionType => HighGround
* _tacticalPositionMembership => Forest, Opening or Difficult Terrain depending on surroundings.
* _tacticalPositionSide => BehaviorSideNotSet
{{% /notice %}}

![](/img/tactical_positions/2.png)

##### Точка давки

Это позиции с непроходимыми преградами с обеих сторон. ИИ с меньшими числами может попытаться удержать эти позиции, чтобы уменьшить их недостаток числа.

{{% notice info %}}
* Direction is the most important part. The position to defend will face the forward direction(green arrow in editor) of the position. ***
* _width is important, the AI will try to form itself to the full extent of the width and if it's too narrow and AI has too many troops or if it's too wide and AI doesn't have enough troops AI may think it's a poorly suitable position.
* Slope is also slightly important for choosing between positions, it is in degrees and a maximum of 60 degrees of slope is recognised by AI. It should roughly estimate the steepness of the position.
* _isInsurmountable => false	(currently this field does nothing for choke points, but I will add checking both front and back of the same chokepoint if _isInsurmountable is true, therefore if there is a chokepoint that can be used against enemies in front and in back, mark this true instead of adding two chokepoints with opposite directions)
* _isOuterEdge => false
* _tacticalPositionType => ChokePoint
* _tacticalPositionMembership => Forest, Opening or Difficult Terrain depending on surroundings.
* _tacticalPositionSide => BehaviorSideNotSet
{{% /notice %}}

![](/img/tactical_positions/3.png)

##### Позиция на утёсе

Эти тактические позиции сами по себе бессмысленны. Они должны быть помещены в иерархию сущностей под тактическими позициями узких мест. Если он размещен под узким проходом и ИИ использует его, будут использоваться только положения обрыва.

{{% notice info %}}
* Cliff positions should be positions that the enemy cannot reach when the parent choke point is held by other defenders.
* When eligible, ranged and archer formations will move to this position.
* Direction of the cliff position will determine where the archers formation will face when they are using this position.
* _width is important, the AI will try to form itself to the full extent of the width and if it's too narrow and AI has too many troops or if it's too wide and AI doesn't have enough troops AI may think it's a poorly suitable position.
* _slope => not important
* _isInsurmountable => false
* _isOuterEdge => false
* _tacticalPositionType => Cliff
* _tacticalPositionMembership => Forest, Opening or Difficult Terrain depending on surroundings, not important
* _tacticalPositionSide => BehaviorSideNotSet
{{% /notice %}}

![](/img/tactical_positions/4.png)

#### Тактический регион

Они предназначены для маркировки областей в сценах. Дан только радиус, и область имеет круглую форму. Очевидно, что сцены будут иметь регионы с лесами полностью нестандартной/произвольной формы, сложными ландшафтами и открытыми местами. Поэтому следует определить несколько тактических областей с различными круговыми областями, при необходимости их можно добавить. Радиус и круговая площадь каждой области могут быть приблизительными, но не обязательно точными.

##### Лесистая местность

ИИ может использовать позиции внутри лесных областей, если у врага превосходящее количество стрелков и кавалерии, потому что лучники и кавалерия менее эффективны в лесах. Любой другой регион, который невыгоден как для стрелковых подразделений, так и для кавалерии, может быть отдан лесному региону, он необязательно должен быть лесом, иметь деревья и т.д. Это может быть рынок с множеством препятствий и укрытий или что-то в этом роде.

![](/img/tactical_positions/5.png)

##### Сложная местность

Это включает в себя каменистую местность, а также болота, или могут быть даже рыночные площади или какое-либо место с множеством препятствий на земле, любая область, которая не препятствует дальнему огню (например, леса), но препятствует и замедляет кавалерию, должна быть рассмотрена и отмечена труднопроходимой местностью. ИИ может использовать позиции внутри труднопроходимой местности, если у врага больше кавалерийских единиц.

![](/img/tactical_positions/6.png)

##### Открытая местность

Позиции, позволяющие быстро передвигаться кавалерии и вести чисто стрелковую стрельбу. Этот тип региона предназначен для обозначения подходящих полей боя. ИИ может выбрать защиту в открытых зонах, если у них есть большее или равное количество отрядов дальнего боя и кавалерии.

![](/img/tactical_positions/7.png)

#### Совмещение тактических регионов и позиций

Тактические позиции, описанные в разделе A, также могут быть помещены в объекты Тактического региона. Их _tacticalRegionMembership должен быть правильно выбран. В этой ситуации ИИ поймет, что точка прохода также находится в лесном районе, и при правильных условиях может предпочесть это положение давки или возвышенность соответственно. 
