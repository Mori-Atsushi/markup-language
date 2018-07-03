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
    <h2>keyword一覧</h2>
    <xsl:for-each select="books/item/keywords/keyword[not(.=preceding::keyword)]">
      <xsl:sort select="normalize-space(.)" data-type="text" order="ascending" />
      <a>
        <xsl:attribute name="href">
          <xsl:text>./keyword/</xsl:text><xsl:value-of select="normalize-space(.)" /><xsl:text>.html</xsl:text>
        </xsl:attribute>
        <xsl:value-of select="normalize-space(.)"/>
      </a> / 
    </xsl:for-each>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>