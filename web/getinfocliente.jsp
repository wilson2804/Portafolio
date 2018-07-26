<%@page import="java.sql.SQLException"%>
<%@page import="modelo.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%

    String idProveedor = request.getParameter("id_cliente");
    
    if (idProveedor.equals("0")){
        out.print("rut.value ='';");
        out.print("nombre.value ='';");
        out.print("razon.value ='';");
        out.print("direccion.value ='';");
    } else {
        String q = "SELECT c.CLI_RUT,c.CLI_NOMBRE,c.CLI_DIRECCION,c.CLI_RAZON_SOCIAL FROM CLIENTE c WHERE c.CLI_TIPO_CLIENTE = 'EMPRESA' AND c.CLI_RUT = '" + idProveedor + "'";
        Conexion con = new Conexion();
        Connection acceso = con.getConnection();
        PreparedStatement ps = acceso.prepareStatement(q);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            out.print("rut.value = '" + idProveedor + "';");
            out.print("nombre.value = '" + rs.getString(2) + "';");
            out.print("direccion.value = '" + rs.getString(3) + "';");
            out.print("razon.value = '" + rs.getString(4) + "';");
        }
    }
%>
