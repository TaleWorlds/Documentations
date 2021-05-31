+++
title = "XSLT使用指南"

[menu.main]
identifier = "xslt_usage_tutorial"
parent = "bestpractices"
+++

我们使用XSLT文件删除或修改从其他模组加载的XML文件中的元素。您不必使用 XSLT 系统添加新元素到 XML 文件。

您只需创建一个与 XML 文件同名的 XSLT 文件，并将其放置在与您的 XML 文件相同的路径中。这个添加的 XSLT 文件将对位于模组之前加载的模组中相同类型的 XML 文件进行更改。系统会在应用模组自己的 XML 文件之前应用模组的 XSLT 文件。所以 XSLT 文件不会影响同一个模组自己的 XML 文件。

您还需要根据文件的类型制作一个条目 submodule.txt 或 project.mbproj 。

| Submodule.txt | project.mbproj |
| ------ | ----------- |
| <img src="/img/xslt_usage_tutorial/submodule_xmlnode.png"/> | <img src="/img/xslt_usage_tutorial/project.mbproj_xslt.png"/> |


如果您已经在 XML 文件中创建了一个实体，则无需执行任何其他操作。

例如，如果您在进行上述输入后创建“settlements.xslt”文件并输入以下代码，它将移除所有定居点。

	<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<xsl:output omit-xml-declaration="yes"/>
		<xsl:template match="@*|node()">
			<xsl:copy>
				<xsl:apply-templates select="@*|node()"/>
			</xsl:copy>
		</xsl:template>
		<xsl:template match="Settlement"/>
	</xsl:stylesheet>
