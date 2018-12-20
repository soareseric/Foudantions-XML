<?xml version="1.0" encoding="UTF-8"?>
<xsl:package name="Funcoes" package-version="1.0" version="3.0" xmlns:xsl="http/www.w3.org/1999/XLS/Transform"  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:func="http://www.ericsoares.com.br/XSLT/Functions ">


<xsl:function name="func:formatData" as="xs:string*" visibility="public">
    <xsl:param name="data" as="xs:date"></xsl:param>
    <xsl:variable name="dia" select="substring($data, 9, 2)" />
    <xsl:variable name="mes" select="substring($data, 6, 2)" />
    <xsl:variable name="ano" select="substring($data, 1, 4)" />
    <xsl:value-of select="concat($dia, '/', $mes, '/', $ano)" />
</xsl:function>

</xsl:package>
