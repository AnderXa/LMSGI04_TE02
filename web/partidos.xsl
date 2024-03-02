<!-- 
    ALUMNO: Ander Chaparro Ibarguren
    FECHA: 02/03/2024
    MÓDULO: LMSGI
    UD: 04
    TAREA EVALUATIVA 02
    AUTOEVALUACIÓN: 
    PÁGINA ONLINE: 
    INICIO: Página principal de la web.
-->


<!-- Estructura básica de un documento xsl-->
<?xsl version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
<xsl:output method="html" doctype-system="about:legacy-compat" />

<!-- Plantilla principal: intercalamos código HTML con datos XML -->
<xsl:template match="/partidos">
    <html lang="es">

        <head>
            <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
            <meta charset="utf-8"/>
            <meta name="description" content="Página principal" />
            <title>titulo de la web</title>
        </head>

        <body>
            <header>
                <img src= "../img/logotipo.png" alt= "Reservas" />
                <a href="tienda.xml">Tienda</a>
                <a href="equipos.xml">Equipos</a>
                <a href="partidos.xml">Partidos</a>
            </header>
            
            <main>
                <h1>PARTIDOS</h1>
                <table>
                    <tr>
                        <th>PARTIDO</th>
                        <th>FECHA</th>
                        <th>RESULTADO</th>
                    </tr>
                    <xsl:for-each select="partido[lugar/@ciudad='Lima']">
                        <xsl:sort select="fecha" order="descending"/>

                        <!-- Variables para saber quién gana -->
                        <xsl:variable name="puntosLocal" select="equipos/local/@puntuacion"/>
                        <xsl:variable name="puntosVisitante" select="equipos/visitante/@puntuacion"/>
                        
                        <tr>
                            <td><xsl:value-of select="equipos/local"/> - <xsl:value-of select="equipos/visitante"/></td>
                            <td><xsl:value-of select="fecha"/></td>
                            <xsl:choose>
                                <xsl:when test="$puntosVisitante > $puntosLocal">
                                    <td class="azul"><xsl:value-of select="concat(' ', equipos/local/@puntuacion, ' - ', equipos/visitante/@puntuacion)"/></td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td><xsl:value-of select="concat(' ', equipos/local/@puntuacion, ' - ', equipos/visitante/@puntuacion)"/></td>
                                </xsl:otherwise>
                            </xsl:choose>
                        </tr>
                    </xsl:for-each>
                </table>			
            </main>
            <footer>
                <address>&#169; Desarrollado por info@birt.eus</address>
            </footer>
        </body>
    </html>
</xsl:template>

</xsl:stylesheet>