<%-- 
    Document   : index
    Created on : 18-04-2018, 21:44:09
    Author     : wilso
--%>

<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ferreteria FERME.</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, maximum-scale=1">
        <link rel="icon" href="img/logo-ferreteria.png|" type="image/png">
        <link rel="shortcut icon" href="favicon.ico" type="img/x-icon">

        <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,800italic,700italic,600italic,400italic,300italic,800,700,600' rel='stylesheet' type='text/css'>

        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet" type="text/css">

        <link href="css/font-awesome.css" rel="stylesheet" type="text/css">
        <link href="css/responsive.css" rel="stylesheet" type="text/css">
        <link href="css/animate.css" rel="stylesheet" type="text/css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/jquery-scrolltofixed.js"></script>
        <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="js/jquery.isotope.js"></script>
        <script type="text/javascript" src="js/wow.js"></script>
        <script type="text/javascript" src="js/classie.js"></script>

    </head>
    <body>
        <nav class="main-nav-outer" id="test">
            <!--main-nav-start-->
            <div class="container">
                <ul class="main-nav">
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="#service">Servicios</a></li>
                    <li><a href="tienda/shop.jsp">Tienda</a></li>
                    <li class="small-logo"><a href="index.jsp"><img src="img/logo-small.png" alt=""></a></li>
                    <li><a href="#client">Proveedores</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="#contact">Contactanos</a></li>
                </ul>
                <a class="res-nav_click" href="#"><i class="fa-bars"></i></a>
            </div>
        </nav>
        <!--main-nav-end-->



        <section class="main-section" id="service">
            <!--main-section-start-->
            <div class="container">
                <h2>Ferreteria Ferme</h2>
                <h6>Todos los productos de construcion al alcance de tu mano</h6>
                <div class="row">
                    <div class="col-lg-4 col-sm-6 wow fadeInLeft delay-05s">
                        <div class="service-list">
                            <div class="service-list-col1">
                                <i class="fa-paw"></i>
                            </div>
                            <div class="service-list-col2">
                                <h3>Siempre el mejor servicio</h3>
                                <p>Atencion personalizada, en nuestra tienda tendras apoyo de un vendedor experimentado, el cual, te podra ayudar en todas tu consultas </p>
                            </div>
                        </div>
                        <div class="service-list">
                            <div class="service-list-col1">
                                <i class="fa-gear"></i>
                            </div>
                            <div class="service-list-col2">
                                <h3>Servicio Web</h3>
                                <p>Compra todas tus productos y escoge una opcion de retiro</p>
                            </div>
                        </div>
                        <div class="service-list">
                            <div class="service-list-col1">
                                <i class="fa-apple"></i>
                            </div>
                            <div class="service-list-col2">
                                <h3>Diseño mobile </h3>
                                <p>Podras ver todos nuestros producto desde tu equipo mobile y tambien podras realizar compras </p>
                            </div>
                        </div>
                        <div class="service-list">
                            <div class="service-list-col1">
                                <i class="fa-medkit"></i>
                            </div>
                            <div class="service-list-col2">
                                <h3>Despachos todos los dias del año</h3>
                                <p>Contamos condespachos dentro y fuera de la comuna</p>
                            </div>
                        </div>
                    </div>
                    <figure class="col-lg-8 col-sm-6  text-right wow fadeInUp delay-02s">
                        <img src="img/herramientas.jpg" alt="">
                    </figure>

                </div>
            </div>
        </section>
        <!--main-section-end-->



        <section class="main-section alabaster">
            <!--main-section alabaster-start-->
            <div class="container">
                <div class="row">
                    <figure class="col-lg-5 col-sm-4 wow fadeInLeft">
                        <img src="img/logos_marcas.jpg" alt="">
                    </figure>
                    <div class="col-lg-7 col-sm-8 featured-work">
                        <h2>Las Mejores Hermanientas</h2>
                        <P class="padding-b">En nuestra tienda encontraras todo lo que necesitas pare realizar tus proyectos. </P>
                        <div class="featured-box">
                            <div class="featured-box-col1 wow fadeInRight delay-02s">
                                <i class="fa-magic"></i>
                            </div>
                            <div class="featured-box-col2 wow fadeInRight delay-02s">
                                <h3>Factibilidad de productos</h3>
                                <p>Nuestra tienda tiene una gran cantidad de productos, marcas y todo al alcance de tu mano.</p>
                            </div>
                        </div>
                        <div class="featured-box">
                            <div class="featured-box-col1 wow fadeInRight delay-04s">
                                <i class="fa-gift"></i>
                            </div>
                            <div class="featured-box-col2 wow fadeInRight delay-04s">
                                <h3>Regalos</h3>
                                <p>Se acerca el cumpleaños de un ser querido, papá, marido, hermano, etc. En nuestra tienda podras encontrar el regalo para ese maestro chasquilla que lleva dentro. </p>
                            </div>
                        </div>
                        <div class="featured-box">
                            <div class="featured-box-col1 wow fadeInRight delay-06s">
                                <i class="fa-dashboard"></i>
                            </div>
                            <div class="featured-box-col2 wow fadeInRight delay-06s">
                                <h3>Rapides en tus compras </h3>
                                <p> Como empresa sabemos que lo mas importante es el tiempo. En nuestra tienda podras optimizar tu proceso de compras, gracias a la ayuda de los vendedores especializados que tenemos para ayudarte.</p>
                            </div>
                        </div>
                        <a class="Learn-More" href="#">Learn More</a>
                    </div>
                </div>
            </div>
        </section>
        <!--main-section alabaster-end-->



        <section class="main-section paddind" id="Portfolio">
            <!--main-section-start-->
            <div class="container">
                <h2>Productos</h2>
                <h6>Gran cantidad de productos y marcar para tu proyecto</h6>
                <div class="portfolioFilter">
                    <ul class="Portfolio-nav wow fadeIn delay-02s">
                        <li><a href="#" data-filter="*" class="current">Todos</a></li>
                        <li><a href="#" data-filter=".branding">Construcción</a></li>
                        <li><a href="#" data-filter=".webdesign">Pinturas</a></li>
                        <li><a href="#" data-filter=".printdesign">Pisos</a></li>
                        <li><a href="#" data-filter=".photography">Herramientas de contruccion </a></li>
                    </ul>
                </div>

            </div>
            <div class="portfolioContainer wow fadeInUp delay-04s">
                <div class=" Portfolio-box printdesign">
                    <a href="#"><img src="img/pisos.jpg" alt=""></a>
                    <h3>Ceramicas</h3>
                    <h3>Pisos Flotantes</h3>

                </div>
                <div class="Portfolio-box webdesign">
                    <a href="#"><img src="img/pintura.jpg" alt=""></a>
                    <h3>Pinturas Interior</h3>
                    <h3>Pinturas Exterior</h3>

                </div>
                <div class=" Portfolio-box branding">
                    <a href="#"><img src="img/tableros.JPG" alt=""></a>
                    <h3>Maderas</h3>
                    <h3>Tableros</h3>

                </div>
                <div class=" Portfolio-box photography">
                    <a href="#"><img src="img/herra.jpg" alt=""></a>
                    <h3>Herramientas</h3>
                    <h3>Maquinarias electricas</h3>

                </div>
                <div class=" Portfolio-box branding">
                    <a href="#"><img src="img/cemento.jpg" alt=""></a>
                    <h3>Cementos</h3>


                </div>
                <div class=" Portfolio-box photography">
                    <a href="#"><img src="img/pvc.jpg" alt=""></a>
                    <h3>Fijaciones y Gasfiteria</h3>
                    <h3>Electricidad</h3>

                </div>
            </div>
        </section>
        <!--main-section-end-->


        <section class="main-section client-part" id="client">
            <!--main-section client-part-start-->
            <div class="container">
                <b class="quote-right wow fadeInDown delay-03"><i class="fa-quote-right"></i></b>
                <div class="row">
                    <div class="col-lg-12">
                        <p class="client-part-haead wow fadeInDown delay-05">Contamos cientos proveedores</p>
                    </div>
                </div>
                <ul class="client wow fadeIn delay-05s">
                    <li><a href="#">
                            <img src="img/client-pic1.jpg" alt="">
                            <h3>Pedro Rojas</h3>
                            <span>Comprador.</span>
                        </a></li>
                </ul>
            </div>
        </section>
        <!--main-section client-part-end-->
        <div class="c-logo-part">
            <!--c-logo-part-start-->
            <div class="container">
                <ul>
                    <li><a href="#"><img src="images/masisa.jpg" alt=""></a></li>
                    <li><a href="#"><img src="img/dewalt.jpg" alt=""></a></li>
                    <li><a href="#"><img src="img/blackanddecker.jpg" alt=""></a></li>
                    <li><a href="#"><img src="img/melon.jpg" alt=""></a></li>
                    <li><a href="#"><img src="img/tricolor.jpg" alt=""></a></li>
                </ul>
            </div>
        </div>
        <!--c-logo-part-end-->
        <section class="main-section team" id="team">
            <!--main-section team-start-->
            <div class="container">
                <h2>Equipo de trabajo</h2>
                <h6>Estamos para Atenderlo.</h6>
                <div class="team-leader-block clearfix">
                    <div class="team-leader-box">
                        <div class="team-leader wow fadeInDown delay-03s">
                            <div class="team-leader-shadow"><a href="#"></a></div>
                            <img src="img/team-leader-pic1.jpg" alt="">
                            <ul>
                                <li><a href="#" class="fa-twitter"></a></li>
                                <li><a href="#" class="fa-facebook"></a></li>
                                <li><a href="#" class="fa-pinterest"></a></li>
                                <li><a href="#" class="fa-google-plus"></a></li>
                            </ul>
                        </div>
                        <h3 class="wow fadeInDown delay-03s">Juan Faundes</h3>
                        <span class="wow fadeInDown delay-03s">Gerente de Tienda</span>
                        <p class="wow fadeInDown delay-03s">Espero que su expreriecia  sea grata dentro de nuestra tienda.</p>
                    </div>
                    <div class="team-leader-box">
                        <div class="team-leader  wow fadeInDown delay-06s">
                            <div class="team-leader-shadow"><a href="#"></a></div>
                            <img src="img/team-leader-pic2.jpg" alt="">
                            <ul>
                                <li><a href="#" class="fa-twitter"></a></li>
                                <li><a href="#" class="fa-facebook"></a></li>
                                <li><a href="#" class="fa-pinterest"></a></li>
                                <li><a href="#" class="fa-google-plus"></a></li>
                            </ul>
                        </div>
                        <h3 class="wow fadeInDown delay-06s">Raul Jeres</h3>
                        <span class="wow fadeInDown delay-06s">Servicio a cliente</span>
                        <p class="wow fadeInDown delay-06s">Haremos que su compra sea el mejor momento del dia.</p>
                    </div>
                    <div class="team-leader-box">
                        <div class="team-leader wow fadeInDown delay-09s">
                            <div class="team-leader-shadow"><a href="#"></a></div>
                            <img src="img/team-leader-pic3.jpg" alt="">
                            <ul>
                                <li><a href="#" class="fa-twitter"></a></li>
                                <li><a href="#" class="fa-facebook"></a></li>
                                <li><a href="#" class="fa-pinterest"></a></li>
                                <li><a href="#" class="fa-google-plus"></a></li>
                            </ul>
                        </div>
                        <h3 class="wow fadeInDown delay-09s">Leticia Faundes </h3>
                        <span class="wow fadeInDown delay-09s">Contadora</span>
                        <p class="wow fadeInDown delay-09s">Tendremos las mejores ofertas para logar su proyecto.</p>
                    </div>
                </div>
            </div>
        </section>
        <!--main-section team-end-->



        <section class="business-talking">
            <!--business-talking-start-->
            <div class="container">
                <h2>Deceas Contactarnos.</h2>
            </div>
        </section>
        <!--business-talking-end-->
        <div class="container">
            <section class="main-section contact" id="contact">

                <div class="row">
                    <div class="col-lg-6 col-sm-7 wow fadeInLeft">
                        <div class="contact-info-box address clearfix">
                            <h3><i class=" icon-map-marker"></i>Direccion:</h3>
                            <span>Portales #3454.San bernardo.</span>
                        </div>
                        <div class="contact-info-box phone clearfix">
                            <h3><i class="fa-phone"></i>Telefono:</h3>
                            <span>+569889933</span>
                        </div>
                        <div class="contact-info-box email clearfix">
                            <h3><i class="fa-pencil"></i>email:</h3>
                            <span>ferreteriaFerme@Ferme.cl</span>
                        </div>
                        <div class="contact-info-box hours clearfix">
                            <h3><i class="fa-clock-o"></i>Atencion:</h3>
                            <span><strong>Lunes - Sabado</strong> 8 am - 20 pm<br><strong>Domingos:</strong> 9:00 am - 20pm </span>
                        </div>
                        <ul class="social-link">
                            <li class="twitter"><a href="#"><i class="fa-twitter"></i></a></li>
                            <li class="facebook"><a href="#"><i class="fa-facebook"></i></a></li>
                            <li class="pinterest"><a href="#"><i class="fa-pinterest"></i></a></li>
                            <li class="gplus"><a href="#"><i class="fa-google-plus"></i></a></li>
                            <li class="dribbble"><a href="#"><i class="fa-dribbble"></i></a></li>
                        </ul>
                    </div>
                    <div class="col-lg-6 col-sm-5 wow fadeInUp delay-05s">
                        <div class="form">

                            <div id="sendmessage">Your message has been sent. Thank you!</div>
                            <div id="errormessage"></div>
                            <form action="" method="post" role="form" class="contactForm">
                                <div class="form-group">
                                    <input type="text" name="name" class="form-control input-text" id="name" placeholder="Nombre" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                                    <div class="validation"></div>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control input-text" name="email" id="email" placeholder="Email" data-rule="email" data-msg="Please enter a valid email" />
                                    <div class="validation"></div>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control input-text" name="subject" id="subject" placeholder="Tema" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                                    <div class="validation"></div>
                                </div>
                                <div class="form-group">
                                    <textarea class="form-control input-text text-area" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Mensaje"></textarea>
                                    <div class="validation"></div>
                                </div>

                                <div class="text-center"><button type="submit" class="input-btn">Send Message</button></div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <script type="text/javascript">
            $(document).ready(function (e) {
                $('#test').scrollToFixed();
                $('.res-nav_click').click(function () {
                    $('.main-nav').slideToggle();
                    return false

                });

            });
        </script>

        <script>
            wow = new WOW({
                animateClass: 'animated',
                offset: 100
            });
            wow.init();
        </script>


        <script type="text/javascript">
            $(window).load(function () {

                $('.main-nav li a, .servicelink').bind('click', function (event) {
                    var $anchor = $(this);

                    $('html, body').stop().animate({
                        scrollTop: $($anchor.attr('href')).offset().top - 102
                    }, 1500, 'easeInOutExpo');
                    /*
                     if you don't want to use the easing effects:
                     $('html, body').stop().animate({
                     scrollTop: $($anchor.attr('href')).offset().top
                     }, 1000);
                     */
                    if ($(window).width() < 768) {
                        $('.main-nav').hide();
                    }
                    event.preventDefault();
                });
            })
        </script>

        <script type="text/javascript">
            $(window).load(function () {


                var $container = $('.portfolioContainer'),
                        $body = $('body'),
                        colW = 375,
                        columns = null;


                $container.isotope({
                    // disable window resizing
                    resizable: true,
                    masonry: {
                        columnWidth: colW
                    }
                });

                $(window).smartresize(function () {
                    // check if columns has changed
                    var currentColumns = Math.floor(($body.width() - 30) / colW);
                    if (currentColumns !== columns) {
                        // set new column count
                        columns = currentColumns;
                        // apply width to container manually, then trigger relayout
                        $container.width(columns * colW)
                                .isotope('reLayout');
                    }

                }).smartresize(); // trigger resize to set container width
                $('.portfolioFilter a').click(function () {
                    $('.portfolioFilter .current').removeClass('current');
                    $(this).addClass('current');

                    var selector = $(this).attr('data-filter');
                    $container.isotope({

                        filter: selector,
                    });
                    return false;
                });

            });
        </script> 

    </body>
</html>
