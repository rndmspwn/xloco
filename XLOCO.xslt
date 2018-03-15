<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="//ontologia">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="ideal">
  <xsl:apply-templates select="atributos"/>
  <xsl:apply-templates select="metodos"/>
</xsl:template>

<xsl:template match="atributos"> 
  <xsl:apply-templates select="atributo"/>
</xsl:template>


<xsl:template match="atributo">
 "<xsl:value-of select="@nbatributo"/>":
 "<xsl:value-of select="@tipo"/>",<br/>
</xsl:template>


<xsl:template match="metodos">
 <xsl:apply-templates select="metodo"/>
</xsl:template>

<xsl:template match="metodo">
<br></br>

  "<xsl:value-of select="@nbmetodo"/>":
  function(){
  <xsl:apply-templates select="asignacion"/>
   <xsl:apply-templates select="decision"/>
     return                 }


</xsl:template>

<xsl:template match="asignacion">
  <xsl:value-of select="variable"/> =
  <xsl:value-of select="operando"/>;<br/>
</xsl:template>

<xsl:template match="decision">
  if (<xsl:value-of select="condicion"/>)
  <xsl:apply-templates select="verdadero"/>
  <xsl:apply-templates select="falso"/>
</xsl:template>

<xsl:template match="verdadero">
  { <br/><xsl:apply-templates select="metodo"/> }
</xsl:template>

<xsl:template match="falso">
 else { <xsl:apply-templates select="metodo"/> }
</xsl:template>

</xsl:stylesheet>