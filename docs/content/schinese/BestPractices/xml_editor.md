+++
title = "Getting Started with XML Editor"

[menu.main]
identifier = "xml_editor"
parent = "bestpractices"
+++

#### Module
Bannerlord consists of different modules, which give it different functionality. You can think of them as game mods. This approach allows players to easily mod the game. The modules are inside the Mount & Blade II Bannerlord installation folder, called `Modules`.
#### XML
XML stands for E**x**tensible **M**arkup **L**anguage, which allows the storage of data related to the game. If we want to add some data to a Module, we would create an XML document within it, or add it to an existing XML document.
#### XSD (Schema files)
XSD stands for **X**ML **S**chema **D**efinition. It allows for a validation layer for data that is provided through XML files. Each XML file in Bannerlord has a related schema file. For example, schema files provide a schema for a culture object, and it looks something like this:

- Culture
	- Name
	- Id
	- Description
	- …

As you can see, these files are schema for how we are going to structure our XML files. 99% of the time, the XML editor prevents you from making a change that is not allowed in the schema files. If, by any chance, you make a change that makes the XML file not fit the schema file, you are going to get an error while saving the file, thus allowing you to fix your mistake.
#### XSLT
XSLT stands for E**x**tensible **S**tylesheet **L**anguage **T**ransformations. It allows for the transformation of existing XML files into new ones, based on the defined rules. These rules get applied to the XML files when they are being loaded into the game.

<img src="/img/xml_editor/1.png" style="max-width:800px; height:auto;" />

Example use case: Assume that we would like to make changes for some culture in the game, but they are defined in one of the official modules. We cannot directly open and edit the official module, as that change will no longer be part of our own module. 

Therefore, instead of changing the XML file, we create rules with XSLT inside our own module, which transform the existing XML file in the related official module.

#### Getting Started with XML Editor
The XML Editor is a program that allows you to:

- Edit your module’s XML files with schema-aware validation that prevents invalid changes.
- Safely modify official and other module data via XSLT, generating non-destructive transformation rules.
	- Accomplish the above two steps through UI rather than text editors.

You can access the XML Editor through the `Mount & Blade II: Bannerlord Modding Kit` on Steam. After installing the Kit, you’ll find the XML Editor inside the `XMLEditor` folder in the game’s root directory.

Starting the XML editor for the first time, you will be asked to adjust the settings for the editor. Choose yes, and you will see the settings window.

<img src="/img/xml_editor/2.png" style="max-width:800px; height:auto;" />

First, you need to select your game folder. It defaults to the Steam version of the game. Other settings are optional, and you can leave them as they are.

- **Game Folder**: The folder where your game is installed. If the path is not valid, you’ll get a red warning. The editor cannot function without the correct folder setup.
- **Editor Theme**: Changes the overall color for the editor and editor windows.
- **Use accent colors for windows**: Changes the window and title colors based on the accent color.
- **Disable warnings showing in the inspector**: Disables any warnings that might be shown in the inspector. Generally not recommended unless you know what you are doing.
- **Enable XSLT editing (experimental)**: Enables the XSLT editing functionality for the editor. XSLT editing works but is experimental and may not be very stable. Some features that exist on direct XML editing may not be available in the XSLT mode.

The editor configuration file is saved directly next to the Bannerlord configuration file folder - `Documents\Mount and Blade II Bannerlord\Configs\xml_editor_config.json`. If any problem occurs with your settings, you can always delete the configuration file and restart the editor, which will recreate the settings file.

You can access settings from the main window toolbar, `File` -> `Settings`, or by choosing the `Change Settings` option inside the Module Selection Window.

After confirming your settings, click the `Save and Close` button. You’ll be navigated to the Module Selection window.
##### What is an Active Module?
An active module is used to describe your intent to the editor. It allows the editor to choose between directly editing the XML file or creating a rule by creating an XSLT file.

<img src="/img/xml_editor/3.png" style="max-width:800px; height:auto;" />

In the module selection window, you are going to see modules that are located in the game folder that you have chosen. From here, you want to select the module that you want your work to be part of. XML Editor only supports direct editing of your or third-party modules. If you want to modify the values of the official modules, you’ll need to select your mod as active and use XSLT editing to edit official modules.
#### Editor Interface and Editing XML Files
After choosing the module that you want to work on, you are going to be greeted with the XML editor. In our case, we’ve chosen an empty mod that only has an `items.xml` file related to it.

<img src="/img/xml_editor/4.png" style="max-width:800px; width:100%; height:auto;" />

To quickly go over the starting interface;

- At the top, you can see the editor toolbar. You can access some quick operations from here, like reloading the editor or opening some additional editor windows, like the dependency editor.
- The center part is your main editor. Currently, it is displaying the schema files that are related to the game. Selecting any of the schemas will show you related XML files to that schema.
- At the bottom, there is an active module selection button. It shows you which module is currently active, and if you want, you can click on it to change your active module. Changing the active module will reload the editor.

Since our example mod only has an `items.xml` which is related to the Items schema, we will continue our guide by selecting the Items schema.

<img src="/img/xml_editor/5.png" style="max-width:800px; width:100%; height:auto;" />

Selecting a schema opens us to the document explorer window. The document explorer shows us every XML file that is related to the selected schema. You can also create a new XML document for the selected module and schema. The names of these files are shown as `[Module Name].[Xml Name]`. Let’s continue with selecting the Example Mod.items file.

<img src="/img/xml_editor/6.png" style="max-width:800px; width:100%; height:auto;" />

Once we select the target document, we are greeted with the `Element Explorer` window, which shows us the top-level elements in our XML file. You can compare the Element Explorer with the exact same document screenshot we’ve added below to help you understand exactly what you are seeing. On the bottom, you can see a button to create new top-level elements and the save button for the file to save your changes.

<img src="/img/xml_editor/7.png" style="max-width:500px; height:auto;" />

To edit one of these elements, you can click on the element in the Element Explorer window. This will open us to our final window, the `Inspector Window`. Inspector Window allows you to see all the attributes and child elements that are related to the selection in the Element Explorer window.

<img src="/img/xml_editor/8.png" style="max-width:800px; width:100%; height:auto;" />

In the Inspector Window, every dropdown represents an XML element. You can do element-related changes by clicking on the cogwheel icon next to the element that you want to apply changes to. You can make changes like creating a child element or deleting the selected element.

Under each dropdown, you can see fields being displayed. These fields are attributes of the XML element. `Undefined` means that the attribute does not exist. It’s marked this way to make sure we can differentiate between empty values and attributes that don’t have a value. Right-clicking on fields will also show you some options, like removing attributes from the element.

The fields in the XML editor are smart. They try to show appropriate fields, like a checkbox for a boolean field, and fall back to a text field. They also check the requirements from the schema file and warn you if there are any problems. Fields with `Required` marked next to them are required by the schema file. If the new file is not compatible with the schema file, or a required field is missing, it will prevent you from saving the file. You’ll be displayed with appropriate errors so that you can fix them.

After making changes, make sure to click the save button. It’s also important to note that there is no element-level save feature. Once you make changes, you need to save the entire document.

#### Editing Official Modules using XSLT
To edit official modules, you need to enable the XSLT editing mode. Open the settings window from `File` -> `Settings`, and make sure the `Enable XSLT editing` box is checked. Once that is done, if we click on any schema file, we are also going to see related XML files from other modules. We can differentiate the XSLT editing by the yellow warning icon on the right side of the XML file.

<img src="/img/xml_editor/9.png" style="max-width:800px; width:100%; height:auto;" />

For demo purposes, we will continue by selecting the `mpitems` file, which is part of the Native module of the game.

<img src="/img/xml_editor/10.png" style="max-width:800px; width:100%; height:auto;" />

We can now see the elements that are part of the `Native.mpitems` file. One thing to note here is that XSLT editing does not support deleting an element. Instead, we can replace the element with an empty one. Let’s continue by choosing an element to edit.

<img src="/img/xml_editor/11.png" style="max-width:800px; width:100%; height:auto;" />

We’ve chosen the `mp_pointed_skullcap_over_cloth_headwrap` item. You can see that there is an error in the inspector preventing us from making any edits. That is because to make XSLT edits, our module needs to be dependent on the target module, Native, in this case. We can quickly fix this error by heading over to the `Window` -> `Dependency Editor`.

<img src="/img/xml_editor/12.png" style="max-width:800px; width:100%; height:auto;" />

`Dependency Editor` allows us to edit the dependencies of our module. On the left side, we see modules that we are not dependent upon. We can click on a module on the left and add it as a dependency. We will choose Native, since mpitems is part of the Native, and then choose `Add Dependency`. In the end, it will look like this:

<img src="/img/xml_editor/13.png" style="max-width:800px; width:100%; height:auto;" />

We can now close the Dependency Editor and return to the Inspector. You’ll see that the error is gone, and there is only a warning, telling us that we are using XSLT and not direct XML editing. We can ignore this warning.

<img src="/img/xml_editor/14.png" style="max-width:800px; width:100%; height:auto;" />

Our setup is done, and we can continue editing the element just like we are editing some other XML element. On the backend, the editor will be translating these changes to XSLT. You can find the resulting XSLT files directly under your module’s `ModuleData` folder, in a folder called `XSLT`. Note that some functionality in the XML editing may not be available in the XSLT editing mode.