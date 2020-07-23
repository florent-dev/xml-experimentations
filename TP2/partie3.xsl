<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
        <html>

            <head>
                <title>10 villes les plus peuplées</title>
                <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
                <style>.bar { fill: #aaa; height: 21px; -webkit-transition: fill .3s ease; transition: fill .3s ease; cursor: pointer; font-family: Helvetica, sans-serif; } .bar text { fill: #555; } .chart:hover .bar, .chart:focus .bar { fill: #aaa; } .bar:hover, .bar:focus { fill: #ea9728 !important; } .bar:hover text, .bar:focus text { fill: #ea9728; }</style>
            </head>

            <body>
                <div class="container-fluid p-5">
                    <h1>Les 10 villes les plus peuplées</h1>
                    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" class="chart" width="100%" height="100%"
                         aria-labelledby="title" role="img">
                        <title>Les 10 villes les plus peuplées</title>
                        <xsl:for-each select="/countries">
                            <xsl:for-each select="country/city">
                                <xsl:sort select="population" order="descending" data-type="number"/>
                                <xsl:if test="position() &lt; 11">
                                    <g class="bar">
                                        <rect height="19" width="{population div 10000}" y="{position()*20}"></rect>
                                        <text x="10" y="{position() * 20 + 9}" dy=".35em"><xsl:value-of select="position()"/></text>
                                        <text x="{population div 10000 + 10}" y="{position() * 20 + 9}" dy=".35em">
                                            Ville : <xsl:value-of select="name"/> - Pays : <xsl:value-of select="./../@name"/> - Population : <xsl:value-of select="population"/>
                                        </text>
                                    </g>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:for-each>
                    </svg>
                </div>
            </body>

        </html>
    </xsl:template>

</xsl:stylesheet>