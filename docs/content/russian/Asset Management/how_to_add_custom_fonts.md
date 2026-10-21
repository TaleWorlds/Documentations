+++
title = "Как добавить пользовательские шрифты"
weight = 15
ai_translated = true
+++


#### Введение

Этот документ проведёт вас через следующие шаги:

* Настройка файлов и путей
* Генерация шрифтов
* Размещение файлов в папке модуля
* Генерация спрайт-листов (Sprite Sheets)
* Как использовать шрифты в Bannerlord

#### Предварительные требования

* Файл TrueTypeFont для шрифта. Например (OpenSans-Regular.ttf)
* Mount &amp; Blade II: Bannerlord - Modding Kit, загруженный из Steam
* Знания о генерации UI-спрайт-листов (см.: [Generating and Loading UI Sprite Sheets]({{< ref "generating_and_loading_ui_sprite_sheets.md" >}}))

#### Настройка файлов и путей

* Перейдите в Mount &amp; Blade II Bannerlord\GUI\GauntletUI\Fonts\.
* Убедитесь, что в каталоге присутствуют два файла ниже. Мы будем использовать их для генерации наших данных шрифта.
	* **GenerateFont.bat**
	* **GenerateFontSettings.txt**
* Переместите файл вашего шрифта **.ttf** в этот каталог.
* В нашем примере мы будем использовать файл шрифта под названием **OpenSansRegular.ttf**.
* Откройте файл: &quot;**GenerateFontSettings.txt**&quot;.
* Значения по умолчанию для &quot;**GenerateFontSettings.txt**&quot;:

		-fontpath {FONT\_PATH.ttf}
		-outputpath {OUTPUT\_PATH.png}
		-atlassize 2048 2048
		-size 64
		-angle 8
		-range 16
		-padding 16
		-smooth 0
		-smoothingConstant 0.5-mode 1

* Здесь нам нужно заменить переменные-заполнители **{FONT\_PATH.ttf}** и **{OUTPUTPATH.png}** на фактические пути.
* Пути здесь указываются относительно каталога: **…\bin\Win64_Shipping_wEditor**, если вы не указываете полный путь.
* Обратите внимание, что если вы хотите использовать пути, содержащие пробелы, вам нужно заключить их в кавычки.
* Настройка -fontpath:
	* В нашем примере переменная должна быть: **-fontpath OpenSansRegular.ttf**.
* Настройка -outputpath:
	* Эта переменная определяет, куда должен быть помещён файл **.png**. Мы должны использовать путь к файлу **.png**, который ещё не существует и будет создан в процессе генерации атласа.
	* В нашем примере мы устанавливаем переменную -outputpath как: **-outputpath OpenSansRegular.png**.
* Содержимое **GenerateFontSettings.txt** теперь должно выглядеть так:

		-fontpath OpenSansRegular.ttf
		-outputpath OpenSansRegular.png
		-atlassize 2048 2048
		-size 64
		-angle 8
		-range 16
		-padding 16
		-smooth 0
		-smoothingConstant 0.5-mode 1

_Если сгенерированный файл .png не содержит всех символов для вашего шрифта, рассмотрите возможность увеличения_ **-atlassize**.

#### Генерация шрифтов

* Теперь, когда файлы добавлены и правильные пути для генератора настроены, запустите **GenerateFont.bat**.
* Если всё настроено правильно, программа не выдаст никаких ошибок и сгенерирует 3 файла в каталоге, который вы определили как ваш **-outputpath**.
	* В нашем примере эти 3 файла:
		* **OpenSansRegular.fnt**
		* **OpenSansRegular.bfnt**
		* **OpenSansRegular.png**
* Если вы видите какие-либо ошибки в скрипте bat-файла, убедитесь, что переменные **-fontpath** и **-outputpath** заданы правильно.
* В нашем примере 3 сгенерированных файла находятся в каталоге **…\bin\Win64_Shipping_wEditor\**, поскольку мы указали относительный путь.

#### Размещение файлов в папке модуля

* На предыдущем шаге мы сгенерировали 3 файла. Теперь нам нужно разместить эти файлы в нашем модуле.

##### Файлы шрифтов

* Перейдите в папку **{YOURMODULE}\GUI\Fonts**. Если в вашем модуле нет папки **Fonts**, создайте её.
* Переместите сгенерированные файлы **.fnt** и **.bfnt** в папку **Fonts**; в нашем примере они называются **OpenSansRegular.fnt** и **OpenSansRegular.bfnt**.

##### Файл изображения

* Перейдите в папку **{YOURMODULE}\GUI\SpriteParts**. Если в вашем модуле нет папок **GUI** или **SpriteParts**, создайте их.
* В папке **SpriteParts** создайте пустую папку с названием **ui\_custom\_fonts**.
* Если у вас нет файла **Config.xml** в папке **SpriteParts**, создайте и его.
* На этом этапе папка **SpriteParts** должна содержать папку с названием **ui\_custom\_fonts** и файл с названием **Config.xml**.
* Теперь мы можем переместить наш файл **.png** в папку ui\_custom\_fonts. В нашем примере файл называется **OpenSansRegular.png**.

##### Конфигурация

* Чтобы иметь возможность использовать наш шрифт в игре, нам нужно указать в нашем файле **Config.xml**, что наш шрифт должен загружаться автоматически.
* Содержимое Config.xml должно включать этот конфиг:

		<Config>
			<SpriteCategory Name="ui_custom_fonts">
				<PackAllSpritesToUniqueTextures/>
				<SingleChannel/>
				<AlwaysLoad/>
				<EdgeSize Value="0" />
			</SpriteCategory>
		</Config>

* Обратите внимание, что **ui\_custom\_fonts** здесь взято из названия папки, которую вы создали в **{YOURMODULE}\GUI\SpriteParts**.

#### Генерация спрайт-листов

* Теперь необходимо сгенерировать спрайт-листы шрифта, используя файл **.png**, созданный в предыдущем процессе.
* Мы вкратце рассмотрим, как добавить ваш новый шрифт в спрайт-листы. Подробное объяснение см. здесь: [Generating and Loading UI Sprite Sheets]({{< ref "generating_and_loading_ui_sprite_sheets.md" >}}).
	* Запустите генератор спрайт-листов, просто запустив **Mount &amp; Blade II Bannerlord\bin\Win64\_Shipping\_wEditor\TaleWorlds.TwoDimension.SpriteSheetGenerator.exe**.
	* Если всё было настроено правильно, результат работы генератора спрайт-листов должен выглядеть так:
<img src="/img/how_to_add_custom_fonts/spritesheet_generator.png"/>
	* Вам следует импортировать шрифт через обозреватель ресурсов в игре. Это было объяснено в [документе]({{< ref "generating_and_loading_ui_sprite_sheets.md" >}}) выше.

#### Использование недавно добавленных шрифтов

* Если мы сделали всё правильно, мы должны иметь возможность использовать наши недавно добавленные шрифты в игре.
* Чтобы использовать шрифт, мы можем объявить его название в кисти (brush), например:

		<Brush Name="CustomBrush.With.New.Font" Font="OpenSansRegular" TextHorizontalAlignment="Right">
			<Styles>
				<Style Name="Default" FontColor="#F4E1C4FF" TextGlowColor="#000000FF" TextOutlineColor="#000000FF" TextOutlineAmount="0.01" TextGlowRadius="0" TextBlur="0" FontSize="20" />
			</Styles>
		</Brush>

* Теперь любые виджеты, использующие эту кисть, будут отрисовываться с использованием нашего недавно добавленного шрифта.

#### Настройка шрифтов по умолчанию для языка

* Для некоторых языков вам могут понадобиться собственные пользовательские шрифты. Если это ваш случай, вы можете установить шрифт по умолчанию для вашего языка.
* Чтобы этого достичь, создайте файл с названием **{YOURMODULE}Languages.xml** и поместите его в папку: **{YOURMODULE}\GUI\Fonts**.
* Обратите внимание, что вы должны дать вашему файлу **\*Languages.xml** уникальное название, и оно всегда должно заканчиваться на &quot;**Languages**&quot; (например, _ **MyModuleLanguages.xml** _). Для получения дополнительной информации см.: [Adding &amp; Overriding Assets]({{< ref "overriding_assets.md" >}})
* В новом файле языка вы можете определить новый узел языка, переопределить существующие и изменить язык игры по умолчанию.
* Узлы языка используются для сопоставления встроенных шрифтов с вашими пользовательскими шрифтами.
* Например, если вы хотите установить шрифты по умолчанию для **турецкого** языка, ваш узел должен выглядеть так:

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

* Здесь мы установили шрифт по умолчанию для турецкого языка как &quot;OpenSansRegular&quot;. А также сопоставили некоторые встроенные шрифты с нашими пользовательскими.
* После сохранения этого файла шрифты по умолчанию для вашего языка должны быть настроены, и вы должны увидеть правильный шрифт для вашего языка.
