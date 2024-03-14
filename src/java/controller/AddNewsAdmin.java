/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.NewsDAO;
import dal.NewsGroupDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.LocalDate;
import java.util.List;
import model.Admin;
import model.News;
import model.NewsGroup;

/**
 *
 * @author nobod
 */
@MultipartConfig
@WebServlet(name = "AddNewsAdmin", urlPatterns = {"/AddNewsAdmin"})
public class AddNewsAdmin extends HttpServlet {

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
        NewsGroupDAO dao = new NewsGroupDAO();
        List<NewsGroup> list = dao.getAllNewsGroup();
        request.setAttribute("newsGroup", list);
        request.getRequestDispatcher("addNewsAdmin.jsp").forward(request, response);
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
        try {
            LocalDate curDate = java.time.LocalDate.now();
            String date = curDate.toString();
            HttpSession session = request.getSession();

            String title = request.getParameter("title");
            String description = request.getParameter("content");
            String heading = request.getParameter("heading");
            String id_raw = request.getParameter("newsgrId");

            Part part = request.getPart("image");
            
            //validate file ảnh
            String allowedFileTypes = "image/jpeg,image/png,image/gif"; // Add more types if needed
            String contentType = part.getContentType();

            if (!allowedFileTypes.contains(contentType)) {
                // Invalid file type, handle the error
                System.out.println("hello");
                request.setAttribute("error", "Invalid file type. Please upload a valid image file.");
                request.getRequestDispatcher("addNewsAdmin.jsp").forward(request, response);
                return;
            }

            String realPath = request.getServletContext().getRealPath("/img2");
            String fileName = Path.of(part.getSubmittedFileName()).getFileName().toString();

            // Debug: In ra giá trị để kiểm tra
            System.out.println("Real Path: " + realPath);
            System.out.println("File Name: " + fileName);

            Admin admin = (Admin) session.getAttribute("adminAcc");
            int id;
            id = Integer.parseInt(id_raw);
            NewsDAO dao = new NewsDAO();

            if (!Files.exists(Path.of(realPath))) {
                Files.createDirectories(Path.of(realPath));
            }

            part.write(realPath + "/" + fileName);

            News n = new News();
            n.setTitle(title);
            n.setDescription(description);
            n.setHeading(heading);
            n.setNewGroupId(id);
            n.setImage(fileName);
            n.setCreatedby(admin.getAdminId());
            n.setCreatedOn(date);

            dao.addNews(n);
            request.getRequestDispatcher("listnewsadmin").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
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
