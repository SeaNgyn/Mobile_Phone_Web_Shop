/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import dal.AdminDAO;
import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Admin;
import model.Customer;

/**
 *
 * @author Admin
 */
@WebServlet(name = "registerServlet", urlPatterns = {"/register"})
public class registerServlet extends HttpServlet {

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
            out.println("<title>Servlet registerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registerServlet at " + request.getContextPath() + "</h1>");
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

        String u = request.getParameter("username1");
        String p = request.getParameter("password1");
        String conf_p = request.getParameter("confirm-password1");
        String email = request.getParameter("email1");
        String phone = request.getParameter("phone");
        String check = request.getParameter("signUp");
        String checkRegister = request.getParameter("checkRegister");
        String regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&.]).{6,}$";
        String notMd5 = p;
        try {
            if (checkRegister != null) {
                int code = (int) Math.floor(((Math.random() * 899999) + 100000));
                p = "Rsacc" + code +"@";
                notMd5 = p;
                conf_p = p;
                email = u;

            } else {

                if (!phone.matches("^[0-9]+$")) {
                    request.setAttribute("errorPass", "Số điện thoại không hợp lệ");
                    request.setAttribute("signup", check);
                    request.getRequestDispatcher("login_2.jsp").forward(request, response);
                    return;
                } else if (!p.matches(regex)) {
                    request.setAttribute("errorPass", "Mật khẩu cần chứa ít nhất 6 kí tự bao gồm kí tự thường, kí tự hoa, chữ số và kí tự đặc biệt!!.");
                    request.setAttribute("signup", check);
                    request.getRequestDispatcher("login_2.jsp").forward(request, response);
                    return;
                } else if (!p.equals(conf_p)) {
                    request.setAttribute("errorPass", "Mật khẩu phải trùng nhau khi đăng kí!!!");
                    request.setAttribute("signup", check);
                    request.getRequestDispatcher("login_2.jsp").forward(request, response);
                    return;

                }
            }
            //MD5 Hash
            
            //System.out.println(p);
            Customer e = new DAO().checkGmail(u);
            Customer a = new DAO().checkAccount(u);
            Admin admin = new AdminDAO().getCheckUser(u);
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] hash = md.digest(p.getBytes());
            StringBuffer sb = new StringBuffer();
            for (byte b : hash) {
                sb.append(String.format("%02x", b));
            }
            p = sb.toString();
            if (a == null && e == null && admin == null) {
                new DAO().insertAccount(u, p, email, phone);
                if (checkRegister != null) {
                    response.getWriter().print(u + " " + notMd5);
                    return;
                }
                request.setAttribute("username", u);
                request.getRequestDispatcher("login_2.jsp").forward(request, response);
            } else {
                request.setAttribute("usernameRes", u);
                request.setAttribute("signup", check);
                request.getRequestDispatcher("login_2.jsp").forward(request, response);
            }
            } catch (ServletException | IOException | NoSuchAlgorithmException ex) {

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
