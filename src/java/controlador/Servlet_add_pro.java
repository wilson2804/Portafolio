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
import modelo.DAOProducto;

/**
 *
 * @author sergio
 */
@WebServlet(name = "Servlet_add_pro", urlPatterns = {"/Servlet_add_pro"})
public class Servlet_add_pro extends HttpServlet {

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
            out.println("<title>Servlet Servlet_add_pro</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Servlet_add_pro at " + request.getContextPath() + "</h1>");
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
        DAOProducto dao = new DAOProducto();
        String descrip = request.getParameter("descripcion");
        int precio = Integer.parseInt(request.getParameter("precio"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        int stock_critico = Integer.parseInt(request.getParameter("stock_critico"));
        int prove = Integer.parseInt(request.getParameter("proveedor"));
        int familia = Integer.parseInt(request.getParameter("familia"));
        int tipo = Integer.parseInt(request.getParameter("tipo"));
        String img = request.getParameter("img");

        String codigo_producto = prove + "" + familia + "" + tipo;

        try {
            
            dao.add_Producto(codigo_producto, descrip,precio, stock, stock_critico, prove, familia, tipo, img);
            response.sendRedirect("exito.jsp");
        } catch (Exception e) {
            System.out.println("ERROR:" + e.getMessage());
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
