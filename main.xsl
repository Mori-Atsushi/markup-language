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
    <h2>著者から探す</h2>
    <ul>
      <xsl:apply-templates select="books/item/creator[not(.=preceding::creator)]">
        <xsl:sort select="count(//books/item[creator=current()])" data-type="number" order="descending" />
        <xsl:sort select="." data-type="text" order="ascending" />
      </xsl:apply-templates>
    </ul>
    <a href="./creator.html">もっと見る</a>

    <h2>キーワードから探す</h2>
    <ul>
      <xsl:apply-templates select="books/item/keywords/keyword[not(.=preceding::keyword)]">
        <xsl:sort select="count(//books/item[keywords/keyword=current()])" data-type="number" order="descending" />
        <xsl:sort select="." data-type="text" order="ascending" />
      </xsl:apply-templates>
    </ul>
    <a href="./keyword.html">もっと見る</a>
  </body>
</html>
</xsl:template>

<xsl:template match="books/item/creator">
<xsl:if test="position()&lt;=10">
  <li>
    <a>
      <xsl:attribute name="href">
        <xsl:text>./creator/</xsl:text><xsl:value-of select="translate(., ' ', '-')" /><xsl:text>.html</xsl:text>
      </xsl:attribute>
      <xsl:value-of select="."/>
    </a> | <xsl:value-of select="count(//books/item[creator=current()])"/> 件
  </li>
</xsl:if>
</xsl:template>

<xsl:template match="books/item/keywords/keyword">
<xsl:if test="position()&lt;=10">
  <li>
    <a>
      <xsl:attribute name="href">
        <xsl:text>./keyword/</xsl:text><xsl:value-of select="translate(., ' ', '-')" /><xsl:text>.html</xsl:text>
      </xsl:attribute>
      <xsl:value-of select="."/>
    </a> | <xsl:value-of select="count(//books/item[keywords/keyword=current()])"/> 件
  </li>
</xsl:if>
</xsl:template>

</xsl:stylesheet>
