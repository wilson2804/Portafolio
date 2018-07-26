<%-- 
    Document   : formulario_registro_cliente_nat
    Created on : 14-05-2018, 16:57:03
    Author     : wilso
--%>

<%@page import="modelo.Comuna"%>
<%@page import="modelo.DAOCliente"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>


        <meta charset="UTF-8">
        <title>Registro Cliente Empresa</title>
        <style>
            th, td.pad {
                padding: 10px;
            }
        </style>
        <% DAOCliente dao = new DAOCliente();%>
    </head>
    <body>
        <nav class="main-nav-outer" id="test">
            <!--main-nav-start-->
            <div class="container">
                <ul class="main-nav">
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="#service">Servicios</a></li>
                    <li><a href="#Portfolio">Tienda</a></li>
                    <li class="small-logo"><a href="index.jsp"><img src="img/logo-small.png" alt=""></a></li>
                    <li><a href="#client">Proveedores</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="#contact">Contactanos</a></li>
                </ul>
                <a class="res-nav_click" href="#"><i class="fa-bars"></i></a>
            </div>
        </nav>
        <div class="table-responsive">
            <div class="panel-heading" style="background-color: #ccffcc">
                <div class="table-responsive">
                    <table border="0" style="width: 100%">
                        <tr>
                            <td>
                                <h4 align="left">Registro Empresa</h4>
                            </td>
                            <td>
                                <h4 align="right">¿Eres Cliente normal?</h4>
                            </td>
                        </tr>
                        <tr>
                            <td><p style="color:gray" align="left">* Todos los campos son obligatorios</p></td>
                            <td><a href="formulario_registro_cliente_nat.jsp"><button class="btn pull-right btn-info">Registrate Aqui</button></a></td>
                        </tr>
                    </table>
                </div>
            </div>
            <br>
            <form action="ServletAgregarUser" method="POST" name="ejemplo">
                <table border="0" style="width: 100%">
                    <tr>
                        <td>
                            <div class="panel panel-success" style="width: 97%">                          
                                <div class="panel-body">
                                    <table border="0" style="width: 100%">
                                        <p style="font-size: 18px">Datos del Cliente:</p><br>
                                        <tr>
                                            <td style="width: 25%" class="pad">
                                                <label>Nombre:</label>    
                                            </td>
                                            <td align="left">
                                                <input type="text" name="nombre" placeholder="Nombre" required="" class="form-control" style="width: 55%"/>    
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="pad">
                                                <label>Apellido Paterno:</label>   
                                            </td>
                                            <td>
                                                <input type="text" name="aPaterno" placeholder="Apellido Paterno" required="" class="form-control" style="width: 55%"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap class="pad">
                                                <label>Apellido Materno:</label>    
                                            </td>
                                            <td>
                                                <input type="text" name="aMaterno" placeholder="Apellido Materno" required="" class="form-control" style="width: 55%"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap class="pad">
                                                <label>Telefono:</label>    
                                            </td>
                                            <td>
                                                <input type="text" name="telefono" placeholder="EJ:+56912345678" maxlength="12" required="" class="form-control" style="width: 55%"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap class="pad">
                                                <label>Direccion:</label>    
                                            </td>
                                            <td>
                                                <input type="text" name="direccion" placeholder="Direccion" required="" class="form-control" style="width: 55%"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap class="pad">
                                                <label>Correo:</label>    
                                            </td>
                                            <td>
                                                <input type="email" name="correo" placeholder="Correo" required="" class="form-control" style="width: 55%"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap class="pad">
                                                <label>Comuna:</label>    
                                            </td>
                                            <td>
                                                <select name="comuna">
                                                    <%
                                                        ArrayList<Comuna> lista = dao.listarComunas();
                                                        for (int i = 0; i < lista.size(); i++) {
                                                            out.println("<option value=" + lista.get(i).getId_comuna() + ">" + lista.get(i).getDescripcion() + "</option>");
                                                        }
                                                    %>           
                                                </select>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </td>
                        <td valign="top">
                            <div class="panel panel-success" style="width: 97%">

                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table border="0" style="width: 100%">
                                            <tr>
                                            <p style="font-size: 18px">Datos de la Cuenta:</p><br>
                                            <td style="width: 25%" class="pad">
                                                <label>Usuario:</label>    
                                            </td>
                                            <td align="left">
                                                <input type="text" name="user" placeholder="Usuario" required="" class="form-control" style="width: 55%"/>    
                                            </td>
                                            </tr>
                                            <tr>
                                                <td class="pad">
                                                    <label>Password:</label>   
                                                </td>
                                                <td>
                                                    <input type="password" name="pass" placeholder="Password" required="" class="form-control" style="width: 55%"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td nowrap class="pad">
                                                    <label>Confirmar Password:</label>    
                                                </td>
                                                <td>
                                                    <input type="password" name="confpass" placeholder="Confirmar password" required="" class="form-control" style="width: 55%"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                    <center>                        
                        <p style="font-size: 11px">* Actualmente contamos solo con Despacho dentro de la comuna de San Bernardo</p>
                        <p style="font-size: 11px"> Si usted pertenece a otra comuna, SOLAMENTE PODRA RETIRAR EN EL LOCAL.</p><br>
                        <input type="checkbox" required="">Acepto los <a>Termino y Condiciones.</a><br><br>
                        <input type="submit" class="btn btn-info" value="Registrar" align="center"> 
                    </center>
                    </td>
                    </tr>
                </table>
            </form>
        </div>

    </body>

</html>
