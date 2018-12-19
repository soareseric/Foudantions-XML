<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:template match="/">
        <html>
            <body>
                <xsl:for-each select="pessoas/pessoa">
                    <xsl:value-of select="nome" /> |
                    <xsl:call-template name="formatData">
                        <xsl:with-param name="data" select="@dataNascimento" />
                    </xsl:call-template>
                    <br />
                </xsl:for-each>
            
            </body>                     
        </html>
    </xsl:template>
        <xsl:template name="formatData">
            <xsl:param name="data" as="xs:date"></xsl:param>

            <xsl:variable name="dia" select="substring($data, 9, 2)"/>
            <xsl:variable name="mes" select="substring($data, 6, 2)"/>            
            <xsl:variable name="ano" select="substring($data, 1, 4)"/>   

            <xsl:value-of select="concat($dia, '/', $mes, '/', $ano)" />
        </xsl:template>
</xsl:stylesheet>
