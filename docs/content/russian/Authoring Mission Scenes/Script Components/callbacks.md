+++
title = "Script Component Callbacks"

[menu.main]
identifier = "script_components"
+++

The callbacks of the script components are listed below.

#### Constructor

In constructor one needs to assign default values to its public variables(variables which can be changed by the scene maker). In constructor script component is not assigned to an entity or scene. Also, you should not write any logic that has any side effect because , even though it is created, the script component may be deleted once the scene is opened because of the upgrade level system. 

#### On Pre Init

This is called after the script component is assigned to its owner entity in the scene. Once you are in this callback , you can be sure that the user defined variables from that script instance are set. However, the other script components of the other entities may not be assigned yet. Thus, in pre init there should not be any logic code that relies on other script components. Example, in pre-init ManagedObject registers himself to the managed object array in the current mission instance.

#### On Init 

This is called once the mission is loaded and all of the script components of the entities are initialized. You can use any type of logic code inside this callback. Run time instantiated scripts also get this callback called.

#### On Editor Init

Editor version of on init. It is called when the scene is loaded from the editor. Beware that there is no mission or game state in editor.

#### On Tick

This is called for every script component every frame on mission from the same thread.

#### On Editor Tick

Editor version of on tick. 

#### Is Only Visual

If you have a script component which is only visual and does not have any logic code that should be running in the dedicated server , you should return true in this function. This ensures that this type of scripts does not run on dedicated server.

#### On Editor Variable Changed

This is called in editor whenever a public variable in that script component is changed by the user. This callback can be used for any visual-logic state change if the artist needs instant feedback on the editor scene.

#### OnRemoved

Called when the entity or the script component is being removed. If you have any allocated objects which are stored in somewhere else (for example static containers), you can use this callback to ensure that they are not leaked.

