<%-- 
    Document   : empleado
    Created on : 18-04-2018, 20:05:45
    Author     : wilso
--%>

<%@page import="modelo.Usuario"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.css">
        <link rel="stylesheet" href="css/sidebar.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <meta charset="UTF-8">
        <title>JSP Page</title>
        <%Usuario usuario = new Usuario("", "");
            Usuario user = new Usuario("", "");
            user = (Usuario) session.getAttribute("usuario");
            if (session.getAttribute("usuario") != null & user.getTipo_user() == 3) {
                usuario = (Usuario) session.getAttribute("usuario");
            } else {
                response.sendRedirect("login.jsp");
            }
        %>

        <%
            if (session.getAttribute("exito") != null) {
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
    </head>
    <body>

        <div class="sidenav">
            <h1 style="color: #000"><%= usuario.getUser().toUpperCase()%></h1><br>
            <ul class="nav nav-pills brand-pills nav-stacked" role="tablist">                
                <li role="presentation" class="brand-nav active"><a href="empleado.jsp">Realizar Venta.</a></li>
                <li role="presentation" class="brand-nav"><a href="revision_ventas.jsp">Revisar Ventas.</a></li>                
                <li role="presentation" class="brand-nav"><a href="adm_productos_vendedor.jsp">Productos</a></li>
            </ul>
            <br>
            <br>
            <br>
            <br>
            <a href="ServletLogin">Cerrar Sesión</a>
        </div>    

        <div class="main">
            <div class="panel-heading" style="background-color: #ccffcc">
                <div class="table-responsive">
                    <table style="width: 100%" border="0">
                        <tr>
                            <td>
                                <h2 align="center">BIENVENIDO</h2>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <br>
            <div class="panel-body">
                <div class="table-responsive">                        
                    <table class="table" border="0"> 
                        <tr style="background-color: #99ff99">
                            <td>
                                <h2 align="center">Venta Boleta</h2>
                            </td>
                            <td>
                                <h2 align="center">Venta Factura</h2>                               
                            </td>
                        </tr>
                        <tr>
                            <td align="center">                               
                                <img src="images/boleta.jpg" style="width: 250px;height: 250px" alt=""/>
                            </td>
                            <td align="center">                                
                                <img src="images/factura.jpg" style="width: 250px;height: 250px" alt=""/>
                            </td>
                        </tr>

                        <tr>
                            <td align="center">                               
                                <a href="venta_boleta.jsp"><button class="btn btn-lg" style="width: 30%;height: 35px"></button></a>
                            </td>
                            <td align="center">                                
                                <a href="venta_factura.jsp"><button class="btn btn-lg" style="width: 30%;height: 35px"></button></a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
