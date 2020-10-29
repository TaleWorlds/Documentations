+++
title = "元模型编辑器" 
+++

#### 导入设置

* 分解为网格 (Grid)：把元模型 (meta mesh) 分成网格，并且添加所有生成的模型部分到子模型 (submesh) 中。
* 移除多余的顶点 (Vertices)：功能如其名。
* 重新计算法线 (Normals)：导入元模型时，计算所有子模型的法线向量，而不是单单全部导入。
* 法线计算：决定法线向量的计算是否依靠面部区域 (Face Area)，是 (weighted) 或者是 否 (default).
* 重新计算切线 (Tangents)：导入元模型时，计算所有子模型的切线向量，而不是单单全部导入。
* 白化 (whiten)：在每一个颜色通道 (channel) 中顶点颜色和白色之间的线性插值 (linear interpolation amount)。

#### 多细节层次 (Lod) 模型

* 所有的在用的元模型的子模型都可以在这儿被看到。材料属性，模型参数以及标签都可以在这个界面被修改。

![](/img/meta_mesh_editor/lods.PNG)

#### 没用到的模型

* 这里展示了子模型的使用情况。如果勾选了忽略复选框 (ignore checkbox)，这意味着对应的子模型是处于非激活状态。当需要修改 lod 模型的状态时，请点击 “应用忽略 (Apply Ignores)” 按钮来应用并且保存你的修改。

![](/img/meta_mesh_editor/ignored_meshes.png)

#### 保存

* 保存元模型的所有改变。
