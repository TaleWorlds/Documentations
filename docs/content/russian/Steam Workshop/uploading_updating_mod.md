+++
title = "Загрузка/обновление мода"
description = ""
weight = 5
ai_translated = true
+++

## Подготовка вашего модуля к публикации

Вам нужно опубликовать свой модуль через набор инструментов моддинга, чтобы другие игроки могли использовать ваш модуль. Вы можете развернуть его для конечного пользователя, выделенных серверов или других моддеров — всё это объясняется ниже.

### Экспорт модуля с помощью инструментов моддинга

* Откройте Modding Kit через Launcher, предварительно отметив свой мод в списке модулей Launcher'а
* Откройте редактор (Editor) из главного меню UI
* В меню File вверху выберите Publish Module

<img src="/img/uploading_updating_mod/1.png"/>

В всплывающем окне публикации доступны следующие параметры:

|  |  |
| ------ | ----------- |
| <img src="/img/uploading_updating_mod/2.png"/> | <img src="/img/uploading_updating_mod/3.png"/> |

* `Client`: Ваш модуль будет упакован для клиентского использования. Это означает, что игрокам потребуются эти пакеты, чтобы играть в игру. Это минимум, который вам нужно сделать, если вы хотите, чтобы ваш модуль можно было загрузить через Steam Workshop.
* `Dedicated Server`: Ваш модуль также может быть запущен на сервере. Если вы хотите, чтобы ваш мод был доступен и в мультиплеере, отметьте этот пункт.
* `Editor`: Другие игроки смогут открыть ваш модуль в редакторе (Editor) и изменять его. Если вы не упакуете его для редактора, игроки не смогут открыть ваш модуль через редактор.

{{% notice warning %}}
Не забудьте выбрать свой модуль в выпадающем списке «Module». В противном случае вы, скорее всего, случайно опубликуете нативный модуль (Native), что займёт значительное количество времени.
{{% /notice %}}

* После выбора этих опций и своего модуля в выпадающем списке Modules нажмите кнопку Publish.
* После нажатия кнопки Publish появится всплывающее окно для выбора целевой директории. Выберите целевую директорию — доступную для записи папку на вашем компьютере, — и модуль будет скопирован туда в виде готовой к загрузке версии.
* Затем просто загрузите папку мода из целевой директории в Steam Workshop, следуя инструкциям, указанным в разделах «**Создание нового элемента Steam Workshop**» и «**Обновление элемента Steam Workshop**».

{{% notice warning %}}
Если вы, как моддер, собираетесь тестировать свой модуль после загрузки в Steam Workshop, пожалуйста, временно переместите папку вашего модуля из «Steam\steamapps\common\Mount & Blade II Bannerlord\Modules» куда-нибудь ещё. Если вы не переместите её временно, игра попытается получить модуль из Bannerlord/Modules вместо workshop/content/261550.
{{% /notice %}}

## Создание нового элемента Steam Workshop

### Подготовка WorkshopCreate.xml

Скачайте [этот файл](https://download.taleworlds.com/WorkshopCreate.xml) и разместите его в любом удобном месте. Вы также можете создать его самостоятельно со следующим кодом:

	<Tasks>
		<CreateItem/>
		<UpdateItem>
			<ModuleFolder Value="C:\Program Files (x86)\Steam\steamapps\common\Mount &amp; Blade II Bannerlord\Modules\YourModuleName"/>
			<!-- A direct path of your module -->
			<ItemDescription Value="A Bannerlord Mod"/>
			<!-- A description that will be displayed on Steam Workshop, can be edited via the Steam UI -->
			<Tags> 
				<!-- You can use the following tags: -->
				<!-- Type: Graphical Enhancement, Map Pack, Partial Conversion, Sound, Total Conversion, Troops, UI, Utility, Weapons and Armour -->
				<!-- Setting: Native, Antiquity, Dark Ages, Medieval, Musket Era, Modern, Sci-Fi, Fantasy, Oriental, Apocalypse, Other -->
				<!-- Game Mode: Singleplayer, Multiplayer -->
				<!-- Compatible Version: v1.4.5, v1.4.6,... The currently available versions can be found at the Steam Workshop "Browse by Tag" section -->
				<Tag Value="Partial Conversion" />
				<Tag Value="Dark Ages" />
				<Tag Value="Singleplayer" />
				<Tag Value="Multiplayer" />
				<Tag Value="v1.4.6" />
			</Tags>
			<Image Value="C:\Program Files (x86)\Steam\steamapps\common\Mount &amp; Blade II Bannerlord\Modules\YourModuleName\Image.png"/>
			<!-- Determines the featured image displayed on Steam Workshop, a direct path to it must be inserted here (the image should be smaller than 1 MB) -->
			<Visibility Value="Public"/>
			<!-- Determines visibility on Steam Workshop. Can be: Public, FriendsOnly, Private -->
		</UpdateItem>
	</Tasks>

* Откройте файл с помощью Notepad, Notepad++ или других инструментов
* Отредактируйте `Items` в соответствии со своим модулем
	* `ModuleFolder`: Прямой путь к вашему модулю
	* `ItemDescription`: Описание, которое будет отображаться в Steam Workshop; его можно редактировать через интерфейс Steam
	* `Tags`: Позволяет находить ваш мод с помощью фильтрации по категориям. Вот теги, которые можно присвоить вашему элементу:
		* `Type`: Graphical Enhancement, Map Pack, Partial Conversion, Sound, Total Conversion, Troops, UI, Utility, Weapons and Armour
		* `Setting`: Native, Antiquity, Dark Ages, Medieval, Musket Era, Modern, Sci-Fi, Fantasy, Oriental, Apocalypse, Other
		* `Game Mode`: Singleplayer, Multiplayer
		* `Compatible Version`: v1.4.5, v1.4.6,... (текущие доступные версии можно найти в разделе Steam Workshop "Browse by Tag")
		* Рекомендуется использовать только перечисленные выше теги, поскольку именно по ним игроки смогут фильтровать моды. Остальные теги не появятся в списке фильтров, но будут отображаться на странице вашего мода в Steam Workshop
	* `Image`: Определяет главное изображение, отображаемое в Steam Workshop; здесь нужно указать прямой путь к нему (изображение должно быть меньше 1 МБ)
	* `Visibility`: Определяет видимость в Steam Workshop. Может быть: Public, FriendsOnly, Private
* Сохраните изменения, внесённые в `WorkshopCreate.xml`

{{% notice warning %}}
Для успешной загрузки вашего мода должна быть включена функция Steam Cloud для игры. Это можно проверить, щёлкнув правой кнопкой мыши на Mount &amp; Blade II: Bannerlord в своей библиотеке Steam, перейдя в Properties, а затем во вкладку General. Либо включив Steam Cloud для всех игр через окно настроек клиента Steam, во вкладке Cloud.
{{% /notice %}}

{{% notice warning %}}
Во время процесса публикации вы можете столкнуться с ошибкой. Бесконечный вывод следующей строки: Status: k_EItemUpdateStatusInvalid 0/0 — если это происходит, ваша загрузка, возможно, завершилась успешно, и вы можете свободно закрыть консоль. Если загрузка завершилась неудачно, попробуйте снова.
{{% /notice %}}

{{% notice tip %}}
Размер загруженного вами модуля, отображаемый в Steam Workshop, может отличаться от фактического размера модуля. Это нормально.
{{% /notice %}}

### Публикация модуля
* Найдите папку `\Steam\steamapps\common\Mount & Blade II Bannerlord\bin\Win64_Shipping_Client` и убедитесь, что файл `TaleWorlds.MountAndBlade.SteamWorkshop.exe` находится внутри неё
* Введите `cmd` в адресной строке, где отображается путь к папке, и нажмите `Enter`
* Введите `TaleWorlds.MountAndBlade.SteamWorkshop.exe c:\path\WorkshopCreate.xml` в консоли, указав путь к вашему файлу `WorkshopCreate.xml`, и нажмите `Enter`
* Если ошибок не появилось, ваш мод был успешно загружен в Steam Workshop

## Обновление элемента Steam Workshop

### Подготовка WorkshopUpdate.xml

Скачайте [этот файл](https://download.taleworlds.com/WorkshopUpdate.xml) и разместите его в любом удобном месте. Вы также можете создать его самостоятельно со следующим кодом:

	<Tasks>
		<GetItem>
			<ItemId Value="YourWorkshopItemIdHere"/>
			<!-- Can be found in the URL of your workshop item -->
		</GetItem>
		<UpdateItem>
			<ModuleFolder Value="C:\Mount &amp; Blade II Bannerlord\Modules\MyMod"/>
			<!-- A direct path of your module -->	
			<ChangeNotes Value="New cool features" />
			<!-- Insert patch notes -->
			<Tags> 
				<!-- You can use the following tags: -->
				<!-- Type: Graphical Enhancement, Map Pack, Partial Conversion, Sound, Total Conversion, Troops, UI, Utility, Weapons and Armour -->
				<!-- Setting: Native, Antiquity, Dark Ages, Medieval, Musket Era, Modern, Sci-Fi, Fantasy, Oriental, Apocalypse, Other -->
				<!-- Game Mode: Singleplayer, Multiplayer -->
				<!-- Compatible Version: v1.4.5, v1.4.6,... The currently available versions can be found at the Steam Workshop "Browse by Tag" section -->
				<Tag Value="Partial Conversion" />
				<Tag Value="Dark Ages" />
				<Tag Value="Singleplayer" />
				<Tag Value="Multiplayer" />
				<Tag Value="v1.4.6" />
			</Tags>
		</UpdateItem>
	</Tasks>

* Откройте файл с помощью Notepad, Notepad++ или других инструментов
* Отредактируйте `Items` в соответствии со своим модулем
	* `ItemId`: Введите ID вашего модуля из мастерской. Его можно найти, перейдя на страницу своего модуля в мастерской, щёлкнув правой кнопкой мыши на пустом месте и выбрав `Copy Page URL`. Если затем вставить URL куда-нибудь, вы увидите ID.
	* `ModuleFolder`: Прямой путь к вашему модулю
	* `ChangeNotes`: Воспринимайте это как список изменений (патчноуты) — они будут отображаться в разделе «Change Notes» вашего модуля в мастерской
	* `Tags`: Позволяет находить ваш мод с помощью фильтрации по категориям. Обновление тегов можно выполнить через файл `WorkshopUpdate.xml`
* Сохраните изменения, внесённые в `WorkshopUpdate.xml`

### Публикация обновления
* Найдите папку `\Steam\steamapps\common\Mount & Blade II Bannerlord\bin\Win64_Shipping_Client` и убедитесь, что файл `TaleWorlds.MountAndBlade.SteamWorkshop.exe` находится внутри неё
* Введите `cmd` в адресной строке, где отображается путь к папке, и нажмите `Enter`
* Введите `TaleWorlds.MountAndBlade.SteamWorkshop.exe c:\path\WorkshopUpdate.xml` в консоли, указав путь к вашему файлу `WorkshopUpdate.xml`, и нажмите `Enter`
* Если ошибок не появилось, ваш мод был успешно обновлён
