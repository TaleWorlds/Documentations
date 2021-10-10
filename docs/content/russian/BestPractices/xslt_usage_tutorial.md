+++
title = "Руководство по использованию XSLT"

[menu.main]
identifier = "xslt_usage_tutorial"
parent = "bestpractices"
+++

Мы используем файлы XSLT для удаления или изменения элементов файлов XML, загружаемых из других модулей. Вам не нужно использовать систему XSLT для добавления новых элементов в файлы XML.

Вы просто создаете XSLT-файл с тем же именем, что и XML-файл, и размещаете его по тому же пути, что и ваш XML-файл. Этот добавленный файл XSLT будет вносить изменения в файлы XML того же типа, расположенные в модулях, которые были загружены до вашего модуля. Система применяет файлы XSLT вашего модуля непосредственно перед применением собственных файлов XML. Таким образом, файлы XSLT не будут влиять на собственные файлы XML того же модуля.

Вам также необходимо создать запись submodule.txt или project.mbproj в зависимости от типа файла.

| Submodule.txt | project.mbproj |
| ------ | ----------- |
| <img src="/img/xslt_usage_tutorial/submodule_xmlnode.png"/> | <img src="/img/xslt_usage_tutorial/project.mbproj_xslt.png"/> |


Если вы уже сделали запись в XML-файле, больше ничего делать не нужно.

Например, если вы создадите файл “settlements.xslt” после ввода вышеуказанной записи, и введете следующий код, он сотрет все поселения.

```xml
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output omit-xml-declaration="yes"/>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="Settlement"/>
</xsl:stylesheet>
```
