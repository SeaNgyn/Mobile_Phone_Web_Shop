/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Admin;
import model.Customer;

/**
 *
 * @author nobod
 */
@WebServlet(name = "UpdateCustomerAdmin", urlPatterns = {"/updatecusadmin"})
public class UpdateCustomerAdmin extends HttpServlet {

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
        try {
            CustomerDAO dao = new CustomerDAO();
            String cid_raw = request.getParameter("cid");
            int cid = Integer.parseInt(cid_raw);
            Customer c = dao.getCustomerById(cid);
            System.out.println(c.getFullName());
            System.out.println(c.getUsername());
            System.out.println(c.getPassword());
            request.setAttribute("data", c);
            request.getRequestDispatcher("update-customers.jsp").forward(request, response);

        } catch (ServletException | IOException | NumberFormatException e) {
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
        Admin a = (Admin) session.getAttribute("adminAcc");

        String id_raw = request.getParameter("customerId");
        String fullName = request.getParameter("fullName");
        String password = request.getParameter("password");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        CustomerDAO dao = new CustomerDAO();
        try {
            int cusID = Integer.parseInt(id_raw);
            Customer cnew = dao.getCustomerById(cusID);
            cnew.setFullName(fullName);
            cnew.setPassword(password);
            cnew.setUsername(username);
            
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] hash = md.digest(password.getBytes());
            StringBuffer sb = new StringBuffer();
            for (byte b : hash) {
                sb.append(String.format("%02x", b));
            }
            cnew.setPassword(password);
            cnew.setEmail(email);
            cnew.setPhone(phone);
            cnew.setAddress(address);
            cnew.setModifiedBy(a.getAdminId());
            cnew.setModifiedOn(date);
            dao.update(cnew);
            response.sendRedirect("lista");

            //request.setAttribute("error", name+ capacity +" not empty");
            //request.getRequestDispatcher("update-products.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.err.println(e);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(UpdateCustomerAdmin.class.getName()).log(Level.SEVERE, null, ex);
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
