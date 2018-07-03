<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="yes" />
<xsl:param name="keyword"/>

<xsl:template match="books/item">
<h3><xsl:value-of select="title" /> | <xsl:apply-templates select="creator" /></h3>
<p><xsl:apply-templates select="description" /></p>
<ul>
  <li>出版社：<xsl:value-of select="publisher" /></li>
  <li>出版日：<xsl:apply-templates select="date" /></li>
  <li>値段：<xsl:value-of select="price" /> 円</li>
  <li>関連リンク：<xsl:apply-templates select="url" /></li>
  <li>キーワード：<xsl:apply-templates select="keywords" /></li>
</ul>
</xsl:template>

<xsl:template match="creator">
  <a>
    <xsl:attribute name="href">
    <xsl:text>../creator/</xsl:text><xsl:value-of select="translate(., ' ', '-')" /><xsl:text>.html</xsl:text>
    </xsl:attribute>
    <xsl:value-of select="." />
  </a>
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
        <xsl:text>../keyword/</xsl:text><xsl:value-of select="translate(., ' ', '-')" /><xsl:text>.html</xsl:text>
      </xsl:attribute>
      <xsl:value-of select="." />(<xsl:value-of select="count(//books/item[keywords/keyword=current()])"/>)
    </a> / 
  </xsl:for-each>
</xsl:template>

<xsl:template match="description">
  <xsl:call-template name="replace-new-line">
    <xsl:with-param name="str" select="." />
  </xsl:call-template>
</xsl:template>

<xsl:template name="replace-new-line">
  <xsl:param name="str" />
  <xsl:choose>
    <xsl:when test="contains($str, '&#10;')">
      <xsl:value-of select="substring-before($str, '&#10;')" /><br />
      <xsl:call-template name="replace-new-line">
        <xsl:with-param name="str" select="substring-after($str, '&#10;')" />
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$str" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>