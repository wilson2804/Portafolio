<%-- 
    Document   : login
    Created on : 23-11-2017, 16:14:55
    Author     : Wilson
--%>

<%@page import="modelo.Usuario"%>
<%@page import="modelo.Cargo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Empleado"%>
<%@page import="modelo.Comuna"%>
<%@page import="modelo.DAOEmpleado"%>
<%@page import="modelo.Tipo_Usuario" %>
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

        <table  style="width: 100%">
            <tr>
                <td>
                    <div class="panel panel-success" style="width: 100%">                          
                        <div class="panel-body" >
                            <form action="ServletAgregar_Empleado" method="POST" >
                                <table border="0" style="width: 100%">
                                    <p style="font-size: 18px">Datos del Empleado</p><br>


                                    <tr>
                                        <td style="width: 25%" class="pad">
                                            <label>Rut Empleado:</label>    
                                        </td>
                                        <td align="left">
                                            <input type="text" name="rut" maxlength="10" id="txt_rut" placeholder="20123543-k" class="form-control" style="width: 75%" onkeypress="rut(event)" onkeyup="valida_rut()"/>    
                                        </td>
                                    </tr>

                                    <tr>
                                        <td nowrap class="pad">
                                            <label>Nombre</label>    
                                        </td>
                                        <td>     
                                            <input type="text" name="nombre" placeholder="Nombre" required="" class="form-control" style="width: 75%"/>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td nowrap class="pad">
                                            <label>Cargo</label>
                                        </td>
                                        <td>
                                            <input type="text" name="cargo" placeholder="Cargo" required="" class="form-control" style="width: 75%"/>
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
                                <input type="submit" class="btn btn-info" value="Registrar">
                            </form>
                        </div>    
                    </div>
        </table>


        <script>
            function closeWin() {
                window.close();
            }
        </script>

        <script type="text/javascript">

            function valida_rut() {
                valida = isRut(txt_rut.value)
                if (valida !== true)
                {
                    txt_rut.style.color = 'red';
                } else {
                    txt_rut.style.color = 'blue';
                }
            }
            function rut(event) {
                if (event.keyCode !== 107)
                {
                    if (event.keyCode < 45 || event.keyCode > 57)
                        event.returnValue = false
                }
            }
            function isRut(value)
            {
                var pattern = new RegExp("^(([0-9]{1,2}\\.[0-9]{3}\\.[0-9]{3})|([0-9]{7,8}))\\-([0-9K])$", "i");
                var pattern_point = new RegExp("\\.", "g");
                var pattern_dv = new RegExp("([0-9]+)\\-([0-9K])", "i");

                var pattern_trim = new RegExp("\\s+$", "g")
                value = value.replace(pattern_trim, "");
                var pattern_trim = new RegExp("^\\s+", "g")
                value = value.replace(pattern_trim, "");

                if (value.match(pattern)) {
                    value = value.replace(pattern_point, "");
                    if (value.match(pattern_dv)) {
                        number = new String(RegExp.$1);
                        dv = new String(RegExp.$2);
                        sum = 0;
                        mul = 2;
                        for (i = number.length - 1; i >= 0; i--) {
                            sum += number.charAt(i) * mul;
                            mul == 7 ? mul = 2 : mul++;
                        }
                        rest = sum % 11;
                        if (rest == 1)
                            dvr = 'K';
                        else if (rest == 0)
                            dvr = '0';
                        else {
                            dvr = 11 - rest;
                        }
                        return dvr == dv.toUpperCase();
                    }
                }
            }
        </script>    


    </body>
</html>
