<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" />
  <xsl:template match="/">
    <cds>
      <xsl:for-each-group select="catalogo/cd" group-by="@pais">
        <xsl:sort select="@pais" />
        <pais nome="{current-grouping-key()}">
          <xsl:apply-template select="current-group()" />
        </pais>
      </xsl:for-each-group>
    </cds>
  </xsl:template>
  <xsl:template match="cd">
    <cd>
      <titulo>
        <xsl:value-of select="@titulo" />
        <xsl:value-of select="@artista" />
        <xsl:value-of select="@ano" />
      </titulo>
    </cd>
  </xsl:template>
</xsl:stylesheet>