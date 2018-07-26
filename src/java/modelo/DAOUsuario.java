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
import modelo.Usuario;

/**
 *
 * @author Wilson
 */
public class DAOUsuario {

    Conexion con = new Conexion();

    public DAOUsuario() {
        con = new Conexion();
    }

    public Usuario buscarUsuario(Usuario u) {

        Usuario usuario = null;
        String q = "SELECT usuario,password,id_tipo_usuario,id_usuario FROM usuario WHERE usuario = '" + u.getUser() + "' and password = '" + u.getPass() + "'";
        try {
            try (Connection acceso = con.getConnection()) {
                PreparedStatement ps = acceso.prepareStatement(q);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    usuario = new Usuario();
                    usuario.setUser(rs.getString(1));
                    usuario.setPass(rs.getString(2));
                    usuario.setTipo_user(rs.getInt(3));
                    usuario.setId(rs.getInt(4));
                }
            }

        } catch (SQLException e) {
            System.out.println("Error Buscar: " + e.getMessage());
        }

        return usuario;
    }

    public ArrayList<Usuario> ListarUsuarios(String id_tipo, String buscar) {
        Usuario user = null;
        String q = "";
        if (id_tipo.equals("1")) {
            q = "SELECT upper(u.usuario),upper(u.pass),upper(t.desc_tipo_usuario),upper(u.id_tipo_usuario),upper(u.estado) FROM usuario u join tipo_usuario t on (u.id_tipo_usuario = t.id_tipo_usuario) WHERE usuario = '" + buscar + "'";
        }
        if (id_tipo.equals("2")) {
            q = "SELECT upper(u.usuario),upper(u.pass),upper(t.desc_tipo_usuario),upper(u.id_tipo_usuario),upper(u.estado) FROM usuario u join tipo_usuario t on (u.id_tipo_usuario = t.id_tipo_usuario) WHERE desc_tipo_usuario = '" + buscar + "'";
        }
        ArrayList listaUsuarios = new ArrayList();
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                user = new Usuario();

                user.setUser(rs.getString(1));
                user.setPass(rs.getString(2));
                user.setDescripcion(rs.getString(3));
                user.setTipo_user(rs.getInt(4));
                user.setEstado(rs.getInt(5));
                listaUsuarios.add(user);
            }
            acceso.close();
        } catch (SQLException e) {
            System.out.println("Error buscar: " + e.getMessage());
        }
        return listaUsuarios;
    }

    public void delete(String user) {
        PreparedStatement ps = null;
        try {
            Connection acceso = con.getConnection();
            ps = acceso.prepareStatement("DELETE * FROM usuario WHERE usuario ='" + user + "'");
            ps.executeUpdate();
        } catch (SQLException e) {

            System.out.println("no se elimino producto" + e.getMessage());
        }
    }

    public void actualizar(Usuario p, int tipo_user, String user) {
        PreparedStatement ps = null;

        try {
            Connection acceso = con.getConnection();
            ps = acceso.prepareStatement("UPDATE usuario SET usuario = '" + p.getUser() + "' ,pass = '" + p.getPass() + "' ,id_tipo_usuario = '" + tipo_user + "' WHERE usuario = '" + user + "'");

            ps.executeUpdate();

        } catch (SQLException e) {

        }
    }

    public String buscarUser(Usuario p) {
        String user = "";
        String q = "SELECT usuario FROM usuario WHERE usuario = '" + p.getUser() + "'";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                user = rs.getString(1);
            }
            acceso.close();

        } catch (SQLException e) {
            System.out.println("Error Buscar: " + e.getMessage());
        }
        return user;

    }

    public void addUsuario(Usuario us, int tipo_usuario) {

        CallableStatement call = null;
        int estado = 0;
        try {
            Connection acceso = con.getConnection();
            call = acceso.prepareCall("{CALL SP_REGISTRA_USUARIO(?,?,?)}");
            call.setString(1, us.getUser());
            call.setString(2, us.getPass());
            call.setInt(3, tipo_usuario);
            estado = call.executeUpdate();

            if (estado > 0) {
                System.out.println("Inserto correctamente usuario");
            } else {
                System.out.println("Error al insertar");
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error al insertar usuario: " + e.getMessage());
        }

    }

    public ArrayList<Usuario> listarTipos() {
        ArrayList listaTipos = new ArrayList();
        Usuario tipo;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement("SELECT ID_TIPO_USUARIO,DESCRIPCION FROM tipo_usuario WHERE id_tipo_usuario != 1");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                tipo = new Usuario();
                tipo.setTipo_user(rs.getInt(1));
                tipo.setDescripcion(rs.getString(2));

                listaTipos.add(tipo);
            }
            acceso.close();

        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }

        return listaTipos;
    }

    public Usuario buscarTipo(String tipo) {
        Usuario tipo_Producto = null;
        String q = "SELECT ID_TIPO_USUARIO,DESCRIPCION FROM TIPO_USUARIO WHERE DESCRIPCION ='" + tipo + "'";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                tipo_Producto = new Usuario();
                tipo_Producto.setTipo_user(rs.getInt(1));
                tipo_Producto.setDescripcion(rs.getString(2));
            }
            acceso.close();

        } catch (SQLException e) {
            System.out.println("Error Buscar: " + e.getMessage());
        }

        return tipo_Producto;
    }

    public ArrayList<Usuario> listarUsuario() {
        Usuario user = null;
        String q = "SELECT upper(u.USUARIO),upper(u.PASSWORD),upper(t.DESCRIPCION),upper(u.ID_TIPO_USUARIO),upper(u.ESTADO) FROM USUARIO u join TIPO_USUARIO t on (u.ID_TIPO_USUARIO = t.ID_TIPO_USUARIO) WHERE u.USUARIO != 'admin'";
        ArrayList listaUsuarios = new ArrayList();
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                user = new Usuario();

                user.setUser(rs.getString(1));
                user.setPass(rs.getString(2));
                user.setDescripcion(rs.getString(3));
                user.setTipo_user(rs.getInt(4));
                user.setEstado(rs.getInt(5));
                listaUsuarios.add(user);
            }
            acceso.close();
        } catch (SQLException e) {
            System.out.println("Error buscar: " + e.getMessage());
        }
        return listaUsuarios;
    }

    public void desactivarUser(String rut) {
        PreparedStatement ps = null;

        try {
            Connection acceso = con.getConnection();
            ps = acceso.prepareStatement("UPDATE usuario SET estado = 0 WHERE usuario = '" + rut + "'");

            ps.executeUpdate();

        } catch (SQLException e) {

        }
    }

}
