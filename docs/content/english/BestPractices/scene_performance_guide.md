+++
title = "Scene Performance Guide"

[menu.main]
identifier = "scene_performance"
parent = "bestpractices"
+++


##### Performance Requirements of Mount&Blade Bannerlord
- Singleplayer Scenes: Very High Config / 60 FPS / Gtx 1060.
- Multiplayer Scenes: Very High Config / 60 FPS / Gtx 970.

{{% notice warning %}}
Do not test the final performance of your scene in the Scene Editor. Editor has low performance due to being editable at runtime. Also, you should check the final performance with the agents in the mission.
{{% /notice %}}


#### Possible Performance Bottlenecks

##### Missing occluders
Occluders are physical objects that define occlusion boundaries for meshes. If an object’s bounding box is fully occluded by an occluder, those objects are not rendered. Occluders drastically reduce the performance problems of wide and large scenes. At runtime, all of the occluders are rendered to a different screen and the depth values of every pixel in this screen is checked with every mesh' bounding box. In your scene, all of the building blocks and big meshes should have occluders. If the “Enable Occlusion Culling” and “Show Occluders” options are enabled from the “Visibility” tab, the occluders of every mesh are rendered with debug meshes. If any of the big meshes in your scene has missing occluders, you should contact the ART team.

##### Too much pointlight overdraw & unnecessary shadow maps
Our engine uses a grid based point light rendering system. This system divides the screen into fixed size grids. Then, the visible point lights are registered to every grid in which it’s bounding box intersects. Then, every shaded pixel in the screen uses all of the point lights inside its tile to shade itself. Every pointlight in your scene should have the minimum possible radius. Also, to not increase the overdraw, you should not use too many point lights. You can use the “Debug Tiled Lights” debug renderer to fix issues like too much point light in tight spots or lights with high radius. If there are any grid tiles with yellowish or red color, than those tiles probably have low performance. Those areas of the scene should be re-adjusted by either decreasing the point light radiuses or decreasing the point light count.

##### Outer Areas Flora Usage
The grass like flora that we use in our scenes has a limited viewing range. Also, we can cull out (decide to not render) these floras in high ranges. However, this flora will have a major memory impact in the scenes, also there will be a mild CPU culling cost as well. Thus, for the outer areas where the grass would not be rendered, you should not use terrain layers with high grass density. 

##### Too many meshes without LOD’s
For modern GPUs, performance wise, polygon density per pixel is much more important than the total polygon count. In this case, the worst situation are meshes without LOD. This can be checked by switching into wireframe mode. Every triangle in the scene should contain a healthy amount of pixels inside, not the other way around. You should contact the ART team if you find a mesh without LOD’s.

##### Terrain LOD Multiplier and Vertex Density
Always check your terrain vertex density. In many cases, the terrain resolution can be reduced without any noticeable change. Also, try not to use terrain LOD multiplier for terrain nodes. Having more nodes and only using terrain LOD multiplier in nodes with detailed curvature will increase your scene's performance.
