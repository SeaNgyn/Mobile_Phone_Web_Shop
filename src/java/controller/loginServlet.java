/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import model.Admin;
import model.Customer;

/**
 *
 * @author Admin
 */
@WebServlet(name = "loginServlet", urlPatterns = {"/login"})
public class loginServlet extends HttpServlet {

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
            out.println("<title>Servlet loginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        String u = request.getParameter("username");
        String p = request.getParameter("password");
        Customer c = new DAO().getAccount(u, p);
        session.setAttribute("customerAcc", c);
        request.getRequestDispatcher("home").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String registerMail = request.getParameter("dataMail");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Xử lý dữ liệu đăng ký mail (nếu có)
        if (registerMail != null) {
            String[] parts = registerMail.split(" ");
            username = parts[0];
            password = parts[1];
        }

        String remember = request.getParameter("rem");
        String check = request.getParameter("signIn");
        // In ra để kiểm tra
        out.print(remember);

        // Tạo cookies cho username, password và remember
        Cookie userCookie = new Cookie("cuser", username);
        Cookie passCookie = new Cookie("cpass", password);
        Cookie remCookie = new Cookie("crem", remember);

        // Đặt thời gian sống cho cookies
        if (remember != null) {
            userCookie.setMaxAge(60 * 60 * 24 * 4); // 4 days
            passCookie.setMaxAge(60 * 60 * 24 * 4);
            remCookie.setMaxAge(60 * 60 * 24 * 4);
        } else {
            userCookie.setMaxAge(0); // Xóa cookie
            passCookie.setMaxAge(0);
            remCookie.setMaxAge(0);
        }

        // Thêm cookies vào response
        response.addCookie(userCookie);
        response.addCookie(passCookie);
        response.addCookie(remCookie);

        // Bắt đầu session
        HttpSession session = request.getSession();

        // Kiểm tra cooldown
        Long cooldownEndTime = (Long) session.getAttribute("cooldownEndTime");
        if (cooldownEndTime != null && cooldownEndTime > System.currentTimeMillis()) {
            // Nếu cooldown vẫn còn, hiển thị thông báo và quay về trang đăng nhập

            request.setAttribute("cooldownMessage", "Bạn phải chờ 10 giây để đăng nhập lại.");
            request.getRequestDispatcher("login_2.jsp").forward(request, response);
            return;
        }

        // Kiểm tra số lần đăng nhập thất bại
        Integer loginAttempts = (Integer) session.getAttribute("loginAttempts");
        if (loginAttempts == null) {
            loginAttempts = 0;
        }
        session.setAttribute("loginAttempts", loginAttempts);

        // Mã hóa mật khẩu
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] hash = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hash) {
                sb.append(String.format("%02x", b));
            }
            password = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        // Kiểm tra tài khoản
        Admin a = new DAO().getAccountAdmin(username, password);
        Customer c = new DAO().getAccount(username, password);
        if (a == null && c == null) {

            loginAttempts++;
            session.setAttribute("loginAttempts", loginAttempts);
            if (loginAttempts != null && loginAttempts % 4 == 0) {
                cooldownEndTime = System.currentTimeMillis() + 10 * 1000 * (int) Math.pow(2, loginAttempts / 4);
                session.setAttribute("cooldownEndTime", cooldownEndTime);
                request.setAttribute("errorPass", "Bạn đăng nhập sai quá nhiều vui lòng chờ để có thể đăng nhập");
                request.getRequestDispatcher("login_2.jsp").forward(request, response);
                return;
            }
            request.setAttribute("signin", check);
            request.setAttribute("username", username);
            request.getRequestDispatcher("login_2.jsp").forward(request, response);

        } else {
            // Đăng nhập thành công, xóa số lần đăng nhập thất bại
            session.removeAttribute("loginAttempts");
            session.setAttribute("customerAcc", c);
            session.setAttribute("adminAcc", a);
            request.getRequestDispatcher("home").forward(request, response);
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
