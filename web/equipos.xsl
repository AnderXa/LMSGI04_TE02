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
<xsl:template match="/equipos">
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
                <!-- Aplicar la plantilla para equipos con entrenador Julio Velasco -->
                <xsl:apply-templates select="equipo[entrenador/nombre='Julio Velasco']"/>            </main>

            <footer>
                <address>&#169; Desarrollado por info@birt.eus</address>
            </footer>
        </body>
    </html>
</xsl:template>

<!-- Plantilla para equipos con entrenador Julio Velasco -->
<xsl:template match="equipo">
    <!-- Guardar nombre del entrenador en variable -->
    <xsl:variable name="nombreEntrenador" select="entrenador/nombre" />

    <h1><a href="{entrenador/url}"><xsl:value-of select="$nombreEntrenador"/></a></h1>
    <article class="equipos">
        <h4><xsl:value-of select="nombre"/></h4>
        <!-- Aplicar la plantilla para jugadores -->
        <xsl:apply-templates select="jugadores/jugador"/>
    </article>
</xsl:template>

<!-- Plantilla para jugadores -->
<xsl:template match="jugador">
    <p><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></p>
</xsl:template>

</xsl:stylesheet>