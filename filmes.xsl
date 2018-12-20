<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:func="http://www.ericsoares.com.br/XSLT/Functions">
    <xsl:variable name="livros" select="document('livros.xml')" />
    <xsl:template match="/">
        <html>
            <body>
                <h1>Filmes</h1>
                <table>
                    <thead>
                        <tr>
                            <td>Título</td>
                            <td>Ano</td>
                            <td>Diretor</td>
                            <td>Livro</td>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-template select="filmes/filme" />
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="filme">
        <tr>
            <td>
                <xsl:value-of select="titulo" />
            </td>
            <td>
                <xsl:value-of select="ano" />
            </td>
            <td>
                <xsl:sequence> <!-- DISPONIVEL APENAS PARA VERSAO 3 DO XSTL -->
                    <xsl:on-non-empty> <!-- DISPONIVEL APENAS PARA VERSAO 3 DO XSTL -->
                        <strong>Diretor:</strong>
                    </xsl:on-non-empty>
                        <xsl:value-of select="diretor" />
                    <xsl:on-empty> <!-- DISPONIVEL APENAS PARA VERSAO 3 DO XSTL -->
                        <xsl:value-of select="'Diretor não informado!!'" />
                    </xsl:on-empty>
                </xsl:sequence> 

            </td>
            <td>
                <xsl:value-of select="func:findBook(@id)" />
            </td>
        </tr>
    </xsl:template>
    <xsl:function name="func:findBook" as="xs:string">
        <xsl:param name="id" as="xs:integer" />
        <xsl:variable name="titulo" select="$livros/livros/livro[@id=$id]/titulo" />
        <xsl:variable name="autor" select="$livros/livros/livro[@id=$id]/autor" />
        <xsl:choose>
            <xsl:when test="exists($titulo) and exists($autor)">
                <xsl:value-of select="concat($titulo, ' - ', $autor)" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="'Filme não baseado em livro!!'"></xsl:value-of>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
</xsl:stylesheet>