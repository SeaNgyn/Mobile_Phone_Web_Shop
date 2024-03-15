/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CustomerDAO;
import dal.DAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Admin;
import model.Cart;
import model.Customer;

/**
 *
 * @author Admin
 */
@WebServlet(name = "checkOutCart", urlPatterns = {"/checkout"})
public class checkOutCart extends HttpServlet {

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
            out.println("<title>Servlet checkOutCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet checkOutCart at " + request.getContextPath() + "</h1>");
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
        response.getWriter().print("hello");
        System.out.println("hello there");
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
        response.setContentType("text/html;charset=UTF-8");
        //PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Cart cart = null;
        Object o = session.getAttribute("cart");
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        String radio_box = request.getParameter("payment-radio");
        String shipCost = request.getParameter("shipCost");
        String discountCost = request.getParameter("discountCost");
        String name = request.getParameter("name_raw");
        String email = request.getParameter("email_raw");
        String phonenumber = request.getParameter("phonenumber_raw");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String result = String.join(",", ward, district, city);
        String address = result;
        if(request.getParameter("address") != null) {
            address = request.getParameter("address");
        }
        try {
            Customer c = null;
            Admin staff = new DAO().getStaff(2);
            Object customer = session.getAttribute("customerAcc");
            if (customer != null) {
                if (session.getAttribute("size") != null) {
                    c = (Customer) customer;
                    new DAO().updateBillingAdress(name, address, email, phonenumber, c);
                    int oid = new OrderDAO().addOrder(c, staff, cart, Double.parseDouble(shipCost), Double.parseDouble(discountCost));
                    session.setAttribute("billingAdress", new DAO().getCustomer(c.getCustomerId()));
                    session.removeAttribute("cart");
                    session.setAttribute("size", 0);
                    request.setAttribute("buy", oid);
                    if (radio_box != null && radio_box.equals("vnpay")) {
                        session.setAttribute("oidVnpay", oid);
                        request.getRequestDispatcher("vnpay/index.jsp").forward(request, response);
                    }
                    request.getRequestDispatcher("home").forward(request, response);
                } else {
                    response.sendRedirect("home");
                }
            } else {
                int code = (int) Math.floor(((Math.random() * 899999) + 100000));
                session.setAttribute("codeId", code);
                request.setAttribute("email", email);
                request.setAttribute("nameN", name);
                request.setAttribute("addN", address);
                request.setAttribute("phoneN", phonenumber);
                request.setAttribute("radio_box", radio_box);
                request.setAttribute("shipCost", shipCost);
                request.setAttribute("discountCost", discountCost);
                //System.out.println(address + " ok");
                Customer checkAcc = new CustomerDAO().CheckAccountCustomerByEmail(email);
                if (checkAcc != null) {
                    //System.out.println(code);
                    request.setAttribute("user", checkAcc.getUsername());
                    request.setAttribute("pass", checkAcc.getPassword());
                    request.getRequestDispatcher("checkout.jsp").forward(request, response);
                } else {

                    request.setAttribute("accNotExist", "accNull");
                    request.getRequestDispatcher("checkout.jsp").forward(request, response);
                }
            }
        } catch (NumberFormatException e) {
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
