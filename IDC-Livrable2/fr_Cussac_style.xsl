<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:w="http://www.tei-c.org/ns/1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:param name="fileName" select="'fr_Cussac-coord-entites.xml'" />
    <xsl:param name="pos" select="document($fileName)" />
    <xsl:output method="xml"/>

    <xsl:template match="/">
        <xsl:apply-templates select="w:TEI"/>
    </xsl:template>
    
    <xsl:template match="w:TEI">
        <TEI>
            <xsl:apply-templates select="w:teiHeader"/>
            <xsl:apply-templates select="w:text"/>
        </TEI>
    </xsl:template>
    
    <xsl:template match="w:teiHeader">
        <teiHeader>
            <xsl:apply-templates select="w:fileDesc"/>
        </teiHeader>
    </xsl:template>
    
    <xsl:template match="w:fileDesc">
        <fileDesc>
            <xsl:apply-templates select="w:titleStmt"/>
            <xsl:apply-templates select="w:publicationStmt"/>
            <xsl:apply-templates select="w:sourceDesc"/>
        </fileDesc>
    </xsl:template>
    
    <xsl:template match="w:titleStmt">
        <titleStmt>
            <xsl:apply-templates select="w:title"/>
        </titleStmt>
    </xsl:template>
    
    <xsl:template match="w:title">
        <title>
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    
    <xsl:template match="w:publicationStmt">
        <publicationStmt>
            <xsl:apply-templates select="w:p"/>
        </publicationStmt>
    </xsl:template>
    
    <xsl:template match="w:sourceDesc">
        <sourceDesc>
            <xsl:apply-templates select="w:p"/>
        </sourceDesc>
    </xsl:template>
    
    <xsl:template match="w:text">
        <text>
            <xsl:apply-templates select="w:body"/>
        </text>
    </xsl:template>
    
    <xsl:template match="w:body">
        <body>
            <xsl:apply-templates select="w:p"/>
        </body>
    </xsl:template>
    
    <xsl:template match="w:p">
        <p>
            <xsl:apply-templates select="w:w"/>
            <xsl:apply-templates select="w:p"/>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="w:pc">
        <pc>
            <xsl:copy-of select="@lemma"/>
            <xsl:copy-of select="@type"/>
            <xsl:apply-templates/>
        </pc>
    </xsl:template>
    
    <xsl:template match="w:w">
            <xsl:choose>
                <xsl:when test="@type='NAM'">
                        <xsl:variable name="tei" select="w:TEI/w:text/w:body"/>
                        <xsl:variable name="varvalue" select="current()"/>
                        <xsl:choose>
                            <xsl:when test="$pos/geolocalisation/entite_nom[text()=$varvalue]">
                                <xsl:for-each select="$pos/geolocalisation/entite_nom[text()=$varvalue][count((current()/preceding::*)[text()=$varvalue]) + 1]">
                                    
                                    <placeName id="{@id}" ref="file:fr_Cussac-coord-entites.xml">
                                      <name>
                                          <w>
                                              <xsl:copy-of select="@type"/>
                                              <xsl:apply-templates/>
                                          </w>
                                      </name> 
                                  </placeName>
                                    
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <w>
                                    <xsl:copy-of select="@lemma"/>
                                    <xsl:copy-of select="@type"/>
                                    <xsl:apply-templates/>
                                </w>
                            </xsl:otherwise>
                        </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <w>
                        <xsl:copy-of select="@lemma"/>
                        <xsl:copy-of select="@type"/>
                        <xsl:apply-templates/>
                    </w>
                </xsl:otherwise>
            </xsl:choose>
    </xsl:template>    
</xsl:stylesheet>