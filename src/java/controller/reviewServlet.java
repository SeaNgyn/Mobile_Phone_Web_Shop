/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CustomerDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author Admin
 */
@WebServlet(name = "reviewServlet", urlPatterns = {"/reviewservlet"})
public class reviewServlet extends HttpServlet {

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
            out.println("<title>Servlet reviewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet reviewServlet at " + request.getContextPath() + "</h1>");
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
        String comment = request.getParameter("rv-comment");
        String productId = request.getParameter("productId");
        String idCustomer = request.getParameter("customerID");
        String action = request.getParameter("action");
        String deleteRv = request.getParameter("reviewId");
        int prId, cusId;
        try {
            prId = Integer.parseInt(productId);

//            System.out.println(rating + " hello there");
//            System.out.println(comment + " comment");
//            
//            System.out.println(prId + " productId");
//            System.out.println(cusId + " idCus");
            //String checkRv = new CustomerDAO().checkingReviewCus(cusId, prId);
            if (action.equals("deleteRv")) {
                new ProductDAO().DeleteReview(Integer.parseInt(deleteRv));
            } else if (action.equals("updateRv")) {
                int rating = Integer.parseInt(request.getParameter("ratingStar"));
                cusId = Integer.parseInt(idCustomer);
                new ProductDAO().updateReview(prId, cusId, comment, rating);
            } else {
                int rating = Integer.parseInt(request.getParameter("ratingStar"));
                cusId = Integer.parseInt(idCustomer);
                new ProductDAO().insertReview(prId, cusId, comment, rating);
                request.setAttribute("reviewList", new CustomerDAO().getReviewEachProduct(prId));
            }
            //request.setAttribute("checkRv", checkRv);

            Product p = new ProductDAO().getProdctById(prId);
            request.setAttribute("productDetail", p);

        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        request.getRequestDispatcher("product-detail.jsp").forward(request, response);

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
