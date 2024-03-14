/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import model.discount;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "discountServlet", urlPatterns = {"/discountServlet"})
public class discountServlet extends HttpServlet {

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
            out.println("<title>Servlet discountServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet discountServlet at " + request.getContextPath() + "</h1>");
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
        String code = request.getParameter("discountCode");
        String name = request.getParameter("discountName");
        String percentage = request.getParameter("discountPercentage");
        String action = request.getParameter("action");
        String discountID = request.getParameter("disId");

        boolean check = false;
        double per;
        if (action.equals("delete")) {
            new DAO().deleteDiscount(Integer.parseInt(discountID));
        } else {
            for (discount d : new DAO().getAllDiscount()) {
                if (d.getDiscountCode().equals(code)) {
                    check = true;
                }
            }
            if (check) {
                request.setAttribute("error", code);
                request.getRequestDispatcher("add-discount.jsp").forward(request, response);
                return;
            } else {
                per = Double.parseDouble(percentage);
                new DAO().insertDiscount(name, code, per);
            }
        }

        request.getRequestDispatcher("discount-admin.jsp").forward(request, response);

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
        String codeDiscount = request.getParameter("codeDiscount");
        System.out.println(codeDiscount);
        for (discount dis : new DAO().getAllDiscount()) {
            if(dis.getDiscountCode().equals(codeDiscount)) {
                response.getWriter().print(dis.getDiscountCode());
                return;
            }
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
