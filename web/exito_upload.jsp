<%-- 
    Document   : exito
    Created on : 04-06-2018, 2:17:32
    Author     : sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>JSP Page</title>
        <%
        String img = request.getParameter("img");
        %>
    </head>
    <body>
    <center>
        <h1>SE HA CARGADO CON EXITO.</h1>
        <input type="hidden" value="<%=img%>" id="img">
        <button onclick="cerrar()">VOLVER</button>
    </center>
</body>
<script>
    function cerrar() {
        window.opener.conf.value = document.getElementById("img").value;
        this.window.close();
    }
</script>
</html>
