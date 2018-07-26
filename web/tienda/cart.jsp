<%@page import="modelo.Producto"%>
<%@page import="controlador.Controlador_Producto"%>
<%@page import="modelo.Articulo"%>
<%@page import="java.util.ArrayList"%>
<%
    HttpSession sesion = request.getSession(true);
    ArrayList<Articulo> articulos = sesion.getAttribute("carrito") == null ? null : (ArrayList) sesion.getAttribute("carrito");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Cart | E-Shopper</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">

        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="../css/style.css" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>        
        <script src="../js/bootstrap.min.js"></script>
    </head><!--/head-->

    <body>
        <header id="header"><!--header-->
            <nav class="main-nav-outer" id="test">
                <!--main-nav-start-->
                <div class="container">
                    <ul class="main-nav">
                        <li><a href="../index.jsp">Inicio</a></li>

                        <li><a href="shop.jsp">Tienda</a></li>
                        <li class="small-logo"><a href="../index.jsp"><img src="../img/logo-small.png" alt=""></a></li>

                        <li><a href="../login.jsp">Login</a></li>
                        <li><a href="cart.jsp" class="active">Carro de Compras</a></li>
                    </ul>
                    <a class="res-nav_click" href="#"><i class="fa-bars"></i></a>
                </div>
            </nav>
        </header><!--/header-->
        <br>
        <br>

        <section id="cart_items">
            <div class="container">

                <div class="table-responsive cart_info" id="cart-container">
                    <table class="table table-condensed" id="shop_table">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image">Producto</td>
                                <td class="description"></td>
                                <td class="price">Precio</td>
                                <td class="quantity">Cantidad</td>
                                <td class="total">Total</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>


                            <%
                                Controlador_Producto cp = new Controlador_Producto();
                                double total = 0;
                                if (articulos != null) {
                                    for (Articulo a : articulos) {
                                        Producto producto = cp.getProducto(a.getIdProducto());
                                        total += a.getCantidad() * producto.getPrecio();
                                        Long codigo = producto.getCodigo_producto();
                            %>

                            <tr>
                                <td class="cart_product">
                                    <a href=""><img src="<%= producto.getImage()%>" alt="" width="120"></a>
                                </td>
                                <td class="cart_description">
                                    <h4><%= producto.getDescripcion()%></h4>
                                    <p>Codigo de producto: <%= producto.getCodigo_producto()%></p>
                                </td>
                                <td class="cart_price">
                                    <input type="hidden" id="precio_producto_<%= producto.getCodigo_producto()%>" value="<%= producto.getPrecio()%>">
                                    <p>$<%= producto.getPrecio()%></p>
                                </td>
                                <td class="cart_quantity">
                                    <div class="cart_quantity_button">
                                        <table border="0" id="tbl_input">
                                            <tr align="center">
                                                <td style="width: 19px"><i class="fa fa-plus" onclick="AumentarCantidad(<%= codigo%>);actualizaTotal(<%= codigo%>);"></i></td>
                                                <td style="width: 19px"><input onchange="check_cantidad(this);actualizaTotal(<%= codigo%>)" class="cart_quantity_input" type="text" id="cantidad_<%= codigo%>" required="" onkeypress="solonumero(event)" name="quantity" value="<%= a.getCantidad()%>" autocomplete="off" size="2"></td>
                                                <td style="width: 19px"><i class="fa fa-minus" onclick="ReducirCantidad(<%= codigo%>);actualizaTotal(<%= codigo%>);"></i></td>
                                            </tr>

                                        </table>
                                    </div>
                                </td>
                                <td class="cart_total">
                                    <table id="tablita>"
                                           <tr>
                                            <td>
                                                <p class="cart_total_price">$</p>
                                            </td>
                                            <td>
                                                <p id="totalcito_<%= producto.getCodigo_producto()%>" class="cart_total_price"><%= Math.round(producto.getPrecio() * a.getCantidad() * 100.0) / 100.0%></p>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="cart_delete">
                                    <span id="idarticulo" style="display:none;"><%= producto.getCodigo_producto()%></span>
                                    <a class="cart_quantity_delete" href="" id="deleteitem"><i class="fa fa-times"></i></a>
                                </td>
                            </tr>

                            <%}
                                }%>









                        </tbody>
                    </table>
                    <% if (articulos == null) {%>
                    <h4>No hay Articulos en el carro</h4>
                    <%}%>

                    </section> 

                    <section id="do_action">
                        <div class="container">

                            <div class="row">

                                <div class="col-sm-6">
                                    <div class="total_area">
                                        <ul>
                                            <li>Subtotal <span id="txt_subtotal">$<%= Math.round(total * 100.0) / 100.0%></span></li>


                                            <li>Total <span id="txt_total">$<%= Math.round(total * 100.0) / 100.0%></span></li>                                            
                                        </ul>
                                        <a class="btn btn-default update" href="shop.jsp">Seguir comprando</a>
                                        <a class="btn btn-default check_out" onclick="proximo()">Pagar</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section><!--/#do_action-->


                    <footer

                        <div class="footer-bottom">
                            <div class="container">
                                <div class="row">
                                    <p class="pull-left">Copyright Â© 2013 E-SHOPPER Inc. All rights reserved.</p>
                                    <p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com">Themeum</a></span></p>
                                </div>
                            </div>
                        </div>

                    </footer><!--/Footer-->



                    <script src="js/jquery.js"></script>
                    <script src="js/bootstrap.min.js"></script>
                    <script src="js/jquery.scrollUp.min.js"></script>
                    <script src="js/jquery.prettyPhoto.js"></script>
                    <script src="js/main.js"></script>
                    <script src="js/carrito.js"></script>

                    <script>
                                                    function AumentarCantidad(codigo) {
                                                        var cant = document.getElementById("cantidad_" + codigo).value;
                                                        if (cant != "") {
                                                            document.getElementById("cantidad_" + codigo).value = parseInt(cant) + 1;
                                                        } else {
                                                            document.getElementById("cantidad_" + codigo).value = 1;
                                                        }

                                                    }

                                                    function actualizaTotal(codigo) {
                                                        var precio = document.getElementById("precio_producto_" + codigo).value;
                                                        var cantidad = document.getElementById("cantidad_" + codigo).value;

                                                        var total = parseInt(precio) * parseInt(cantidad)
                                                        document.getElementById("totalcito_" + codigo).innerHTML = total + ".0";

                                                    }

                                                    function ReducirCantidad(codigo) {
                                                        var cant = document.getElementById("cantidad_" + codigo).value;
                                                        if (cant != "") {
                                                            document.getElementById("cantidad_" + codigo).value = parseInt(cant) - 1;
                                                        }
                                                        if (document.getElementById("cantidad_" + codigo).value < 1) {
                                                            alert("La cantidad no puede ser menor que 1");
                                                            document.getElementById("cantidad_" + codigo).value = 1;
                                                        }
                                                    }

                                                    function solonumero(event)
                                                    {
                                                        if (event.keyCode < 46 || event.keyCode > 57) {
                                                            event.returnValue = false
                                                        }
                                                    }

                                                    function check_cantidad(element)
                                                    {
                                                        var cant = element.value;
                                                        var cant_es_flotante = isFloat(cant);
                                                        if (cant === "") {
                                                            document.getElementById(element.id).value = 1;
                                                        } else if (cant < 1)
                                                        {
                                                            alert('Introduce numeros enteros mayores que 0');
                                                            document.getElementById(element.id).value = "";

                                                        } else if (cant_es_flotante == true)
                                                        {
                                                            alert('El valor es decimal.  Será convertido a entero.');
                                                            cant = Math.round(cant);
                                                            document.getElementById(element.id).value = cant;
                                                        }
                                                    }
                                                    function isFloat(myNum)
                                                    {
                                                        var myMod = myNum % 1;
                                                        if (myMod == 0)
                                                        {
                                                            return false;
                                                        } else {
                                                            return true;
                                                        }
                                                    }
                                                    
                                                    function proximo(){
                                                        alert("EL SISTEMA ESTA EN FASE DE CONSTRUCCION. \n\n LAMENTAMOS LOS INCONVENIENTES");
                                                        
                                                    }
                    </script>
                    </body>
                    </html>