/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.time.LocalDate;
import java.nio.file.Path;
import java.nio.file.Files;
import model.Admin;

/**
 *
 * @author nobod
 */
@MultipartConfig
@WebServlet(name = "AddProducts", urlPatterns = {"/addproduct"})
public class AddProducts extends HttpServlet {

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

        try {
            LocalDate curDate = java.time.LocalDate.now();
            String date = curDate.toString();
            response.setContentType("text/html;charset=UTF-8");
            HttpSession session = request.getSession();
            String id_raw = request.getParameter("category");
            String name = request.getParameter("productName");
            String capa_raw = request.getParameter("capacity");
            String des = request.getParameter("describe");
            String quantity_raw = request.getParameter("quantity");
            String price_raw = request.getParameter("price");

//            System.out.println("Received price: " + price_raw);
            
             price_raw = price_raw.replaceAll("[^\\d.]", "");
             String pr = price_raw.replaceAll("\\.", "");
//            System.out.println("Received price: " + pr);
            Part part = request.getPart("image");
            
            //validate file ảnh
            String allowedFileTypes = "image/jpeg,image/png,image/gif"; // Add more types if needed
            String contentType = part.getContentType();

            if (!allowedFileTypes.contains(contentType)) {
                // Invalid file type, handle the error
                request.setAttribute("error", "Invalid file type. Please upload a valid image file.");
                request.getRequestDispatcher("add-products.jsp").forward(request, response);
                return;
            }

            String realPath = request.getServletContext().getRealPath("/img2");
            String fileName = Path.of(part.getSubmittedFileName()).getFileName().toString();

            Admin admin = (Admin) session.getAttribute("adminAcc");
            int id, quantity, capacity;
            double price;
            ProductDAO dao = new ProductDAO();

            id = Integer.parseInt(id_raw);
            quantity = Integer.parseInt(quantity_raw);
            capacity = Integer.parseInt(capa_raw);
            price = Double.parseDouble(pr);

            // Kiểm tra số lượng và capacity
            if (quantity < 0 || capacity < 0) {
                // Ném ra lỗi và điều hướng về trang add-products.jsp
                if (!Files.exists(Path.of(realPath))) {
                    Files.createDirectories(Path.of(realPath));
                }

                part.write(realPath + "/" + fileName);

                Product pnew = new Product();
                pnew.setCategoryId(id);
                pnew.setName(name);
                pnew.setCapacity(capacity);
                pnew.setDescription(des);
                pnew.setQuantity(quantity);
                pnew.setPrice(price);
                pnew.setCreatedby(admin.getAdminId());
                pnew.setCreatedOn(date);
                request.setAttribute("pnew", pnew);
                request.setAttribute("error", "Quantity and Capacity must be non-negative.");
                request.getRequestDispatcher("add-products.jsp").forward(request, response);
                return; // Kết thúc xử lý để ngăn chặn tiếp tục thực hiện các công việc khác trong khối try
            }

            Product p = dao.getCategoryByNameRam(name, capacity);
            if (p == null) {
                if (!Files.exists(Path.of(realPath))) {
                    Files.createDirectories(Path.of(realPath));
                }

                part.write(realPath + "/" + fileName);

                Product pnew = new Product();
                pnew.setCategoryId(id);
                pnew.setName(name);
                pnew.setCapacity(capacity);
                pnew.setDescription(des);
                pnew.setQuantity(quantity);
                pnew.setPrice(price);
                pnew.setCreatedby(admin.getAdminId());
                pnew.setCreatedOn(date);

                dao.insert(pnew, fileName);
                request.getRequestDispatcher("listp").forward(request, response);
            } else {
                request.setAttribute("error", name + capacity + " already exists!");
                request.getRequestDispatcher("add-products.jsp").forward(request, response);
            }
        } catch (NumberFormatException | IOException e) {
            // Log or handle the exception appropriately
            // Nếu có lỗi, bạn cũng có thể thêm mã để ném ra thông báo lỗi lên phía client nếu cần
            request.setAttribute("error", "Invalid input. Please enter valid values.");
            request.getRequestDispatcher("add-products.jsp").forward(request, response);
            System.out.println(e);
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
