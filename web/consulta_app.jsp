<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="modelo.Conexion"%>
<%    

    String q = "SELECT PRO_ID_PRODUCTO,PRO_DESCRIPCION,PRO_PRECIO,PRO_STOCK,PRO_STOCK_CRITICO,PRO_IMAGE FROM PRODUCTO";
    Conexion con = new Conexion();
    Connection acceso = con.getConnection();
    PreparedStatement ps = acceso.prepareStatement(q);
    ResultSet rs = ps.executeQuery();

    while (rs.next()) {
        long codigo = rs.getLong(1);
        String descripcion = rs.getString(2);
        int precio = rs.getInt(3);
        int stock = rs.getInt(4);
        int stock_critico = rs.getInt(5);
        String img = rs.getString(6);
        
        String codigojs =img+","+descripcion+",\n Codigo: "+codigo+" \n Precio: $"+precio+" \n Stock: "+stock+","+stock_critico+";";

        out.print(codigojs);
    }
%>