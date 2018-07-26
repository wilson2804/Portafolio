<%@page import="java.sql.SQLException"%>
<%@page import="modelo.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="modelo.Proveedor"%>
<%@page import="modelo.DAOProveedor"%>
<%

    int idProveedor = Integer.parseInt(request.getParameter("id_proveedor"));
    if (idProveedor == 0) {
        out.print("contacto.value ='';");
        out.print("telefono.value ='';");
        out.print("correo.value ='';");
    }

    String q = "SELECT PROV_ID,PROV_NOMBRE,PROV_CONTACTO,PROV_TELEFONO,PROV_CORREO FROM PROVEEDOR WHERE PROV_ID = " + idProveedor;
    Conexion con = new Conexion();
    Connection acceso = con.getConnection();
    PreparedStatement ps = acceso.prepareStatement(q);
    ResultSet rs = ps.executeQuery();

    while (rs.next()) {
        //out.print((rs.getInt(1)));
        //out.print((rs.getString(2)));
        out.print("contacto.value = '" + rs.getString(3) + "';");
        out.print("telefono.value = '" + rs.getString(4) + "';");
        out.print("correo.value = '" + rs.getString(5) + "';");                                
    }
%>
