/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author sergio
 */
public class Boleta_Detalle {
    
    private long id_codigo;
    private String descripcion;
    private int cantidad;

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
    private int precio;
    private int total;

    public Boleta_Detalle() {
    }

    public Boleta_Detalle(long id_codigo, String descripcion, int cantidad) {
        this.id_codigo = id_codigo;
        this.descripcion = descripcion;
        this.cantidad = cantidad;
    }

    public long getId_codigo() {
        return id_codigo;
    }

    public void setId_codigo(long id_codigo) {
        this.id_codigo = id_codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }                
}
