/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author sergio
 */
public class Orden_Compra_Cabecera {
    
    private int id;
    private String rubro;
    private String contacto;
    private String telefono;
    private String correo;
    private String emp_nombre;

    public String getRubro() {
        return rubro;
    }

    public void setRubro(String rubro) {
        this.rubro = rubro;
    }

    public String getContacto() {
        return contacto;
    }

    public void setContacto(String contacto) {
        this.contacto = contacto;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getEmp_nombre() {
        return emp_nombre;
    }

    public void setEmp_nombre(String emp_nombre) {
        this.emp_nombre = emp_nombre;
    }
    private String fecha;
    private String emp_rut;
    private int prov_id;
    private String prov_nombre;

    public String getProv_nombre() {
        return prov_nombre;
    }

    public void setProv_nombre(String prov_nombre) {
        this.prov_nombre = prov_nombre;
    }

    public Orden_Compra_Cabecera() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        //DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        //this.fecha = dateFormat.format(fecha);
        this.fecha = fecha;
    }

    public String getEmp_rut() {
        return emp_rut;
    }

    public void setEmp_rut(String emp_rut) {
        this.emp_rut = emp_rut;
    }

    public int getProv_id() {
        return prov_id;
    }

    public void setProv_id(int prov_id) {
        this.prov_id = prov_id;
    }
    
    
    
}
