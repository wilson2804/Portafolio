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
import modelo.Producto;

/**
 *
 * @author sergio
 */
@WebServlet(name = "ServletGenerar_Boleta", urlPatterns = {"/ServletGenerar_Boleta"})
public class ServletGenerar_Boleta extends HttpServlet {

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
            out.println("<title>Servlet ServletGenerar_Boleta</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletGenerar_Boleta at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        String codigos = request.getParameter("codigos");
        String cantidad = request.getParameter("cantidad");
        String fecha = request.getParameter("fecha");
        int total = Integer.parseInt(request.getParameter("precio_total"));
        //System.out.println(request.getParameter("proveedoor"));        

        if (!"0".equals(codigos)) {
            DAOProducto dao = new DAOProducto();
            Producto pro = new Producto();
                               
            dao.add_Boleta_Cabecera(fecha,total);

            String[] cant = cantidad.split(",");
            String[] codes = codigos.split(",");
            //System.out.println(fecha);

            for (int i = 1; i < codes.length; i++) {
                //System.out.println(cant[i]);
                //System.out.println(codes[i]);
                pro = dao.datosProducto(codes[i]);
                dao.DescuentaStock(codes[i], Integer.parseInt(cant[i]));                
                //System.out.println(pro.getPrecio()*Integer.parseInt(cant[i]));                
                dao.add_Boleta_Detalle(Integer.parseInt(cant[i]), pro.getPrecio(), codes[i]);

            }            
            response.sendRedirect("exito.jsp");
        } else {
            response.sendRedirect("venta_boleta.jsp");
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
