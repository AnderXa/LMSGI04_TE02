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
<xsl:template match="/tienda">
    <html lang="es">

        <head>
            <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
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
            
            <main class="principal">
                <xsl:for-each select="articulo">
                    <article>
                        <section>
                            <img class="articulo" src="../img/{@foto}" />			
                        </section>
                        <section>
                            <h2><xsl:value-of select="precio"/></h2>

                            <!-- Cuenta comentarios -->
                            <xsl:variable name="numComentarios" select="count(comentarios)"/>

                            <h3>Comentarios: <xsl:value-of select="$numComentarios"/></h3>
                            <ul>
                                <xsl:for-each select="comentarios">
                                    <li><xsl:value-of select="."/></li>                                
                                </xsl:for-each>
                            </ul>
                        </section>
                    </article>
                </xsl:for-each>
            </main>
            <footer>
                <address>&#169; Desarrollado por info@birt.eus</address>
            </footer>
        </body>
    </html>
</xsl:template>

</xsl:stylesheet>