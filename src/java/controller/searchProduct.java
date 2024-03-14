/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import constant.IConstant;
import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
@WebServlet(name = "searchProduct", urlPatterns = {"/search"})
public class searchProduct extends HttpServlet {

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
            out.println("<title>Servlet searchProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servletasdasdadasd searchProduct at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        ProductDAO pdao = new ProductDAO();
        List<Product> list = new ArrayList<>();
        CategoryDAO cdao = new CategoryDAO();
        List<Category> listC = cdao.getAllCategory();

        if (action == null) {
            action = "getAll";
        }
        if (action.equals("getAll")) {
            String indexPage_raw = request.getParameter("indexPage");
            int indexPage = 1;
            if (indexPage_raw != null) {
                indexPage = Integer.parseInt(indexPage_raw);
            }
            int count = pdao.getTotalProduct();
            int endPage = count / IConstant.NUMBER_PER_PAGE;
            if (count % IConstant.NUMBER_PER_PAGE != 0) {
                endPage += 1;
            }
            list = pdao.getProductPaging(indexPage, IConstant.NUMBER_PER_PAGE);
            request.setAttribute("endPage", endPage);
            request.setAttribute("tag", indexPage);
        }
//        if (action.equals("getByCate")) {
//            String cateName = request.getParameter("cateName");
//            list = pdao.getAllProductByCate(cateName);
//        }
        if (action.equals("filterAll")) {
            
            String search = request.getParameter("searchProduct");
            String typeSort = request.getParameter("typeSort");
            String priceSort = request.getParameter("priceSort");
            String indexPage_raw = request.getParameter("indexPage");
            String cateName = request.getParameter("cateName");
            int indexPage = 1;
            if (indexPage_raw != null) {
                indexPage = Integer.parseInt(indexPage_raw);
            }
            list = pdao.getAllProductBySQL(search, typeSort, priceSort,
                    cateName, indexPage,
                    IConstant.NUMBER_PER_PAGE
            );
            int count = pdao.getAllProductBySQLs(search, typeSort, priceSort,
                    cateName
            ).size();
            int endPage = count / IConstant.NUMBER_PER_PAGE;
            if (count % IConstant.NUMBER_PER_PAGE != 0) {
                endPage += 1;
            }
           
            request.setAttribute("cateName", cateName);
            request.setAttribute("endPage", endPage);
            request.setAttribute("tag", indexPage);

            request.setAttribute("searchFind", search);
            request.setAttribute("filterType", typeSort);
            request.setAttribute("filterPrice", priceSort);

        }
        request.setAttribute("listC", listC);
        request.setAttribute("listSearch", list);
        request.getRequestDispatcher("product-list.jsp").forward(request, response);
        //PrintWriter out = response.getWriter();
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
