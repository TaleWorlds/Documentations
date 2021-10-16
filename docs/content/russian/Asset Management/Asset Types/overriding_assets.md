+++
title = "Добавление и переопределение ассетов"
description = ""
weight = 1
+++

В RGL _(игровой движок)_ вы можете легко переопределить существующие ассеты или создать новые в редакторе для вашего пользовательского режима. Механизм переопределения работает путем замены существующих ресурсов на те, которые вы указали в каталоге ресурсов вашего модуля. Он пытается сопоставить ваши пользовательские ассеты с теми, которые ранее были зарегистрированы другими модулями по их именам. Это происходит в зависимости от порядка загрузки модулей.

Если **Module A** и **Module B** загружены в дополнение к модулю **Native** соответственно, список конечных ресурсов и их источников будет следующим:

<table style="vertical-align: bottom">
<thead>
    <tr>
        <th>Native</td>
        <th>Module A</td>
        <th>Module B</td>
        <th>Result</td>
    </tr>
</thead>
<tbody>
    <tr>
        <td>adobe_wall<br>tarnished_metal<br>ground_mud<br>marble<br>-<br></td>
        <td>adobe_wall<br>tarnished_metal<br>-<br>-<br>metal_plate</td>
        <td>adobe_wall<br>-<br>ground_mud<br>-<br>-<br></td>
        <td>Module B::adobe_wall<br>Module A::tarnished_metal<br>Module B::ground_mud<br>Native::marble<br>Module A::metal_plate<br></td>
    </tr>
</tbody>
</table>

В настоящее время модифицируемые типы ассетов:

- [Материалы](#overriding-materials)
- [Сетки](#overriding-meshes)
- [Текстуры](#overriding-textures)
- [Физические объекты](#overriding-physics-shapes)

### Иерархия папок

Система ассетов обрабатывает некоторые папки в каталоге модуля специально в соответствии с их именами. Вот список этих папок и их использование:

- **Assets** : Включает редактируемые файлы *.tpac в котором хранятся метаданные каждого ассета.
- **AssetSources** : Includes source files of imported assets(.psd, .fbx).
- **AssetPackages** : Includes read-only *.tpac files. It is generated when a module is packed for client builds. 
- **EmAssetPackages** : Includes read-only *.tpac files. It is generated when a module is packed for editor builds. 
- **DsAssetPackages** : Includes read-only *.tpac files. It is generated when a module is packed for server builds.
- **RuntimeDataCache** : Includes auto-generated data required by engine for each asset. Can be deleted but it might take time to generate from scratch during startup.

### Разрешения на редактирование

Система ассетов ищет разные папки в зависимости от версии исполняемого файла игры. В зависимости от наличия этих папок он решает, можно ли изменить модуль или его можно использовать только в режиме только для чтения. Если вы хотите распространить свой модуль, вы можете упаковать свои ассеты и поделиться упакованными папками, не распространяя тысячи файлов и их источников. У вас есть три варианта упаковки ваших активов:

- **Client** : Others can activate your module to play. You must distribute **AssetPackages** folder.
- **Editor** : Others can use your module in editor but can not modify it. Used if you want others to derive modules from your module. You must distribute **EmAssetPackages** folder.
- **Server** : Used for server builds. All data which is not related to server is stripped out. You must distribute **DsAssetPackages** folder.

Вы также можете поделиться своим модулем так же, как вы его используете, чтобы другие могли его изменять. В этом случае вы должны распределить папки **Assets**, **AssetSources** и, возможно, **RuntimeDataCache**.

### Переопределение материалов
Переопределение материалов может быть выполнено путем создания нового материала с тем же именем, что и материал, который вы хотите переопределить.
Перейдите в каталог ресурсов вашего модуля и щелкните правой кнопкой мыши в пустое место на панели браузера. Создайте новый материал и переименуйте его в то же имя, что и у материала, который вы хотите переопределить.

{{% panel footer="Material of an existing mesh overriden by ModuleA" %}}![](/img/modding/assets/material_override.png){{% /panel %}}
На этом этапе все ссылки на материалы в системе будут перенаправлены на ваш пользовательский материал.
<br><br>

### Переопределение сеток
Модели можно импортировать из файлов нескольких форматов (например, Trf, Fbx). Ресурсы, импортированные из одного файла, группируются по именам в соответствии с <>правилами именования ресурсов<>. Представьте себе файл fbx следующим образом:

- Model.fbx
    - wall(Mesh)
    - wall.lod1(Mesh)
    - wall.lod3(Mesh)
    - bo_wall(Physics Shape)

Согласно соглашениям об именах ресурсов, первые три ресурса будут сгруппированы в одну сетку, в которой три подсетки принадлежат разным LOD. В конце будут импортированы два ресурса из Model.fbx : wall(Mesh) и bo_wall(Physics shape).

Следуя этим правилам, вы можете экспортировать новый файл геометрии (например, fbx), который содержит группу сеток, имена которых начинаются с **wall**. В этом случае новая сетка **wall** будет создана из этих подсеток, а существующая сетка будет полностью заменена той, которую вы указали. Имя файла геометрии не учитывается. Стоит отметить, что переопределение сетки происходит на уровне сетки. Невозможно переопределить одиночную подсетку с помощью переопределения модуля.

{{% panel footer="Existing cube mesh with name **testbox** overriden by ModuleA with a teapot" %}}![](/img/modding/assets/metamesh_override.png){{% /panel %}}
<br><br>

### Переопределение текстур
Переопределение текстур очень похоже на материалы. Вам необходимо импортировать новую текстуру с тем же именем текстуры, которую вы хотите переопределить. Вы также можете переименовать любую уже импортированную текстуру во что-то, что соответствует имени текстуры, которую нужно переопределить.

{{% panel footer="Existing albedo texture with name **roman_ground_d** overriden by ModuleA with a white texture" %}}![](/img/modding/assets/texture_override.png){{% /panel %}}
<br><br>

### Переопределение физических фигур
Для переопределения физических фигур необходимо импортировать физическую форму с тем же именем ресурса, который вы хотите заменить. Установите флажок <>Asset naming conventions<>, чтобы увидеть возможность импорта физических фигур.

{{% panel footer="Существующая форма тора, переопределенная ModuleA с пользовательской формой аквилы" %}}![](/img/modding/assets/physics_shape_override.png){{% /panel %}}