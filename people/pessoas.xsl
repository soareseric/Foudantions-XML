<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:func="http://www.ericsoares.com.br/XSLT/Functions ">
    <xsl:template match="/">
        <html>
            <body>
                <xsl:for-each select="pessoa">
                    <xsl:value-of select="nome" /> |
                    <xsl:value-of select="func:formatData(@dataNascimento)" />
                    <br />
                </xsl:for-each>
            
            </body>                     
        </html>
    </xsl:template>
        <xsl:function name="func:formatData" as="xs:string*">
            <xsl:param name="data" as="xs:date"></xsl:param>

            <xsl:variable name="dia" select="substring($data, 9, 2)"/>
            <xsl:variable name="mes" select="substring($data, 6, 2)"/>            
            <xsl:variable name="ano" select="substring($data, 1, 4)"/>   

            <xsl:value-of select="concat($dia, '/', $mes, '/', $ano)" />
        </xsl:function>
</xsl:stylesheet>
