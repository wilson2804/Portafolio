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
import modelo.Empleado;
import modelo.Cargo;
import modelo.Comuna;

/**
 *
 * @author Abraham
 */
public class DAOEmpleado {

    Conexion con = new Conexion();

    public DAOEmpleado() {
        con = new Conexion();
    }

    public ArrayList<Empleado> listarEmpleado() {
        ArrayList listaEmpleados = new ArrayList();
        Empleado emple;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement("SELECT e.EMP_RUT,e.EMP_NOMBRE,e.EMP_CARGO,u.USUARIO FROM EMPLEADO e JOIN USUARIO u on (e.id_usuario = u.ID_USUARIO)");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                emple = new Empleado();
                emple.setRut(rs.getString(1));
                emple.setNombre(rs.getString(2));
                emple.setCargo(rs.getString(3));
                emple.setUsuario(rs.getString(4));

                listaEmpleados.add(emple);

            }
            acceso.close();
        } catch (SQLException e) {
            System.out.println("Error buscar: " + e.getMessage());
        }
        return listaEmpleados;
    }

    public void addEmpleado(Empleado emp) {
        CallableStatement call = null;
        int estado = 0;
        try {
            Connection acceso = con.getConnection();
            call = acceso.prepareCall("{CALL SP_REGISTRAR_EMPLEADO(?,?,?)}");
            call.setString(1, emp.getRut());
            call.setString(2, emp.getNombre());
            call.setString(3, emp.getCargo());
            estado = call.executeUpdate();
            if (estado > 0) {
                System.out.println("Se inserto correctamente el empleado");
            } else {

                System.out.println("Error al insertar");
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error de al insertar metodo " + e.getMessage());
        }
    }

    public void desactivarEmpleado(String rut, String usuario) {
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;

        try {
            Connection acceso = con.getConnection();
            ps = acceso.prepareStatement("UPDATE usuario SET estado = 0 WHERE usuario = '" + usuario + "'");
            ps2 = acceso.prepareStatement("UPDATE empleado SET estado = 0 WHERE rut_emple = '" + rut + "'");
            ps.executeUpdate();
            ps2.executeUpdate();

        } catch (SQLException e) {
        }
    }

    public ArrayList<Cargo> listarTiposCargo() {
        ArrayList listaTipos = new ArrayList();
        Cargo tipoCargo;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement("select id_cargo, desc_cargo from cargo");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                tipoCargo = new Cargo();
                tipoCargo.setId_cargo(rs.getInt(1));
                tipoCargo.setDesc_cargo(rs.getString(2));

                listaTipos.add(tipoCargo);
            }
            acceso.close();

        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }

        return listaTipos;
    }

    public ArrayList<Tipo_Usuario> listartipoEmple() {
        ArrayList listarTEmple = new ArrayList();
        Tipo_Usuario tipos;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement("SELECT  ID_TIPO_USUARIO,DESCRIPCION FROM TIPO_USUARIO WHERE ID_TIPO_USUARIO!= 2 and ID_TIPO_USUARIO!=5");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                tipos = new Tipo_Usuario();
                tipos.setId_tipo_usuario(rs.getInt(1));
                tipos.setDesc_tipo_usuario(rs.getString(2));

                listarTEmple.add(tipos);

                acceso.close();
            }
        } catch (Exception e) {
            System.out.println("Error al listar " + e.getMessage());
        }
        return listarTEmple;
    }

    public ArrayList<Comuna> listarTiposComuna() {
        ArrayList listaTipos = new ArrayList();
        Comuna tipoComuna;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement("select id_comuna, desc_comuna from comuna");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                tipoComuna = new Comuna();
                tipoComuna.setId_comuna(rs.getInt(1));
                tipoComuna.setDescripcion(rs.getString(2));

                listaTipos.add(tipoComuna);
            }
            acceso.close();

        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }

        return listaTipos;
    }

    /* public void actualizar(Empleado e,int cargo,int comuna, String user) {
        PreparedStatement ps = null;

        try {
            Connection acceso = con.getConnection();
            ps = acceso.prepareStatement("UPDATE empleado SET rut = '" + e.getRut_emple()+ "' ,dv = '" + e.getDv_emple()+ "' ,nombre = '" + e.getNombre_emple() + "', apellido_paterno = '" + e.getApaterno_emple()+ "',apellido_materno ='" + e.getAmaterno_emple()+ "', telefono = '" +e.getTelefono_emple()+ "', direccion = '" + e.getDireccion_emple()+ "', correo ='" + e.getCorreo_emple()+"', user ='"+ e.getUsuario()+ "',cargo = '" + e.getId_cargo()+ "', comuna ='" + e.getId_comuna()+"'   WHERE empleado = '" + user + "'");

            ps.executeUpdate();

        } catch (SQLException ex) {

        }
    }*/
    public ArrayList<Usuario> ListarEmpleadoFiltro(String id_tipo, String buscar) {
        Empleado emp = null;
        String q = "";
        if (id_tipo.equals("1")) {
            q = "SELECT e.EMP_RUT,e.EMP_RUT,e.EMP_CARGO,u.USUARIO,u.ESTADO FROM EMPLEADO e join USUARIO u on (u.id_usuario = e.ID_USUARIO) WHERE e.EMP_RUT ='" + buscar + "'";
        }
        if (id_tipo.equals("2")) {
            q = "SELECT e.EMP_RUT,e.EMP_RUT,e.EMP_CARGO,u.USUARIO,u.ESTADO FROM EMPLEADO e join USUARIO u on (u.id_usuario = e.ID_USUARIO) WHERE e.EMP_NOMBRE ='" + buscar + "'";
        }
        if (id_tipo.equals("3")) {
            q = "SELECT e.EMP_RUT,e.EMP_RUT,e.EMP_CARGO,u.USUARIO,u.ESTADO FROM EMPLEADO e join USUARIO u on (u.id_usuario = e.ID_USUARIO) WHERE e.EMP_CARGO ='" + buscar + "'";
        }

        ArrayList listaEmpleado = new ArrayList();
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                emp = new Empleado();

                emp.setRut(rs.getString(1));
                emp.setNombre(rs.getString(2));
                emp.setCargo(rs.getString(3));
                emp.setUsuario(rs.getString(4));
                emp.setEstado(rs.getInt(5));

                listaEmpleado.add(emp);
            }
            acceso.close();
        } catch (SQLException e) {
            System.out.println("Error buscar: " + e.getMessage());
        }
        return listaEmpleado;
    }

    public Empleado buscarEmpleadoPorUsuario(int id_user) {
        Empleado emp = new Empleado();
        String q = "SELECT EMP_RUT,EMP_NOMBRE,EMP_CARGO FROM EMPLEADO WHERE ID_USUARIO = '" + id_user + "'";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                emp.setRut(rs.getString(1));
                emp.setNombre(rs.getString(2));
                emp.setCargo(rs.getString(3));
            }
            acceso.close();

        } catch (SQLException e) {
            System.out.println("Error Buscar: " + e.getMessage());
        }
        return emp;
    }
}
