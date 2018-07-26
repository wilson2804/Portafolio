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
public class Factura_Cabecera {
    
    private int id_factura;
    private String fecha;
    private int neto;
    private int iva;
    private int bruto;
    private String rut_cliente;

    public Factura_Cabecera() {
    }

    public Factura_Cabecera(int id_factura, String fecha, int neto, int iva, int bruto, String rut_cliente) {
        this.id_factura = id_factura;
        this.fecha = fecha;
        this.neto = neto;
        this.iva = iva;
        this.bruto = bruto;
        this.rut_cliente = rut_cliente;
    }

    public int getId_factura() {
        return id_factura;
    }

    public void setId_factura(int id_factura) {
        this.id_factura = id_factura;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getNeto() {
        return neto;
    }

    public void setNeto(int neto) {
        this.neto = neto;
    }

    public int getIva() {
        return iva;
    }

    public void setIva(int iva) {
        this.iva = iva;
    }

    public int getBruto() {
        return bruto;
    }

    public void setBruto(int bruto) {
        this.bruto = bruto;
    }

    public String getRut_cliente() {
        return rut_cliente;
    }

    public void setRut_cliente(String rut_cliente) {
        this.rut_cliente = rut_cliente;
    }
    
    
    
    
}
