<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8" indent="yes" />
<xsl:param name="keyword"/>
<xsl:include href="item.xsl"/>

<xsl:template match="/">
<html>
  <head>
    <title><xsl:value-of select="books/metadata/title" /> | <xsl:value-of select="$keyword" /></title>
  </head>
  <body>
    <h1><xsl:value-of select="books/metadata/title" /></h1>
    <h2>キーワード：<xsl:value-of select="$keyword" /></h2>
    <xsl:apply-templates select="books/item[keywords/keyword=$keyword]" />
  </body>
</html>
</xsl:template>
</xsl:stylesheet>