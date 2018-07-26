<%-- 
    Document   : revisar_pedidos_proveedor
    Created on : 04-06-2018, 17:24:37
    Author     : sergio
--%>

<%@page import="modelo.DAOProducto"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.DAOProveedor"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.css">
        <link href="css/font-awesome.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/sidebar.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%Usuario usuario = new Usuario("", "");
            Usuario user = new Usuario("", "");
            user = (Usuario) session.getAttribute("usuario");
            if (session.getAttribute("usuario") != null & user.getTipo_user() == 5) {
                usuario = (Usuario) session.getAttribute("usuario");
            } else {
                response.sendRedirect("login.jsp");
            }
            DAOProveedor daoP = new DAOProveedor();

            int id = daoP.buscarProveedorPorUsuario(usuario.getId());

            DAOProducto dao = new DAOProducto();
            pageContext.setAttribute("ordenes", dao.listarOrdenes_Proveedor(id));


        %>

        <%            if (session.getAttribute("exito") != null) {
        %>
        <script>
            alert("<%=session.getAttribute("exito")%>");
        </script>
        <%
                session.removeAttribute("exito");
            }
        %>

        <%
            if (session.getAttribute("error") != null) {
        %>
        <script>
            alert("<%=session.getAttribute("error")%>");
        </script>
        <%
                session.removeAttribute("error");
            }
        %>

        <script type="text/javascript">
            function Abrir_ventana(pagina) {
                var opciones = "toolbar=no, location=no, directories=no, status=yes, menubar=yes, scrollbars=no, resizable=yes, width=1008, height=625, top=20, left=200";
                window.open(pagina, "", opciones);
            }
        </script> 
    </head>
    <body>
        <div class="sidenav">
            <h1 style="color: #000">BIENVENIDO <%= usuario.getUser().toUpperCase()%></h1><br>
            <ul class="nav nav-pills brand-pills nav-stacked" role="tablist">
                <li role="presentation" class="brand-nav active"><a href="revisar_pedidos_proveedor.jsp">Revisar Pedidos.</a></li>
            </ul>
            <br>
            <br>
            <br>
            <br>
            <a href="ServletLogin">Cerrar Sesión</a>
        </div>
        <div class="main">

            <div class="table-responsive">
                <div class="panel-heading" style="background-color: #ccffcc">
                    <div class="table-responsive">
                        <table border="0" style="width: 100%">
                            <tr>
                                <td>
                                    <h4 align="left">Ordenes de Compra generadas</h4>
                                </td>
                            </tr>
                            <tr>
                                <td><p style="color:gray" align="left"></p></td>                                
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="panel panel-default" style="width: 100%">
                <table border="0" class="table table-hover" cellspacing="" style="text-align: center">
                    <thead style="background-color: #4CAF50;color: white">
                        <tr>
                            <td nowrap>
                                ID ORDEN DE COMPRA
                            </td>
                            <td nowrap>
                                FECHA DE EMISION
                            </td>
                            <td nowrap>
                                RUT DEL EMPLEADO EMISOR
                            </td>
                            <td nowrap> 
                                PROVEEDOR
                            </td>
                            <td></td>
                        </tr>
                    </thead>
                    <c:forEach var= "u" items="${ordenes}">
                        <tr>
                            <td nowrap>${u.getId()}</td>
                            <td nowrap>${u.getFecha()}</td>
                            <td nowrap>${u.getEmp_rut()}</td>
                            <td nowrap>${u.getProv_nombre()}</td>
                            <td><a href="javascript:Abrir_ventana('detalle_orden_proveedor.jsp?id_orden=${ u.getId()}')">VER DETALLES</a></td>
                        </tr>
                    </c:forEach>
                </table>

            </div>
        </div>
    </body>
</html>
