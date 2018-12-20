<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:func="http://www.ericsoares.com.br/XSLT/Functions">
    <xsl:output indent="yes" />
    <xsl:variable name="livros" select="document('livros.xml')" />
    <xsl:template match="/">
        <xsl:merge>
            <xsl:merge-source name="filme" select="doc('filmes.xml')//filme" sort-before-merge="true">
                <xsl:merge-key select="@id" />
            </xsl:merge-source>
            <xsl:merge-source name="livro" select="doc('livros.xml')//livro" sort-before-merge="true">
                <xsl:merge-key select="@id" />
            </xsl:merge-source>
            <xsl:merge-action>
                <filmes>
                    <filme id="{current-merge-key()}" idioma="{@idioma}">
                        <xsl:copy-of select="current-merge-group('filme')" />
                        <xsl:if test="current-merge-group('livro')">
                            <baseado>
                                <xsl:copy-of select="current-merge-group('livro')" />
                            </baseado>
                        </xsl:if>
                    </filme>
                </filmes>
            </xsl:merge-action>
        </xsl:merge>
    </xsl:template>
</xsl:stylesheet>