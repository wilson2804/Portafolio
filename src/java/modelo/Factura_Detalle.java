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
public class Factura_Detalle {
    
    private int cantidad;
    private Long codigo;

    public Long getCodigo() {
        return codigo;
    }

    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }
    private int precio;
    private int neto;

    public int getNeto() {
        return neto;
    }

    public void setNeto(int neto) {        
        this.neto = neto;
    }
    private String desc;

    public Factura_Detalle() {
    }

    public Factura_Detalle(int cantidad, int precio, String desc) {
        this.cantidad = cantidad;
        this.precio = precio;
        this.desc = desc;
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

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
    
    
    
}
