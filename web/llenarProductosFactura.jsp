<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="modelo.Conexion"%>
<%
    String codigo_producto = request.getParameter("id_codigo");

    String q = "SELECT PRO_ID_PRODUCTO,PRO_DESCRIPCION,PRO_PRECIO FROM PRODUCTO WHERE PRO_ID_PRODUCTO IN (0" + codigo_producto + ")";
    Conexion con = new Conexion();
    Connection acceso = con.getConnection();
    PreparedStatement ps = acceso.prepareStatement(q);
    ResultSet rs = ps.executeQuery();

    while (rs.next()) {
        long codigo = rs.getLong(1);
        String descripcion = rs.getString(2);
        int precio = rs.getInt(3);
        
        double precioNeto = Math.round(precio/(1.19));
        
        String codigojs = "var row = tbl_producto.insertRow(tbl_producto.rows.length);"
                + "row.id='" + codigo + "';"
                + "var cell = row.insertCell(0);"
                + "cell.className = 'padsito';"
                + "cell.id = '" + codigo + "';"
                + "cell.innerHTML = ' " + codigo + " ';"
                + "cell = row.insertCell(1);"
                + "cell.className = 'padsito';"
                + "cell.id = '" + descripcion + "';"
                + "cell.innerHTML = ' " + descripcion + " ';"
                + "cell = row.insertCell(2);"
                + "cell.className = 'padsito';"
                + "cell.id = 'cantidad';"
                + "cell.innerHTML = '<input required= maxlength=3 onkeypress=\"solonumero(event)\" onkeyup=\"precio_" + codigo + ".innerHTML=this.value * " + precioNeto + ";calcula_total();check_cantidad(this);\" type=text size=5 id=cantidad_" + rs.getLong(1) + "> ';"
                + "cell = row.insertCell(3);"
                + "cell.className = 'padsito';"
                + "cell.name = 'precio_unitario';"
                + "cell.innerHTML = ' $" + precioNeto + "';"
                + "cell = row.insertCell(4);"
                + "cell.className = 'padsito';"
                + "cell.name = 'precio_total';"
                + "cell.id = 'precio_" + codigo + "';"
                + "cell.innerHTML = '0';"
                + "cell = row.insertCell(5);"
                + "cell.innerHTML = '<a href=\"javascript:borrar_celda(" + codigo + ");\"> <img width=16px src=\"128px/denied.png\" /> </a> ';";

        out.print(codigojs);
    }
%>