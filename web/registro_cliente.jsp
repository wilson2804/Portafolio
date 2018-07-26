<%-- 
    Document   : login
    Created on : 23-11-2017, 16:14:55
    Author     : Wilson
--%>

<%@page import="modelo.Tipo_Cliente"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Comuna"%>
<%@page import="modelo.DAOCliente"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>     
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, maximum-scale=1">
	<link rel="icon" href="favicon.png" type="image/png">
	<link rel="shortcut icon" href="favicon.ico" type="img/x-icon">

	<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,800italic,700italic,600italic,400italic,300italic,800,700,600' rel='stylesheet' type='text/css'>

	<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<link href="css/font-awesome.css" rel="stylesheet" type="text/css">
	<link href="css/responsive.css" rel="stylesheet" type="text/css">
	<link href="css/animate.css" rel="stylesheet" type="text/css">
        <link href="css/login.css" rel="stylesheet" type="text/css">

	<script type="text/javascript" src="js/jquery.1.8.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/jquery-scrolltofixed.js"></script>
	<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="js/jquery.isotope.js"></script>
	<script type="text/javascript" src="js/wow.js"></script>
	<script type="text/javascript" src="js/classie.js"></script>
        
         <%
         Usuario usuario = new Usuario("", "");
         DAOCliente dao = new DAOCliente();
          if (session.getAttribute("usuario") != null) {
                usuario = (Usuario) session.getAttribute("usuario");
            } else {
                response.sendRedirect("login.jsp");
        }%>
        
        
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
            if (session.getAttribute("errorLogin") != null) {
        %>
        <script>
            alert("<%=session.getAttribute("errorLogin")%>");
        </script>
        <%
                session.removeAttribute("errorLogin");
            }
        %>

</head>
    <body>     
 <center>
        <div class="panel panel-default" style="width: 100%">
            <div class="panel-heading"><h3>Agregar Cliente</h3></div>
            <form action="ServletAgregar_Cliente" method="POST">
                <label>Rut:</label>
                <input type="text" name="rut" placeholder="Rut" required="" class="form-control" style="width: 35%"/>
                <label>DV:</label>
                <input type="text" name="dv" placeholder="DV" required="" class="form-control" style="width: 35%"/>
                <label>Nombre:</label> 
                <input type="text" name="nombre" placeholder="Nombre" required="" class="form-control" style="width: 35%"/>
                <label>Apellido Paterno:</label> 
                <input type="text" name="aPaterno" placeholder="Apellido Paterno" required="" class="form-control" style="width: 35%"/>
                <label>Apellido Materno:</label> 
                <input type="text" name="aMaterno" placeholder="Apellido Materno" required="" class="form-control" style="width: 35%"/>
                <label>Telefono:</label> 
                <input type="text" name="telefono" placeholder="Telefono" required="" class="form-control" style="width: 35%"/>
                <label>Direccion:</label> 
                <input type="text" name="direccion" placeholder="Direccion" required="" class="form-control" style="width: 35%"/>
                <label>Correo:</label> 
                <input type="email" name="correo" placeholder="Correo" required="" class="form-control" style="width: 35%"/>
                <label>Usuario:</label> 
                <input type="text" name="user" placeholder="Usuario" required="" class="form-control" style="width: 35%"/>
                <label>Password:</label> 
                <input type="password" name="pass" placeholder="Password" required="" class="form-control" style="width: 35%"/>
                <br>
                <label>Comuna:</label> 
                <select name="comuna">
                    <%
                        ArrayList<Comuna> lista = dao.listarComunas();
                        for (int i = 0; i < lista.size(); i++) {
                            out.println("<option value="+lista.get(i).getId_comuna()+">" + lista.get(i).getDescripcion() + "</option>");
                        }
                    %>           
                </select>
                <label>Tipo de Cliente:</label> 
                <select name="tipo_cliente">
                    <%
                        ArrayList<Tipo_Cliente> lista1 = dao.listarTipoCliente();
                        for (int i = 0; i < lista1.size(); i++) {
                            out.println("<option value="+lista1.get(i).getId_tipoCliente()+">" + lista1.get(i).getDescripcion()+ "</option>");
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
