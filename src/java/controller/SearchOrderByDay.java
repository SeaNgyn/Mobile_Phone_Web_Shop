/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import model.Order;

/**
 *
 * @author nobod
 */
@WebServlet(name = "SearchOrderByDay", urlPatterns = {"/searchOrderByDayAdmin"})
public class SearchOrderByDay extends HttpServlet {

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
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");

            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");

            if (startDate != null && endDate != null && !startDate.isEmpty() && !endDate.isEmpty()) {
                Date parsedStartDate = inputFormat.parse(startDate);
                Date parsedEndDate = inputFormat.parse(endDate);

                // Chuyển đổi sang định dạng ngày SQL Server (nếu cần)
                if (parsedEndDate.before(parsedStartDate)) {
                    // Ngày kết thúc không hợp lệ, có thể trả về một thông báo lỗi hoặc xử lý khác tùy thuộc vào yêu cầu của bạn.
                    request.setAttribute("errorDate", "EndDate must be after StartDate");
                    // Có thể chuyển hướng hoặc trả về thông báo lỗi tùy thuộc vào logic của bạn
                    request.getRequestDispatcher("orders-admin.jsp").forward(request, response);
                } else {
                    // Chuyển đổi sang định dạng ngày SQL Server (nếu cần)
                    String sqlStartDate = outputFormat.format(parsedStartDate);
                    String sqlEndDate = outputFormat.format(parsedEndDate);

                    OrderDAO dao = new OrderDAO();

                    int count = dao.count();
                    int pageSize = 8;
                    int endPage = 0;
                    endPage = count / pageSize;
                    if (count % pageSize != 0) {
                        endPage++;
                    }
                    request.setAttribute("end", endPage);
                    String index_raw = request.getParameter("index");
                    int index = 0;
                    if (index_raw == null) {
                        index = 1;
                    } else {
                        index = Integer.parseInt(index_raw);
                    }
                    
                    
                    List<Order> list = dao.getOrderByDay(sqlStartDate, sqlEndDate, index, pageSize);
                    request.setAttribute("data", list);
                    request.getRequestDispatcher("orders-admin.jsp").forward(request, response);
                    request.setAttribute("startDate", startDate);
                    request.setAttribute("endDate", endDate);
                }
            } else {
                // Xử lý trường hợp startDate hoặc endDate là null hoặc chuỗi rỗng
                System.err.println("Invalid startDate or endDate");
                // Có thể chuyển hướng hoặc trả về thông báo lỗi tùy thuộc vào logic của bạn
            }
        } catch (ParseException e) {
            // Xử lý ngoại lệ
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
