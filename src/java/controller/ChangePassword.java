/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.MessageDigest;
import model.Customer;

/**
 *
 * @author quang
 */
@WebServlet(name = "ChangePassword", urlPatterns = {"/changepass"})
public class ChangePassword extends HttpServlet {

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
            out.println("<title>Servlet ChangePassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassword at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        String regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&.]).{6,}$";
        String cur_p = request.getParameter("cur_pass");
        String confPassword = request.getParameter("conf_pass");
        String newPassword = request.getParameter("new_pass");
        RequestDispatcher dispatcher = null;
        Customer id = (Customer) session.getAttribute("customerAcc");
        try {
//            System.out.println(newPassword);
//            System.out.println(confPassword);
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] hash = md.digest(cur_p.getBytes());
            StringBuffer sb = new StringBuffer();
            for (byte b : hash) {
                sb.append(String.format("%02x", b));
            }
            cur_p = sb.toString();

            Customer c = new DAO().getPass(id.getCustomerId());
            if (c != null && c.getPassword().equals(cur_p)) {
                if (!newPassword.matches(regex)) {
                    System.out.println("Mat khau sai");
                    request.setAttribute("status", "resetFailed");
                    request.setAttribute("errorPass", "Mật khẩu không đúng định dạng!!");
//            dispatcher = request.getRequestDispatcher("newPassword.jsp");
//            dispatcher.forward(request, response);

                } else if (!newPassword.equals(confPassword)) {
                    System.out.println("Mat khau khong trung");
                    request.setAttribute("status", "resetFailed");
                    request.setAttribute("errorPass", "Mật khẩu không khớp!!");
//            dispatcher = request.getRequestDispatcher("newPassword.jsp");
//            dispatcher.forward(request, response);

                } else {
                    StringBuffer sbV1 = new StringBuffer();
                    System.out.println(newPassword);
                    hash = md.digest(newPassword.getBytes());
                    for (byte b : hash) {
                        sbV1.append(String.format("%02x", b));
                    }
                    
                    newPassword = sbV1.toString();
                    System.out.println(newPassword);
                    new DAO().changePass(newPassword, id.getCustomerId());
                }

            } else {
                request.setAttribute("errorPass", "Mật khẩu không đúng!!");

            }
            dispatcher = request.getRequestDispatcher("my-account.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
