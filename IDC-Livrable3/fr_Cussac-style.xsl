<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:w="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:param name="fileName" select="'fr_Cussac-coord-entites.xml'"/>
    <xsl:param name="pos" select="document($fileName)"/>
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    
    <xsl:variable name="default_time" select="xs:dateTime('2020-04-15T00:00:00+02:00')"/>
    <xsl:variable name="add" select="xs:dayTimeDuration(concat(concat('P0DT', 2 * position()), 'H'))"/>

    <xsl:template match="/">
        <xsl:apply-templates select="w:TEI"/>
    </xsl:template>

    <xsl:template match="w:TEI">
<!--        <xsl:element name="gpx" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns="http://www.topografix.com/GPX/1/1">
            <xsl:attribute name="xsi:schemaLocation">http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd</xsl:attribute>
            <xsl:attribute name="version">1.1</xsl:attribute>
            <xsl:attribute name="creator">IDC</xsl:attribute>-->
            
        <gpx version="1.1" creator="IDC" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns="http://www.topografix.com/GPX/1/1"
            xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd">
            
            <metadata>
                <name>Cussac</name>
                <link href="file:///fr_Cussac_liv2.xml">
                    <text>fr_Cussac_liv2.xml</text>
                </link>
            </metadata>
            <xsl:for-each
                select="/w:TEI/w:text/w:body/w:p/w:placeName">
                <xsl:variable name="varvalue" select="current()"/>

                <xsl:for-each select="$pos/geolocalisation/entite_nom">
                    <xsl:choose>

                        <xsl:when test="@id = $varvalue/@id">
                            <wpt lat="{@lat}" lon="{@lng}">
                                <ele>
                                    <xsl:value-of select="@alt"/>
                                </ele>
                                <name>
                                    <xsl:value-of select="text()"/>
                                </name>
                            </wpt>
                        </xsl:when>

                    </xsl:choose>
                </xsl:for-each>
            </xsl:for-each>


            <trk>
                <name>Cussac</name>
                <trkseg>

                    <xsl:for-each select="$pos/geolocalisation/entite_nom">
                        <trkpt lat="{@lat}" lon="{@lng}">
                            <ele>
                                <xsl:value-of select="@alt"/>
                            </ele>
                            <time>
                                <xsl:value-of
                                    select="$default_time + $add"
                                />
                            </time>
                            <name>
                                <xsl:value-of select="text()"/>
                            </name>
                        </trkpt>
                    </xsl:for-each>

                </trkseg>
            </trk>
        <!--</xsl:element>-->
        </gpx>
    </xsl:template>

    <!--<xsl:template match="w:teiHeader">
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
    </xsl:template>-->
</xsl:stylesheet>
