/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author jano1
 */
public class Rubro {
     private int id_rubro;
    private String descripcion;

    public Rubro(int id_rubro, String descripcion) {
        this.id_rubro = id_rubro;
        this.descripcion = descripcion;
    }

    public Rubro() {
    }

    public int getId_rubro() {
        return id_rubro;
    }

    public void setId_rubro(int id_rubro) {
        this.id_rubro = id_rubro;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
