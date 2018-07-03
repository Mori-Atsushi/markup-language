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
    <nav><a href="./index.html">TOP</a> > キーワード一覧</nav>
    <ul>
      <xsl:apply-templates select="books/item/keywords/keyword[not(.=preceding::keyword)]">
        <xsl:sort select="count(//books/item[keywords/keyword=current()])" data-type="number" order="descending" />
        <xsl:sort select="." data-type="text" order="ascending" />
      </xsl:apply-templates>
    </ul>
  </body>
</html>
</xsl:template>

<xsl:template match="books/item/keywords/keyword">
<li>
  <a>
    <xsl:attribute name="href">
      <xsl:text>./keyword/</xsl:text><xsl:value-of select="translate(., ' ', '-')" /><xsl:text>.html</xsl:text>
    </xsl:attribute>
    <xsl:value-of select="."/>
  </a> | <xsl:value-of select="count(//books/item[keywords/keyword=current()])"/> 件
</li>
</xsl:template>

</xsl:stylesheet>
