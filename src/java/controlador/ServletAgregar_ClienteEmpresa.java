/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;
import modelo.DAOCliente;
import modelo.DAOUsuario;
import modelo.Usuario;

/**
 *
 * @author jano1
 */
@WebServlet(name = "ServletAgregar_ClienteEmpresa", urlPatterns = {"/ServletAgregar_ClienteEmpresa"})
public class ServletAgregar_ClienteEmpresa extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletAgregar_ClienteEmpresa</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletAgregar_ClienteEmpresa at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
         String rut = request.getParameter("rut");
         String nombre =request.getParameter("nombre");
         String direccion = request.getParameter("direccion");
         String telefono =request.getParameter("telefono");
         String correo = request.getParameter("correo");
         String razon = request.getParameter("razonSocial");
         int comuna = Integer.parseInt(request.getParameter("comuna"));
         
         String usuario= request.getParameter("user");
         String pass = request.getParameter("pass");
         
         Cliente cli =new Cliente(rut, nombre, direccion, telefono, correo, razon);
         Usuario user = new Usuario(usuario, pass);
         DAOCliente daocli = new DAOCliente();
         DAOUsuario daous = new DAOUsuario();
         
         try {
            daous.addUsuario(user, 2);
            daocli.addCliente_empresa(cli, comuna);
            request.getSession().setAttribute("exito","Usuario agregado");
            response.sendRedirect("cerrar_registro_usuario.jsp");
        } catch (Exception e) {
             response.sendRedirect("adm_usuario.jsp");
            System.out.println("Error servlet : " + e.getMessage());
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
