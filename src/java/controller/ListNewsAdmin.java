/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CommentNewsDAO;
import dal.NewsDAO;
import dal.NewsGroupDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.News;
import model.NewsGroup;

/**
 *
 * @author nobod
 */
@WebServlet(name = "ListNewsAdmin", urlPatterns = {"/listnewsadmin"})
public class ListNewsAdmin extends HttpServlet {

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
            NewsDAO dao = new NewsDAO();
        NewsGroupDAO gr = new NewsGroupDAO();
        List<NewsGroup> group = gr.getAllNewsGroup();
        request.setAttribute("newsgroup", group);
        String service = request.getParameter("service");
        request.setAttribute("service", service);

        if (service.equals("searchNews")) {
            String search = request.getParameter("searchNews");
            request.setAttribute("textSearch", search);
            int count = dao.getCountNewsSearch(search);
            int pageSize = 2;
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

            List<News> list = dao.getNewsByTittle(search, index, pageSize);
            request.setAttribute("listNew", list);
            request.getRequestDispatcher("newsAdmin.jsp").forward(request, response);
        }

        if (service.equals("getAll")) {
            int count = dao.getTotalNews();
            int pageSize = 3;
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
            List<News> list = dao.getAllNews(index, pageSize);
            request.setAttribute("listNew", list);
            request.getRequestDispatcher("newsAdmin.jsp").forward(request, response);
        }
        
        if (service.equals("getById")) {
            String grId = request.getParameter("grId");
            
            int groupId = Integer.parseInt(grId);
            
            request.setAttribute("grId", groupId);
            int count = dao.getTotalNewsoGroup(groupId);
            int pageSize = 2;
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

            List<News> list = dao.getNewsByGroupId(groupId, index, pageSize, 0);
            request.setAttribute("listNew", list);
            request.getRequestDispatcher("newsAdmin.jsp").forward(request, response);
        }
        } catch (ServletException | IOException | NumberFormatException e) {
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
