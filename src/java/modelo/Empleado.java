/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Abraham
 */
public class Empleado {
    
    private String rut;
    private String nombre;
    private String cargo;
    private int id_usuario;
    private String usuario;

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    
    private String estado;

    public Empleado() {
    }

    public Empleado(String rut, String nombre, String cargo) {
        this.rut = rut;
        this.nombre = nombre;
        this.cargo = cargo;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
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
