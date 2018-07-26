/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author jano1
 */
public class DAOCliente {

    Conexion con = new Conexion();

    public DAOCliente() {
        con = new Conexion();
    }

    public ArrayList<Comuna> listarComunas() {
        ArrayList listaComunas = new ArrayList();
        Comuna comuna;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement("SELECT ID_COMUNA,DESCRIPCION FROM COMUNA");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                comuna = new Comuna();
                comuna.setId_comuna(rs.getInt(1));
                comuna.setDescripcion(rs.getString(2));
                listaComunas.add(comuna);
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return listaComunas;
    }

//    public ArrayList<Tipo_Cliente> listarTipoCliente() {
//        ArrayList listaTipos = new ArrayList();
//        Tipo_Cliente cli;
//        try {
//            Connection acceso = con.getConnection();
//            PreparedStatement ps = acceso.prepareStatement("SELECT id_tipo_cliente,desc_tipo_cliente FROM tipo_cliente");
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                cli = new Tipo_Cliente();
//                cli.setId_tipoCliente(rs.getInt(1));
//                cli.setDescripcion(rs.getString(2));
//                listaTipos.add(cli);
//            }
//            acceso.close();
//        } catch (Exception e) {
//            System.out.println("Error Listar: " + e.getMessage());
//        }
//        return listaTipos;
//    }
    public ArrayList<Cliente> listarCliente() {
        Cliente clie = null;
        String q = "select  c.CLI_RUT,c.CLI_NOMBRE,c.CLI_APATERNO,c.CLI_AMATERNO,c.CLI_DIRECCION,c.CLI_TELEFONO,c.CLI_CORREO,c.CLI_TIPO_CLIENTE,co.DESCRIPCION,t.USUARIO from cliente c join comuna co on(co.ID_COMUNA = c.ID_COMUNA) join USUARIO t on t.ID_USUARIO = c.ID_USUARIO WHERE c.CLI_TIPO_CLIENTE ='PERSONA NATURAL'";
        ArrayList listaCliente = new ArrayList();
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                clie = new Cliente();

                clie.setRut(rs.getString(1));
                clie.setNombre(rs.getString(2));
                clie.setApPaterno(rs.getString(3));
                clie.setApMaterno(rs.getString(4));
                clie.setTelefono(rs.getString(6));
                clie.setDireccion(rs.getString(5));
                clie.setCorreo(rs.getString(7));
                clie.setTipo_cliente(rs.getString(8));
                clie.setComuna(rs.getString(9));
                clie.setUsuario(rs.getString(10));

                listaCliente.add(clie);
            }
            acceso.close();
        } catch (SQLException e) {
            System.out.println("Error buscar: " + e.getMessage());
        }
        return listaCliente;
    }

    public ArrayList<Cliente> listarClienteEmp() {
        Cliente clie = null;
        String q = "SELECT c.CLI_RUT,c.CLI_NOMBRE,c.CLI_DIRECCION,c.CLI_TELEFONO,c.CLI_CORREO,c.CLI_RAZON_SOCIAL,com.DESCRIPCION,us.USUARIO,c.CLI_TIPO_CLIENTE FROM CLIENTE c join COMUNA com on (c.ID_COMUNA = com.ID_COMUNA) join USUARIO us on(c.ID_USUARIO =us.ID_USUARIO)WHERE c.CLI_TIPO_CLIENTE = 'EMPRESA' ";
        ArrayList listaCliente = new ArrayList();
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                clie = new Cliente();

                clie.setRut(rs.getString(1));
                clie.setNombre(rs.getString(2));
                clie.setDireccion(rs.getString(3));
                clie.setTelefono(rs.getString(4));
                clie.setCorreo(rs.getString(5));
                clie.setRazon(rs.getString(6));
                clie.setComuna(rs.getString(7));
                clie.setUsuario(rs.getString(8));
                clie.setTipo_cliente(rs.getString(9));

                listaCliente.add(clie);
            }
            acceso.close();
        } catch (SQLException e) {
            System.out.println("Error buscar: " + e.getMessage());
        }
        return listaCliente;
    }

    public void addCliente_empresa(Cliente cli, int comuna) {
        CallableStatement call = null;
        int estado = 0;
        try {
            Connection acceso = con.getConnection();
            call = acceso.prepareCall("{CALL SP_REGISTRA_CLIENTE_EMPRESA(?,?,?,?,?,?,?)}");
            call.setString(1, cli.getRut());
            call.setString(2, cli.getNombre());
            call.setString(3, cli.getDireccion());
            call.setString(4, cli.getTelefono());
            call.setString(5, cli.getCorreo());
            call.setString(6, cli.getRazon());
            call.setInt(7, comuna);
            estado = call.executeUpdate();

            if (estado > 0) {

                System.out.println("Cliente agregado Empresa");
            } else {

                System.out.println("error al insertar empresa");
            }
        } catch (Exception e) {
            System.out.println("Error al insertar empresa" + e.getMessage());
        }
    }

    public void addCliente_natural(Cliente cli, int comuna) {
        CallableStatement call = null;
        int estado = 0;
        try {
            Connection acceso = con.getConnection();
            call = acceso.prepareCall("{Call SP_REGISTRA_CLIENTE_NATURAL(?,?,?,?,?,?,?,?)}");
            call.setString(1, cli.getRut());
            call.setString(2, cli.getNombre());
            call.setString(3, cli.getApPaterno());
            call.setString(4, cli.getApMaterno());
            call.setString(5, cli.getDireccion());
            call.setString(6, cli.getTelefono());
            call.setString(7, cli.getCorreo());
            call.setInt(8, comuna);
            estado = call.executeUpdate();
            if (estado > 0) {

                System.out.println("Cliente ingresado con exito sistema");
            } else {

                System.out.println("Error al insertar cliente sistema");
            }
            acceso.close();
        } catch (SQLException e) {
            System.out.println("Error al insertar catch " + e.getMessage());
        }
    }

    public ArrayList<Usuario> ListarClientesFiltro(String id_tipo, String buscar) {
        Cliente clie = null;
        String q = "";
        if (id_tipo.equals("1")) {
            q = "select  c.CLI_RUT,c.CLI_NOMBRE,c.CLI_APATERNO,c.CLI_AMATERNO,c.CLI_DIRECCION,c.CLI_TELEFONO,c.CLI_CORREO,c.CLI_TIPO_CLIENTE,co.DESCRIPCION,t.USUARIO from cliente c join comuna co on(co.ID_COMUNA = c.ID_COMUNA) join USUARIO t on t.ID_USUARIO = c.ID_USUARIO WHERE c.rut_cli = '" + buscar + "'";
        }
        if (id_tipo.equals("2")) {
            q = "select  c.CLI_RUT,c.CLI_NOMBRE,c.CLI_APATERNO,c.CLI_AMATERNO,c.CLI_DIRECCION,c.CLI_TELEFONO,c.CLI_CORREO,c.CLI_TIPO_CLIENTE,co.DESCRIPCION,t.USUARIO from cliente c join comuna co on(co.ID_COMUNA = c.ID_COMUNA) join USUARIO t on t.ID_USUARIO = c.ID_USUARIO WHERE c.nombre_cli = '" + buscar + "'";
        }
        if (id_tipo.equals("3")) {
            q = "select  c.CLI_RUT,c.CLI_NOMBRE,c.CLI_APATERNO,c.CLI_AMATERNO,c.CLI_DIRECCION,c.CLI_TELEFONO,c.CLI_CORREO,c.CLI_TIPO_CLIENTE,co.DESCRIPCION,t.USUARIO from cliente c join comuna co on(co.ID_COMUNA = c.ID_COMUNA) join USUARIO t on t.ID_USUARIO = c.ID_USUARIO WHERE c.apaterno_cli = '" + buscar + "'";
        }
        if (id_tipo.equals("4")) {
            q = "select  c.CLI_RUT,c.CLI_NOMBRE,c.CLI_APATERNO,c.CLI_AMATERNO,c.CLI_DIRECCION,c.CLI_TELEFONO,c.CLI_CORREO,c.CLI_TIPO_CLIENTE,co.DESCRIPCION,t.USUARIO from cliente c join comuna co on(co.ID_COMUNA = c.ID_COMUNA) join USUARIO t on t.ID_USUARIO = c.ID_USUARIO WHERE c.amaterno_cli = '" + buscar + "'";
        }
        if (id_tipo.equals("5")) {
            q = "select  c.CLI_RUT,c.CLI_NOMBRE,c.CLI_APATERNO,c.CLI_AMATERNO,c.CLI_DIRECCION,c.CLI_TELEFONO,c.CLI_CORREO,c.CLI_TIPO_CLIENTE,co.DESCRIPCION,t.USUARIO from cliente c join comuna co on(co.ID_COMUNA = c.ID_COMUNA) join USUARIO t on t.ID_USUARIO = c.ID_USUARIO WHERE co.DESC_COMUNA = '" + buscar + "'";
        }
        if (id_tipo.equals("6")) {
            q = "select  c.CLI_RUT,c.CLI_NOMBRE,c.CLI_APATERNO,c.CLI_AMATERNO,c.CLI_DIRECCION,c.CLI_TELEFONO,c.CLI_CORREO,c.CLI_TIPO_CLIENTE,co.DESCRIPCION,t.USUARIO from cliente c join comuna co on(co.ID_COMUNA = c.ID_COMUNA) join USUARIO t on t.ID_USUARIO = c.ID_USUARIO WHERE t.DESC_TIPO_CLIENTE = '" + buscar + "'";
        }
        ArrayList listaClientes = new ArrayList();
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                clie = new Cliente();

                clie.setRut(rs.getString(1));
                clie.setNombre(rs.getString(2));
                clie.setApMaterno(rs.getString(3));
                clie.setApPaterno(rs.getString(4));
                clie.setDireccion(rs.getString(5));
                clie.setTelefono(rs.getString(6));
                clie.setCorreo(rs.getString(7));
                clie.setTipo_cliente(rs.getString(8));
                clie.setComuna(rs.getString(9));
                clie.setUsuario(rs.getString(10));

                listaClientes.add(clie);
            }
            acceso.close();
        } catch (SQLException e) {
            System.out.println("Error buscar: " + e.getMessage());
        }
        return listaClientes;
    }

    public void desactivarCliente(String rut, String usuario) {
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;

        try {
            Connection acceso = con.getConnection();
            ps = acceso.prepareStatement("UPDATE usuario SET estado = 0 WHERE usuario = '" + usuario + "'");
            ps2 = acceso.prepareStatement("UPDATE cliente SET estado = 0 WHERE rut_cli = '" + rut + "'");
            ps.executeUpdate();
            ps2.executeUpdate();

        } catch (SQLException e) {

        }
    }

    public ArrayList<Cliente> listarClienteParaFactura() {
        Cliente clie = null;
        String q = "SELECT c.CLI_RUT,c.CLI_NOMBRE,c.CLI_DIRECCION,c.CLI_RAZON_SOCIAL FROM CLIENTE c WHERE c.CLI_TIPO_CLIENTE = 'EMPRESA'";
        ArrayList listaCliente = new ArrayList();
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                clie = new Cliente();

                clie.setRut(rs.getString(1));
                clie.setNombre(rs.getString(2));
                clie.setDireccion(rs.getString(3));
                clie.setRazon(rs.getString(4));

                listaCliente.add(clie);
            }
            acceso.close();
        } catch (SQLException e) {
            System.out.println("Error buscar: " + e.getMessage());
        }
        return listaCliente;
    }

    public Cliente buscarClientePorFactura(int id_user) {
        Cliente cli = new Cliente();
        String q = "SELECT CLI_RUT,CLI_NOMBRE,CLI_DIRECCION,CLI_RAZON FROM FACTURA WHERE ID_FACTURA = '" + id_user + "'";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                cli.setRut(rs.getString(1));
                cli.setNombre(rs.getString(2));
                cli.setDireccion(rs.getString(3));
                cli.setRazon(rs.getString(4));
            }
            acceso.close();

        } catch (SQLException e) {
            System.out.println("Error Buscar: " + e.getMessage());
        }
        return cli;
    }
    
    public Cliente buscarClientePorRut(String rut) {
        Cliente cli = new Cliente();
        String q = "SELECT c.CLI_RUT,c.CLI_NOMBRE,c.CLI_DIRECCION,c.CLI_RAZON_SOCIAL FROM CLIENTE c WHERE c.CLI_RUT = '" + rut + "'";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                cli.setRut(rs.getString(1));
                cli.setNombre(rs.getString(2));
                cli.setDireccion(rs.getString(3));
                cli.setRazon(rs.getString(4));
            }
            acceso.close();

        } catch (SQLException e) {
            System.out.println("Error Buscar: " + e.getMessage());
        }
        return cli;
    }
}
