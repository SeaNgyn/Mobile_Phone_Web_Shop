package controller;

import dal.DAO;
import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.MessageDigest;

@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {

    String regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&.]).{6,}$";
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        RequestDispatcher dispatcher = null;
        if (!newPassword.matches(regex)) {
            System.out.println("Mat khau sai");
            request.setAttribute("status", "resetFailed");
//            dispatcher = request.getRequestDispatcher("newPassword.jsp");
//            dispatcher.forward(request, response);

            
        } else if (!newPassword.equals(confPassword)) {
            System.out.println("Mat khau khong trung");
            request.setAttribute("status", "resetFailed");
//            dispatcher = request.getRequestDispatcher("newPassword.jsp");
//            dispatcher.forward(request, response);
            
        }

        try {
            System.out.println(newPassword);
            System.out.println(confPassword);
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] hash = md.digest(newPassword.getBytes());
            StringBuffer sb = new StringBuffer();
            for (byte b : hash) {
                sb.append(String.format("%02x", b));
            }
            newPassword = sb.toString();
            System.out.println((String) session.getAttribute("email"));
            new DAO().updatePass(newPassword, (String) session.getAttribute("email"));
                dispatcher = request.getRequestDispatcher("login_2.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
