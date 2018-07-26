<%-- 
    Document   : generar_orden
    Created on : 23-05-2018, 16:43:03
    Author     : sergio
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="modelo.Proveedor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.DAOProveedor"%>
<%@page import="modelo.DAOEmpleado"%>
<%@page import="modelo.Empleado"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.css">
        <link href="css/font-awesome.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/sidebar.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <meta charset="UTF-8">
        <title>JSP Page</title>
        <%Usuario usuario = new Usuario("", "");
            Usuario user = new Usuario("", "");
            user = (Usuario) session.getAttribute("usuario");
            if (session.getAttribute("usuario") != null & user.getTipo_user() == 4) {
                usuario = (Usuario) session.getAttribute("usuario");
            } else {
                response.sendRedirect("login.jsp");
            }

            Empleado emp = new Empleado();
            DAOEmpleado dao = new DAOEmpleado();
            DAOProveedor daoP = new DAOProveedor();

            emp = dao.buscarEmpleadoPorUsuario(usuario.getTipo_user());

        %>

        <%            if (session.getAttribute("exito") != null) {
        %>
        <script>
            alert("<%=session.getAttribute("exito")%>");
        </script>
        <%
                session.removeAttribute("exito");
            }
        %>

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

        <%
            Date date = new Date();
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            String fechasys = dateFormat.format(date);
        %>

        <style>
            td.pad {
                padding: 5px; 
                text-align: center;
                white-space: nowrap;    
            }
            td.padsito {
                padding: 2.8px; 
                text-align: center;
                white-space: nowrap;    
            }
        </style>
    </head>
    <body>
        <div class="sidenav">
            <h1 style="color: #000"><%= usuario.getUser().toUpperCase()%></h1><br>
            <ul class="nav nav-pills brand-pills nav-stacked" role="tablist">                
                <li role="presentation" class="brand-nav active"><a href="generar_orden.jsp">Generar Orden de Compra.</a></li>
                <li role="presentation" class="brand-nav"><a href="revisar_pedidos.jsp">Revisar Pedidos.</a></li>
                <li role="presentation" class="brand-nav"><a href="adm_productos_vendedor.jsp">Productos</a></li>
            </ul>
            <br>
            <br>
            <br>
            <br>
            <a href="ServletLogin">Cerrar Sesión</a>
        </div>

        <div class="main">
            <div class="table-responsive">
                <div class="panel-heading" style="background-color: #ccffcc">
                    <div class="table-responsive">
                        <table border="0" style="width: 100%">
                            <tr>
                                <td>
                                    <h4 align="left">Generar Orden de Compra</h4>
                                </td>
                            </tr>
                            <tr>
                                <td><p style="color:gray" align="left">* Todos los campos son obligatorios</p></td>                                
                            </tr>
                        </table>
                    </div>
                </div>
                <br>
                <form action="ServletGenerar_Orden_Compra" method="POST" name="ejemplo">
                    <table border="0" style="width: 100%">
                        <tr>
                            <td>
                                <div class="panel panel-success" style="width: 97%">                          
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table border="0" style="width: 100%">
                                                <p style="font-size: 18px">Cabecera Orden de Compra:</p><br>
                                                <tr>
                                                    <td style="width: 25%" class="pad" nowrap>
                                                        <label>Fecha De Ingreso:</label>    
                                                    </td>
                                                    <td align="left">
                                                        <input type="text" name="fecha" id="fecha" value="<%=fechasys%>" readonly="" required="" class="form-control" style="width: 55%"/>    
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="pad" nowrap>
                                                        <label>Rut del Empleado:</label>   
                                                    </td>
                                                    <td>
                                                        <input type="text" name="rut" readonly="" value="<%= emp.getRut()%>" required="" class="form-control" style="width: 55%"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td nowrap class="pad">
                                                        <label>Proveedores:</label>    
                                                    </td>
                                                    <td>
                                                        <select id="proveedor" onchange="buscarDatosProveedor(value)">
                                                            <option selected="" value="0">---SELECCIONAR PROVEEDOR---</option>
                                                            <%
                                                                ArrayList<Proveedor> lista = daoP.listarProveedor();
                                                                for (int i = 0; i < lista.size(); i++) {
                                                                    out.println("<option value=" + lista.get(i).getId_proveedor() + ">" + lista.get(i).getNombre() + " - " + lista.get(i).getRubro() + "</option>");
                                                                }
                                                            %>           
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td nowrap class="pad">
                                                        <label>Contacto:</label>    
                                                    </td>
                                                    <td>
                                                        <input readonly="" type="text" id="contacto" placeholder="EJ: JUAN PEREZ" maxlength="12" required="" class="form-control" style="width: 65%"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td nowrap class="pad">
                                                        <label>Telefono:</label>    
                                                    </td>
                                                    <td>
                                                        <input readonly="" type="text" id="telefono" placeholder="EJ:+56912345678" required="" class="form-control" style="width: 55%"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td nowrap class="pad">
                                                        <label>Correo:</label>    
                                                    </td>
                                                    <td>
                                                        <input type="email" readonly="" id="correo" placeholder="example@example.com" required="" class="form-control" style="width: 55%"/>
                                                    </td>
                                                </tr>  
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td valign="top">
                                <div class="panel panel-success" style="width: 100%">

                                    <div class="panel-body">
                                        <div class="table-responsive">                                                                                        
                                            <table border="0" style="width: 90%" id="tbl_producto">
                                                <tr style="background-color: #4CAF50;color: #ccffcc">
                                                    <td nowrap class="pad">
                                                        CODIGO
                                                    </td>
                                                    <td nowrap class="pad">
                                                        PRODUCTO
                                                    </td>
                                                    <td nowrap class="pad">
                                                        CANTIDAD
                                                    </td>
                                                    <td nowrap class="pad">
                                                        PRECIO UNITARIO
                                                    </td>
                                                    <td nowrap class="pad">
                                                        PRECIO TOTAL
                                                    </td>  
                                                    <td>

                                                    </td>
                                                </tr>  
                                            </table>
                                        </div>
                                        <br>
                                        <center><a href="javascript:Abrir_ventana('seleccionar_productos.jsp')"><i class="fa fa-plus"></i></a></center>
                                        <hr>
                                        <table style="width: 100%">
                                            <tr>
                                                <td>
                                                    TOTAL: 
                                                </td>
                                                <td align="right">
                                                    $ <input value="0" type="text" readonly="" id="precio_total" name="precio_total"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>                                    
                                </div>
                        <center>                                                    
                            <input type="submit" onclick="capturaCodigos();" class="btn btn-info" value="Confirmar" align="center"> 
                        </center>
                        </td>
                        </tr>
                    </table>
                    <input type="hidden" id="proveedoor" name="proveedoor">
                    <input type="hidden" id="codigos" name="codigos">
                    <input type="hidden" id="cantidadPOST" name="cantidad">
                </form>
            </div>
            <input type="hidden" id="codigo_producto">
            <a href="empleado.jsp"><button class="btn btn-danger">ATRAS</button></a>
        </div>  
    </body> 

    <script>
        function buscarDatosProveedor(id_proveedor) {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    eval(this.responseText);
                }
            };
            xhttp.open("GET", "getinfoproveedor.jsp?id_proveedor=" + id_proveedor, true);
            xhttp.send();
        }

        function llenarProductos() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    eval(this.responseText);
                }
            };
            var codigo = document.getElementById("codigo_producto").value;
            xhttp.open("GET", "llenarProductos.jsp?id_codigo=" + codigo, true);
            xhttp.send();
        }

        function Abrir_ventana(pagina) {
            var opciones = "toolbar=no, location=no, directories=no, status=yes, menubar=yes, scrollbars=no, resizable=yes, width=1008, height=625, top=20, left=200";
            if (proveedor.value == 0) {
                alert("DEBE SELECCIONAR UN PROVEEDOR");
            } else {
                window.open(pagina + '?id_p=' + proveedor.value, "", opciones);
            }
        }

        function borrar_celda(codigo)
        {
            var i;
            for (i = 0; i < tbl_producto.rows.length; i++) {
                if (codigo == tbl_producto.rows[i].id) {
                    //alert(tbl_producto.rows[i].id);
                    var valor = tbl_producto.rows[i].cells[4].innerHTML;
                    var precio = document.getElementById("precio_total").value;
                    tbl_producto.deleteRow(i);
                    document.getElementById("precio_total").value = parseInt(precio) - parseInt(valor);
                }
            }
        }

        function capturaCodigos()
        {
            var i;
            var codigos = "";
            var cantidad = "";
            for (i = 0; i < tbl_producto.rows.length; i++) {
                if (tbl_producto.rows[i].id != 0) {
                    codigos = codigos + "," + tbl_producto.rows[i].id;
                    var input = tbl_producto.rows[i].cells[2].id + "_" + tbl_producto.rows[i].id;
                    var valor = document.getElementById(input).value;
                    if (valor != "") {
                        cantidad = cantidad + "," + valor;
                        //alert(tbl_producto.rows[i].id);
                        //alert(cantidad);
                    }
                }
            }
            if (proveedor.value == 0) {
                alert("DEBE SELECCIONAR UN PROVEEDOR.");
            } else {
                if (codigos == "") {
                    alert("DEBE SELECCIONAR PRODUCTOS.");
                    document.getElementById("codigos").value = "0";
                } else {
                    document.getElementById("codigos").value = codigos;
                }
            }
            document.getElementById("cantidadPOST").value = cantidad;
            document.getElementById("proveedoor").value = proveedor.value;
        }

        function calcula_total()
        {
            var i;
            var total = 0;
            for (i = 0; i < tbl_producto.rows.length; i++) {
                if (tbl_producto.rows[i].id != 0) {
                    //alert(tbl_producto.rows[i].cells[4].id);                    
                    var valor = tbl_producto.rows[i].cells[4].innerHTML;
                    if (valor != "") {
                        //cantidad = cantidad + "," + valor;
                        //alert(tbl_producto.rows[i].id);                        
                        total = parseInt(valor) + parseInt(total);
                    }
                }
            }
            document.getElementById("precio_total").value = total;
            //alert(total);
        }

        function solonumero(event)
        {
            if (event.keyCode < 46 || event.keyCode > 57) {
                event.returnValue = false
            }
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
