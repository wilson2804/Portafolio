<%-- 
    Document   : revisar_pedidos
    Created on : 04-06-2018, 14:35:40
    Author     : sergio
--%>

<%@page import="modelo.DAOProducto"%>
<%@page import="modelo.DAOEmpleado"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="modelo.Empleado"%>
<%@page import="modelo.Usuario"%>
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

            Empleado emp = new Empleado();
            DAOEmpleado dao = new DAOEmpleado();
            DAOProducto daoP = new DAOProducto();

            pageContext.setAttribute("boletas", daoP.listarBoletas());
            pageContext.setAttribute("facturas", daoP.listarFacturas());
            emp = dao.buscarEmpleadoPorUsuario(usuario.getTipo_user());

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
            <h1 style="color: #000"><%= usuario.getUser().toUpperCase()%></h1><br>
            <ul class="nav nav-pills brand-pills nav-stacked" role="tablist">
                <li role="presentation" class="brand-nav"><a href="vendedor.jsp">Realizar Venta.</a></li>
                <li role="presentation" class="brand-nav active"><a href="revision_ventas.jsp">Revisar Ventas.</a></li>                
                <li role="presentation" class="brand-nav"><a href="adm_productos_vendedor.jsp">Productos</a></li>
            </ul>
            <br>
            <br>
            <br>
            <br>
            <a href="ServletLogin">Cerrar Sesión</a>
        </div>
        <div class="main">

            <div class="table-responsive">
                <div class="panel-heading" style="">
                    <div class="table-responsive">
                        <table border="0" style="width: 100%">
                            <tr>
                                <td>
                                    <h4 align="left">Boletas Emitidas</h4>
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
                                NRO BOLETA
                            </td>
                            <td nowrap>
                                FECHA DE EMISION
                            </td>
                            <td nowrap>
                                TOTAL
                            </td>                         
                            <td></td>
                        </tr>
                    </thead>
                    <c:forEach var= "u" items="${boletas}">
                        <tr>
                            <td nowrap>${u.getId_boleta()}</td>
                            <td nowrap>${u.getFecha()}</td>
                            <td nowrap>$${u.getTotal()}</td>                            
                            <td><a href="javascript:Abrir_ventana('detalle_boleta.jsp?id_boleta=${ u.getId_boleta()  + 354656786}&id_usuario=${usuario.getId() + 354656786}')">VER DETALLES</a></td>
                        </tr>
                    </c:forEach>
                </table>

            </div>

            <div class="table-responsive">
                <div class="panel-heading" style="">
                    <div class="table-responsive">
                        <table border="0" style="width: 100%">
                            <tr>
                                <td>
                                    <h4 align="left">Facturas Emitidas</h4>
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
                                NRO FACTURA
                            </td>
                            <td nowrap>
                                FECHA DE EMISION
                            </td>
                            <td nowrap>
                                TOTAL NETO
                            </td>
                            <td nowrap>
                                TOTAL IVA
                            </td>
                            <td nowrap>
                                TOTAL BRUTO
                            </td>
                            <td></td>
                        </tr>
                    </thead>
                    <c:forEach var= "u" items="${facturas}">
                        <tr>
                            <td nowrap>${u.getId_factura()}</td>
                            <td nowrap>${u.getFecha()}</td>
                            <td nowrap>$${u.getNeto()}</td> 
                            <td nowrap>$${u.getIva()}</td> 
                            <td nowrap>$${u.getBruto()}</td> 
                            <td><a href="javascript:Abrir_ventana('detalle_factura.jsp?id_factura=${u.getId_factura()}&id_usuario=${usuario.getId()}')">VER DETALLES</a></td>
                        </tr>
                    </c:forEach>
                </table>

            </div>
        </div>                        
    </body>
</html>
