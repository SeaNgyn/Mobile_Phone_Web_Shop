/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.discount;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Admin;
import model.Customer;
import model.Image;
import model.Product;

/**
 *
 * @author Admin
 */
public class DAO extends DBContext {
    
    //QUANG
    public Customer getPass(int id) {
        String sql = "Select * from Customer where CustomerID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Customer c = new Customer(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getString(11));
                return c;

            }
        } catch (SQLException e) {

        }
        return null;
    }
    
    //QUANG
    public void changePass(String pass, int id) {
        String sql = "update Customer set [Password] = ? where CustomerID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    //QUANG
    public void updatePass(String pass, String email) {
        String sql = "update Customer set [Password] = ? where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, email);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    //Theanh
    public List<discount> getAllDiscount() {
        List<discount> list = new ArrayList<>();
        try {
            String sql = "select * from discount";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                discount d = new discount(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4));
                list.add(d);
            }

        } catch (Exception e) {
        }
        return list;
    }

    //TheAnh
    public void deleteDiscount(int discountId) {
        String sql = "DELETE FROM [dbo].[discount]\n"
                + "      WHERE discountID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, discountId);
            st.executeQuery();
        } catch (SQLException e) {
        }
    }

    //TheAnh
    public void insertDiscount(String name, String code, double percent) {
        String sql = "INSERT INTO [dbo].[discount]\n"
                + "           ([discountName]\n"
                + "           ,[discountCode]\n"
                + "           ,[discountPercentage])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, code);
            st.setDouble(3, percent);
            st.executeQuery();
        } catch (SQLException e) {
        }
    }

    public List<Image> getImageByProductId(int pid) {
        List<Image> list = new ArrayList<>();
        String sql = "select * from ProductImage where ProductId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Image i = new Image(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7));
                list.add(i);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public Customer getAccount(String user, String pass) {
        String sql = "select * from customer where UserName = ? and [Password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Customer c = new Customer(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getString(11));
                return c;

            }
        } catch (SQLException e) {
        }

        return null;
    }

    public void updateBillingAdress(String name, String Adress, String email, String phone, Customer c) {
        String sql = "UPDATE Customer SET FullName = ?, Address = ?, Email = ?, Phone = ? WHERE CustomerId = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, Adress);
            st.setString(3, email);
            st.setString(4, phone);
            st.setInt(5, c.getCustomerId());
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error to update");
        }
    }

    public Admin getAccountAdmin(String user, String pass) {
        String sql = "select * from [Admin] where UserName = ? and [Password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Admin a = new Admin(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getString(11));
                return a;

            }
        } catch (SQLException e) {
        }

        return null;
    }

    public Admin getStaff(int role) {
        String sql = " select * from [Admin] where RoleId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, role);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Admin a = new Admin(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getString(11));
                return a;

            }
        } catch (SQLException e) {
        }

        return null;
    }

    public Customer getCustomer(int id) {
        String sql = "select * from customer where [CustomerId] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Customer c = new Customer(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getString(11));
                return c;

            }
        } catch (SQLException e) {
        }

        return null;
    }

    public Customer checkAccount(String user) {
        String sql = "select * from customer where Username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Customer c = new Customer(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getString(11));
                return c;

            }
        } catch (SQLException e) {
        }

        return null;
    }

    public void insertAccount(String user, String pass, String email, String phone) {
        String sql = "INSERT INTO [dbo].[Customer]\n"
                + "           ([FullName]\n"
                + "           ,[Password]\n"
                + "           ,[UserName]\n"
                + "           ,[Email]\n"
                + "           ,[Phone]\n"
                + "           ,[CreatedOn])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            LocalDate curDate = java.time.LocalDate.now();
            String date = curDate.toString();
            st.setString(1, user);
            st.setString(2, pass);
            st.setString(3, user);
            st.setString(4, email);
            st.setString(5, phone);
            st.setString(6, date);
            st.executeUpdate();

        } catch (SQLException e) {
        }

    }

    public Customer checkGmail(String user) {
        String sql = "select * from customer where Email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Customer c = new Customer(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getString(11));
                return c;

            }
        } catch (SQLException e) {
        }

        return null;
    }

    public void insertGoogleAccount(String fullname, String email) {
        String sql = "INSERT INTO [dbo].[Customer]\n"
                + "           ([FullName]\n"
                + "           ,[Email]\n"
                + "           ,[CreatedOn])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            LocalDate curDate = java.time.LocalDate.now();
            String date = curDate.toString();
            st.setString(1, fullname);
            st.setString(2, email);
            st.setString(3, date);
            st.executeUpdate();

        } catch (SQLException e) {
        }

    }

    public void deleteProductById(String id) {
        String sql = "delete from Products where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

}
