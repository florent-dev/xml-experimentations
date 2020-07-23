<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        version="1.0"
>

    <xsl:template match="countries">
        <html>
            <body>
                <h1>Pays</h1>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="country">
        <div>
            <h2><xsl:value-of select="@name"/></h2>
            <li>
                Population: <xsl:value-of select="@population"/>
            </li>
            <li>
                Superficie: <xsl:value-of select="@area"/>
            </li>
            <xsl:if test="@population > 3000000">
                <li>Grande ville (> 3000000k)</li>
            </xsl:if>
        </div>
    </xsl:template>

</xsl:stylesheet>
