<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="UTF-8" />

<xsl:template match="/">
  <xsl:text>xsltproc -o output/index.html main.xsl data/books.xml
</xsl:text>
  <xsl:text>xsltproc -o output/keyword.html keywords.xsl data/books.xml
</xsl:text>
  <xsl:text>xsltproc -o output/creator.html creators.xsl data/books.xml
</xsl:text>

  <xsl:for-each select="books/item/keywords/keyword[not(.=preceding::keyword)]">
    <xsl:text>xsltproc --stringparam keyword "</xsl:text>
    <xsl:value-of select="." />
    <xsl:text>" -o "output/keyword/</xsl:text>
    <xsl:value-of select="translate(., ' ', '-')" />
    <xsl:text>.html" keyword.xsl data/books.xml
</xsl:text>
  </xsl:for-each>

  <xsl:for-each select="books/item/creator[not(.=preceding::creator)]">
    <xsl:text>xsltproc --stringparam creator "</xsl:text>
    <xsl:value-of select="." />
    <xsl:text>" -o "output/creator/</xsl:text>
    <xsl:value-of select="translate(., ' ', '-')" />
    <xsl:text>.html" creator.xsl data/books.xml
</xsl:text>
  </xsl:for-each>
</xsl:template>
</xsl:stylesheet>
