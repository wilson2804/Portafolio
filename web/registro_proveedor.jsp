<%-- 
    Document   : registro_proveedor
    Created on : 29-04-2018, 21:07:34
    Author     : jano1
--%>

<%@page import="modelo.Comuna"%>
<%@page import="modelo.Rubro"%>
<%@page import="modelo.DAOUsuario"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Proveedor"%>
<%@page import="modelo.DAOProveedor"%>
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
        <script type="text/javascript">
            function Abrir_ventana(pagina) {
                var opciones = "toolbar=no, location=no, directories=no, status=yes, menubar=yes, scrollbars=yes, resizable=yes, width=500, height=380, top=20, left=100";
                window.open(pagina, "", opciones);
            }
        </script>

        <%
            Usuario usuario = new Usuario("", "");
            DAOUsuario dao = new DAOUsuario();
            DAOProveedor daopro = new DAOProveedor();
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
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <table  style="width: 100%">
                <tr>
                    <td>
                        <div class="panel panel-success" style="width: 100%">                          
                            <div class="panel-body" >
                                <form action="ServletAgregar_Proveedor" method="POST" >
                                    <table border="0" style="width: 100%">
                                        <p style="font-size: 18px">Datos del Proveedor</p><br>


                                        <tr>
                                            <td style="width: 25%" class="pad">
                                                <label>Nombre:</label>    
                                            </td>
                                            <td align="left">
                                                <input type="text" name="nombre" placeholder="Nombre" required="" class="form-control" style="width: 75%"/>    
                                            </td>
                                        </tr>

                                        <tr>
                                            <td nowrap class="pad">
                                                <label>Contacto:</label>    
                                            </td>
                                            <td>
                                                <input type="text" name="contacto" placeholder="contacto" required="" class="form-control" style="width: 75%"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap class="pad">
                                                <label>Telefono:</label>    
                                            </td>
                                            <td>
                                                <input type="text" name="telefono" placeholder="EJ:+56912345678" maxlength="12" required="" class="form-control" style="width: 75%"/>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td nowrap class="pad">
                                                <label>Rubro</label>    
                                            </td>
                                            <td>
                                                <input type="text" name="rubro" placeholder="rubro" required="" class="form-control" style="width: 75%"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap class="pad">
                                                <label>Correo:</label>    
                                            </td>
                                            <td>
                                                <input type="email" name="correo" placeholder="Correo" required="" class="form-control" style="width: 75%"/>
                                            </td>
                                        </tr>

                                    </table>
                                    <br>
                                    <table border="0" style="width: 100%">

                                        <tr>
                                        <p style="font-size: 17px">Datos de la Cuenta:</p><br>
                                        <td style="width: 25%" class="pad">
                                            <label>Usuario:</label>    
                                        </td>

                                        <td align="left">
                                            <input type="text" name="user" placeholder="Usuario" required="" class="form-control" style="width: 75%"/>    
                                        </td>
                                        </tr>
                                        <tr>
                                            <td class="pad">
                                                <label>Password:</label>   
                                            </td>
                                            <td>
                                                <input type="password" name="pass" placeholder="Password" required="" class="form-control" style="width: 75%"/>
                                            </td>
                                        </tr>
                                        </div>
                                    </table> 
                                    <a href="javascript:Abrir_ventana('registroCorrecto.jsp')"><input type="submit" class="btn btn-info" value="Registrar"></a>
                                </form>
                            </div>    
                        </div>
            </table>

            <script>
                function closeWin() {
                    window.close();
                }
            </script> 

    </body>
</html> 
