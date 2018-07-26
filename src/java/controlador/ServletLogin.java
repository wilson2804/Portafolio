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
import modelo.Usuario;
import modelo.DAOUsuario;

/**
 *
 * @author Wilson
 */
@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin"})
public class ServletLogin extends HttpServlet {

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
            out.println("<title>Servlet ServletLogin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletLogin at " + request.getContextPath() + "</h1>");
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

        request.getSession().removeAttribute("usuario");
        response.sendRedirect("login.jsp");
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
        String correo;
        String contr;

        correo = request.getParameter("user");
        contr = request.getParameter("pass");
        Usuario usuario = new Usuario(correo, contr);
        DAOUsuario dao = new DAOUsuario();

        Usuario u = dao.buscarUsuario(usuario);
        try {
            if (u.getUser().trim().equals(correo) && u.getPass().trim().equals(contr)) {

                if (u.getTipo_user() == 1) {
                    request.getSession().setAttribute("exito", "Ingreso correcto");
                    request.getSession().setAttribute("usuario",u);
                    response.sendRedirect("administrar.jsp");
                } else {                    
                    if (u.getTipo_user() == 5) {
                        request.getSession().setAttribute("exito", "Ingreso correcto");
                        request.getSession().setAttribute("usuario", u);
                        response.sendRedirect("proveedor.jsp");
                    }else {                    
                    if (u.getTipo_user() == 3) {
                        request.getSession().setAttribute("exito", "Ingreso correcto");
                        request.getSession().setAttribute("usuario", u);
                        response.sendRedirect("vendedor.jsp");
                    }else {                    
                    if (u.getTipo_user() == 4) {
                        request.getSession().setAttribute("exito", "Ingreso correcto");
                        request.getSession().setAttribute("usuario", u);
                        response.sendRedirect("empleado.jsp");
                    }                     
                    else {
                        request.getSession().setAttribute("exito", "Ingreso correcto");
                        request.getSession().setAttribute("usuario", u);
                        response.sendRedirect("cliente.jsp");
                    }

                }

            }}
                }
            }catch (Exception e) {
            request.getSession().setAttribute("errorLogin", "Usuario o contraseña incorrecta");
            response.sendRedirect("login.jsp");
            System.out.println("Error servlet Login : " + e.getMessage());
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
