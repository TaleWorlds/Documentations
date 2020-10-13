+++
title = "过滤器查询"
+++


------------------

你可以使用 SQL 语法 查询资产 (assets) 中特定的属性 (properties)，比如查找分辨率大于 1024 的纹理 (Textures)。你可以在额外菜单 (extras menu) 中使用查询模式：

![](/img/asset_browser/extras_icon.png)

从右边栏的纹理检查器 (Texture Inspector)中，你可以通过勾选 <strong>Use Mipmap Blending</strong> 来启用/禁用 混合纹理映射。
当你启用 混合纹理映射 (MipMap Blending) 的时候，你可以在预览界面 (Preview Window) 看到所有的选中纹理的映射层级。

![](/img/mipmap_editor/tex_editor_post_mip.PNG)

点击 <strong>MipMap Blend Amounts</strong> 将会打开一个新的窗口，在这个窗口中你可以调整每一层映射的混合量 (amounts)。

![](/img/mipmap_editor/mipmap_blend_window.PNG)

之后你可以选中 <strong>MipMap Blend Color (1)</strong> 然后点击 <strong>Recompile (2)</strong> 来应用混合。结果会立即在预览界面和游戏中显示。

![](/img/mipmap_editor/tex_editor_compiled.PNG)
