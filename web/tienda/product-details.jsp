<%@page import="controlador.Controlador_Producto"%>
<%@page import="modelo.Producto"%>

<%
    String id = request.getParameter("id");
    Producto producto = new Controlador_Producto().getProducto(id);
%> 


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Product Details | E-Shopper</title>
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
        <script src="../js/jquery-3.2.1.min.js"></script>
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

        <section>
            <div class="container">
                <div class="row">
                    

                    <div class="col-sm-9 padding-right">
                        <div class="product-details">
                            <div class="col-sm-5">
                                <div class="view-product">
                                    <img src="<%= producto.getImage()%>" alt="" />
                                    <h3>ZOOM</h3>
                                </div>
                                <div id="similar-product" class="carousel slide" data-ride="carousel">


                                    <a class="left item-control" href="#similar-product" data-slide="prev">
                                        <i class="fa fa-angle-left"></i>
                                    </a>
                                    <a class="right item-control" href="#similar-product" data-slide="next">
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>

                            </div>
                            <div class="col-sm-7">
                                <div class="product-information">
                                    <img src="images/product-details/new.jpg" class="newarrival" alt="" />
                                    <h2><%= producto.getDescripcion()%></h2>
                                    <p>Web ID: <%= producto.getCodigo_producto()%></p>
                                    <img src="images/product-details/rating.png" alt="" />
                                    <form action="../AddCart" method="post">
                                        <span>
                                            <span>$<%= producto.getPrecio()%></span>
                                            <label>Cantidad:</label>
                                            <input type="hidden" value="<%= producto.getCodigo_producto()%>" name="idproducto">
                                            <input type="text" required="" value="1" id="txt-cantidad" onkeypress="solonumero(event)" onchange="check_cantidad(this)" name="cantidad"/>
                                            <button type="submit" class="btn btn-fefault cart">
                                                <i class="fa fa-shopping-cart"></i>
                                                Agregar al carro
                                            </button>
                                        </span>
                                    </form>
                                    <p><b>Disponibilidad:</b> En Stock</p>                                    
                                    <a href=""><img src="images/product-details/share.png" class="share img-responsive"  alt="" /></a>
                                </div><!--/product-information-->
                            </div>
                        </div><!--/product-details-->









                    </div>
                </div>
            </div>
        </section>




        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                    <p class="pull-left">Copyright Â© 2018 Ferreteria-Ferme. All rights reserved.</p>

                </div>
            </div>
        </div>

    </footer><!--/Footer-->



    <script src="js/jquery.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>

<script>
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
        if (cant < 1)
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
</script>

</html>