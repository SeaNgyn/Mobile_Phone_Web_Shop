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
@WebServlet(name="UpdateCommentNews", urlPatterns={"/UpdateCommentNews"})
public class UpdateCommentNews extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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

        // In ra các tham số nhận về từ request
        System.out.println("Received parameters:");
        System.out.println("service: " + request.getParameter("service"));
        System.out.println("rating: " + request.getParameter("rating"));
        System.out.println("newsId: " + request.getParameter("newsId"));
        System.out.println("comment: " + request.getParameter("comment"));
        System.out.println("commentId: " + request.getParameter("commentId"));

        String service = request.getParameter("service");
        String rating = request.getParameter("editedRating");
        String newsId_raw = request.getParameter("newsId");
        String comment = request.getParameter("comment");
        String commentNewID = request.getParameter("commentId");
        Customer cus = (Customer) session.getAttribute("customerAcc");
        
        // Kiểm tra xem các tham số có rỗng hoặc null không
        if (service == null || rating == null || newsId_raw == null || comment == null || commentNewID == null) {
            System.out.println("One or more parameters are null or empty.");
            // Xử lý lỗi tại đây nếu cần
            return;
        }

        // Tiếp tục xử lý như bình thường nếu các tham số không rỗng hoặc null
        int star = Integer.parseInt(rating);
        int newsId = Integer.parseInt(newsId_raw);
        int cmtID = Integer.parseInt(commentNewID);
        request.setAttribute("service", service);
        request.setAttribute("newsId", newsId);

        CommentNews cn = new CommentNews();
        cn.setContent(comment);
        cn.setStar(star);
        cn.setModifiedBy(cus.getCustomerId());
        cn.setModifiedOn(date);
        cn.setNewsId(newsId);
        cn.setCmtId(cmtID);
        
        dao.editCommentNews(cn);

        request.getRequestDispatcher("listallnews").forward(request, response);
    } catch (ServletException | IOException | NumberFormatException e) {
        e.printStackTrace(); // In ra stack trace của lỗi nếu có
    }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
