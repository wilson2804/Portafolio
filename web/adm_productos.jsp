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
            if (session.getAttribute("usuario") != null & user.getTipo_user() == 1) {
                usuario = (Usuario) session.getAttribute("usuario");
            } else {
                response.sendRedirect("login.jsp");
            }

            DAOEmpleado dao = new DAOEmpleado();
            DAOProducto daoP = new DAOProducto();

            pageContext.setAttribute("ordenes", daoP.listar_todos_Productos());

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
            <h1 style="color: #000">Bienvenido Administrador</h1>
            <ul class="nav nav-pills brand-pills nav-stacked" role="tablist">
                <li role="presentation" class="brand-nav"><a href="adm_usuario.jsp">Usuarios</a></li>
                <li role="presentation" class="brand-nav"><a href="adm_cliente.jsp">Clientes</a></li>
                <li role="presentation" class="brand-nav"><a href="adm_proveedor.jsp">Proveedores</a></li>
                <li role="presentation" class="brand-nav"> <a href="adm_empleado.jsp">Empleados</a></li>
                <li role="presentation" class="brand-nav active"> <a href="adm_productos.jsp">Productos</a></li>
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
                                    <h4 align="left">Productos Registrados.</h4>
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
                <table border="0" style="text-align: center;width: 100%">
                    <tr align="center">
                        <td>
                            <a href="javascript:Abrir_ventana('registrar_producto.jsp')"><button class="btn-info btn btn-lg">Agregar Producto</button></a>
                        </td>  
                    </tr>
                </table>
            </div>
            <div class="panel panel-default" style="width: 100%">
                <table border="0" class="table table-hover" cellspacing="" style="text-align: center">
                    <thead style="background-color: #4CAF50;color: white">
                        <tr>
                            <td nowrap>
                                CODIGO DE PRODUCTO
                            </td>
                            <td nowrap>
                                DESCRIPCION
                            </td>
                            <td nowrap>
                                PRECIO
                            </td>
                            <td nowrap> 
                                STOCK
                            </td>
                            <td>IMAGEN</td>                            
                        </tr>
                    </thead>
                    <c:forEach var= "u" items="${ordenes}">
                        <tr>
                            <td nowrap>${u.getCodigo_producto()}</td>
                            <td nowrap>${u.getDescripcion()}</td>
                            <td nowrap>$${u.getPrecio()}</td>
                            <td nowrap>${u.getStock()}</td>
                            <td nowrap><a href="tienda/${u.getImage()}">${u.getImage()}</a></td>                            
                        </tr>
                    </c:forEach>
                </table>

            </div>
        </div>
    </body>
</html>
