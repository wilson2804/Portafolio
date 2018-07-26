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
public class Tipo_Cliente {
    
    private int id_tipoCliente;
    private String descripcion;

    public Tipo_Cliente() {
    }

    public Tipo_Cliente(int id_tipoCliente, String descripcion) {
        this.id_tipoCliente = id_tipoCliente;
        this.descripcion = descripcion;
    }
    
    public int getId_tipoCliente() {
        return id_tipoCliente;
    }

    public void setId_tipoCliente(int id_tipoCliente) {
        this.id_tipoCliente = id_tipoCliente;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    
    
}
