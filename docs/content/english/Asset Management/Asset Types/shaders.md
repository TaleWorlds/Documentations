+++
title = "Shaders"
description = ""
weight = 1
+++

Shaders are program snippets that run on GPU cores. They define the rendering methods. 

##### Material Shader Flags & Shader Combinations
Shaders define material flags which can is configurable per material. Every material shader flag changes a portion of the shader code to change how the material look. For example, once the "USE_PROCEDURAL_WIND_ANIMATION" flag is enabled, material will start animate in a fixed axis with respect to the wind in the scene. 

##### Shader Cache
Every material defines a new shader flag combination which in turns define a new shader code to be compiled. The game is shipped with a shader cache which contains all of the unique shader + material shader flag combinations in the base game. 

##### Bulk Shader Compilation for Mods
If a module adds a good amount of new combinations, runtime shader compilation can disrupt the flow of the game tremendously. To avoid that, the mod owner should compile the unique shader + material combinations introduced within that module. In order to do that, while the module is being published via the "Publish Module" functionality in the editor, "Compile Shaders" checkbox should be checked. The shader cache will be saved into the "Modules/'ModuleName'/Shaders/D3D11" folder. Please note that the game shaders can be changed in some version updates, even though this is not very often, for those cases the old shader cache file will be invalid and not be used. To avoid that, it would be good workflow o re-create the shader cache before every upload to a new major version of the game. Shader compilation system is highly parallel and it may finish around 30 to 60 minutes depending on the multi-core performance of the CPU.


