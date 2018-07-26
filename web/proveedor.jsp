<%-- 
    Document   : proveedor
    Created on : 18-04-2018, 20:05:04
    Author     : wilso
--%>

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
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <%
            Usuario usuario = new Usuario("", "");
            Usuario user = new Usuario("", "");
            user = (Usuario) session.getAttribute("usuario");            
            if (session.getAttribute("usuario") != null & user.getTipo_user() == 5) {
                usuario = (Usuario) session.getAttribute("usuario");
            } else {
                response.sendRedirect("login.jsp");
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
            <h1 style="color: #000">BIENVENIDO <%=usuario.getUser().toUpperCase()%></h1>  
            <ul class="nav nav-pills brand-pills nav-stacked" role="tablist">
                <li role="presentation" class="brand-nav"><a href="revisar_pedidos_proveedor.jsp">Revisar Pedidos.</a></li>
            </ul>
            <br>
            <br>
            <br>
            <br>
            <a href="ServletLogin">Cerrar Sesión</a>
        </div>
    </body>
</html>
