+++
title = "Создание и загрузка таблиц спрайтов пользовательского интерфейса"
weight = 3
+++

#### Вступление
Спрайты - это двухмерные изображения, которые в основном используются в пользовательском интерфейсе игры. Таблицы спрайтов - это коллекция таких изображений. Другими словами, спрайты упаковываются вместе, чтобы сформировать лист спрайтов. В этой документации будут выполняться следующие шаги:

* Добавление новых спрайтов.
* Создание листов спрайтов из добавленных вами спрайтов.
* Импорт листов спрайтов в ваш модуль.
* Использование спрайтов в файлах UI XML.
* Загрузка и выгрузка категорий спрайтов.

#### Предпосылки
* Подмодуль создан в INSTALLATION_PATH\Mount & Blade II Bannerlord\Modules\
* Известно как собрать проект в Integrated Development Environment (IDE) например Visual Studio.
* Mount & Blade II: Bannerlord - Modding Kit загружен в Steam.

#### Добавление спрайтов
* Создайте новую папку с именем GUI в Modules\YOUR_MODULE_NAME\
* Создайте новую папку с именем SpriteParts во вновь созданной папке GUI.
* Создайте новую папку с именем ui_{YOUR_CATEGORY_NAME} в созданной папке SpriteParts. В этой документации он будет называться **ui_mycategory**.
* Примечание. Контент внутри ui_{YOUR_CATEGORY_NAME} будет помещен в одну категорию под названием YOUR_CATEGORY_NAME. Все спрайты в категории загружаются и выгружаются вместе. Предлагается разделить ваши спрайты на категории (вместо того, чтобы иметь только одну категорию), чтобы избежать загрузки ненужных спрайтов. Например, вы можете создать новый экран в игре, который требует загрузки определенных спрайтов. Эти спрайты можно упаковать в категорию, и как только этот экран будет открыт, вы сможете загрузить только соответствующие спрайты, а затем, когда экран будет закрыт, вы сможете выгрузить их (см. Раздел «Загрузка и выгрузка категорий спрайтов»).
* Поместите свои спрайты в папку ui_{YOUR_CATEGORY_NAME}. Например, этот спрайт добавлен и назван **mysprite.png**:

<img src="/img/sprite_sheets/1.png"/>

#### Генерация таблиц спрайтов
Чтобы сгенерировать листы спрайтов, запустите TaleWorlds.TwoDimension.SpriteSheetGenerator.exe расположенный в  INSTALLATION_PATH\Mount & Blade II Bannerlord\bin\Win64_Shipping_wEditor. Если вы выполнили указанные выше действия, после запуска SpriteSheetGenerator.exe вы должны увидеть следующее окно:

<img src="/img/sprite_sheets/2.PNG" width="1200px"/>

SpriteSheetGenerator.exe создаст две папки с именами Assets и AssetSources в Modules\YOUR_MODULE_NAME. Он также создаст файл SpriteData.xml (с префиксом имени вашего модуля) в разделе Modules\YOUR_MODULE_NAME\GUI.

#### Импорт созданной таблицы спрайтов
Чтобы использовать спрайты в ваших таблицах спрайтов, вы также должны импортировать их из браузера ресурсов. Выполните следующие действия, чтобы импортировать лист спрайтов:

* Убедитесь, что вы встроили свой проект в Modules\YOUR_MODULE_NAME\bin\Win64_Shipping_wEditor (в дополнение к Win64_Shipping_Client). Если ваш проект не собран должным образом, вы получите сбой при запуске.
* Запустите Mount & Blade II: Bannerlord - Modding Kit из Steam.
* Убедитесь, что ваш режим выбран в разделе «Моды» на панели запуска, затем нажмите «Играть».
* В главном меню нажмите Alt + `, чтобы открыть консоль.
* Введите resource.show_resource_browser и нажмите Enter.

<img src="/img/sprite_sheets/3.PNG" width="1200px"/>

При этом должен открыться браузер ресурсов:

<img src="/img/sprite_sheets/4.PNG" width="1200px"/>

Сверните папку Native в левой части браузера ресурсов, чтобы легко увидеть ваш модуль. Затем выберите свой модуль.

<img src="/img/sprite_sheets/5.PNG" width="1200px"/>

Откройте папку GauntletUI в вашем модуле. Затем нажмите кнопку «Сканировать новые файлы ресурсов», на которую указывает красная стрелка внизу (стрелка справа).

<img src="/img/sprite_sheets/6.png" width="1200px"/>

Откроется новое окно:

<img src="/img/sprite_sheets/7.PNG"/>

Убедитесь, что ваша категория выбрана (в примере это ui_mycategory), затем нажмите кнопку «Импорт». Затем вы должны увидеть что-то похожее на это:

<img src="/img/sprite_sheets/8.PNG" width="1200px"/>

Закройте браузер ресурсов и игру.
Теперь вы должны увидеть новый файл с именем ui_{YOUR_CATEGORY_NAME}_1_tex.tpac в Modules\YOUR_MODULE_NAME\Assets\GauntletUI.

#### Использование спрайтов в UI XML файлах
Теперь вы можете использовать спрайты в таблицах спрайтов, которые вы создали (вам также необходимо загрузить соответствующую категорию, которая объясняется ниже в разделе «Загрузка и выгрузка категорий спрайтов»). Спрайты используются в XML-файлах пользовательского интерфейса. Вы можете ссылаться на свои спрайты по их именам. Вы можете найти имена своих спрайтов в файле SpriteData.xml (с префиксом имени вашего модуля), который находится в Modules\YOUR_MODULE_NAME\GUI.
В качестве примера мы создадим новый UI XML-файл. Для этого вернитесь в папку с именем GUI в разделе Modules\YOUR_MODULE_NAME и создайте новую папку с именем Prefabs. Создайте новый файл с именем MyXml.xml в папке Prefabs. Теперь вы можете ссылаться на свои спрайты в этом файле как Sprite="mysprite". Например, содержимое файла MyXml.xml может быть:

```xml
<Prefab>
	<Window>
		<Widget DoNotAcceptEvents="true" DoNotPassEventsToChildren="true" WidthSizePolicy="StretchToParent" HeightSizePolicy="StretchToParent">
			<Children>
				<ImageWidget WidthSizePolicy="Fixed" HeightSizePolicy="Fixed" SuggestedWidth="128" SuggestedHeight="128" HorizontalAlignment="Center" VerticalAlignment="Center" Sprite="mysprite"/>
			</Children>
		</Widget>
	</Window>
</Prefab>
```

#### Загрузка и выгрузка категории спрайтов
Чтобы использовать добавленные вами спрайты, вам необходимо их загрузить. У вас есть два варианта:

1. Загрузка и выгрузка вручную
* Разработчик имеет больше возможностей для контроля. Они могут выбирать, когда категории спрайтов загружаются и выгружаются. Таким образом, они могут управлять использованием памяти и производительностью.
* Требуется написание кода. Этот вариант более сложный, чем вариант AlwaysLoad.

2. Использование опции AlwaysLoad
* Категории спрайтов загружаются при запуске автоматически.
* Категории хранятся в памяти до закрытия игры. Таким образом, нет необходимости загружать их вручную каждый раз, когда они используются.
* Уменьшено время загрузки пользовательского интерфейса за счет увеличения использования памяти.
* Легко использовать.

##### 1. Загрузка и выгрузка вручную
Здесь мы покажем, как загружать и выгружать категории спрайтов вручную. В приведенном ниже примере мы переопределяем методы OnGameStart и OnGameEnd класса MBSubModuleBase для добавления и удаления глобального слоя MyScreen соответственно. Обратите внимание, что конструктор MyScreen загружает категорию спрайтов и пользовательский интерфейс XML, которые мы создали в предыдущих разделах. Мы также выгружаем категорию спрайтов внутри метода OnFinalize.

Если вы собираетесь скопировать приведенный ниже код, не забудьте изменить пространство имен и имя функции Main. Они должны совпадать с полями в вашем SubModule.xml. Другими словами, вы должны изменить SpritesheetDocumentation (пространство имен) на YOUR_MODULE_NAME и Main (имя функции Main) на YOUR_MAIN_FUNCTION_NAME в этом поле SubModule.xml:

```xml
<SubModuleClassType value="YOUR_MODULE_NAME.YOUR_MAIN_FUNCTION_NAME"/>
```

В противном случае они не будут распознаны, и игра вылетит при запуске.

	using TaleWorlds.Core;
	using TaleWorlds.MountAndBlade;
	using TaleWorlds.Engine.Screens;
	using TaleWorlds.Engine.GauntletUI;
	using TaleWorlds.GauntletUI.Data;
	using TaleWorlds.TwoDimension;

	namespace SpritesheetDocumentation
	{
		public class Main : MBSubModuleBase
		{
			private MyScreen _myScreen;
			
			protected override void OnSubModuleLoad()
			{

			}
			
			protected override void OnGameStart(Game game, IGameStarter gameStarterObject)
			{
				base.OnGameStart(game, gameStarterObject);
				_myScreen = new MyScreen();
				ScreenManager.AddGlobalLayer(_myScreen, true); // add MyScreen on game start
			}
			
			public override void OnGameEnd(Game game)
			{
				base.OnGameEnd(game);
				_myScreen.OnFinalize();
				ScreenManager.RemoveGlobalLayer(_myScreen); // remove MyScreen on game end
			}
		}

		public class MyScreen : GlobalLayer
		{
			private GauntletLayer _gauntletLayer;
			private IGauntletMovie _gauntletMovie;
			private SpriteCategory _category;

			public MyScreen()
			{
				var spriteData = UIResourceManager.SpriteData;
				var resourceContext = UIResourceManager.ResourceContext;
				var resourceDepot = UIResourceManager.UIResourceDepot;
				
				_category = spriteData.SpriteCategories["ui_mycategory"]; // select which category to load, put your category name here
				_category.Load(resourceContext, resourceDepot); // load the selected category
				
				_gauntletLayer = new GauntletLayer(2);
				Layer = (ScreenLayer)_gauntletLayer;
				
				_gauntletMovie = _gauntletLayer.LoadMovie("MyXml", null); // load the ui xml in Prefabs folder
			}

			public void OnFinalize()
			{
				// unload ui xml, sprite category, layer, etc.
				_gauntletMovie = null;
				_category.Unload();
				_gauntletLayer = null;
			}
		}
	}

##### 2. Использование опции AlwaysLoad
Вместо того чтобы вручную загружать категории спрайтов, как в разделе «Загрузка и выгрузка вручную», вы можете выбрать, какие категории спрайтов должны загружаться автоматически при запуске включив параметр AlwaysLoad для этих категорий. Если разработчик не выгружает их вручную, категории, для которых включена опция AlwaysLoad, будут храниться в памяти до закрытия игры, чтобы вам не приходилось загружать их вручную каждый раз, когда они используются. Включение параметра AlwaysLoad уменьшает время загрузки пользовательского интерфейса (поскольку эти категории загружаются только один раз при запуске), но увеличивает использование памяти (поскольку эти категории будут храниться в памяти, даже если они не используются). Эта опция очень полезна для категорий, которые часто загружаются и выгружаются (например, категория которая используется на экране, который часто открывается и закрывается).

Примечание. Эта функция была выпущена с версией e1.6.2. Если вы используете более раннюю версию и все еще хотите использовать опцию AlwaysLoad, переключите игру и набор инструментов для моддинга на версию e1.6.2 или более новую.

Чтобы включить параметр AlwaysLoad для категории, выполните следующие действия:

Создайте новый XML-файл с именем Config.xml в папке Modules\YOUR_MODULE_NAME\GUI\SpriteParts. Скопируйте и вставьте в Config.xml следующее:

```xml
<Config>
	<SpriteCategory Name="ui_{YOUR_CATEGORY_NAME}">
		<AlwaysLoad/>
	</SpriteCategory>
</Config>
```

Замените ui_{YOUR_CATEGORY_NAME} своей категорией. Затем сгенерируйте таблицы спрайтов, выполнив действия, описанные в разделе «Создание таблиц спрайтов» выше. Чтобы проверить, все ли в порядке, откройте файл с именем {YOUR_MODULE_NAME} SpriteData.xml, который находится в Modules\YOUR_MODULE_NAME\GUI. Там вы должны увидеть, что опция AlwaysLoad включена для категорий, которые вы выбрали в Config.xml:

```xml
<SpriteData>
	<SpriteCategories>
		<SpriteCategory>
			<Name>ui_{YOUR_CATEGORY_NAME}</Name>
			<AlwaysLoad />
			<SpriteSheetCount>1</SpriteSheetCount>
			<SpriteSheetSize ID="1" Width="512" Height="512" />
		</SpriteCategory>
	</SpriteCategories>
	...
</SpriteData>
```

Вам не нужно изменять/добавлять какой-либо код для загрузки новой категории таблицы спрайтов.

#### Заключение
Убедитесь, что вы создали экран и загрузили UI XML-файл, который вы создали в разделе «Использование спрайтов в UI XML-файлах», чтобы увидеть результат ниже.

Примечание. Если вы добавили категорию спрайтов с опцией AlwaysLoad и не использовали код, опубликованный в разделе "Загрузка и выгрузка вручную", вы можете написать свой собственный код для создания экрана и загрузки UI XML. Если вы не знаете как это сделать, тогда вы можете скопировать код из раздела "Загрузка и выгрузка вручную" (также прочтите подробности в этом разделе) и удалить следующие строки, поскольку вы использовали параметр AlwaysLoad и они вам не нужны для загрузки категорий вручную:

	var spriteData = UIResourceManager.SpriteData;
	var resourceContext = UIResourceManager.ResourceContext;
	var resourceDepot = UIResourceManager.UIResourceDepot;
	
	_category = spriteData.SpriteCategories["ui_mycategory"]; // select which category to load, put your category name here
	_category.Load(resourceContext, resourceDepot); // load the selected category

Вы также можете удалить поле _category и удалить его ссылки.

* Убедитесь, что вы встроили свой проект в Modules\YOUR_MODULE_NAME\bin\Win64_Shipping_Client.
* Запустите игру (не Modding Kit) из Steam и убедитесь, что ваш модуль выбран в разделе «Моды» в лаунчере, затем нажмите «Play».
* Создайте новую кампанию или загрузите совместимый файл сохранения, чтобы открыть карту кампании. Оба они начнут игру. Обратите внимание, что в написанном нами коде экран добавляется после запуска игры (проверьте метод OnGameStart).
* После того как вы запустите игру, создав новую кампанию, вы должны увидеть этот экран:

<img src="/img/sprite_sheets/9.PNG" width="1200px"/>