+++
title = "Filter Queries"
+++


------------------

You can use sql syntax to search for assets with specific properties like textures whose resolutions are greater than 1024.
To do this you need to enable query mode from extras menu :
![](/img/asset_browser/extras_icon.png)

From the Texture Inspector (Right Panel), you can enable/disable MipMap blending by toggling <strong>Use Mipmap Blending</strong> checkbox.
When you enable MipMap Blending, you will see all mip levels of the selected texture next to each other in Preview Window.
![](/img/mipmap_editor/tex_editor_post_mip.PNG)

Clicking on <strong>MipMap Blend Amounts</strong> will open a new window where you can adjust blend amounts for every mip level.
![](/img/mipmap_editor/mipmap_blend_window.PNG)

Then you can select <strong>MipMap Blend Color (1)</strong> and click <strong>Recompile (2)</strong> button to apply blending. The result will be immediately visible in Preview Window and also in Game.
![](/img/mipmap_editor/tex_editor_compiled.PNG)
