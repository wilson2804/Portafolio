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
public class DAOProveedor {

    Conexion con = new Conexion();

    public DAOProveedor() {

        con = new Conexion();
    }

    public ArrayList<Rubro> listarRubro() {
        ArrayList listaRubros = new ArrayList();
        Rubro rubro;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement("SELECT id_rubro,desc_rubro FROM rubro");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                rubro = new Rubro();
                rubro.setId_rubro(rs.getInt(1));
                rubro.setDescripcion(rs.getString(2));
                listaRubros.add(rubro);
            }
            acceso.close();

        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }

        return listaRubros;
    }

    public ArrayList<Comuna> listarComunas() {
        ArrayList listaComunas = new ArrayList();
        Comuna comuna;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement("SELECT id_comuna,desc_comuna FROM comuna");
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
   
    public void addUser(Usuario p, int tipo) {
        PreparedStatement ps = null;
        int estado;
        try {
            Connection acceso = con.getConnection();
            ps = acceso.prepareStatement("INSERT INTO usuario (usuario,pass,id_tipo_usuario) VALUES(?,?,?)");
            ps.setString(1, p.getUser());
            ps.setString(2, p.getPass());
            ps.setInt(3, tipo);
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
    
    public int buscarRubro(Rubro ru) {
        int rubro = 0;
        String q = "SELECT id_rubro FROM rubro WHERE usuario = '" + ru.getId_rubro() + "'";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                rubro = rs.getInt(1);
            }
            acceso.close();

        } catch (SQLException e) {
            System.out.println("Error Buscar: " + e.getMessage());
        }
        return buscarRubro(ru);
    }

    public int buscarProveedorPorUsuario(int id_user) {
        int id = 0;
        String q = "SELECT PROV_ID FROM proveedor WHERE ID_USUARIO = '" + id_user + "'";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                id = rs.getInt(1);
            }
            acceso.close();

        } catch (SQLException e) {
            System.out.println("Error Buscar: " + e.getMessage());
        }
        return id;
    }

    public void deleteProveedor(int rut) {
        PreparedStatement ps = null;
        try {
            Connection acceso = con.getConnection();
            ps = acceso.prepareStatement("DELETE FROM proveedor WHERE rut_provee =" + rut + "");
            ps.executeUpdate();
        } catch (Exception e) {

            System.out.println("no se elimino proveedor" + e.getMessage());
        }
    }
       
     public ArrayList<Tipo_Usuario> listarTiposUsuarios() {
        ArrayList listaTiposUsuarios = new ArrayList();
        Tipo_Usuario tipo_Usuario;
        
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement("SELECT id_tipo_usuario,desc_tipo_usuario FROM tipo_usuario");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                tipo_Usuario = new Tipo_Usuario();
                tipo_Usuario.setId_tipo_usuario(rs.getInt(1));
                tipo_Usuario.setDesc_tipo_usuario(rs.getString(2));
                listaTiposUsuarios.add(tipo_Usuario);
            }
            acceso.close();

        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }

        return listaTiposUsuarios;
    }
     
     public  void addProveedor(Proveedor pro)
    {
        CallableStatement call = null;
        int estado =0;
        try {
            Connection acceso = con.getConnection();
            call = acceso.prepareCall("{CALL SP_REGISTRA_PROVEEDOR(?,?,?,?,?)}");
            call.setString(1, pro.getNombre());
            call.setString(2, pro.getContacto());
            call.setString(3, pro.getTelefono());
            call.setString(4, pro.getRubro());
            call.setString(5, pro.getCorreo());
            estado = call.executeUpdate();

            if (estado > 0) {
                System.out.println("Inserto correctamente proveedor");
            } else {
                System.out.println("Error al insertar");
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error al insertar hh: " + e.getMessage());
        }
        
    }
     public void Modificar_Proveedor(Proveedor p, String usua){
         
         CallableStatement call = null;
         int estado =0;
         
         try {
             Connection acceso = con.getConnection();
             call = acceso.prepareCall("{CALL SP_UPDATEPROVEEDOR(?,?,?,?,?,?) }");
             call.setInt(1,p.getId_proveedor());
             call.setString(2, p.getNombre());
             call.setString(3, p.getContacto());
             call.setString(4, p.getTelefono());
             call.setString(5, p.getRubro());
             call.setString(6, p.getCorreo());
             estado = call.executeUpdate();
             if(estado>0){
             
                 System.out.println("modificacion correcta");
             }else{
             
                 System.out.println("Error al modificar");
             }
             acceso.close();;
             
         } catch (Exception e) {
             System.out.println("Error al insertar"+e.getMessage());
         }
     }
               
     public ArrayList<Proveedor> listarProveedor(){

        ArrayList listasProveedores = new ArrayList();
        Proveedor proveedor;
       
            try {
                Connection acceso = con.getConnection();
                PreparedStatement ps= acceso.prepareStatement("SELECT p.PROV_ID,p.PROV_NOMBRE,p.PROV_CONTACTO,p.PROV_TELEFONO,p.PROV_RUBRO,p.PROV_CORREO,us.USUARIO FROM PROVEEDOR p  JOIN USUARIO us ON (p.ID_USUARIO = us.ID_USUARIO)");
                ResultSet rs=ps.executeQuery();
                while (rs.next()) {
                    
                    proveedor = new Proveedor();
                    proveedor.setId_proveedor(rs.getInt(1));
                    proveedor.setNombre(rs.getString(2));
                    proveedor.setContacto(rs.getString(3));
                    proveedor.setTelefono(rs.getString(4));
                    proveedor.setRubro(rs.getString(5));
                    proveedor.setCorreo(rs.getString(6));
                    proveedor.setUsuario(rs.getString(7));
                   
                    listasProveedores.add(proveedor);
                    
                }
                acceso.close();
                
            } catch (Exception e) {
                System.out.println("Error Listar: " + e.getMessage());
            }
            return listasProveedores; 
        
}
       public ArrayList<Proveedor> ListarProveedoresFiltro(String id_tipo,String buscar) {
        Proveedor proveedor = null;
        String q = "";
        if(id_tipo.equals("1")){      
        q =  "SELECT p.PROV_ID,p.PROV_NOMBRE,p.PROV_CONTACTO,p.PROV_TELEFONO,p.PROV_RUBRO,p.PROV_CORREO,u.USUARIO FROM proveedor p JOIN USUARIO u on u.id_usuario = p.ID_USUARIO WHERE p.PROV_ID = '" + buscar + "'";
        }
        if(id_tipo.equals("2")){
        q =  "SELECT p.PROV_ID,p.PROV_NOMBRE,p.PROV_CONTACTO,p.PROV_TELEFONO,p.PROV_RUBRO,p.PROV_CORREO,u.USUARIO FROM proveedor p JOIN USUARIO u on u.id_usuario = p.ID_USUARIO WHERE p.PROV_NOMBRE = '" + buscar + "'"; 
        }
        if(id_tipo.equals("3")){
         q =  "SELECT p.PROV_ID,p.PROV_NOMBRE,p.PROV_CONTACTO,p.PROV_TELEFONO,p.PROV_RUBRO,p.PROV_CORREO,u.USUARIO FROM proveedor p JOIN USUARIO u on u.id_usuario = p.ID_USUARIO WHERE p.PROV_RUBRO = '" + buscar + "'";
        }
        if(id_tipo.equals("4")){
        q =  "SELECT p.PROV_ID,p.PROV_NOMBRE,p.PROV_CONTACTO,p.PROV_TELEFONO,p.PROV_RUBRO,p.PROV_CORREO,u.USUARIO FROM proveedor p JOIN USUARIO u on u.id_usuario = p.ID_USUARIO WHERE p.PROV_ID = '" + buscar + "'";
        }
        
        ArrayList listasProveedores = new ArrayList();
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
               proveedor = new Proveedor();
                    proveedor.setId_proveedor(rs.getInt(1));
                    proveedor.setNombre(rs.getString(3));
                    proveedor.setContacto(rs.getString(4));
                    proveedor.setTelefono(rs.getString(5));
                    proveedor.setRubro(rs.getString(6));
                    proveedor.setCorreo(rs.getString(7));
                    proveedor.setUsuario(rs.getString(8));
                   
                    listasProveedores.add(proveedor);
            }
            acceso.close();
        } catch (SQLException e) {
            System.out.println("Error buscar: " + e.getMessage());
        }
        return listasProveedores;
    }
       
}



