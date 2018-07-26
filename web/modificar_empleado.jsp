<%-- 
    Document   : modificar_usuario
    Created on : 24-04-2018, 15:52:56
    Author     : wilso
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.DAOUsuario"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.DAOEmpleado"%>
<%@page import="modelo.Empleado"%>
<%@page import="modelo.Comuna"%>
<%@page import="modelo.Cargo"%>
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
        DAOEmpleado dao = new DAOEmpleado();
          if (session.getAttribute("usuario") != null) {
                usuario = (Usuario) session.getAttribute("usuario");
            } else {
                response.sendRedirect("login.jsp");
            }         
       int rut = Integer.parseInt(request.getParameter("rut"));
       String dv = request.getParameter("dv");
       String nombre = request.getParameter("nombre"); 
       String apaterno = request.getParameter("apaterno");
       String amaterno = request.getParameter("amaterno"); 
       String telefono = request.getParameter("telefono"); 
       String direccion = request.getParameter("direccion"); 
       String correo = request.getParameter("correo");
       int cargo = Integer.parseInt(request.getParameter("cargo"));
       int comuna = Integer.parseInt(request.getParameter("comuna"));
%>
        
        <script>
        function closeWin() {
        window.close();
        }
        </script>
        
    </head>
    <body>
        <center>
        <div class="panel panel-default" style="width: 100%">
            <div class="panel-heading"><h3>Modificar Empleado</h3></div>
            <form action="ServletModificar_Empleado" method="POST">
                <label>Rut:</label>
                <input type="text" name="rut" placeholder="Rut" required="" class="form-control" value="<%=rut%>" style="width: 35%"/>
                <label>DV:</label>
                <input type="text" name="dv" placeholder="DV" required="" class="form-control" value="<%=dv%>" style="width: 35%"/>
                <label>Nombre:</label> 
                <input type="text" name="nombre" placeholder="Nombre" required="" class="form-control" value="<%=nombre%>" style="width: 35%"/>
                <label>Apellido Paterno:</label> 
                <input type="text" name="apellido_paterno" placeholder="Apellido Paterno" required="" value="<%=apaterno%>" class="form-control" style="width: 35%"/>
                <label>Apellido Materno:</label> 
                <input type="text" name="apellido_materno" placeholder="Apellido Materno" required="" value="<%=amaterno%>" class="form-control" style="width: 35%"/>
                <label>Telefono:</label> 
                <input type="text" name="telefono" placeholder="Telefono" required="" class="form-control" value="<%=telefono%>" style="width: 35%"/>
                <label>Direccion:</label> 
                <input type="text" name="direccion" placeholder="Direccion" required="" class="form-control" value="<%=direccion%>" style="width: 35%"/>
                <label>Correo:</label> 
                <input type="email" name="correo" placeholder="Correo" required="" class="form-control" value="<%=correo%>" style="width: 35%"/> 
                <br>
               <label>Cargo:</label> 
                <select name="tiposCargo">
                    <%
                        ArrayList<Cargo> lista = dao.listarTiposCargo();
                        for (int i = 0; i < lista.size(); i++) {
                            if(lista.get(i).getId_cargo()== cargo){
                            out.println("<option selected>" + lista.get(i).getDesc_cargo() + "</option>");
                            }
                            
                        }
                    %>           
                </select>
            <label>Comuna:</label> 
                <select name="tiposComuna">
                    <%
                        ArrayList<Comuna> listaa = dao.listarTiposComuna();
                        for (int i = 0; i < listaa.size(); i++) {
                            if(listaa.get(i).getId_comuna() == comuna){
                            out.println("<option>" + listaa.get(i).getDescripcion() + "</option>");
                            }
                            
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
    </body>
</html>
