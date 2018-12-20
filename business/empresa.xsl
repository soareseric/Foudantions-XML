<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" >
    <xsl:template match="/">
        <html>
            <body>
                <ul>
                    <xsl:iterate select="//funcionario">
                        <xsl:param name="aumento" select="1.0" as="xs:decimal" />
                        <li>
                            <strong><xsl:value-of select="nome" /></strong>:
                            <xsl:value-of select="salario * aumento" />
                        </li>
                        <xsl:variable name="promocao" select="$aumento + 0.1" />
                        <xsl:next-iteration>
                            <xsl:with-param name="aumento" select="$promocao" />
                        </xsl:next-iteration>
                    </xsl:iterate>
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>