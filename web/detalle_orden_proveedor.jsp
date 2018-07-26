<%-- 
    Document   : detalle_orden
    Created on : 04-06-2018, 15:06:52
    Author     : sergio
--%>

<%@page import="modelo.Orden_Compra_Detalle"%>
<%@page import="modelo.DAOProducto"%>
<%@page import="modelo.Orden_Compra_Cabecera"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            int id_orden = Integer.parseInt(request.getParameter("id_orden"));
            DAOProducto dao = new DAOProducto();
            Orden_Compra_Cabecera ord = dao.datosOrden(id_orden);
            int total = dao.total_detalle(id_orden);
            pageContext.setAttribute("ordenes_detalle", dao.datosOrden_detalle(id_orden));
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
                        <td class="pad">ORDEN NRO: <%=id_orden%><br></td>                                         
                    </tr>                
                    <tr>
                        <td class="pad">
                            FECHA DE EMISION: <%=ord.getFecha()%> 
                        </td>                    
                    </tr>                
                    <tr>
                        <td class="pad"> 
                            PROVEEDOR: <%=ord.getProv_nombre()%> 
                        </td>
                        <td class="pad">
                            RUBRO: <%=ord.getRubro()%>
                        </td>                                       
                    </tr>
                    <tr>
                        <td class="pad">
                            CONTACTO: <%=ord.getContacto()%>
                        </td>                      
                        <td class="pad">
                            TELEFONO: <%=ord.getTelefono()%>
                        </td>                    
                        <td class="pad">
                            CORREO: <%=ord.getCorreo()%>
                        </td>                     
                    </tr>
                    <tr>
                        <td class="pad">
                            EMPLEADO: <%=ord.getEmp_nombre()%>
                        </td>                    
                        <td class="pad">
                            RUT EMPLEADO: <%=ord.getEmp_rut()%>
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
                        <td>
                            PRECIO TOTAL
                        </td>
                    </tr>
                </thead>
                <c:forEach var= "u" items="${ordenes_detalle}">
                    <tr>
                        <td nowrap>${u.getId_producto()}</td>
                        <td nowrap>${u.getDescripcion()}</td>
                        <td nowrap>${u.getCantidad()}</td>
                        <td nowrap>$ ${u.getPrecio()}</td>
                        <td nowrap>$ ${u.getTotal_cantidad()}</td>                                                
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
                        TOTAL:
                    </td> 
                    <td align="right">
                        $<%=total%>
                    </td>
                </tr>
            </table>            
        </div>
        <br><br><button onclick="window.close()" class="btn btn-danger">Cerrar</button>
    </center>
</body>
</html>
