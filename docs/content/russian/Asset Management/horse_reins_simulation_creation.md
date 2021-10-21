+++
title = "Моделирование поводьев лошади"
weight = 3
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
| **Image 1a**; *Normally each component has a different name but we will refer to the parts of our mesh either as headpiece or rein as shown in Image 1b.* | **Image 1b**; *For simplicity and due to functionality we will only use “head piece” and “reins”.* |

Мы назвали конскую сбрую как "horse_harness_x", в качестве примера ниже (отмечены светло-серым), при объяснении группировки (эти имена выбраны только в качестве примеров. Имейте в виду, что в папке есть меши с именами "horse_harness_x", "horse_harness_x_rein", "horse_harness_x_rein_rope" которые уже в игре.

 |  | 
------- | ------- | --------
<img src="/img/horse_reins_simulation_creation/image_2a.png"/> | <img src="/img/horse_reins_simulation_creation/image_2b.png"/> | <img src="/img/horse_reins_simulation_creation/image_2c.png"/>
**Image 2a**; *This is the initial stage where you model the horse harness/armor and rein according to horse anatomy. The rein should be modelled so that it is positioned within the rider’s reach (we have modelled the armor sets in 3ds Max).* | **Image 2b**; *horse_harness_x.* | **Image 2c**; *horse_harness_x_rein (headpiece is part of this mesh which will later be duplicated to become horse_harness_x_rein_rope).*

В следующей главе мы поговорим о том, как создать третий компонент; «Имитация поводья» комплекта брони.

### Имитация поводья: Horse_harness_x_rein_rope

Для смоделированной части требуется еще один скелет, который является частью нашего набора для моддинга, доступного в Mount & Blade II Bannerlord\modding_resources (смотри рисунок 3).

<img src="/img/horse_reins_simulation_creation/image_3.png" width="900px"/>

**Image 3**; *horse_harness_rein_skeleton which contains 22 bones is on the left. On the right we have a demonstration of how the horse_harness_x_rein_rope is supposed to fit on the skeleton.*

#### Шаги по созданию моделирующей сетки:
1. Duplicate the mesh “horse_harness_x_rein”.
2. Rename it to “horse_harness_x_rein_rope”.
3. Tweak the new mesh (“horse_harness_x_rein_rope”) so that it sits perfectly on the “horse_harness_rein_skeleton” (when you are done the mesh should look like it does on Image 5a and 5b).
4. Skin “horse_harness_x_rein_rope” according to “horse_harness_rein_skeleton”. Image 4 shows the bone list of the skeleton in question.
5. Set the alpha of vertices of the simulated region to “100”. Set the other non-simulated vertices to “0” (see Image 6).

 |  |  | 
------- | ------- | -------- | --------
<img src="/img/horse_reins_simulation_creation/image_4.png"/> | <img src="/img/horse_reins_simulation_creation/image_5a.png"/> | <img src="/img/horse_reins_simulation_creation/image_5b.png"/> | <img src="/img/horse_reins_simulation_creation/image_6.png"/>
**Image 4**; *bones of horse_harness_rein_skeleton.* | **Image 5a**; *side view of horse_harness_x_rein_rope compared to horse_harness_x_rein.* | **Image 5b**; *top view of horse_harness_x_rein_rope (selected mesh) compared to horse_harness_x_rein.* | **Image 6**; *alphas of the selected vertices (red/lighter) are set to “100” since they belong to the simulated region of the rein. The part where the rider holds and the head piece (see Image 1b) are not simulated, hence they are set to “0”.*

### Экспорт мешей в игру

Экспортируйте меши в формате fbx в указанную папку:

[Game Folder]\Modules\[Mod Folder]\AssetSources