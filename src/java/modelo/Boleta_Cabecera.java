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
public class Boleta_Cabecera {
    
    private int id_boleta;
    private String fecha;
    private int total;

    public Boleta_Cabecera() {
    }

    public Boleta_Cabecera(int id_boleta, String fecha, int total) {
        this.id_boleta = id_boleta;
        this.fecha = fecha;
        this.total = total;
    }

    public int getId_boleta() {
        return id_boleta;
    }

    public void setId_boleta(int id_boleta) {
        this.id_boleta = id_boleta;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
    
    
    
}
