<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <!-- HERE WE USE THE METHOD APPLY-TEMPLATES FOR WE CAN GET SOME INFOMRATICA THAT WE WANT INSIDE THE PESSOAS-->
                <!-- <xsl:apply-templates select="pessoas/pessoa" /> -->
                <!-- HERE INSTEAD WE USE APPLY-TEMPLATE WE USED FOR EACH, THE TWO METHODS DO THE SAMETHING -->
                <xsl:for-each select="pesoas/pessoa">
                    <xsl:value-of select="nome" />
                </xsl:for-each>
            
            </body>                     
        </html>
    </xsl:template>
    <!--
    <xsl:template match="pessoa">
        <xsl:value-of select="nome"/><br />
    </xsl:template> -->
</xsl:stylesheet>
