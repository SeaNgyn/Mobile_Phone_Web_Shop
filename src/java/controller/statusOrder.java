/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Order;

/**
 *
 * @author Admin
 */
@WebServlet(name = "status", urlPatterns = {"/statusorder"})
public class statusOrder extends HttpServlet {

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
        List<Order> list = new OrderDAO().getAllOrderWithName();
        PrintWriter out = response.getWriter();

        for (Order o : list) {
            out.println("<tr>\n"
                    + "                                                <td>" + o.getOrderID() + "</td>\n"
                    + "                                                <td>" + o.getCutomerName() + "</td>\n"
                    + "                                                <td><script>\n"
                    + "                                                    var formattedPrice = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(" + o.getTotalPrice() + ");\n"
                    + "                                                    document.write(formattedPrice);\n"
                    + "                                                    </script>\n"
                    + "                                                </td>\n"
                    + "                                                <td>" + o.getAddress() + "</td>\n"
                    + "                                                <td>" + o.getCreatedOn() + "</td>\n"
                    + "                                                <td>" + o.getStatus() + "</td>\n"
                    + "                                                <td class=\"action-buttons\">\n"
                    + "                                                    <a onclick=\"shipped(" + o.getOrderID() + "); return false;\" href=\"#\" class=\"edit-button\">Mark as shipped</a>\n"
                    + "                                                    <a href=\"deleteOrder?id=" + o.getOrderID() + "\" onclick=\"return confirm('Bạn có chắc muốn xóa đơn hàng này?')\" class=\"delete-button\">Cancel Order</a>\n"
                    + "                                                </td>\n"
                    + "                                            </tr>");
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
        System.out.println(action);
        try {
            if (action.equals("accept")) {
                new OrderDAO().updateStatus(Integer.parseInt(request.getParameter("orderId")));
                System.out.println("UpdateStatus successfull");
            } else if (action.equals("delete")) {
                new OrderDAO().updateStatusCancel(Integer.parseInt(request.getParameter("orderId")));
                System.out.println("Cancel UpdateStatus");
            } else if (action.equals("beingtransport")) {
                new OrderDAO().updateStatusBeingTrans(Integer.parseInt(request.getParameter("orderId")));
            }
            response.sendRedirect("listo");
            //response.getWriter().print("Approved");

        } catch (NumberFormatException e) {
            System.out.println(e);
        }
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
