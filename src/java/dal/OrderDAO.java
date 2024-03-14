/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Admin;
import model.Cart;
import model.Customer;
import model.Image;
import model.Item;
import model.Order;
import model.Product;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DBContext {

    public List<Order> getSalesMonth() {
        List<Order> ls = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        String sql = "SELECT\n"
                + "    YEAR(createdOn) AS Nam,\n"
                + "    MONTH(createdOn) AS Thang,\n"
                + "    SUM([TotalPrice]) AS TongGiaTien\n"
                + "FROM\n"
                + "    [dbo].[Order]\n"
                + "WHERE\n"
                + "    createdOn BETWEEN '2024-01-01' AND '2024-12-31'\n"
                + "GROUP BY\n"
                + "    YEAR(createdOn),\n"
                + "    MONTH(createdOn)\n"
                + "ORDER BY   \n"
                + "    MONTH(createdOn);";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setYear(rs.getInt(1));
                o.setMonth(rs.getInt(2));
                o.setSalesMonth(rs.getInt(3));
                ls.add(o);
            }
        } catch (SQLException e) {
        }
        return ls;
    }

    public List<Integer> getPriceSalesMonth() {
        List<Integer> ls = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        String sql = "SELECT\n"
                + "    SUM([TotalPrice]) AS TongGiaTien\n"
                + "FROM\n"
                + "    [dbo].[Order]\n"
                + "WHERE\n"
                + "    createdOn BETWEEN '2024-01-01' AND '2024-12-31'\n"
                + "GROUP BY\n"
                + "    YEAR(createdOn),\n"
                + "    MONTH(createdOn)\n"
                + "ORDER BY\n"
                + "    MONTH(createdOn);";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int value = rs.getInt(1);
                ls.add(value);
            }
        } catch (SQLException e) {
        }
        return ls;
    }

    public List<Integer> getSalesEachBrand() {
        List<Integer> ls = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        String sql = "SELECT SUM(o.[ListPrice] * o.[Quantity]) as KetQua, c.CategoryId, c.CategoryName\n"
                + "FROM\n"
                + "[dbo].[OrderDetails] o\n"
                + "JOIN Product p ON o.ProductId = p.ProductId\n"
                + "JOIN Category c ON p.CategoryId = c.CategoryId\n"
                + "GROUP BY\n"
                + "c.CategoryId, c.CategoryName\n"
                + "ORDER BY c.CategoryId;";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int value = rs.getInt(1);
                ls.add(value);
            }
        } catch (SQLException e) {
        }
        return ls;
    }

    public int getTotalProfit() {
        int totalProfit = 0;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String sql = "SELECT SUM(TotalPrice)\n"
                + "FROM [PhoneStoreWeb].[dbo].[Order]";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                totalProfit = rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return totalProfit;
    }

    //Theanh
    public void deleteOrderAndODetail(int orderID) {
        try {
            String sql = "DELETE FROM [OrderDetails]\n"
                    + "WHERE OrderId = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            st.executeUpdate();
            String sql1 = "DELETE FROM [Order]\n"
                    + "WHERE OrderId = ?";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, orderID);
            st1.executeUpdate();
        } catch (SQLException e) {
        }
    }

    //TheAnh
    public Order getOrderByOid(int orderID) {
        try {
            String sql = "select * from [Order] where OrderId = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Order c = new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getDouble(11),
                        rs.getDouble(12));
                return c;
            }

        } catch (SQLException e) {
        }
        return null;
    }

    //TheAnh
    public Image getImageByProductId(int pid) {
        String sql = "select * from [ProductImage] where ProductId = ?";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Image(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    //Theanh
    public List<Product> getProductDetailByOrderId(int orderID) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select p.*, od.Quantity from Product p join OrderDetails od on p.ProductId = od.ProductId where od.OrderId = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(12),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getInt(11),
                        getImageByProductId(rs.getInt(1)));
                list.add(p);
            }

        } catch (SQLException e) {
        }
        return list;
    }

    // THEANH
    public int addOrder(Customer u, Admin a, Cart cart, double shipCost, double discountCost) {
        Customer cus = new CustomerDAO().getCustomerById(u.getCustomerId());
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        int oid = 0;
        try {
            //add vao bang order
            String sql = """
                         INSERT INTO [dbo].[Order]
                                    ([CustomerId]
                                    ,[TotalPrice]
                                    ,[Address]
                                    ,[AdminId]
                                    ,[CreatedBy]
                                    ,[CreatedOn]
                                    ,[status]
                                    ,[shipCost]
                                    ,[discountCost])
                              VALUES
                                    (?,?,?,?,?,?,?,?,?)""";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cus.getCustomerId());
            st.setDouble(2, cart.getTotalMoney() + shipCost);
            st.setString(3, cus.getAddress());
            st.setInt(4, a.getAdminId());
            st.setInt(5, cus.getCustomerId());
            st.setString(6, date);
            st.setString(7, "Pending");
            st.setDouble(8, shipCost);
            st.setDouble(9, discountCost);
            st.executeUpdate();
            // lay ra id cua Order vua add, de add vao orderDetail
            String sql1 = "select top 1 [OrderId] from [order] order by [OrderId] desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                oid = rs.getInt(1);
                for (Item i : cart.getItems()) {
                    String sql2 = """
                                  INSERT INTO [dbo].[OrderDetails]
                                             ([ProductId]
                                             ,[Quantity]
                                             ,[OrderId]
                                             ,[ListPrice]
                                             ,[CreatedBy]
                                             ,[CreatedOn]
                                             ,[status])
                                       VALUES
                                             (?,?,?,?,?,?,?)""";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, i.getProduct().getProductId());
                    st2.setInt(2, i.getQuantity());
                    st2.setInt(3, oid);
                    st2.setDouble(4, i.getPrice());
                    st2.setInt(5, cus.getCustomerId());
                    st2.setString(6, date);
                    st2.setString(7, "Pending");
                    st2.executeUpdate();
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return oid;
    }

    //The Anh
    public List<Order> getAllOrderByCid(int cid) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<Order> list = new ArrayList<>();
        try {
            String sql = "select * from [Order] where CustomerId = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            rs = stm.executeQuery();
            while (rs.next()) {
                Order c = new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getDouble(11),
                        rs.getDouble(12));
                list.add(c);
            }
            rs.close();
            stm.close();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        dao.deleteOrderAndODetail(33);

    }

    //The Anh
    public void updateStatus(int orderId) {
        try {
            String sql = """
                         UPDATE [dbo].[Order]
                            SET [status] = 'Delivered'
                          WHERE OrderId = ?""";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderId);
            st.execute();
            String sql1 = """
                          UPDATE [dbo].[OrderDetails]
                             SET [status] = 'Delivered'
                           WHERE OrderId = ?""";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, orderId);
            st1.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //Theanh
    public void updateStatusBeingTrans(int orderId) {
        try {
            String sql = """
                         UPDATE [dbo].[Order]
                            SET [status] = 'Being transported'
                          WHERE OrderId = ?""";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderId);
            st.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //Theanh
    public void updateStatusPaid(int orderId) {
        try {
            String sql = """
                         UPDATE [dbo].[Order]
                            SET [status] = 'Pending (PAID)'
                          WHERE OrderId = ?""";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderId);
            st.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //TheAnh
    public void updateStatusCancel(int orderId) {
        try {
            String sql = """
                         UPDATE [dbo].[Order]
                            SET [status] = 'Cancel'
                          WHERE OrderId = ?""";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderId);
            st.execute();
            String sql1 = """
                          UPDATE [dbo].[OrderDetails]
                             SET [status] = 'Cancel'
                           WHERE OrderId = ?""";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, orderId);
            st1.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //CUONG
    public List<Order> getAll() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<Order> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [dbo].[Order] ";

            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Order c = new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getDouble(11),
                        rs.getDouble(12));
                list.add(c);
            }
            rs.close();
            stm.close();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return list;
    }

    //CUONG
    public int count() {
        try {
            String sql = "SELECT COUNT(*) FROM Order";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }

        return 0;
    }

    //CUONG
    public List<Order> getOrderByDay(String startDate, String endDate, int index, int pageSize) {

        PreparedStatement stm = null;
        ResultSet rs = null;
        List<Order> list = new ArrayList<>();
        try {
            String sql = "SELECT * from [dbo].[Order] where [createdOn] BETWEEN ? AND ?\n"
                    + "ORDER BY [Order].[CreatedOn]  OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            stm = connection.prepareStatement(sql);
            stm.setString(1, startDate);
            stm.setString(2, endDate);
            stm.setInt(3, (index - 1) * pageSize);
            stm.setInt(4, pageSize);
            rs = stm.executeQuery();
            while (rs.next()) {
                Order c = new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getDouble(11),
                        rs.getDouble(12));
                list.add(c);
            }
            rs.close();
            stm.close();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return list;
    }

    public List<Order> getAllOrderWithName() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<Order> list = new ArrayList<>();
        try {
            String sql = " SELECT o.orderID,\n"
                    + "       o.customerID,\n"
                    + "       c.FullName AS CustomerName, \n"
                    + "       o.totalPrice,\n"
                    + "       o.address,\n"
                    + "       o.adminID,\n"
                    + "       o.createdOn,\n"
                    + "       o.status\n"
                    + "FROM [dbo].[Order] o\n"
                    + "JOIN [dbo].[Customer] c ON o.customerID = c.CustomerId;";

            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrderID(rs.getInt(1));
                o.setCustomerID(rs.getInt(2));
                o.setCutomerName(rs.getString(3));
                o.setTotalPrice(rs.getDouble(4));
                o.setAddress(rs.getString(5));
                o.setAdminID(rs.getInt(6));
                o.setCreatedOn(rs.getString(7));
                o.setStatus(rs.getString(8));
                list.add(o);
            }
            rs.close();
            stm.close();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return list;
    }

}
