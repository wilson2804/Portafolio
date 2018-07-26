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
public class Cargo {
    
    private int id_cargo;
    private String desc_cargo;

    public Cargo(int id_cargo, String desc_cargo) {
        this.id_cargo = id_cargo;
        this.desc_cargo = desc_cargo;
    }

    public Cargo() {
    }

   
  

    public int getId_cargo() {
        return id_cargo;
    }

    public void setId_cargo(int id_cargo) {
        this.id_cargo = id_cargo;
    }

    public String getDesc_cargo() {
        return desc_cargo;
    }

    public void setDesc_cargo(String desc_cargo) {
        this.desc_cargo = desc_cargo;
    }
    
    
}
