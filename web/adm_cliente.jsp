<%@page import="modelo.DAOCliente"%>
<%@page import="modelo.Usuario"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.css">
        <link rel="stylesheet" href="css/sidebar.css">
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <script type="text/javascript">
            function Abrir_ventana(pagina) {
                var opciones = "toolbar=no, location=no, directories=no, status=yes, menubar=yes, scrollbars=no, resizable=yes, width=900, height=600, top=20, left=200";
                window.open(pagina, "", opciones);
            }
        </script>                


        <%
            Usuario usuario = new Usuario("", "");
            Usuario user = new Usuario("", "");
            user = (Usuario) session.getAttribute("usuario");
            DAOCliente dao = new DAOCliente();
            if (session.getAttribute("usuario") != null & user.getTipo_user() == 1) {
                usuario = (Usuario) session.getAttribute("usuario");
            } else {
                response.sendRedirect("login.jsp");
            }

            String idTipo = request.getParameter("idtipo");
            String buscar = request.getParameter("cliente");
            if (idTipo != null) {
                pageContext.setAttribute("clientes", dao.ListarClientesFiltro(idTipo, buscar));
            } else {

                pageContext.setAttribute("clientesN", dao.listarCliente());
            }
            if (idTipo != null) {
                pageContext.setAttribute("clientes", dao.ListarClientesFiltro(idTipo, buscar));
            } else {
                pageContext.setAttribute("clientesEmp", dao.listarClienteEmp());
            }

        %>

        <%            if (session.getAttribute("error") != null) {
        %>
        <script>
            alert("<%=session.getAttribute("error")%>");
        </script>
        <%
                session.removeAttribute("error");
            }
        %>
        <title>JSP Page</title>

    </head>
    <body>

        <div class="sidenav">
            <h1 style="color: #000">Bienvenido Administrador</h1>  
            <ul class="nav nav-pills brand-pills nav-stacked" role="tablist">
                <li role="presentation" class="brand-nav"><a href="adm_usuario.jsp">Usuarios</a></li>
                <li role="presentation" class="brand-nav active"><a href="adm_cliente.jsp">Clientes</a></li>
                <li role="presentation" class="brand-nav"><a href="adm_proveedor.jsp">Proveedores</a></li>
                <li role="presentation" class="brand-nav"> <a href="adm_empleado.jsp">Empleados</a></li>
                <li role="presentacion" class="brand-nav"><a href="adm_productos.jsp"> Producto</a></li> 
            </ul>
            <br>
            <br>
            <br>
            <br>
            <a href="ServletLogin">Cerrar Sesión</a>
        </div>

        <div class="main">
            <form action="ServletFiltro_Cliente" method="POST">
                Buscar Por :
                <select name="tipo">
                    <option value="0">
                        Todos
                    </option>
                    <option value="1">
                        Rut
                    </option>
                    <option value="2">
                        Nombre
                    </option>
                    <option value="3">
                        Apellido Paterno
                    </option>
                    <option value="4">
                        Apellido Materno
                    </option>
                    <option value="5">
                        Comuna
                    </option>
                    <option value="6">
                        Tipo de Cliente
                    </option>                   
                </select>
                <input type="text" name="buscar">
                <input class="btn-info btn-sm" type="submit" value="Buscar">
            </form>
            <br>
            <div class="panel panel-default" style="width: 80%">
                <table border="0" style="text-align: center;width: 80%">
                    <tr>
                        <td>
                            <a href="javascript:Abrir_ventana('formulario_registro_cliente_nat_adm.jsp')"><button class="btn-info btn btn-lg">Ingresar Cliente</button></a>
                        </td>
                        <td>
                            <a href="javascript:Abrir_ventana('formulario_registro_cliente_emp_admin.jsp')"><button class="btn-info btn btn-lg">Ingresar Empresa</button></a>
                        </td>
                        <td>
                            <button class="btn-info btn btn-lg" onclick="location.reload()">Actualizar</button>
                        </td>
                    </tr>
                </table>
            </div>
            <h1>Clientes</h1>
            <form action="ServletFiltro_Cliente" method="POST">
                <div class="panel panel-default" style="width: 120%">
                    <table class="table table-hover" cellspacing="" style="text-align: center">
                        <thead style="background-color: #4CAF50;color: white">
                            <tr>
                                <td>Rut</td>
                                <td>Nombre</td>
                                <td nowrap>Apellido Paterno</td>
                                <td nowrap>Apellido Materno</td>
                                <td>Telefono</td>
                                <td>Dirección</td>
                                <td>Correo</td>
                                <td>Comuna</td>
                                <td>Usuario</td>
                                <td>Tipo de Cliente</td>

                            </tr>
                        </thead>
                        <c:forEach var= "u" items="${clientesN}" >
                            <tr>
                                <td nowrap>${ u.getRut()}</td>
                                <td nowrap>${ u.getNombre()}</td>
                                <td nowrap>${ u.getApPaterno()}</td>
                                <td nowrap>${ u.getApMaterno()}</td>
                                <td nowrap>${ u.getDireccion()}</td>
                                <td nowrap>${ u.getTelefono()}</td>
                                <td nowrap>${ u.getCorreo()}</td>
                                <td nowrap>${ u.getComuna()}</td>
                                <td nowrap>${ u.getUsuario()}</td>
                                <td nowrap>${ u.getTipo_cliente()}</td> 
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </form>
            <h1>Clientes Empresa</h1>

            <div class="panel panel-default" style="width: 110%">
                <table class="table table-hover" cellspacing="" style="text-align: center">
                    <thead style="background-color: #4CAF50;color: white">
                        <tr>
                            <td>Rut</td>
                            <td>Nombre</td>
                            <td>Dirección</td>
                            <td>Telefono</td> 
                            <td>Correo</td>
                            <td>Comuna</td>
                            <td>Razon Social</td>
                            <td>Usuario</td>
                            <td>Tipo de Cliente</td>

                        </tr>
                    </thead>
                    <c:forEach var= "u" items="${clientesEmp}"   >
                        <tr>
                            <td nowrap>${ u.getRut()}</td>
                            <td nowrap>${ u.getNombre()}</td>
                            <td nowrap>${ u.getDireccion()}</td>
                            <td nowrap>${ u.getTelefono()}</td>
                            <td nowrap>${ u.getCorreo()}</td>
                            <td nowrap>${ u.getComuna()}</td>
                            <td nowrap>${ u.getRazon()}
                            <td nowrap>${ u.getUsuario()}</td>
                            <td nowrap>${ u.getTipo_cliente()}</td>



                        </tr>
                    </c:forEach>


                </table>
            </div>
        </div>                           
    </body>
</html>
