<%-- 
    Document   : exito
    Created on : 04-06-2018, 2:17:32
    Author     : sergio
--%>

<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>JSP Page</title>
    </head>

    <%Usuario usuario = new Usuario("", "");
        Usuario user = new Usuario("", "");
        user = (Usuario) session.getAttribute("usuario");
        if (session.getAttribute("usuario") != null & user.getTipo_user() == 3 || user.getTipo_user() == 4 || user.getTipo_user() == 1) {
            usuario = (Usuario) session.getAttribute("usuario");
        } else {
            response.sendRedirect("login.jsp");
        }%>
    <body>
    <center>
        <h1>SE HA REGISTRADO CON EXITO.</h1>
        <%if(user.getTipo_user() == 3){%>
        <a href="vendedor.jsp"><button onclick="cerrar()">VOLVER</button></a>
        <%}%>
        
        <%if(user.getTipo_user() == 4){%>
        <a href="empleado.jsp"><button onclick="cerrar()">VOLVER</button></a>
        <%}%>
        <%if(user.getTipo_user() == 1){%>
        <a href="adm_productos.jsp"><button onclick="cerrar()">VOLVER</button></a>
        <%}%>
    </center>
</body>

<script>
    function cerrar() {
        window.opener.location.reload();
        this.window.close();
    }
</script>
</html>
