<%-- 
    Document   : detalle_orden
    Created on : 04-06-2018, 15:06:52
    Author     : sergio
--%>

<%@page import="modelo.DAOCliente"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Factura_Cabecera"%>
<%@page import="modelo.DAOEmpleado"%>
<%@page import="modelo.Boleta_Cabecera"%>
<%@page import="modelo.Orden_Compra_Detalle"%>
<%@page import="modelo.Empleado"%>
<%@page import="modelo.DAOProducto"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            int id_factura = Integer.parseInt(request.getParameter("id_factura"));
            int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
            DAOProducto dao = new DAOProducto();
            DAOEmpleado daoE = new DAOEmpleado();
            DAOCliente daoC = new DAOCliente();
            Empleado emp = new Empleado();
            emp = daoE.buscarEmpleadoPorUsuario(id_usuario);
            Cliente cli = new Cliente();
            cli = daoC.buscarClientePorFactura(id_factura);
            Factura_Cabecera ord = dao.datosFactura(id_factura);
            pageContext.setAttribute("ordenes_detalle", dao.datosFactura_detalle(id_factura));

        %>

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.css">
        <link href="css/font-awesome.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/sidebar.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <style>
            td.pad {
                padding: 5px; 
                text-align: left;
                white-space: nowrap;    
            }
        </style>
    </head>
    <body>
    <center>
        <div class="panel panel-success" style="width: 97%">            
            <div class="table table-hover">
                <table border="0" cellspacing="20" style="width: 100%">
                    <tr>
                    <img src="img/logo-ferreteria.png" alt="" style="width: 90px; height: 90px"/>
                    </tr>
                    <tr>
                        <td class="pad">NRO FACTURA: <%=id_factura%><br></td>                                         
                    </tr>                
                    <tr>
                        <td class="pad">
                            FECHA DE EMISION: <%=ord.getFecha()%> 
                        </td>                    
                    </tr> 
                    <tr>
                        <td class="pad">
                            RUT CLIENTE : <%=cli.getRut()%>
                        </td>
                        <td class="pad">
                            NOMBRE CLIENTE : <%=cli.getNombre()%>
                        </td>
                        <td class="pad">
                            RAZON SOCIAL : <%=cli.getRazon()%>
                        </td>                        
                    </tr>
                    <tr>
                        <td class="pad">
                            DIRECCION : <%=cli.getDireccion()%>
                        </td>
                    </tr>
                    <tr>
                        <td class="pad">
                            EMPLEADO: <%=emp.getNombre()%>
                        </td>                    
                        <td class="pad">
                            RUT EMPLEADO: <%=emp.getRut()%>
                        </td>                     
                    </tr>
                </table>
            </div>
            <hr>
            <table border="0" class="table table-hover" cellspacing="" style="text-align: center;width: 100%">
                <thead style="background-color: #4CAF50;color: white">
                    <tr>
                        <td nowrap>
                            CODIGO PRODUCTO
                        </td>
                        <td nowrap>
                            DESCRIPCION
                        </td>
                        <td nowrap>
                            CANTIDAD
                        </td>
                        <td nowrap>
                            PRECIO UNITARIO
                        </td>
                        <td nowrap>
                            PRECIO TOTAL
                        </td>                        

                    </tr>
                </thead>
                <c:forEach var= "u" items="${ordenes_detalle}">
                    <tr>
                        <td nowrap>${u.getCodigo()}</td>
                        <td nowrap>${u.getDesc()}</td>
                        <td nowrap>${u.getCantidad()}</td>                         
                        <td nowrap>$ ${u.getNeto()}</td>
                        <td nowrap>$${u.getNeto() * u.getCantidad()}</td> 
                    </tr>
                </c:forEach>                
            </table>
            <br>
            <br>
            <br>
            <br>
            <br>
            <hr>
            <table style="width: 100%" border="0">
                <tr>
                    <td nowrap>
                        TOTAL NETO:
                    </td> 
                    <td align="right">
                        $<%=ord.getNeto()%> 
                    </td>

                </tr>                
                <tr>
                    <td nowrap>
                        I.V.A:
                    </td> 
                    <td align="right">
                        $<%=ord.getIva()%> 
                    </td>

                </tr>                
                <tr>
                    <td nowrap>
                        TOTAL BRUTO:
                    </td> 
                    <td align="right">
                        $<%=ord.getBruto()%> 
                    </td>

                </tr>                
            </table>            
        </div>
        <button onclick="window.close()" class="btn btn-danger">Cerrar</button>
    </center>
</body>
</html>
