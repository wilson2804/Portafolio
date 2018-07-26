<%-- 
    Document   : cliente
    Created on : 18-04-2018, 20:04:53
    Author     : wilso
--%>

<%@page import="modelo.Usuario"%>
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

	<script type="text/javascript" src="js/jquery.1.8.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/jquery-scrolltofixed.js"></script>
	<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="js/jquery.isotope.js"></script>
	<script type="text/javascript" src="js/wow.js"></script>
	<script type="text/javascript" src="js/classie.js"></script>
        
       <% 
            Usuario usuario = new Usuario("", "");
            if (session.getAttribute("usuario") != null) {               
                usuario = (Usuario) session.getAttribute("usuario");
                
            } else {
                response.sendRedirect("login.jsp");
            }
        %>
    </head>
    <body>
        <nav class="main-nav-outer" id="test">
		<!--main-nav-start-->
		<div class="container">
			<ul class="main-nav">
				<li><a href="index.jsp">Inicio</a></li>
				<li><a href="#service">Services</a></li>
				<li><a href="#Portfolio">Portfolio</a></li>
				<li class="small-logo"><a href="index.jsp"><img src="img/small-logo.png" alt=""></a></li>
				<li><a href="#client">Clients</a></li>
				<li><a href="login.jsp">Login</a></li>
				<li><a href="#contact">Contact</a></li>
                                 <%
                                if (usuario != null) {

                                %>
                                <li><h1>Bienvenido <%= usuario.getUser()%></h1></li>
                                <li><a href="ServletLogin">Cerrar sesion</a></li>
                                <%}
                                %>
			</ul>
			<a class="res-nav_click" href="#"><i class="fa-bars"></i></a>
		</div>
	</nav>
	<!--main-nav-end-->
    </body>
</html>
