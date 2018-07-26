/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author sergio
 */
public class DAOProducto {

    Conexion con = new Conexion();

    public DAOProducto() {

        con = new Conexion();
    }

    // <editor-fold defaultstate="collapsed" desc="PRODUCTOS"> 
    public ArrayList<Producto> listarProductos(int id_proveedor) {

        ArrayList listasProductos = new ArrayList();
        Producto producto = null;
        String q = "SELECT PRO_ID_PRODUCTO,PRO_DESCRIPCION,PRO_PRECIO,PRO_STOCK,PRO_STOCK_CRITICO FROM PRODUCTO WHERE PROV_ID = '" + id_proveedor + "'";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                producto = new Producto();
                producto.setCodigo_producto(rs.getLong(1));
                producto.setDescripcion(rs.getString(2));
                producto.setPrecio(rs.getInt(3));
                producto.setStock(rs.getInt(4));
                producto.setStock_critico(rs.getInt(5));
                listasProductos.add(producto);
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return listasProductos;
    }

    public ArrayList<Producto> listarProductos_paraVentas() {

        ArrayList listasProductos = new ArrayList();
        Producto producto = null;
        String q = "SELECT PRO_ID_PRODUCTO,PRO_DESCRIPCION,PRO_PRECIO,PRO_STOCK,PRO_STOCK_CRITICO FROM PRODUCTO";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                producto = new Producto();
                producto.setCodigo_producto(rs.getLong(1));
                producto.setDescripcion(rs.getString(2));
                producto.setPrecio(rs.getInt(3));
                producto.setStock(rs.getInt(4));
                producto.setStock_critico(rs.getInt(5));
                listasProductos.add(producto);
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return listasProductos;
    }

    public ArrayList<Producto> codigosProductos(int id_proveedor) {

        ArrayList listasProductos = new ArrayList();
        long cod = 0;
        String q = "SELECT PRO_ID_PRODUCTO FROM PRODUCTO WHERE PROV_ID = '" + id_proveedor + "'";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cod = rs.getLong(1);
                listasProductos.add(cod);
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return listasProductos;
    }

    public int contarProductos() {

        String q = "SELECT COUNT(*) FROM PRODUCTO;";
        int cont = 0;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            cont = rs.getInt(1);

            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return cont;
    }

    public ArrayList<Producto> productosParaOrdenDeCompra(String codigos) {

        ArrayList listasProductos = new ArrayList();
        Producto producto = null;
        String q = "SELECT PRO_ID_PRODUCTO,PRO_DESCRIPCION,PRO_PRECIO FROM PRODUCTO WHERE PRO_ID_PRODUCTO IN (0" + codigos + ")";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                producto = new Producto();
                producto.setCodigo_producto(rs.getLong(1));
                producto.setDescripcion(rs.getString(2));
                producto.setPrecio(rs.getInt(3));
                producto.setStock(rs.getInt(4));
                producto.setStock_critico(rs.getInt(5));
                listasProductos.add(producto);
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return listasProductos;
    }

    public Producto datosProducto(String codigo) {
        Producto pro = null;
        String q = "SELECT PRO_ID_PRODUCTO,PRO_DESCRIPCION,PRO_PRECIO,PRO_IMAGE FROM PRODUCTO WHERE PRO_ID_PRODUCTO = '" + codigo + "'";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pro = new Producto(rs.getLong(1), rs.getString(2), rs.getInt(3), rs.getString(4));
            }
        } catch (SQLException e) {
            System.out.println("Error buscar: " + e.getMessage());
        }
        return pro;
    }

    public ArrayList<Producto> listar_todos_Productos() {

        ArrayList listasProductos = new ArrayList();
        Producto producto = null;
        String q = "SELECT PRO_ID_PRODUCTO,PRO_DESCRIPCION,PRO_PRECIO,PRO_STOCK,PRO_STOCK_CRITICO,PRO_IMAGE FROM PRODUCTO";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                producto = new Producto();
                producto.setCodigo_producto(rs.getLong(1));
                producto.setDescripcion(rs.getString(2));
                producto.setPrecio(rs.getInt(3));
                producto.setStock(rs.getInt(4));
                producto.setStock_critico(rs.getInt(5));
                producto.setImage(rs.getString(6));
                listasProductos.add(producto);
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return listasProductos;
    }

    public ArrayList<Proveedor> listarProveedores() {
        ArrayList listaComunas = new ArrayList();
        Proveedor prov;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement("SELECT PROV_ID,PROV_NOMBRE FROM PROVEEDOR");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                prov = new Proveedor();
                prov.setId_proveedor(rs.getInt(1));
                prov.setNombre(rs.getString(2));
                listaComunas.add(prov);
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return listaComunas;
    }

    public ArrayList<Familia_Producto> listarFamilias() {
        ArrayList listaComunas = new ArrayList();
        Familia_Producto prov;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement("SELECT ID_FAMILIA_PRODUCTO,DESCRIPCION FROM FAMILIA_PRODUCTO");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                prov = new Familia_Producto();
                prov.setCodigo(rs.getInt(1));
                prov.setNombre(rs.getString(2));
                listaComunas.add(prov);
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return listaComunas;
    }

    public ArrayList<Tipo_Producto> listarTipo_Producto() {
        ArrayList listaComunas = new ArrayList();
        Tipo_Producto prov;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement("SELECT ID_TIPO_PRODUCTO,DESCRIPCION FROM TIPO_PRODUCTO");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                prov = new Tipo_Producto();
                prov.setCodigo(rs.getInt(1));
                prov.setNombre(rs.getString(2));
                listaComunas.add(prov);
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return listaComunas;
    }

    public int TraeStock(String codigo) {

        String q = "SELECT PRO_STOCK FROM PRODUCTO WHERE PRO_ID_PRODUCTO = '" + codigo + "'";
        int cont = 0;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                cont = rs.getInt(1);
            }

            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return cont;
    }

    public void DescuentaStock(String codigo, int cantidad) {
        PreparedStatement ps = null;
        int estado;
        try {
            Connection acceso = con.getConnection();
            int stock = TraeStock(codigo);
            int desc = stock - cantidad;
            ps = acceso.prepareStatement("UPDATE PRODUCTO SET PRO_STOCK = " + desc + " WHERE PRO_ID_PRODUCTO = '" + codigo + "'");
            estado = ps.executeUpdate();

            if (estado > 0) {                
                System.out.println("Update Correcto");
            } else {
                System.out.println("Error al Updatear ");
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error al Updatear Stock: " + e.getMessage());
        }

    }

    public int valorSecuenciaFamilia_producto() {

        String q = "SELECT SQ_FAMILIA_PRODUCTO.NEXTVAL FROM DUAL";
        int cont = 0;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cont = rs.getInt(1);
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return cont;
    }

    public void add_Producto(String codigo, String descrip, int precio, int stock, int stock_critico, int prove, int familia, int tipo, String img) {
        PreparedStatement ps = null;
        int estado;
        try {
            Connection acceso = con.getConnection();
            ps = acceso.prepareStatement("INSERT INTO PRODUCTO(PRO_ID_PRODUCTO,PRO_DESCRIPCION,PRO_PRECIO,PRO_STOCK,PRO_STOCK_CRITICO,PROV_ID,ID_TIPO_PRODUCTO,ID_FAMILIA_PRODUCTO,PRO_IMAGE) VALUES(?,?,?,?,?,?,?,?,?)");
            int seq = valorSecuenciaFamilia_producto();
            codigo = codigo + "00000" + seq;
            Long number = Long.parseLong(codigo);
            System.out.println(number);
            ps.setLong(1, number);
            ps.setString(2, descrip);
            ps.setInt(3, precio);
            ps.setInt(4, stock);
            ps.setInt(5, stock_critico);
            ps.setInt(6, prove);
            ps.setInt(7, tipo);
            ps.setInt(8, familia);
            ps.setString(9, img);
            estado = ps.executeUpdate();

            if (estado > 0) {
                System.out.println("Inserto correctamente");
            } else {
                System.out.println("Error al insertar");
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error al insertar: " + e.getMessage());
        }
    }
    // </editor-fold> 

    // <editor-fold defaultstate="collapsed" desc="ORDEN DE COMPRA"> 
    public int valorSecuenciaOrden() {

        String q = "SELECT SQ_ORDEN_COMPRA.NEXTVAL FROM DUAL";
        int cont = 0;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cont = rs.getInt(1);
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return cont;
    }

    public Orden_Compra_Cabecera datosOrden(int id_orden) {
        Orden_Compra_Cabecera ord = null;
        String q = "SELECT TO_CHAR(o.ORD_FECHA,'dd/mm/yyyy'),p.PROV_NOMBRE,p.PROV_RUBRO,p.PROV_CONTACTO,p.PROV_TELEFONO,p.PROV_CORREO,e.EMP_NOMBRE,e.EMP_RUT FROM ORDEN_DE_COMPRA o JOIN PROVEEDOR p ON (p.prov_id = o.PROV_ID) JOIN EMPLEADO e ON (o.emp_rut = e.EMP_RUT) WHERE o.ID_ORDENDECOMPRA = '" + id_orden + "'";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ord = new Orden_Compra_Cabecera();
                ord.setFecha(rs.getString(1));
                ord.setProv_nombre(rs.getString(2));
                ord.setRubro(rs.getString(3));
                ord.setContacto(rs.getString(4));
                ord.setTelefono(rs.getString(5));
                ord.setCorreo(rs.getString(6));
                ord.setEmp_nombre(rs.getString(7));
                ord.setEmp_rut(rs.getString(8));
            }
        } catch (SQLException e) {
            System.out.println("Error buscar: " + e.getMessage());
        }
        return ord;
    }

    public ArrayList<Orden_Compra_Detalle> datosOrden_detalle(int id_orden) {
        ArrayList listasProductos = new ArrayList();
        Orden_Compra_Detalle ord = null;
        String q = "SELECT p.PRO_ID_PRODUCTO,p.PRO_DESCRIPCION,d.ORD_CANTIDAD,d.ORD_PRECIO FROM DETALLE_ORDENDECOMPRA d JOIN PRODUCTO p ON (p.PRO_ID_PRODUCTO = d.ID_PRODUCTO)WHERE d.ID_ORDENDECOMPRA = '" + id_orden + "'";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ord = new Orden_Compra_Detalle();
                ord.setId_producto(rs.getLong(1));
                ord.setDescripcion(rs.getString(2));
                ord.setCantidad(rs.getInt(3));
                ord.setPrecio(rs.getInt(4));
                int total = rs.getInt(3) * rs.getInt(4);
                ord.setTotal_cantidad(total);
                listasProductos.add(ord);
            }
        } catch (SQLException e) {
            System.out.println("Error buscar: " + e.getMessage());
        }
        return listasProductos;
    }

    public void add_Orden_Compra_Cabecera(String fecha, String rut, int prov_id) {
        PreparedStatement ps = null;
        int estado;
        try {
            Connection acceso = con.getConnection();
            ps = acceso.prepareStatement("INSERT INTO ORDEN_DE_COMPRA (ID_ORDENDECOMPRA,ORD_FECHA,EMP_RUT,PROV_ID) VALUES(?,?,?,?)");
            int seq = valorSecuenciaOrden();
            ps.setInt(1, seq);
            ps.setString(2, fecha);
            ps.setString(3, rut);
            ps.setInt(4, prov_id);

            estado = ps.executeUpdate();

            if (estado > 0) {
                System.out.println("Inserto correctamente");
            } else {
                System.out.println("Error al insertar");
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error al insertar: " + e.getMessage());
        }
    }

    public void add_Orden_Compra_Detalle(int cantidad, int precio, String pro_id) {
        PreparedStatement ps = null;
        int estado;
        int ord_id = lastOrdenCompra();
        //System.out.println(cantidad + " " + precio + " " + ord_id + " " + pro_id);
        try {
            Connection acceso = con.getConnection();
            Long number = Long.parseLong(pro_id);
            ps = acceso.prepareStatement("INSERT INTO DETALLE_ORDENDECOMPRA (ORD_CANTIDAD,ORD_PRECIO,ID_ORDENDECOMPRA,ID_PRODUCTO) VALUES(?,?,?,?)");

            ps.setInt(1, cantidad);
            ps.setInt(2, precio);
            ps.setInt(3, ord_id);
            ps.setLong(4, number);

            estado = ps.executeUpdate();

            if (estado > 0) {
                System.out.println("Inserto correctamente");
            } else {
                System.out.println("Error al insertar");
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error al insertar: " + e.getMessage());
        }
    }

    public int lastOrdenCompra() {

        String q = "SELECT MAX(ID_ORDENDECOMPRA) FROM ORDEN_DE_COMPRA";
        int cont = 0;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cont = rs.getInt(1);
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return cont;
    }

    public int total_detalle(int id_orden) {

        String q = "SELECT SUM(ORD_CANTIDAD * ORD_PRECIO) FROM DETALLE_ORDENDECOMPRA WHERE ID_ORDENDECOMPRA = '" + id_orden + "'";
        int cont = 0;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cont = rs.getInt(1);
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return cont;
    }

    public ArrayList<Orden_Compra_Cabecera> listarOrdenes() {

        ArrayList listasProductos = new ArrayList();
        Orden_Compra_Cabecera ord = null;
        String q = "SELECT o.ID_ORDENDECOMPRA,to_char(o.ORD_FECHA,'dd/mm/yyyy'),o.EMP_RUT,p.PROV_NOMBRE FROM ORDEN_DE_COMPRA o join Proveedor p on(p.PROV_ID = o.PROV_ID) ORDER BY o.ID_ORDENDECOMPRA ASC";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ord = new Orden_Compra_Cabecera();
                ord.setId(rs.getInt(1));
                ord.setFecha(rs.getString(2));
                ord.setEmp_rut(rs.getString(3));
                ord.setProv_nombre(rs.getString(4));
                listasProductos.add(ord);
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return listasProductos;
    }

    public ArrayList<Orden_Compra_Cabecera> listarOrdenes_Proveedor(int id) {

        ArrayList listasProductos = new ArrayList();
        Orden_Compra_Cabecera ord = null;
        String q = "SELECT o.ID_ORDENDECOMPRA,to_char(o.ORD_FECHA,'dd/mm/yyyy'),o.EMP_RUT,p.PROV_NOMBRE FROM ORDEN_DE_COMPRA o join Proveedor p on(p.PROV_ID = o.PROV_ID) WHERE p.PROV_ID = '" + id + "' ORDER BY o.ID_ORDENDECOMPRA ASC";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ord = new Orden_Compra_Cabecera();
                ord.setId(rs.getInt(1));
                ord.setFecha(rs.getString(2));
                ord.setEmp_rut(rs.getString(3));
                ord.setProv_nombre(rs.getString(4));
                listasProductos.add(ord);
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return listasProductos;
    }
    // </editor-fold> 

    // <editor-fold defaultstate="collapsed" desc="BOLETA"> 
    public int valorSecuenciaBoleta() {

        String q = "SELECT SQ_BOLETA.NEXTVAL FROM DUAL";
        int cont = 0;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cont = rs.getInt(1);
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return cont;
    }

    public void add_Boleta_Cabecera(String fecha, int total) {
        PreparedStatement ps = null;
        int estado;
        try {
            Connection acceso = con.getConnection();
            ps = acceso.prepareStatement("INSERT INTO BOLETA (ID_BOLETA,BOL_FECHA,BOL_TOTAL) VALUES(?,?,?)");
            int seq = valorSecuenciaBoleta();
            ps.setInt(1, seq);
            ps.setString(2, fecha);
            ps.setInt(3, total);

            estado = ps.executeUpdate();

            if (estado > 0) {
                System.out.println("Inserto correctamente");
            } else {
                System.out.println("Error al insertar");
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error al insertar: " + e.getMessage());
        }
    }

    public int lastBoleta() {

        String q = "SELECT MAX(ID_BOLETA) FROM BOLETA";
        int cont = 0;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cont = rs.getInt(1);
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return cont;
    }

    public void add_Boleta_Detalle(int cantidad, int precio, String pro_id) {
        PreparedStatement ps = null;
        int estado;
        int ord_id = lastBoleta();
        //System.out.println(cantidad + " " + precio + " " + ord_id + " " + pro_id);
        try {
            Connection acceso = con.getConnection();
            Long number = Long.parseLong(pro_id);
            ps = acceso.prepareStatement("INSERT INTO DETALLE_BOLETA (BOL_CANTIDAD,BOL_PRECIO,ID_BOLETA,ID_PRODUCTO) VALUES(?,?,?,?)");

            ps.setInt(1, cantidad);
            ps.setInt(2, precio);
            ps.setInt(3, ord_id);
            ps.setLong(4, number);

            estado = ps.executeUpdate();

            if (estado > 0) {
                System.out.println("Inserto correctamente");
            } else {
                System.out.println("Error al insertar");
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error al insertar: " + e.getMessage());
        }
    }

    public ArrayList<Boleta_Cabecera> listarBoletas() {

        ArrayList listasProductos = new ArrayList();
        Boleta_Cabecera ord = null;
        String q = "SELECT ID_BOLETA,to_char(BOL_FECHA,'dd/mm/yyyy'),BOL_TOTAL FROM BOLETA ORDER BY ID_BOLETA ASC";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ord = new Boleta_Cabecera();
                ord.setId_boleta(rs.getInt(1));
                ord.setFecha(rs.getString(2));
                ord.setTotal(rs.getInt(3));
                listasProductos.add(ord);
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return listasProductos;
    }

    public Boleta_Cabecera datosBoleta(int id_orden) {
        Boleta_Cabecera ord = null;
        String q = "SELECT TO_CHAR(BOL_FECHA,'dd/mm/yyyy'),ID_BOLETA,BOL_TOTAL FROM BOLETA WHERE ID_BOLETA = '" + id_orden + "'";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ord = new Boleta_Cabecera();
                ord.setFecha(rs.getString(1));
                ord.setId_boleta(rs.getInt(2));
                ord.setTotal(rs.getInt(3));
            }
        } catch (SQLException e) {
            System.out.println("Error buscar: " + e.getMessage());
        }
        return ord;
    }

    public ArrayList<Boleta_Detalle> datosBoleta_detalle(int id_orden) {
        ArrayList listasProductos = new ArrayList();
        Boleta_Detalle ord = null;
        String q = "SELECT p.PRO_ID_PRODUCTO,p.PRO_DESCRIPCION,b.BOL_CANTIDAD,p.PRO_PRECIO FROM DETALLE_BOLETA b JOIN PRODUCTO p ON (p.PRO_ID_PRODUCTO = b.ID_PRODUCTO) WHERE b.ID_BOLETA = '" + id_orden + "'";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ord = new Boleta_Detalle();
                ord.setId_codigo(rs.getLong(1));
                ord.setDescripcion(rs.getString(2));
                ord.setCantidad(rs.getInt(3));
                ord.setPrecio(rs.getInt(4));
                int total = rs.getInt(3) * rs.getInt(4);
                ord.setTotal(total);
                listasProductos.add(ord);
            }
        } catch (SQLException e) {
            System.out.println("Error buscar: " + e.getMessage());
        }
        return listasProductos;
    }

// </editor-fold> 
    // <editor-fold defaultstate="collapsed" desc="FACTURA"> 
    public int valorSecuenciaFactura() {

        String q = "SELECT SQ_FACTURA.NEXTVAL FROM DUAL";
        int cont = 0;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cont = rs.getInt(1);
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return cont;
    }

    public void add_Factura_Cabecera(String fecha, int total_neto, int total_iva, int total_bruto, String rut,String nombre,String razon, String direccion) {
        PreparedStatement ps = null;
        int estado;
        try {
            Connection acceso = con.getConnection();
            ps = acceso.prepareStatement("INSERT INTO FACTURA (ID_FACTURA,FAC_FECHA,FAC_NETO,FAC_IVA,FAC_BRUTO,CLI_RUT,CLI_NOMBRE,CLI_RAZON,CLI_DIRECCION) VALUES(?,?,?,?,?,?,?,?,?)");
            int seq = valorSecuenciaFactura();
            ps.setInt(1, seq);
            ps.setString(2, fecha);
            ps.setInt(3, total_neto);
            ps.setInt(4, total_iva);
            ps.setInt(5, total_bruto);
            ps.setString(6, rut);
            ps.setString(7, nombre);
            ps.setString(8, razon);
            ps.setString(9, direccion);

            estado = ps.executeUpdate();

            if (estado > 0) {
                System.out.println("Inserto correctamente");
            } else {
                System.out.println("Error al insertar");
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error al insertar: " + e.getMessage());
        }
    }

    public int lastFactura() {

        String q = "SELECT MAX(ID_FACTURA) FROM FACTURA";
        int cont = 0;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cont = rs.getInt(1);
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return cont;
    }

    public void add_Factura_Detalle(int cantidad, int precio, String pro_id) {
        PreparedStatement ps = null;
        int estado;
        int ord_id = lastFactura();
        //System.out.println(cantidad + " " + precio + " " + ord_id + " " + pro_id);
        try {
            Connection acceso = con.getConnection();
            Long number = Long.parseLong(pro_id);
            ps = acceso.prepareStatement("INSERT INTO DETALLE_FACTURA (FAC_CANTIDAD,FAC_PRECIO,ID_FACTURA,ID_PRODUCTO) VALUES (?,?,?,?)");

            ps.setInt(1, cantidad);
            ps.setInt(2, precio);
            ps.setInt(3, ord_id);
            ps.setLong(4, number);

            estado = ps.executeUpdate();

            if (estado > 0) {
                System.out.println("Inserto correctamente");
            } else {
                System.out.println("Error al insertar");
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error al insertar: " + e.getMessage());
        }
    }

    public ArrayList<Factura_Cabecera> listarFacturas() {

        ArrayList listasProductos = new ArrayList();
        Factura_Cabecera ord = null;
        String q = "SELECT ID_Factura,to_char(FAC_FECHA,'dd/mm/yyyy'),FAC_NETO,FAC_IVA,FAC_BRUTO FROM FACTURA ORDER BY ID_FACTURA ASC";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ord = new Factura_Cabecera();
                ord.setId_factura(rs.getInt(1));
                ord.setFecha(rs.getString(2));
                ord.setNeto(rs.getInt(3));
                ord.setIva(rs.getInt(4));
                ord.setBruto(rs.getInt(5));
                listasProductos.add(ord);
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return listasProductos;
    }

    public Factura_Cabecera datosFactura(int id_orden) {
        Factura_Cabecera ord = null;
        String q = "SELECT ID_Factura,to_char(FAC_FECHA,'dd/mm/yyyy'),FAC_NETO,FAC_IVA,FAC_BRUTO FROM FACTURA WHERE ID_FACTURA = '" + id_orden + "'";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ord = new Factura_Cabecera();
                ord.setId_factura(rs.getInt(1));
                ord.setFecha(rs.getString(2));
                ord.setNeto(rs.getInt(3));
                ord.setIva(rs.getInt(4));
                ord.setBruto(rs.getInt(5));
            }
        } catch (SQLException e) {
            System.out.println("Error buscar: " + e.getMessage());
        }
        return ord;
    }

    public ArrayList<Factura_Detalle> datosFactura_detalle(int id_orden) {
        ArrayList listasProductos = new ArrayList();
        Factura_Detalle ord = null;
        String q = "SELECT p.PRO_ID_PRODUCTO,p.PRO_DESCRIPCION,b.FAC_CANTIDAD,p.PRO_PRECIO FROM DETALLE_FACTURA b JOIN PRODUCTO p ON (p.PRO_ID_PRODUCTO = b.ID_PRODUCTO) WHERE b.ID_FACTURA = " + id_orden;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ord = new Factura_Detalle();
                ord.setCodigo(rs.getLong(1));
                ord.setDesc(rs.getString(2));
                ord.setCantidad(rs.getInt(3));
                ord.setPrecio(rs.getInt(4));
                ord.setNeto((int) Math.round(rs.getInt(4) / 1.19));
                listasProductos.add(ord);
            }
        } catch (SQLException e) {
            System.out.println("Error buscar: " + e.getMessage());
        }
        return listasProductos;
    }

    // </editor-fold>    
}
