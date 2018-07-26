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
public class Tipo_Usuario {
    
    private int id_tipo_usuario;
    private String desc_tipo_usuario;

    public Tipo_Usuario(int id_tipo_usuario, String desc_tipo_usuario) {
        this.id_tipo_usuario = id_tipo_usuario;
        this.desc_tipo_usuario = desc_tipo_usuario;
    }

    public int getId_tipo_usuario() {
        return id_tipo_usuario;
    }

    public void setId_tipo_usuario(int id_tipo_usuario) {
        this.id_tipo_usuario = id_tipo_usuario;
    }

    public String getDesc_tipo_usuario() {
        return desc_tipo_usuario;
    }

    public void setDesc_tipo_usuario(String desc_tipo_usuario) {
        this.desc_tipo_usuario = desc_tipo_usuario;
    }

    public Tipo_Usuario() {
    }

    
    
    
}
