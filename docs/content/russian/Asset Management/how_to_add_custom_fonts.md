+++
title = "Как добавить собственные шрифты"
weight = 3
+++

#### Вступление

В этой документации будут выполняться следующие шаги:

* Настройка файлов и путей
* Генерация шрифтов
* Размещение файлов в папке модуля
* Создание таблиц спрайтов
* Как использовать шрифты в Bannerlord

#### Предварительные условия

* TrueTypeFont file for the font. E.g. (OpenSans-Regular.ttf)
* Mount &amp; Blade II: Bannerlord - Modding Kit downloaded from steam
* Knowledge on generating UI Spritesheets (see: [GENERATING AND LOADING UI SPRITE SHEETS](http://docs.modding.bannerlord.com/asset-management/generating_and_loading_ui_sprite_sheets/))

#### Настройка файлов и путей

* Go to Mount &amp; Blade II Bannerlord\GUI\GauntletUI\Fonts\.
* Make sure the two files below exist in the directory. We will use them to generate our font data.
	* **GenerateFont.bat**
	* **GenerateFontSettings.txt**
* Move your **.ttf** font file to the directory.
* For our example, we will use a font file named **OpenSansRegular.ttf**.
* Open the file: &quot;**GenerateFontSettings.txt**&quot;.
* &quot;**GenerateFontSettings.txt**&quot; default values are:

```text
-fontpath {FONT\_PATH.ttf}
-outputpath {OUTPUT\_PATH.png}
-atlassize 2048 2048
-size 64
-angle 8
-range 16
-padding 16
-smooth 0
-smoothingConstant 0.5-mode 1
```

* Here, we need to change the placeholder variables **{FONT\_PATH.ttf}** and **{OUTPUTPATH.png}** with actual paths.
* The paths here are relative to the directory: **…\bin\Win64_Shipping_wEditor** directory unless you specify a full path.
* Please note that if you want to use paths that contain spaces, you need to put them inside quotes.
* Setting -fontpath:
	* In our example, the variable should be: **-fontpath OpenSansRegular.ttf**.
* Setting -outputpath:
	* This variable determines where the **.png** file should be placed. We should use a **.png** file path to a non-existent file which will be created in the process of generating atlas.
	* In our example we set the -outputpath variable as: **-outputpath OpenSansRegular.png**.
* The contents of **GenerateFontSettings.txt** should now look like this:

```text
-fontpath OpenSansRegular.ttf
-outputpath OpenSansRegular.png
-atlassize 2048 2048
-size 64
-angle 8
-range 16
-padding 16
-smooth 0
-smoothingConstant 0.5-mode 1
```

_If the generated .png file does not contain all the characters for your font, consider increasing the_ **-atlassize**.

#### Генерация шрифтов

* Now that the files are added and the correct paths for generator set up, start the **GenerateFont.bat**.
* If everything is properly set up, the program will not throw any errors and will generate 3 files in the directory which you defined as your **-outputpath**.
	* In our example, the 3 files are:
		* **OpenSansRegular.fnt**
		* **OpenSansRegular.bfnt**
		* **OpenSansRegular.png**
* If you see any errors in the batch script, make sure that the **-fontpath** and **-outputpath** variables are set correctly.
* In our example, the 3 generated files are located in the **…\bin\Win64_Shipping_wEditor\** directory since we put a relative path.

#### Размещение файлов в папке модуля

* На предыдущем шаге мы создали 3 файла. Теперь нам нужно поместить эти файлы в наш модуль.

##### Файлы шрифтов

* Go to **{YOURMODULE}\GUI\Fonts** folder. If your module doesn&#39;t have a **Fonts** folder, create it.
* Move the generated **.fnt** and **.bfnt** files to the **Fonts** folder, in our example they are named **OpenSansRegular.fnt** and **OpenSansRegular.bfnt**.

##### Файл изображения

* Go to **{YOURMODULE}\GUI\SpriteParts** folder. If your module doesn&#39;t have any **GUI** or **SpriteParts** folders, create them.
* In the **SpriteParts** folder, create an empty folder named **ui\_custom\_fonts**.
* If you don&#39;t have a **Config.xml** in your **SpriteParts** folder, create it too.
* At this stage, **SpriteParts** folder should have a folder named **ui\_custom\_fonts** and a file named **Config.xml**.
* Now we can move our **.png** file to the ui\_custom\_fonts folder. In our example, the file is named **OpenSansRegular.png**.

##### Конфигурация

* Чтобы иметь возможность использовать наш шрифт в игре, нам нужно указать в нашем **Config.xml** файле, что наш шрифт должен загружаться автоматически.
* Содержимое Config.xml должно включать этот конфиг:

```xml
<Config>
	<SpriteCategory Name="ui_custom_fonts">
		<PackAllSpritesToUniqueTextures/>
		<SingleChannel/>
		<AlwaysLoad/>
		<EdgeSize Value="0" />
	</SpriteCategory>
</Config>
```

* Note that **ui\_custom\_fonts** here comes from the name of the folder you created in **{YOURMODULE}\GUI\SpriteParts**.

#### Генерация таблиц спрайтов

* Теперь необходимо сгенерировать таблицы спрайтов шрифта, используя файл **.png**, созданный в последнем процессе.
* Мы кратко расскажем, как добавить новый шрифт в таблицы спрайтов. Подробное объяснение см. [GENERATING AND LOADING UI SPRITE SHEETS](http://docs.modding.bannerlord.com/asset-management/generating_and_loading_ui_sprite_sheets/).
    * Запустите генератор таблицы спрайтов, просто запустив **Mount &amp; Blade II Bannerlord\bin\Win64\_Shipping\_wEditor\TaleWorlds.TwoDimension.SpriteSheetGenerator.exe**.
    * Если все было настроено правильно, вывод генератора таблицы спрайтов должен выглядеть так:
      <img src="/img/how_to_add_custom_fonts/spritesheet_generator.png"/>
    * Вы должны импортировать шрифт через браузер ресурсов в игре. Что было объяснено в [документе](http://docs.modding.bannerlord.com/asset-management/generating_and_loading_ui_sprite_sheets/) выше.

#### Использование недавно добавленных шрифтов

* Если мы все сделали правильно, мы сможем использовать наши недавно добавленные шрифты в игре.
* Чтобы использовать шрифт, мы можем объявить его имя в кисти, например:

```xml
<Brush Name="CustomBrush.With.New.Font" Font="OpenSansRegular" TextHorizontalAlignment="Right">
	<Styles>
		<Style Name="Default" FontColor="#F4E1C4FF" TextGlowColor="#000000FF" TextOutlineColor="#000000FF" TextOutlineAmount="0.01" TextGlowRadius="0" TextBlur="0" FontSize="20" />
	</Styles>
</Brush>
```

* Теперь все виджеты, использующие эту кисть, будут отображаться с использованием нашего недавно добавленного шрифта.

#### Установка шрифтов по умолчанию для языка

* Для некоторых языков вам могут потребоваться собственные пользовательские шрифты. В этом случае вы можете установить шрифт по умолчанию для своего языка.
* To achieve this, create a file named **{YOURMODULE}Languages.xml** and put it in the folder: **{YOURMODULE}\GUI\Fonts** folder.
* Please note that you should give your **\*Languages.xml** file a unique name, and it should always end with &quot; **Languages**&quot; (e.g. _ **MyModuleLanguages.xml** _). For more information please see: [ADDING &amp; OVERRIDING ASSETS](http://docs.modding.bannerlord.com/asset-management/asset-types/overriding_assets/)
* В файле новых языков вы можете определить новый языковой узел, переопределить существующие и изменить язык игры по умолчанию.
* Узлы языка используются для сопоставления встроенных шрифтов с вашими пользовательскими шрифтами.
* Например, если вы хотите установить шрифты по умолчанию для **Турецкого** языка, ваш узел должен выглядеть так:

```xml
<Languages>
	<!-- Turkish -->
	<Language id="Türkçe" DefaultFont="OpenSans-Regular" LineSeperatorChar="-">
		<Map From="FiraSansExtraCondensed-Light" To="OpenSans-Regular"/>
		<Map From="FiraSansExtraCondensed-Medium" To="OpenSans-Regular"/>
		<Map From="FiraSansExtraCondensed-Regular" To="OpenSans-Regular"/>
		<Map From="Galahad" To="OpenSans-Regular"/>
		<Map From="Galahad_Numbers_Bold" To="OpenSans-Regular"/>
	</Language>
</Languages>
```

* Здесь мы установили шрифт по умолчанию для турецкого языка как "OpenSansRegular". И также сопоставили некоторые встроенные шрифты с нашими пользовательскими.
* После сохранения этого файла должны быть установлены шрифты по умолчанию для вашего языка, и вы должны увидеть правильный шрифт для вашего языка.