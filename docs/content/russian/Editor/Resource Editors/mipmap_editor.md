+++
title = "Редактор текстур"
+++

------------------

Доступ к редактору текстур можно получить через: Editor <strong>></strong> Window <strong>></strong> Show Resource Browser <strong>></strong>  *..Search for Texture..* <strong>></strong>  *..Double Click on Texture..*
![](/img/mipmap_editor/tex_editor_pre_mip.PNG)

В инспекторе текстур (правая панель) вы можете включить/выключить смешивание MipMap, установив флажок <strong>Use Mipmap Blending</strong>.
Когда вы включаете MipMap Blending, вы увидите все mip уровни выбранной текстуры рядом друг с другом в окне предварительного просмотра.
![](/img/mipmap_editor/tex_editor_post_mip.PNG)

При нажатии на <strong>MipMap Blend Amounts</strong> откроется новое окно, в котором вы можете настроить количество смешивания для каждого уровня mip.
![](/img/mipmap_editor/mipmap_blend_window.PNG)

Затем вы можете выбрать <strong>MipMap Blend Color (1)</strong> и нажать кнопку <strong>Recompile (2)</strong>, чтобы применить смешивание. Результат будет сразу виден в окне предварительного просмотра, а также в игре.
![](/img/mipmap_editor/tex_editor_compiled.PNG)
