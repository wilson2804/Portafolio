<%@page import="modelo.DAOEmpleado"%>
<%@page import="modelo.Empleado"%>
<%@page import="modelo.DAOUsuario"%>
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
        function Abrir_ventana (pagina) {
        var opciones= "toolbar=no, location=no, directories=no, status=yes, menubar=yes, scrollbars=no, resizable=yes, width=500, height=380, top=20, left=200";
        window.open(pagina,"",opciones);
        }       
        </script>
        
        
        
        <%
        Usuario usuario = new Usuario("", "");
        Usuario user = new Usuario("", "");
        user = (Usuario) session.getAttribute("usuario");
        DAOEmpleado dao = new DAOEmpleado();
          if (session.getAttribute("usuario") != null & user.getTipo_user()==1) {
                usuario = (Usuario) session.getAttribute("usuario");
            } else {
                response.sendRedirect("login.jsp");
            }
          
        String idTipo = request.getParameter("idtipo");
        String buscar = request.getParameter("empleado");
            if (idTipo != null) {
                pageContext.setAttribute("empleados", dao.ListarEmpleadoFiltro(idTipo,buscar));
            } else {       
                pageContext.setAttribute("empleados", dao.listarEmpleado());} 
        %>

        <%
            if (session.getAttribute("error") != null) {
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
        <li role="presentation" class="brand-nav"><a href="adm_cliente.jsp">Clientes</a></li>
        <li role="presentation" class="brand-nav"><a href="adm_proveedor.jsp">Proveedores</a></li>
        <li role="presentation" class="brand-nav active"> <a href="adm_empleado.jsp">Empleados</a></li>
        <li role="presentacion" class="brand-nav"><a href="adm_productos.jsp"> Producto</a></li> 
    </ul>
  <br>
  <br>
  <br>
  <br>
  <a href="ServletLogin">Cerrar Sesión</a>
</div>

        <div class="main">
             <form action="ServletFiltro_Empleado" method="POST">
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
                        Cargo
                    </option>
                    <option value="4">
                        Tipo Usuario
                    </option>
                    <option value="5">
                        Estado
                    </option>
                </select>
                <input type="text" name="buscar">
                <input class="btn-info btn-sm" type="submit" value="Buscar">
            </form>
        <br>
        <div class="panel panel-default" style="width: 100%">
            <table border="0" style="text-align: center;width: 100%">
                <tr>
                    <td>
                        <a href="javascript:Abrir_ventana('registro_empleado.jsp')"><button class="btn-info btn btn-lg">Ingresar</button></a>
                    </td>
                    <td>
                        <button class="btn-info btn btn-lg" onclick="location.reload()">Actualizar</button>
                    </td>
                </tr>
            </table>
        </div>
        <div class="panel panel-default" style="width: 100%">
            <table class="table table-hover" cellspacing="8" style="text-align: center">
                <thead style="background-color: #4CAF50;color: white">
                    <tr>
                        <td>Rut</td>
                        <td>Nombre</td>
                        <td>Cargo</td>
                        <td>usuario</td>
                        <td>Estado</td>
                        
                    </tr>
                </thead>
                <c:forEach var= "u" items="${empleados}"   >
                    <tr >
                        <td nowrap>${ u.getRut()}</td>
                        <td nowrap>${ u.getNombre()}</td>
                        <td nowrap>${u.getCargo()}</td>
                        <td nowrap>${u.getUsuario()}</td>
                        <td nowrap>${ u.getEstado()}</td>
                        
                    </tr>
                </c:forEach>
            </table>
        </div>
       </div>                           
    </body>
</html>