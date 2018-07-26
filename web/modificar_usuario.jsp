<%-- 
    Document   : modificar_usuario
    Created on : 24-04-2018, 15:52:56
    Author     : wilso
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.DAOUsuario"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.css">
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <%
        Usuario usuario = new Usuario("", "");
        DAOUsuario dao = new DAOUsuario();
          if (session.getAttribute("usuario") != null) {
                usuario = (Usuario) session.getAttribute("usuario");
            } else {
                response.sendRedirect("login.jsp");
            }         
        String user = request.getParameter("usuario");
        String pass = request.getParameter("pass");
        int tipo_user = Integer.parseInt(request.getParameter("tipo_user"));%>
        
        <script>
        function closeWin() {
        window.close();
        }
        </script>
        
    </head>
    <body>
         <center>
        <div class="panel panel-default" style="width: 100%">
            <div class="panel-heading"><h3>Modificar Usuario</h3></div>
            <form action="ServletModificar" method="POST">
                <label>Usuario:</label>
                <input type="text" name="user" placeholder="Usuario" value="<%=user%>" required="" class="form-control" style="width: 35%"/>
                <br>
                <label>Password:</label> 
                <input type="text" name="pass" placeholder="Password" value="<%=pass%>" required="" class="form-control" style="width: 35%"/>
                <br>
                <label>Tipo de Usuario:</label> 
                <select name="tipos">
                    <%
                        ArrayList<Usuario> lista = dao.listarTipos();
                        for (int i = 0; i < lista.size(); i++) {
                            if(lista.get(i).getTipo_user()== tipo_user){
                            out.println("<option selected>" + lista.get(i).getDescripcion() + "</option>");
                            }
                            
                        }
                    %>           
                </select>
                <br>
                <br>
                <input type="submit" class="btn btn-info" value="Modificar">               
            </form>
                <br>   
                <button onclick="closeWin()" class="btn btn-danger">Cerrar</button>
       </div>
    </center>
    </body>
</html>
