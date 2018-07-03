<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="yes" />

<xsl:template match="/">
<html>
  <head>
    <title><xsl:value-of select="books/metadata/title" /></title>
  </head>
  <body>
    <h1><xsl:value-of select="books/metadata/title" /></h1>
    <h2>creater一覧</h2>
    <ul>
      <xsl:apply-templates select="books/item/creator[not(.=preceding::creator)]">
        <xsl:sort select="count(//books/item[creator=current()])" data-type="number" order="descending" />
        <xsl:sort select="." data-type="text" order="ascending" />
      </xsl:apply-templates>
    </ul>
  </body>
</html>
</xsl:template>

<xsl:template match="books/item/creator">
<li>
  <a>
    <xsl:attribute name="href">
      <xsl:text>./creator/</xsl:text><xsl:value-of select="normalize-space(.)" /><xsl:text>.html</xsl:text>
    </xsl:attribute>
    <xsl:value-of select="normalize-space(.)"/>
  </a> | <xsl:value-of select="count(//books/item[creator=current()])"/> 件
</li>
</xsl:template>

</xsl:stylesheet>
