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
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author nobod
 */
@WebServlet(name="FilterProductAdmin", urlPatterns={"/filteradminproduct"})
public class FilterProductAdmin extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String name = request.getParameter("brand");
            String price = request.getParameter("price");         
            int value = Integer.parseInt(price);
            int cate = Integer.parseInt(name);
            ProductDAO dao = new ProductDAO();
            CategoryDAO cateDao = new CategoryDAO();
            List<Category> brand = cateDao.getAllCategory();
            request.setAttribute("brand", brand);
            int count = dao.count();
            int pageSize = 20;
            int endPage = 0;
            endPage = count / pageSize;
            if (count % pageSize != 0) {
                endPage++;
            }
            request.setAttribute("end", endPage);      
            String index_raw = request.getParameter("index");
            int index = 0;
            if (index_raw == null) {               
                index = 1;
            } else {
                index = Integer.parseInt(index_raw);
            }
            request.setAttribute("cate", cate);
            request.setAttribute("value", value);
            List<Product> list = dao.filterByNamePrice(cate, value, index, pageSize);
            request.setAttribute("data", list);
            request.getRequestDispatcher("filterProductAdmin.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
