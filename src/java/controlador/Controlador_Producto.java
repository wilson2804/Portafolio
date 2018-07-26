/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import modelo.Producto;
import modelo.DAOProducto;

/**
 *
 * @author Jonathan
 */
public class Controlador_Producto {
    public String getProductos(){
        DAOProducto mp = new DAOProducto();
        String htmlcode = "";
        for(Producto producto : mp.listar_todos_Productos()){
            htmlcode += "<div class=\"col-sm-4\">\n" +
"							<div class=\"product-image-wrapper\">\n" +
"								<div class=\"single-products\">\n" +
"									<div class=\"productinfo text-center\">\n" +
"										<img src=\""+producto.getImage()+"\" alt=\"\" />\n" +
"										<h2>$"+producto.getPrecio()+"</h2>\n" +
"										<p>"+producto.getDescripcion()+"</p>\n" +
"										<button class=\"btn btn-default\"><a href=\"product-details.jsp?id="+producto.getCodigo_producto()+"\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\"> Ver Detalles</i></a></button>\n" +
"									</div>\n" +
"									<div class=\"product-overlay\">\n" +
"										<div class=\"overlay-content\">\n" +
"											<h2>$"+producto.getPrecio()+"</h2>\n" +
"											<p>"+producto.getDescripcion()+"</p>\n" +
"											<a href=\"product-details.jsp?id="+producto.getCodigo_producto()+"\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\"></i>Ver Detalles</a>\n" +
"										</div>\n" +
"									</div>\n" +
"								</div>\n" +
"								<div class=\"choose\">\n" +
"									<ul class=\"nav nav-pills nav-justified\">\n" +
"										<li><a href=\"\"><i class=\"fa fa-plus-square\"></i>Add to wishlist</a></li>\n" +
"										<li><a href=\"\"><i class=\"fa fa-plus-square\"></i>Add to compare</a></li>\n" +
"									</ul>\n" +
"								</div>\n" +
"							</div>\n" +
"						</div>"
                    + "<br><br>";
        }        
        return htmlcode;        
    }
    
    
    public Producto getProducto(String id){
        return new DAOProducto().datosProducto(id);
    }
}
