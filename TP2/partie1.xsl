<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="countries">
        <html>

            <head>
                <title>Liste des pays</title>
                <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
                <style>.bar { fill: #aaa; height: 21px; -webkit-transition: fill .3s ease; transition: fill .3s ease; cursor: pointer; font-family: Helvetica, sans-serif; } .bar text { fill: #555; } .chart:hover .bar, .chart:focus .bar { fill: #aaa; } .bar:hover, .bar:focus { fill: #ea9728 !important; } .bar:hover text, .bar:focus text { fill: #ea9728; }</style>
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                        crossorigin="anonymous"/>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
                        crossorigin="anonymous"/>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                        crossorigin="anonymous"/>
            </head>

            <body>
                <div class="container-fluid p-5">
                    <div class="row h-100">
                        <div class="col-12 col-sm-2">
                            <ul class="nav flex-column card">

                                <div class="accordion" id="accordionExample">
                                    <div class="card">
                                        <div class="card-header" id="headingOne">
                                            <h2 class="mb-0">
                                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                                    Triés par le nombre de la population
                                                </button>
                                            </h2>
                                        </div>
                                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <div class="card-body">
                                                    <xsl:for-each select="country">
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="#{concat(@population,@area)}">
                                                                <xsl:value-of select="@name" />
                                                            </a>
                                                        </li>
                                                    </xsl:for-each>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card">
                                        <div class="card-header" id="headingTwo">
                                            <h2 class="mb-0">
                                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                    Triés par le nombre de la population
                                                </button>
                                            </h2>
                                        </div>
                                        <div id="collapseTwo" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <div class="card-body">
                                                    <xsl:for-each select="country">
                                                        <xsl:sort select="@population" data-type="number" order="descending"/>
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="#{concat(@population,@area)}">
                                                                <xsl:value-of select="@name" />
                                                            </a>
                                                        </li>
                                                    </xsl:for-each>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card">
                                        <div class="card-header" id="headingThree">
                                            <h2 class="mb-0">
                                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                    Triés par la superficie
                                                </button>
                                            </h2>
                                        </div>
                                        <div id="collapseThree" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <div class="card-body">
                                                    <xsl:for-each select="country">
                                                        <xsl:sort select="@area" data-type="number" order="descending"/>
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="#{concat(@population,@area)}">
                                                                <xsl:value-of select="@name" />
                                                            </a>
                                                        </li>
                                                    </xsl:for-each>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>


                            </ul>
                        </div>
                        <div class="col-12 col-sm-10">
                            <div class="row h-100">
                                <xsl:apply-templates>
                                    <xsl:sort select="@name" order="ascending" data-type="text"/>
                                    <xsl:sort select="@population" order="ascending" data-type="number"/>
                                    <xsl:sort select="@area" order="ascending" data-type="number"/>
                                </xsl:apply-templates>
                            </div>
                        </div>
                    </div>
                </div>
                <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
                <script>$(document).on('click', '.nav-link', (e) => { var id_panel = $(e.target).attr('href'); $('.panel').addClass('d-none'); $(id_panel).removeClass('d-none'); });</script>
            </body>

        </html>
    </xsl:template>




    <xsl:template match="country">
        <xsl:variable name="populationTotale" select="@population"/>
        <div class="col-12 d-none panel">

            <xsl:attribute name="id">
                <xsl:value-of select="concat(@population,@area)"/>
            </xsl:attribute>

            <div class="card h-100 p-3">
                <h2><xsl:value-of select="@name"/></h2>
                <div class="card p-3 m-1">
                    <h4>Informations générales</h4>
                    <table class="table mt-1">
                        <tbody>
                            <tr>
                                <th scope="row">Population</th>
                                <td><xsl:value-of select="@population"/></td>
                            </tr>
                            <tr>
                                <th scope="row">Superficie</th>
                                <td><xsl:value-of select="@area"/></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <xsl:if test="city">
                    <div class="card p-3 m-1">
                        <h4>Villes</h4>
                        <xsl:apply-templates select="city">
                            <xsl:with-param name="populationTotale" select="$populationTotale"/>
                        </xsl:apply-templates>
                    </div>
                </xsl:if>
                <xsl:if test="language">
                    <div class="card p-3 m-1">
                        <h4>Langues</h4>
                        <xsl:apply-templates select="language"/>
                    </div>
                </xsl:if>
                <xsl:if test="city">
                    <div class="card h-100 p-3 m-1">
                        <h4>Histogrammes villes</h4>
                        <div class="h-100 w-100 px-4 py-3">
                            <figure>
                                <svg version="1.1" xmlns="http://www.w3.org/2000/svg" class="chart" width="100%"
                                     height="100%" aria-labelledby="title" role="img">
                                    <title>Histogramme</title>
                                    <xsl:for-each select="city">
                                        <xsl:sort select="population" order="descending" data-type="number"/>
                                        <xsl:variable name="percentagePopulation" select="format-number((population div $populationTotale) * 100, '##.##')"/>
                                        <g class="bar">
                                            <rect height="19" width="{$percentagePopulation*10}" y="{position()*20}"></rect>
                                            <text x="{$percentagePopulation*10+10}" y="{position()*20+9}" dy=".35em">
                                                <xsl:value-of select="name"/> (<xsl:value-of select="$percentagePopulation"/> %)
                                            </text>
                                        </g>
                                    </xsl:for-each>
                                </svg>
                            </figure>
                        </div>
                    </div>
                </xsl:if>
            </div>
        </div>
    </xsl:template>



    <xsl:template match="city">
        <xsl:param name="populationTotale"/>
        <li class="list-group-item">
            <xsl:value-of select="name"/> : <xsl:value-of select="population"/> habitants (<xsl:value-of select="format-number((population div $populationTotale) * 100, '##.##')"/> % de la population totale)
        </li>
    </xsl:template>



    <xsl:template match="language">
        <li class="list-group-item"><xsl:apply-templates /> : <xsl:value-of select="@percentage"/> %</li>
    </xsl:template>



</xsl:stylesheet>