<%-- 
    Document   : adm_usuario
    Created on : 11-04-2018, 21:42:11
    Author     : wilso
--%>

<%@page import="modelo.DAOUsuario"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Proveedor"%>
<%@page import="modelo.DAOProveedor"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.css">
        <link rel="stylesheet" href="css/sidebar.css">
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <script type="text/javascript">
            function Abrir_ventana(pagina) {
                var opciones = "toolbar=no, location=no, directories=no, status=yes, menubar=yes, scrollbars=yes, resizable=yes, width=500, height=380, top=20, left=100";
                window.open(pagina, "", opciones);
            }
        </script>



        <%
            Usuario usuario = new Usuario("", "");
            Usuario user = new Usuario("", "");
            user = (Usuario) session.getAttribute("usuario");
            DAOProveedor dao = new DAOProveedor();
            if (session.getAttribute("usuario") != null & user.getTipo_user() == 1) {
                usuario = (Usuario) session.getAttribute("usuario");
            } else {
                response.sendRedirect("login.jsp");
            }

            String idTipo = request.getParameter("idtipo");
            String buscar = request.getParameter("proveedor");
            if (idTipo != null) {
                pageContext.setAttribute("proveedores", dao.ListarProveedoresFiltro(idTipo, buscar));
            } else {
                pageContext.setAttribute("proveedores", dao.listarProveedor());
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
        <title>JSP Page</title>
    </head>
    <body>

        <div class="sidenav">
            <h1 style="color: #000">Bienvenido Administrador</h1>
            <ul class="nav nav-pills brand-pills nav-stacked" role="tablist">
                <li role="presentation" class="brand-nav "><a href="adm_usuario.jsp">Usuarios</a></li>
                <li role="presentation" class="brand-nav"><a href="adm_cliente.jsp">Clientes</a></li>
                <li role="presentation" class="brand-nav active"><a href="adm_proveedor.jsp">Proveedores</a></li>
                <li role="presentation" class="brand-nav"> <a href="adm_empleado.jsp">Empleados</a></li>
                <li role="presentacion" class="brand-nav"><a href="adm_productos.jsp"> Producto</a></li> 
            </ul>
            <br>
            <br>
            <br>
            <br>
            <a href="ServletLogin">Cerrar Sesión</a>
        </div>

        <div class="main">
            <form action="ServletFiltro_Proveedor" method="POST">
                Buscar Por :
                <select name="tipo">
                    <option value="0">
                        Todos
                    </option>
                    <option value="1">
                        Id
                    </option>
                    <option value="2">
                        Nombre
                    </option>
                    <option value="3">
                        Rubro
                    </option>
                    <option value="4">
                        Comuna
                    </option>
                </select>
                <input type="text" name="buscar">
                <input class="btn-info btn-sm" type="submit" value="Buscar">
            </form>
            <br>
            <div class="panel panel-default" style="width: 100%">
                <table border="0" style="text-align: center;width: 100%">
                    <tr>
                        <td>
                            <a href="javascript:Abrir_ventana('registro_proveedor.jsp')"><button class="btn-info btn btn-lg">Ingresar</button></a>
                        </td>
                        <td>
                            <button class="btn-info btn btn-lg" onclick="location.reload()">Actualizar</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="panel panel-default" style="width: 100%">
                <table class="table table-hover" cellspacing="8" style="text-align: center">
                    <thead style="background-color: #4CAF50;color: white" >
                        <tr>
                            <td nowrap>Codigo de proveedor</td>
                            <td nowrap>Nombre</td>
                            <td nowrap>Contacto</td>
                            <td nowrap>Telefono</td>
                            <td nowrap>Rubro</td>
                            <td nowrap>Correo</td>
                            <td nowrap>Usuario</td>
                            <td nowrap></td>
                        </tr>
                    </thead>
                    <c:forEach var= "u" items="${proveedores}"   >
                        <tr >
                            <td nowrap>${ u.getId_proveedor()}</td>
                            <td nowrap>${ u.getNombre()}</td>
                            <td nowrap>${ u.getContacto()}</td>
                            <td nowrap>${ u.getTelefono()}</td>
                            <td nowrap>${ u.getRubro()}</td>
                            <td nowrap>${ u.getCorreo()}</td>
                            <td nowrap>${ u.getUsuario()}</td>

                            <td>
                                <table>
                                    <tr>
                                        <td nowrap><a href="javascript:Abrir_ventana('modificar_proveedor.jsp?id_prove=${ u.getId_proveedor()}&nombre=${u.getNombre()}&contacto=${u.getContacto()}&telefono=${u.getTelefono()}&rubro=${u.getRubro()}&correo=${u.getCorreo()}')"><img style="width: 30%" src="128px/compose.png"/></a></td>

                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>                           
    </body>
</html>     