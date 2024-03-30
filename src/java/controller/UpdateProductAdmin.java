/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;

/**
 *
 * @author nobod
 */
@MultipartConfig
@WebServlet(name = "UpdateProductAdmin", urlPatterns = {"/updatep"})
public class UpdateProductAdmin extends HttpServlet {

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
            ProductDAO dao = new ProductDAO();
            CategoryDAO dao1 = new CategoryDAO();
            int pid = Integer.parseInt(request.getParameter("id"));
            Product p = dao.getProdctById(pid);
            List<Category> ca = dao1.getAllCategory();
            request.setAttribute("ca", ca);
            request.setAttribute("data", p);
            request.getRequestDispatcher("update-products.jsp").forward(request, response);

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

        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        String pid_raw = request.getParameter("productID");
        String id_raw = request.getParameter("categoryID");
        String name = request.getParameter("productName");
        String capa_raw = request.getParameter("capacity");
        String des = request.getParameter("describe");
        String quantity_raw = request.getParameter("quantity");
        String price_raw = request.getParameter("price");
        String cread = request.getParameter("createdBy");
        String creadon = request.getParameter("createdOn");

        Part part = request.getPart("image");

        int id, quantity, capacity, pid;
        double price;
        ProductDAO dao = new ProductDAO();
        try {
            String realPath = request.getServletContext().getRealPath("/img2");
            String fileName = Path.of(part.getSubmittedFileName()).getFileName().toString();

            if (!Files.exists(Path.of(realPath))) {
                    Files.createDirectories(Path.of(realPath));
                }

                part.write(realPath + "/" + fileName);

            id = Integer.parseInt(id_raw);
            pid = Integer.parseInt(pid_raw);
            quantity = Integer.parseInt(quantity_raw);
            capacity = Integer.parseInt(capa_raw);
            
  
//            System.out.println("Received price: " + price_raw);
            
             price_raw = price_raw.replaceAll("[^\\d.]", "");
             String pr = price_raw.replaceAll("\\.", "");
//            System.out.println("Received price: " + pr);
            price = Double.parseDouble(pr);
            
            if (quantity < 0 || capacity < 0) {
                request.setAttribute("error", "Quantity and Capacity must be non-negative.");
                request.getRequestDispatcher("update-products.jsp").forward(request, response);
                return;
            }
            
            Product pnew = new Product();
            pnew.setProductId(pid);
            pnew.setCategoryId(id);
            pnew.setName(name);
            pnew.setCapacity(capacity);
            pnew.setDescription(des);
            pnew.setQuantity(quantity);
            pnew.setPrice(price);
            pnew.setCreatedby(Integer.parseInt(cread));
            pnew.setCreatedOn(creadon);
            pnew.setModifiedBy(1);
            pnew.setModifiedOn(date);
//            pnew.getImage().setImagePath(fileName);
            dao.update(pnew, fileName);
            response.sendRedirect("listp");
//            request.setAttribute("error", name + capacity + " not empty");
//            request.getRequestDispatcher("update-products.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            System.err.println(e);
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
