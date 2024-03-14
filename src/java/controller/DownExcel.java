/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.sql.ResultSet;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import java.sql.SQLException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DownExcel", urlPatterns = {"/excel"})
public class DownExcel extends HttpServlet {

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
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=Reviews-export.xlsx");
        String orderId_raw = request.getParameter("oid_raw");
        //System.out.println(orderId_raw);
        int orderid;
        try (OutputStream outputStream = response.getOutputStream()) {
            orderid = Integer.parseInt(orderId_raw);
            ProductDAO dao = new ProductDAO();
            ResultSet result = dao.getResultSet("select p.[Name], od.ListPrice, od.Quantity, od.ListPrice*od.Quantity as Total \n"
                    + "  from [OrderDetails] od join [Order] o on od.OrderId = o.OrderId \n"
                    + "  join [Product] p on p.ProductId = od.ProductId \n"
                    + "  where od.OrderId = " + orderid);

            XSSFWorkbook workbook = new XSSFWorkbook();
            XSSFSheet sheet = workbook.createSheet("Reviews");

            writeHeaderLine(sheet);
            writeDataLines(result, sheet);

            workbook.write(outputStream);
        } catch (SQLException ex) {

        }
    }

    private void writeHeaderLine(XSSFSheet sheet) {
        Row headerRow = sheet.createRow(0);

        Cell headerCell = headerRow.createCell(0);
        headerCell.setCellValue("Tên hàng");

        headerCell = headerRow.createCell(1);
        headerCell.setCellValue("Đơn giá");

        headerCell = headerRow.createCell(2);
        headerCell.setCellValue("Số lượng");

        headerCell = headerRow.createCell(3);
        headerCell.setCellValue("Thành Tiền");
        
       


    }

    private void writeDataLines(ResultSet result, XSSFSheet sheet) throws SQLException {
        int rowCount = 1;

        while (result.next()) {
            String name = result.getString(1);
            double price = result.getDouble(2);
            int Quantity = result.getInt(3);
            Double total = result.getDouble(4);
            

            Row row = sheet.createRow(rowCount++);

            int columnCount = 0;
            Cell cell = row.createCell(columnCount++);
            cell.setCellValue(name);

            cell = row.createCell(columnCount++);
            cell.setCellValue(price);

            cell = row.createCell(columnCount++);
            cell.setCellValue(Quantity);

            cell = row.createCell(columnCount++);
            cell.setCellValue(total);

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
