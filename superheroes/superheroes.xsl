<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xpath-default-namespace="http://www.w3.org/2005/xpath-functions">
    <xsl:output indent="yes" />
    <xsl:variable name="json" select="unparsed-text('superheroes.json')" as="xs:string" />
    <xsl:template match="/">
        <xsl:variable name="json-xml" select="json-to-xml($json)" />
        <html>
            <body>
                <h1>
                    <xsl:value-of select="$json-xml//*[@key='squadName']" /> of <xsl:value-of select="$json-xml//*[@key='homeTown']" />
                </h1>
                <table>
                    <thead>
                        <td>Nome</td>
                        <td>Idade</td>
                        <td>Id. Secreta</td>
                        <td>Poderes</td>
                    </thead>
                    <tbody>
                        <xsl:for-each select="$json-xml//*[@key = 'members']/map">
                                <tr>
                                    <td><xsl:copy-of select="*[@key = 'name']" /></td>
                                    <td><xsl:copy-of select="*[@key = 'age']" /></td>
                                    <td><xsl:copy-of select="*[@key = 'secretIdentity']" /></td>
                                    <td><xsl:copy-of select="*[@key = 'powers']/*" separator=", " /></td>
                                </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
        <xsl:for-each select="$json-xml">
            <xsl:copy-of select="string[@key = 'squadName']" />
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>