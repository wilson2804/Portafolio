<%-- 
    Document   : seleccionar_productos
    Created on : 25-05-2018, 17:26:53
    Author     : sergio
--%>

<%@page import="java.util.List"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="modelo.DAOProducto"%>
<%@page import="modelo.Producto"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.css">
        <link href="css/font-awesome.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/sidebar.css">
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <%
            int idProveedor = Integer.parseInt(request.getParameter("id_p"));
            DAOProducto dao = new DAOProducto();
            pageContext.setAttribute("productos", dao.listarProductos(idProveedor));
        %>                 

        <meta charset="UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <h1>PRODUCTOS</h1>
        <br>
        <div class="panel panel-default" style="width: 75%">
            <table class="table table-hover" cellspacing="8" style="text-align: center">
                <thead style="background-color: #4CAF50;color: white">
                    <tr>
                        <td nowrap>CODIGO</td>
                        <td nowrap>DESCRIPCION</td>
                        <td nowrap>PRECIO UNITARIO</td>
                        <td nowrap>STOCK</td>
                        <td nowrap>STOCK CRITICO</td>
                        <td nowrap></td>
                    </tr>
                </thead>
                <c:forEach var="p" items="${productos}">
                    <tr>
                        <td nowrap>${p.getCodigo_producto()}</td>
                        <td nowrap>${p.getDescripcion()}</td>
                        <td nowrap>$${p.getPrecio()}</td>
                        <td nowrap>${p.getStock()}</td>
                        <td nowrap>${p.getStock_critico()}</td>
                        <td><input type="checkbox" onClick="fcheck(this);" id="chk_${p.getCodigo_producto()}" value="${p.getCodigo_producto()}"></td>
                    </tr>    
                </c:forEach>
            </table>
        </div>
        <button class="btn btn-success" onClick="cerrar();">Agregar Productos Seleccionados.</button>
    </center>   
</body>

<script type="text/javascript">
    var codes = "";

    function fcheck(box) {
        var code = "";
        if (box.checked) {
            code = box.value;
            codes = codes + "," + code;
        } else {
            //alert(box.value);
            codes = codes.replace("," + box.value, "");
            // codes = code;
        }
    }

    function cerrar() {
        window.opener.codigo_producto.value = codes;
        window.opener.llenarProductos();
        this.window.close();
    }
</script>

</html>
