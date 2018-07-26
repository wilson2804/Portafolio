<%-- 
    Document   : subirArchivo
    Created on : 23-06-2018, 18:52:42
    Author     : jano1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SUBIR ARCHIVO AL SERVIDOR</title>
    </head>
    <body>
        <form action="ServletAgregar_producto" method="post" enctype="multipart/form-data">
            <table border="1">
                <tr>
                    <td>
                        <input type="file" name="file"/>                        
                    </td>
                    <td>
                        <input type="submit" value="SUBIR ARCHIVO"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
