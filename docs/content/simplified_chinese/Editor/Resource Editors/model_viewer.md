+++
title = "Model Viewer"

[menu.main]
identifier = "model_viewer"
+++


------------------

The Model Viewer can be accesed from; Editor <strong>></strong> Window <strong>></strong> Show Model Viewer
![](/img/model_viewer/mv_empty.PNG)

From the left panel, you can change Atmosphere, hide/show ground, or add as many entities as you want. The entities can either be <strong>Human</strong> or simple <strong>Mesh.</strong>
Pressing <strong>Add Entity</strong> will open a modal window for you to select the entity type.
![](/img/model_viewer/mv_add_entity.PNG)


#### Transform ####
From this panel, you can set entities Tranform, Rotation, and Scale.

#### Animation ####
From this panel, you can choose Skeleton type, and Animation. \\
You can also filter animations by their name. \\
Filtering system is quite strong through all the engine, so you can fine tune your filtering. Some examples; \\
idle = Will filter animations that contains "idle" \\
.idle = Will filter animations that starts with "idle" \\
idle. = Will filter animations that ends with "idle" \\
-idle = Will filter animations that does not contain "idle" \\
 --- *You can also use combinations of those filters by putting a space between them* \\
"idle -barmaid 2." = Will filter animations that contains "idle", and does not contains "barmaid", and ends with "2". (like "guard_idle_2" which fits this condition) \\
"idle hangout 7" = Will filter animations that contains "idle", "hangout", and "7". (like "anim_hangout_idle_7" which fits this condition)

--- You can also blend an another animation using the blend panel.

#### Visuals ####

From this panel, you can put any mesh at any part of the human, and you can choose this humans gender.

![](/img/model_viewer/mv_full.PNG)
![](/img/model_viewer/mv_fun.PNG)

## Save / Load scene ##

You can also Save / Load the current working scene, by clicking; File <strong>></strong> Save Scene <strong>></strong> *..Save Name..* \\
Then you can load it with; File <strong>></strong> Load Saved Scene <strong>></strong> *..Write Saved Name..* \\
Which will restore everyting to the state where you saved it.
