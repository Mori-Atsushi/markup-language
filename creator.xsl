<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="yes" />
<xsl:param name="creator"/>

<xsl:template match="/">
<html>
  <head>
    <title><xsl:value-of select="books/metadata/title" /> | <xsl:value-of select="$creator" /></title>
  </head>
  <body>
    <h1><xsl:value-of select="books/metadata/title" /></h1>
    <h2>著者：<xsl:value-of select="$creator" /></h2>
    <xsl:apply-templates select="books/item[creator=$creator]" />
  </body>
</html>
</xsl:template>

<xsl:template match="books/item">
<h3><xsl:value-of select="title" /> | <xsl:value-of select="creator" /></h3>
<p><xsl:value-of select="description" /></p>
<ul>
  <li>出版社：<xsl:value-of select="publisher" /></li>
  <li>出版日：<xsl:apply-templates select="date" /></li>
  <li>値段：<xsl:value-of select="price" /> 円</li>
  <li>関連リンク：<xsl:apply-templates select="url" /></li>
  <li>キーワード：<xsl:apply-templates select="keywords" /></li>
</ul>
</xsl:template>

<xsl:template match="date">
  <xsl:value-of select="year" />-<xsl:value-of select="format-number(month, '00')" />-<xsl:value-of select="format-number(day, '00')" />
</xsl:template>

<xsl:template match="url">
  <a target="_blank">
    <xsl:attribute name="href">
      <xsl:value-of select="@resource" />
    </xsl:attribute>
    <xsl:value-of select="@resource" />
  </a>
</xsl:template>

<xsl:template match="keywords">
  <xsl:for-each select="keyword">
    <a>
      <xsl:attribute name="href">
        <xsl:text>./</xsl:text><xsl:value-of select="normalize-space(.)" /><xsl:text>.html</xsl:text>
      </xsl:attribute>
      <xsl:value-of select="." />(<xsl:value-of select="count(//books/item[keywords/keyword=current()])"/>)
    </a> / 
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>