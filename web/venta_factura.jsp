<%-- 
    Document   : venta_factura
    Created on : 21-06-2018, 17:29:46
    Author     : sergio
--%>

<%@page import="modelo.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.DAOCliente"%>
<%@page import="modelo.DAOEmpleado"%>
<%@page import="modelo.Empleado"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.css">
        <link rel="stylesheet" href="css/sidebar.css">
        <link href="css/font-awesome.css" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <meta charset="UTF-8">
        <title>JSP Page</title>
        <%Usuario usuario = new Usuario("", "");
            Usuario user = new Usuario("", "");
            user = (Usuario) session.getAttribute("usuario");
            if (session.getAttribute("usuario") != null & user.getTipo_user() == 3) {
                usuario = (Usuario) session.getAttribute("usuario");
            } else {
                response.sendRedirect("login.jsp");
            }

            Empleado emp = new Empleado();
            DAOEmpleado dao = new DAOEmpleado();
            DAOCliente daoC = new DAOCliente();

            emp = dao.buscarEmpleadoPorUsuario(usuario.getId());

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
    <body onload="init()">
        <div class="sidenav">
            <h1 style="color: #000"><%= usuario.getUser().toUpperCase()%></h1><br>
            <ul class="nav nav-pills brand-pills nav-stacked" role="tablist">                
                <li role="presentation" class="brand-nav active"><a href="vendedor.jsp">Realizar Venta.</a></li>
                <li role="presentation" class="brand-nav"><a href="revision_ventas.jsp">Revisar Ventas.</a></li>                
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
                                    <h4 align="left">Venta Con Factura</h4>
                                </td>
                            </tr>
                            <tr>
                                <td><p style="color:gray" align="left">* Todos los campos son obligatorios</p></td>                                
                            </tr>
                        </table>
                    </div>
                </div>
                <br>
                <table border="0" style="width: 150px">
                    <tr>
                        <td nowrap style="width: 70px">
                            ¿Cliente registrado en el sistema?                                                        
                        </td>
                    </tr>
                    <tr>
                        <td nowrap>
                            <table border="0" style="width: 50px">
                                <tr>
                                    <td>NO</td>
                                    <td>
                                        <input type="radio" name="imgsel"  value="1" checked="checked" onclick="extranjero(this)" />
                                    </td>
                                </tr>
                            </table> 
                        </td>
                    </tr>
                    <tr>
                        <td nowrap>
                            <table border="0" style="width: 50px">
                                <tr>
                                    <td>SI</td>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;<input type="radio" name="imgsel"  value="2" onclick="extranjero(this)" />
                                    </td>
                                </tr>
                            </table> 
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 70px">
                            <br>
                            <select id="cliente" onchange="buscarDatosProveedor(this.value)">
                                <option value="0">---SELECCIONAR CLIENTE---</option>
                                <%
                                    ArrayList<Cliente> lista = daoC.listarClienteParaFactura();
                                    for (int i = 0; i < lista.size(); i++) {
                                        out.println("<option value=" + lista.get(i).getRut() + ">" + lista.get(i).getNombre() + " - " + lista.get(i).getRazon() + "</option>");
                                    }
                                %>           
                            </select>
                        </td>
                    </tr>
                </table>
                <br>
                <form action="ServletGenerar_Factura" method="POST" name="ejemplo">
                    <table border="0" style="width: 100%">
                        <tr>
                            <td>
                                <div class="panel panel-success" style="width: 97%">                          
                                    <div class="panel-body">
                                        <table border="0" style="width: 100%">
                                            <p style="font-size: 18px">Cabecera Factura:</p><br>
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
                                                    <label>Rut del Cliente:</label>
                                                    <p style="font-size: 10px">(INGRESE SU RUT CON GUION Y SIN PUNTOS)</p>                                                    
                                                </td>
                                                <td>
                                                    <input maxlength="10" type="text" onkeypress="rutVal(event)"   onkeyup="valida_rut()" name="rut" id="rut" placeholder="EJ: 12345678-9" required="" class="form-control" style="width: 55%"/>
                                                    <p style="font-size: 10px">(COLOR NEGRO -> OK)</p>
                                                </td>
                                            </tr>                                           
                                            <tr>
                                                <td nowrap class="pad">
                                                    <label>Nombre:</label>    
                                                </td>
                                                <td>
                                                    <input type="text" name="nombre" id="nombre" placeholder="EJ: JUAN PEREZ" required="" class="form-control" style="width: 65%"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td nowrap class="pad">
                                                    <label>Razon Social:</label>    
                                                </td>
                                                <td>
                                                    <input type="text" name="razonS" id="razon" placeholder="EJ:PINTORES S.A" required="" class="form-control" style="width: 79%"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td nowrap class="pad">
                                                    <label>Direccion:</label>    
                                                </td>
                                                <td>
                                                    <input type="text" name="direccionN" id="direccion" placeholder="EJ: AV. PAJARITOS 1234" required="" class="form-control" style="width: 65%"/>
                                                </td>
                                            </tr>  
                                        </table>
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
                                                        PRECIO NETO
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
                                        <center><a href="javascript:Abrir_ventana('productos_ventas.jsp')"><i class="fa fa-plus"></i></a></center>
                                        <hr>
                                        <table style="width: 100%">
                                            <tr>
                                                <td>
                                                    TOTAL NETO: 
                                                </td>
                                                <td align="right">
                                                    $ <input value="0" type="text" readonly="" id="precio_total" name="precio_total"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    I.V.A: 
                                                </td>
                                                <td align="right">
                                                    $ <input value="0" type="text" readonly="" id="iva" name="iva"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    TOTAL BRUTO: 
                                                </td>
                                                <td align="right">
                                                    $ <input value="0" type="text" readonly="" id="bruto" name="bruto"/>
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
                    <input type="hidden" id="codigos" name="codigos">
                    <input type="hidden" id="cantidadPOST" name="cantidad">
                </form>
            </div>
            <input type="hidden" id="codigo_producto">
            <a href="vendedor.jsp"><button class="btn btn-danger">CANCELAR</button></a>
        </div>  
    </body>

    <script>
        function buscarDatosProveedor(id_cliente) {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    eval(this.responseText);
                }
            };
            xhttp.open("GET", "getinfocliente.jsp?id_cliente=" + id_cliente, true);
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
            xhttp.open("GET", "llenarProductosFactura.jsp?id_codigo=" + codigo, true);
            xhttp.send();
        }

        function Abrir_ventana(pagina) {
            var opciones = "toolbar=no, location=no, directories=no, status=yes, menubar=yes, scrollbars=no, resizable=yes, width=1008, height=625, top=20, left=200";
            window.open(pagina, "", opciones);
        }

        function borrar_celda(codigo)
        {
            var i;
            for (i = 0; i < tbl_producto.rows.length; i++) {
                if (codigo == tbl_producto.rows[i].id) {
                    //alert(tbl_producto.rows[i].id);
                    var valor = tbl_producto.rows[i].cells[4].innerHTML;
                    var precio = document.getElementById("precio_total").value;
                    var iva = document.getElementById("iva").value;
                    var bruto = document.getElementById("bruto").value;
                    tbl_producto.deleteRow(i);
                    document.getElementById("precio_total").value = parseInt(precio) - parseInt(valor);
                    document.getElementById("iva").value = parseInt(iva) - parseInt(Math.round(valor * 0.19));
                    document.getElementById("bruto").value = parseInt(bruto) - (parseInt(Math.round(valor * 0.19)) + parseInt(valor));
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
            if (cliente.value == 0 && document.getElementById("nombre").value == "") {
                alert("DEBE SELECCIONAR UN CLIENTE.");
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
            var iva = total * 0.19;
            var bruto = Math.round(iva) + total;
            document.getElementById("iva").value = Math.round(iva);
            document.getElementById("bruto").value = bruto;

            //alert(total);
        }

        function init() {
            document.getElementById("cliente").disabled = true;
            document.getElementById("cliente").selectedIndex = 0
            document.getElementById("rut").readOnly = false;
            document.getElementById("nombre").readOnly = false;
            document.getElementById("direccion").readOnly = false;
            document.getElementById("razon").readOnly = false;
        }
        function extranjero(radio) {
            document.getElementById("cliente").disabled = (radio.value == 1) ? true : false;
            document.getElementById("cliente").selectedIndex = 0;
            document.getElementById("rut").readOnly = (radio.value == 2) ? true : false;
            document.getElementById("nombre").readOnly = (radio.value == 2) ? true : false;
            document.getElementById("direccion").readOnly = (radio.value == 2) ? true : false;
            document.getElementById("razon").readOnly = (radio.value == 2) ? true : false;

            document.getElementById("rut").value = "";
            document.getElementById("nombre").value = "";
            document.getElementById("direccion").value = "";
            document.getElementById("razon").value = "";
        }

        function solonumero(event)
        {
            if (event.keyCode < 46 || event.keyCode > 57)
                event.returnValue = false
        }

        function sololetras(event)
        {
            if (event.keyCode > 45 && event.keyCode < 57)
                event.returnValue = false;
        }

        function valida_rut()
        {
            valida = isRut(rut.value);

            if (valida !== true)
            {
                rut.style.color = 'red';
            } else
            {
                rut.style.color = 'black';
            }
        }

        function rutVal(event)
        {
            if (event.keyCode != 107)
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
