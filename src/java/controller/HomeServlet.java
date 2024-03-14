/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author soulk
 */
@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//
//        ProductDAO pdao = new ProductDAO();
//        CategoryDAO cdao = new CategoryDAO();
//        List<Product> list = pdao.getAllProduct();
//        List<Category> listC = cdao.getAllCategory();
//        List<Product> productListTop = pdao.getProductByTarget(8, "Price");
//        System.out.println(productListTop.size());
//        List<Product> productListLast = pdao.getProductByTarget(8, "ProductId");
//        request.setAttribute("listP", list);
//        request.setAttribute("listC", listC);
//        request.setAttribute("productListTop", productListTop);
//        request.setAttribute("productListLast", productListLast);
//
//        request.getRequestDispatcher("index.jsp").forward(request, response);
//    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ProductDAO pdao = new ProductDAO();
        CategoryDAO cdao = new CategoryDAO();
        String action = request.getParameter("action");
        if (action == null) {
            action = "getAll";
        }
        if (action.equals("getAll")) {
            List<Product> list = pdao.getAllProduct();
            List<Category> listC = cdao.getAllCategory();
            List<Product> productListTop = pdao.getProductByTarget(8, "Price");
            //System.out.println(productListTop.size());
            List<Product> productListLast = pdao.getProductByTarget(8, "ProductId");
            request.setAttribute("listP", list);
            request.setAttribute("listC", listC);
            request.setAttribute("productListTop", productListTop);
            request.setAttribute("productListLast", productListLast);
            request.getRequestDispatcher("index.jsp").forward(request, response);
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
        processRequest(request, response);
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
