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
public class Orden_Compra_Detalle {
    
    private long id_producto;
    private String descripcion;
    private int cantidad;
    private int precio;
    private int total_cantidad;

    public long getId_producto() {
        return id_producto;
    }

    public void setId_producto(long id_producto) {
        this.id_producto = id_producto;
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

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getTotal_cantidad() {
        return total_cantidad;
    }

    public void setTotal_cantidad(int total_cantidad) {
        this.total_cantidad = total_cantidad;
    }

    public Orden_Compra_Detalle() {
    }
    
}
