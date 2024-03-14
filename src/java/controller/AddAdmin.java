/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AdminDAO;
import dal.CustomerDAO;
import model.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;

/**
 *
 * @author nobod
 */
@WebServlet(name = "AddAdmin", urlPatterns = {"/addAdmin"})
public class AddAdmin extends HttpServlet {

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
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        String roleID = request.getParameter("roleId");
        String email = request.getParameter("email");
        String createdBy = request.getParameter("createdBy");
        //String createdOn = request.getParameter("createdOn");
        System.out.println(createdBy);
        AdminDAO dao = new AdminDAO();
        try {
            Admin p = dao.getCheckUser(userName);
            Customer c = new CustomerDAO().CheckAccountCustomer(userName);
            if (p == null && c == null) {
                Admin anew = new Admin();
                anew.setFirstname(firstName);
                anew.setLastname(lastName);
                anew.setUsername(userName);
                MessageDigest md = MessageDigest.getInstance("MD5");
                byte[] hash = md.digest(password.getBytes());
                StringBuffer sb = new StringBuffer();
                for (byte b : hash) {
                    sb.append(String.format("%02x", b));
                }
                anew.setPassword(sb.toString()); // Gán mật khẩu sau khi mã hóa
                //anew.setPassword(password);
                anew.setRoleId(Integer.parseInt(roleID));
                anew.setEmail(email);
                anew.setCreatedById(Integer.parseInt(createdBy));
                anew.setCreatedOn(date);
                dao.insert(anew);
                response.sendRedirect("lista");
            } else {
                request.setAttribute("error", userName + " existed!");
                request.getRequestDispatcher("add-admin.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            System.err.println(e);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(AddAdmin.class.getName()).log(Level.SEVERE, null, ex);
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
