<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="yes" />
<xsl:param name="creator"/>
<xsl:include href="item.xsl"/>

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
</xsl:stylesheet>