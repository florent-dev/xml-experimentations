
<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"

	version="1.0"
>



<xsl:template match="countries">
  <html>
    <body>
		<h3>list pays hispanisant</h3>	
      <xsl:apply-templates select="countriescountry[language = 'Spanish']/@name"/>
<hr/>	
		<h3>list pays hispanisant > 30 000 000 ha</h3>	
      <xsl:apply-templates select="countriescountry[language = 'Spanish'][@population > 30000000]/@name"/>
<hr/>	
	    <h3>list villes</h3>
      <xsl:apply-templates select="country[language = 'Spanish']/descendant::name"/>
<hr/>
	<h3>Liste des pays ayant des villes de plus de 8 million d'hab</h3>

      <xsl:apply-templates select="countrycity[population > 8000000]/ancestor::country/@name"/>
	  <xsl:apply-templates select="country[citypopulation > 8000000]/@name"/>
   </body>
  </html>
</xsl:template>

<xsl:template match="name">
  <p><xsl:apply-templates/></p>
</xsl:template>

<xsl:template match="@name">
  <p><xsl:value-of select="."/></p>
</xsl:template>

<!--
 <xsl:template match="city">
   <p>une ville !!</p>
 </xsl:template>


 <xsl:template match="country">
   <p>un pays !!</p>
 </xsl:template>
-->
</xsl:stylesheet>
