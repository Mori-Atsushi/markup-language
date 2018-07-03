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
    <nav><a href="../index.html">TOP</a> > <a href="../keyword.html">キーワード一覧</a> > <xsl:value-of select="$keyword" /></nav>
    <xsl:apply-templates select="books/item[keywords/keyword=$keyword]" />
  </body>
</html>
</xsl:template>
</xsl:stylesheet>