<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/arrays">
        <html>
        <head>
            <style>
                table {
                    padding: 15px;
                    text-align: center;
                }

                table td {
                    border: 1px solid #F3F3F3;
                    padding: 15px;
                    text-align: center;
                    background-color: #F9F9F9;
                }
            </style>
        </head>
        <body>
            <table>
                <th colspan="2">
                    Результат
                </th>
                <xsl:for-each select="array">
                    <tr class="table-elem">
                        <td><xsl:value-of select="array[1]"/></td>
                        <td><xsl:value-of select="array[2]"/></td>
                    </tr>
                </xsl:for-each>
            </table>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>