/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CommentNewsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import model.CommentNews;
import model.Customer;

/**
 *
 * @author nobod
 */
@WebServlet(name = "AddComment", urlPatterns = {"/AddComment"})
public class AddComment extends HttpServlet {

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
            LocalDate curDate = java.time.LocalDate.now();
            String date = curDate.toString();
            HttpSession session = request.getSession();
            CommentNewsDAO dao = new CommentNewsDAO();

            String service = request.getParameter("service");
            String rating = request.getParameter("rating");

            String newsId_raw = request.getParameter("newsId");

            String comment = request.getParameter("comment");
            Customer cus = (Customer) session.getAttribute("customerAcc");

//            System.out.println("Service: " + service);
//            System.out.println("Rating: " + rating);
//            System.out.println("News ID: " + newsId_raw);
//            System.out.println("Comment: " + comment);
//            System.out.println("Customer: " + cus);
            if (cus == null) {
                // Gửi mã kích hoạt JavaScript để hiển thị popup và xử lý điều hướng
                PrintWriter out = response.getWriter();
                out.println("<script type=\"text/javascript\">");
                out.println("if(confirm('Please log in before commenting. Do you want to log in?')) {");
                out.println("   window.location.href='login_2.jsp';");  // Điều hướng đến trang login khi nhấn "Đăng nhập"
                out.println("} else {");
                out.println("   history.back();");  // Quay lại trang trước đó nếu nhấn "Cancel"
                out.println("}");
                out.println("</script>");
                return;
            } else {
                // Check if rating and comment are provided
                    if (rating == null || comment == null || rating.isEmpty() || comment.isEmpty()) {
                        request.setAttribute("error", "Please enter enough information and rate before posting a comment!!");
                        request.getRequestDispatcher("listallnews").forward(request, response);
                        return;
                    }
                // Kiểm tra xem người dùng đã bình luận trước đó hay chưa
                CommentNews cmt = dao.getCmtByCusId(cus.getCustomerId());
                if (cmt != null && cmt.getStar() > 0) {
                    PrintWriter out = response.getWriter();
                    out.println("<script type=\"text/javascript\">");
                    out.println("if(confirm('You have already commented before, you can only correct it')) {");
                    out.println("   history.back();");  // Quay lại trang trước đó nếu nhấn "OK"
                    out.println("}");
                    out.println("</script>");
                    return;
                } else {
                    

                    int star = Integer.parseInt(rating);
                    int newsId = Integer.parseInt(newsId_raw);
                    request.setAttribute("service", service);
                    request.setAttribute("newsId", newsId);

                    CommentNews cn = new CommentNews();
                    cn.setContent(comment);
                    cn.setStar(star);
                    cn.setCreatedby(cus.getCustomerId());
                    cn.setCreatedOn(date);
                    cn.setNewsId(newsId);

                    dao.addCommentNews(cn);

                    request.getRequestDispatcher("listallnews").forward(request, response);
                }
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
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
