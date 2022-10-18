+++
title = "Имитация поводьев лошади"
weight = 15
+++

### Введение

В этом руководстве объясняется, как добавить симуляцию к поводьям комплекта конской брони.

Ранее мы использовали только одну сетку для конской брони, однако поводья висели в воздухе и не двигались под действием силы тяжести. Затем мы решили добавить симуляцию к поводьям, что означало внесение некоторых изменений в систему. Вместо одной сетки, конские доспехи теперь содержат 3-и сетки. Разделим их на 2-е группы.

#### Группа 1:

- **Конские доспехи / сбруя**: Комплект доспехов, связанный с телом лошади, как показано на изображении 2b (который имеет собственную симуляцию, но мы пока не будем это учитывать). Пример: horse_harness_x
- **Оригинальные поводья**: Часть, которая отделена от первоначальной единой сетки, о которой мы упоминали выше, и она видна на изображении 2c. Мы сохранили этот немоделированный кусок для случаев, когда имитируемый кусок не нужен; это когда камера находится далеко от лошади и комплект брони начинает переключаться на LOD 1 и на остальные LODы. Пример: horse_harness_x_rein

#### Группа 2:

- **Имитация поводья**: Когда камера приближается к лошади, всадник держит поводья, и поводья двигаются согласно физике. Пример: horse_harness_x_rein_rope

В этом уроке в основном объясняется, как создать третью сетку, которая является «имитируемой частью поводья». Но прежде чем углубиться в пошаговые инструкции, мы хотели бы прояснить несколько моментов.

|  |  |
| ------ | ----------- |
| <img src="/img/horse_reins_simulation_creation/image_1a.png" width="350px"/> | <img src="/img/horse_reins_simulation_creation/image_1b.png" width="350px"/> |
| **Рисунок 1a**; *Normally each component has a different name but we will refer to the parts of our mesh either as headpiece or rein as shown in Image 1b.* | **Рисунок 1b**; *For simplicity and due to functionality we will only use “head piece” and “reins”.* |

Мы назвали конскую сбрую как "horse_harness_x", в качестве примера ниже (отмечены светло-серым), при объяснении группировки (эти имена выбраны только в качестве примеров. Имейте в виду, что в папке есть меши с именами "horse_harness_x", "horse_harness_x_rein", "horse_harness_x_rein_rope" которые уже в игре.

 |  | 
------- | ------- | --------
<img src="/img/horse_reins_simulation_creation/image_2a.png"/> | <img src="/img/horse_reins_simulation_creation/image_2b.png"/> | <img src="/img/horse_reins_simulation_creation/image_2c.png"/>
**Рисунок 2a**; *This is the initial stage where you model the horse harness/armor and rein according to horse anatomy. The rein should be modelled so that it is positioned within the rider’s reach (we have modelled the armor sets in 3ds Max).* | **Рисунок 2b**; *horse_harness_x.* | **Рисунок 2c**; *horse_harness_x_rein (headpiece is part of this mesh which will later be duplicated to become horse_harness_x_rein_rope).*

В следующей главе мы поговорим о том, как создать третий компонент; «Имитация поводья» комплекта брони.

### Имитация поводья: Horse_harness_x_rein_rope

Для смоделированной части требуется еще один скелет, который является частью нашего набора для моддинга, доступного в Mount & Blade II Bannerlord\modding_resources (смотри рисунок 3).

<img src="/img/horse_reins_simulation_creation/image_3.png" width="900px"/>

**Рисунок 3**; *horse_harness_rein_skeleton which contains 22 bones is on the left. On the right we have a demonstration of how the horse_harness_x_rein_rope is supposed to fit on the skeleton.*

#### Шаги по созданию моделирующей сетки:
1. Продублируйте меш "horse_harness_x_rein".
2. Переименуйте в "horse_harness_x_rein_rope".
3. Настройте новую сетку ("horse_harness_x_rein_rope") так, чтобы она идеально сидела на "horse_harness_rein_skeleton" (когда вы закончите, сетка должна выглядеть так, как на изображениях 5a и 5b).
4. Скин "horse_harness_x_rein_rope" в соответствии с "horse_harness_rein_skeleton". На рисунке 4 показан список костей рассматриваемого скелета.
5. Установите альфа-вершину моделируемой области на "100". Установите остальные не смоделированные вершины на "0" (см. изображение 6).

 |  |  | 
------- | ------- | -------- | --------
<img src="/img/horse_reins_simulation_creation/image_4.png"/> | <img src="/img/horse_reins_simulation_creation/image_5a.png"/> | <img src="/img/horse_reins_simulation_creation/image_5b.png"/> | <img src="/img/horse_reins_simulation_creation/image_6.png"/>
**Рисунок 4**; *bones of horse_harness_rein_skeleton.* | **Рисунок 5a**; *side view of horse_harness_x_rein_rope compared to horse_harness_x_rein.* | **Рисунок 5b**; *top view of horse_harness_x_rein_rope (selected mesh) compared to horse_harness_x_rein.* | **Рисунок 6**; *alphas of the selected vertices (red/lighter) are set to “100” since they belong to the simulated region of the rein. The part where the rider holds and the head piece (see Image 1b) are not simulated, hence they are set to “0”.*

### Экспорт мешей в игру

Экспортируйте меши в формате fbx в указанную папку:

[Game Folder]\Modules\[Mod Folder]\AssetSources