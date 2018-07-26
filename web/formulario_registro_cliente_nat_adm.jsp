
<%@page import="modelo.Comuna"%>
<%@page import="modelo.DAOCliente"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>


        <meta charset="UTF-8">
        <title>Registro Cliente Persona Natural</title>
        <style>
            th, td.pad {
                padding: 10px;
            }
        </style>
        <% DAOCliente dao = new DAOCliente();%>
    </head>
    <body>
       
        <div class="table-responsive">
            <div class="panel-heading" style="background-color: #ccffcc">
                <div class="table-responsive">
                    <table border="0" style="width: 100%">
                        <tr>
                            <td>
                                <h4 align="left">Registro Persona</h4>
                            </td>
                            
                        </tr>
                       
                    </table>
                </div>
            </div>
            <br>
            <form action="ServletAgregar_Cliente" method="POST" >
                <table border="0" style="width: 100%">
                    <tr>
                        <td>
                            <div class="panel panel-success" style="width: 97%">                          
                                <div class="panel-body">
                                    <table border="0" style="width: 100%">
                                        <p style="font-size: 18px">Datos del Cliente:</p><br>
                                        <tr>
                                            <td style="width: 25%" class="pad" nowrap>
                                                <label>Cedula de Identidad: </label>    
                                            </td>
                                            <tr>
                                                   <td style="width: 25%" class="pad">
                                                       <label>Rut Empresa:</label>    
                                                   </td>
                                                   <td align="left">
                                                       <input type="text" name="rut" maxlength="10" id="txt_rut" required="true" placeholder="20123543-k" class="form-control" style="width: 55%" onkeypress="rut(event)" onkeyup="valida_rut()"/>    
                                                   </td>
                                               </tr>
                                        </tr>
                                        <tr>
                                            <td style="width: 25%" class="pad">
                                                <label>Nombre:</label>    
                                            </td>
                                            <td align="left">
                                                <input type="text" name="nombre" placeholder="Nombre" required="true" class="form-control" style="width: 55%"/>    
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="pad">
                                                <label>Apellido Paterno:</label>   
                                            </td>
                                            <td>
                                                <input type="text" name="aPaterno" placeholder="Apellido Paterno" required="true" class="form-control" style="width: 55%"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap class="pad">
                                                <label>Apellido Materno:</label>    
                                            </td>
                                            <td>
                                                <input type="text" name="aMaterno" placeholder="Apellido Materno" required="true" class="form-control" style="width: 55%"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap class="pad">
                                                <label>Telefono:</label>    
                                            </td>
                                            <td>
                                                <input type="text" name="telefono" placeholder="EJ:+56912345678" maxlength="12" required="true" class="form-control" style="width: 55%"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap class="pad">
                                                <label>Direccion:</label>    
                                            </td>
                                            <td>
                                                <input type="text" name="direccion" placeholder="Direccion" required="true" class="form-control" style="width: 55%"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap class="pad">
                                                <label>Correo:</label>    
                                            </td>
                                            <td>
                                                <input type="email" name="correo" placeholder="Correo" required="true" class="form-control" style="width: 55%"/>
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
                                                <input type="text" name="user" placeholder="Usuario" required="true" class="form-control" style="width: 55%"/>    
                                            </td>
                                            </tr>
                                            <tr>
                                                <td class="pad">
                                                    <label>Password:</label>   
                                                </td>
                                                <td>
                                                    <input type="password" name="pass" placeholder="Password" required="true" class="form-control" style="width: 55%"/>
                                                </td>
                                            </tr>
                                           
                                        </table>
                                    </div>
                                </div>
                            </div>
                    
                            <input type="submit" class="btn btn-info" value="Registrar" align="center" refresh HTTP-EQUIV="REFRESH" CONTENT="URL=adm_cliente.jsp">
                     </form>
                    </td>
                    </tr>
                </table>
            </form>
        </div>
     <script type="text/javascript">
            
        function valida_rut() {
	valida = isRut(txt_rut.value)
            if (valida !== true)
            {
                txt_rut.style.color = 'red';
            }else{
                txt_rut.style.color = 'blue';
            }
        }
        function rut(event){
            if (event.keyCode  !== 107 )
            {
            if (event.keyCode < 45 || event.keyCode > 57 ) 	event.returnValue = false 
            }
        }
        function isRut(value) 
                {
                   var pattern=new RegExp("^(([0-9]{1,2}\\.[0-9]{3}\\.[0-9]{3})|([0-9]{7,8}))\\-([0-9K])$", "i");
                   var pattern_point=new RegExp("\\.", "g");
                   var pattern_dv=new RegExp("([0-9]+)\\-([0-9K])", "i");

                 var pattern_trim=new RegExp("\\s+$", "g")
                  value = value.replace(pattern_trim, "");
                  var pattern_trim=new RegExp("^\\s+", "g")
                  value = value.replace(pattern_trim, "");

                   if (value.match(pattern)) {
                       value=value.replace(pattern_point, "");
                       if (value.match(pattern_dv)) {
                           number=new String(RegExp.$1);
                           dv=new String(RegExp.$2);
                           sum = 0;
                           mul = 2;
                           for (i = number.length - 1 ; i >= 0; i--) {
                               sum += number.charAt(i) * mul;
                               mul == 7 ? mul = 2:mul++;
                           }
                           rest = sum % 11;
                           if (rest == 1) dvr = 'K';
                           else if (rest == 0) dvr = '0';
                           else  {
                               dvr = 11-rest;
                           }
                           return dvr==dv.toUpperCase();
                       }
                   }
        }
        </script>
    </body>

</html>
