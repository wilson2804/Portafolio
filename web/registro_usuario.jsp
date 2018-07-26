<%-- 
    Document   : registro_usuario
    Created on : 17-04-2018, 15:58:58
    Author     : wilso
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.DAOUsuario"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.css">
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <%
            Usuario usuario = new Usuario("", "");
            DAOUsuario dao = new DAOUsuario();
            if (session.getAttribute("usuario") != null) {
                usuario = (Usuario) session.getAttribute("usuario");
            } else {
                response.sendRedirect("login.jsp");
            }%>

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






        <title>Registrar Usuario</title>
    </head>
    <body>
    <center>
        <div class="panel panel-default" style="width: 100%">
            <div class="panel-heading"><h3>Agregar Usuario</h3></div>
            <form action="ServletAgregarUser" method="POST" name="ejemplo">
                <label>Usuario:</label>
                <input type="text" name="user" placeholder="Usuario" required="" class="form-control" style="width: 35%"/>
                <br>
                <label>Password:</label> 
                <input type="password" name="pass" placeholder="Password" required="" class="form-control" style="width: 35%"/>
                <br>
                <label>Tipo de Usuario:</label> 
                <select name="tipos">
                    <%
                        ArrayList<Usuario> lista = dao.listarTipos();
                        for (int i = 0; i < lista.size(); i++) {
                            out.println("<option>" + lista.get(i).getDescripcion() + "</option>");
                        }
                    %>           
                </select>
                <br>
                <br>
                <input type="submit" class="btn btn-info" value="Registrar">               
            </form>
            <br>   
            <button onclick="closeWin()" class="btn btn-danger">Cerrar</button>
        </div>
    </center>





    <script>
        function closeWin() {
            window.close();
        }
    </script>    

</body>
</html>
