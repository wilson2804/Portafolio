/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Wilson
 */
public class Usuario {

    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    private String user;
    private String pass;
    private int tipo_user;
    private String descripcion,estado;

    public Usuario(String user, String pass) {
        this.user = user;
        this.pass = pass;
    }
    
    public Usuario() {
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    @Override
    public String toString() {
        return "Usuario{" + "correo=" + user + ", password=" + pass + '}';
    }

    /**
     * @return the tipo_user
     */
    public int getTipo_user() {
        return tipo_user;
    }

    /**
     * @param tipo_user the tipo_user to set
     */
    public void setTipo_user(int tipo_user) {
        this.tipo_user = tipo_user;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        if(estado == 1){
        this.estado = "ACTIVO";
        }else{
        this.estado = "INACTIVO";
        }
    }


}
