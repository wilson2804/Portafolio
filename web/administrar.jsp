<%-- 
    Document   : administrar
    Created on : 11-04-2018, 20:58:32
    Author     : wilso
--%>

<%@page import="modelo.Usuario"%>
<%@page import="modelo.DAOUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/sidebar.css">
        <link rel="stylesheet" href="css/bootstrap-theme.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        
        <%Usuario usuario = new Usuario("", "");
        Usuario user = new Usuario("", "");
        user = (Usuario) session.getAttribute("usuario");
          if (session.getAttribute("usuario") != null & user.getTipo_user()==1) {
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
        
        <title>Ferreteria </title>
    </head>
    <body>
        
    <div class="sidenav">
    <h1 style="color: #000">Bienvenido Administrador</h1>  
    <ul class="nav nav-pills brand-pills nav-stacked" role="tablist">
        <li role="presentation" class="brand-nav"><a href="adm_usuario.jsp">Usuarios</a></li>
        <li role="presentation" class="brand-nav"><a href="adm_cliente.jsp">Clientes</a></li>
        <li role="presentation" class="brand-nav"><a href="adm_proveedor.jsp">Proveedores</a></li>
        <li role="presentation" class="brand-nav"> <a href="adm_empleado.jsp">Empleados</a></li>
        <li role="presentation" class="brand-nav"> <a href="adm_productos.jsp">Productos</a></li>
    </ul>
    <br>
    <br>
    <br>
    <br>
    <a href="ServletLogin">Cerrar Sesión</a>
    </div>
        
        
    </body>
</html>
