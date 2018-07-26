/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author wilso
 */
public class Comuna {
    
    private int id_comuna;
    private String descripcion;

    public Comuna(int id_comuna, String descripcion) {
        this.id_comuna = id_comuna;
        this.descripcion = descripcion;
    }

    public int getId_comuna() {
        return id_comuna;
    }

    public void setId_comuna(int id_comuna) {
        this.id_comuna = id_comuna;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Comuna() {
    }
    
    
    
}
