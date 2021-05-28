+++
title = "XSLT Usage Tutorial"

[menu.main]
identifier = "xslt_usage_tutorial"
parent = "bestpractices"
+++

We use XSLT files to remove or modify the elements of XML files that are loaded from other modules. You don’t have to use the XSLT system for adding new elements to the XML files.

You simply create an XSLT file with the same name as the XML file and place it to the same path with your XML file. This added XSLT file is going to make the changes to the XML files of the same type located in modules that were loaded before your module. The system applies your module’s XSLT files just before applying your module’s own XML files. So the XSLT files are not going to affect the same module’s own XML files. 

You also need to make an entry  submodule.txt or project.mbproj according to the type of the file.

| Submodule.txt | project.mbproj |
| ------ | ----------- |
| <img src="/img/xslt_usage_tutorial/submodule_xmlnode.png"/> | <img src="/img/xslt_usage_tutorial/project.mbproj_xslt.png"/> |


If you already made an entry in the XML file then there is no need to do anything else.

For example, if you create a “settlements.xslt” file after making the entry as above and enter the following code, it will erase all the settlements.

	<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		<xsl:output omit-xml-declaration="yes"/>
		<xsl:template match="@*|node()">
			<xsl:copy>
				<xsl:apply-templates select="@*|node()"/>
			</xsl:copy>
		</xsl:template>
		<xsl:template match="Settlement"/>
	</xsl:stylesheet>
