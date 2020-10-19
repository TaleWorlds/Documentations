+++
title = "纹理编辑器"
+++


------------------

纹理编辑器 (Texture Editor) 可以通过 编辑器 (Editor) <strong>></strong> 窗口 (Windows) <strong>></strong> 资源展示浏览器 (Show Resource Browser) <strong>></strong> 寻找目标纹理 (*..Search for Texture..*) <strong>></strong> 双击找到的纹理 (*..Double Click on Texture..*)

![](/img/mipmap_editor/tex_editor_pre_mip.PNG)

从右侧面板中的 纹理查看器 (Texture Inspector) 中，你可以通过选中 <strong> 使用纹理细节混合 (Use Mipmap Blending) </strong> 启用/禁用 纹理细节混合 (MipMap Blending) 功能。当时启用该功能的时候，你会在预览框 (Preview Windows) 中看到所有的被选中贴图的所有纹理细节层级。

![](/img/mipmap_editor/tex_editor_post_mip.PNG)

点击 <strong> 纹理细节量 (MipMap Blend Amounts) </strong> 将会打开一个新的窗口，在这个窗口中你可以修改每一层级混合的数量。

![](/img/mipmap_editor/mipmap_blend_window.PNG)

你可以选中 <strong> 细节纹理混合颜色 (MipMap Blend Color) (1)</strong> 并点击 <strong> 重新编译 (Recompile) (2)</strong> 来应用混合。结果会立即显示在预览框和游戏中。

![](/img/mipmap_editor/tex_editor_compiled.PNG)
