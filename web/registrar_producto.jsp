<%-- 
    Document   : formulario_registro_cliente_nat
    Created on : 14-05-2018, 16:57:03
    Author     : wilso
--%>

<%@page import="modelo.Tipo_Producto"%>
<%@page import="modelo.Familia_Producto"%>
<%@page import="modelo.Proveedor"%>
<%@page import="modelo.Producto"%>
<%@page import="modelo.DAOProducto"%>
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

        <script type="text/javascript">
            function Abrir_ventana(pagina) {
                var opciones = "toolbar=no, location=no, directories=no, status=yes, menubar=yes, scrollbars=no, resizable=yes, width=400, height=200, top=20, left=200";
                window.open(pagina, "", opciones);
            }
        </script> 
        <% DAOProducto dao = new DAOProducto();%>
    </head>
    <body>
        <div class="table-responsive">
            <div class="panel-heading" style="background-color: #ccffcc">
                <div class="table-responsive">
                    <table border="0" style="width: 100%">
                        <tr>
                            <td>
                                <h4 align="left">Agregar Producto</h4>
                            </td>                            
                        </tr>
                        <tr>
                            <td><p style="color:gray" align="left">* Todos los campos son obligatorios</p></td>
                        </tr>
                    </table>
                </div>
            </div>
            <br>
            <form action="Servlet_add_pro" method="POST">
                <div class="panel panel-success" style="width: 97%">                          
                    <div class="panel-body">
                        <table border="0" style="width: 100%">
                            <p style="font-size: 18px">Datos del Producto:</p><br>
                            <tr>
                                <td style="width: 25%" class="pad">
                                    <label>Imagen:</label> 
                                </td>
                                <td>
                                    <button onclick="Abrir_ventana('datos_up_ingresar.jsp')">Subir Imagen</button>
                                    <input style="width: 200px" name="img" id="conf" readonly=""/>
                                </td>                                
                            </tr> 
                            <tr>
                                <td style="width: 25%" class="pad">
                                    <label>Descripcion:</label>    
                                </td>
                                <td align="left">
                                    <input type="text" name="descripcion" placeholder="Descripción del producto" required="" class="form-control" style="width: 55%"/>    
                                </td>
                            </tr>
                            <tr>
                                <td class="pad">
                                    <label>Precio:</label>   
                                </td>
                                <td>
                                    <input type="text" maxlength="8" onkeypress="solonumero(event)" name="precio" onkeyup="check_cantidad(this);" id="precio" placeholder="EJ: 500" required="" class="form-control" style="width: 55%"/>
                                </td>
                            </tr>
                            <tr>
                                <td nowrap class="pad">
                                    <label>Stock:</label>    
                                </td>
                                <td>
                                    <input type="text" maxlength="3" onkeypress="solonumero(event)" name="stock" onkeyup="check_cantidad(this);" id="stock" placeholder="EJ: 200" required="" class="form-control" style="width: 55%"/>
                                </td>
                            </tr>
                            <tr>
                                <td nowrap class="pad">
                                    <label>Stock Critico:</label>    
                                </td>
                                <td>
                                    <input maxlength="2" type="text" onkeypress="solonumero(event);" onkeyup="check_cantidad(this);" id="stock_critico" name="stock_critico" placeholder="EJ: 5" maxlength="2" required="" class="form-control" style="width: 55%"/>
                                </td>
                            </tr>                           
                            <tr>
                                <td nowrap class="pad">
                                    <label>Proveedor:</label>    
                                </td>
                                <td>
                                    <select name="proveedor">
                                        <%
                                            ArrayList<Proveedor> lista = dao.listarProveedores();
                                            for (int i = 0; i < lista.size(); i++) {
                                                out.println("<option value=" + lista.get(i).getId_proveedor() + ">" + lista.get(i).getNombre() + "</option>");
                                            }
                                        %>           
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td nowrap class="pad">
                                    <label>Familia de producto:</label>    
                                </td>
                                <td>
                                    <select name="familia">
                                        <%
                                            ArrayList<Familia_Producto> listaF = dao.listarFamilias();
                                            for (int i = 0; i < lista.size(); i++) {
                                                out.println("<option value=" + listaF.get(i).getCodigo() + ">" + listaF.get(i).getNombre() + "</option>");
                                            }
                                        %>           
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td nowrap class="pad">
                                    <label>Tipo Producto:</label>    
                                </td>
                                <td>
                                    <select name="tipo">
                                        <%
                                            ArrayList<Tipo_Producto> listaT = dao.listarTipo_Producto();
                                            for (int i = 0; i < listaT.size(); i++) {
                                                out.println("<option value=" + listaT.get(i).getCodigo() + ">" + listaT.get(i).getNombre() + "</option>");
                                            }
                                        %>           
                                    </select>
                                </td>
                            </tr>                                                      
                        </table>
                    </div>
                </div>
                <center>
                    <input type="submit" class="btn btn-success" value="Registrar" />
                </center>
            </form>

        </div>
    </body>

    <script>
        function solonumero(event)
        {
            if (event.keyCode < 46 || event.keyCode > 57)
                event.returnValue = false
        }

        function check_cantidad(element)
        {
            var cant = element.value;
            var cant_es_flotante = isFloat(cant);
// alert('Valor introducido: '+cant+' \n\n ID: '+element.id+' | Es flotante? '+cant_es_flotante);
// descomentar si quieres revisar los valores del id, value y si es flotante

            if (isNaN(cant))
            {
                alert('Valor introducido:       ' + cant + ' \n\n Introduce solo valores numericos');
                document.getElementById(element.id).value = "";
            } else if (cant < 1)
            {
                alert('Valor introducido:       ' + cant + ' \n\n Introduce numeros enteros mayores que 0');
                document.getElementById(element.id).value = "";
            } else if (cant_es_flotante == true)
            {
                alert('Valor introducido:       ' + cant + ' \n\n El valor es decimal.  Será convertido a entero.');
                cant = Math.round(cant);
                document.getElementById(element.id).value = cant;
            }
        }
        function isFloat(myNum)
        {
// es true si es 1, osea si es flotante
            var myMod = myNum % 1;

            if (myMod == 0)
            {
                return false;
            } else {
                return true;
            }
        }
    </script>

</html>
