/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Customer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.review;

/**
 *
 * @author nobod
 */
public class CustomerDAO extends DBContext {

    public static void main(String[] args) {
        CustomerDAO test = new CustomerDAO();
        System.out.println(test.getReviewEachProduct(3));
        for (review arg : test.getReviewEachProduct(3)) {
            System.out.println(arg.getCusId());
        }
        System.out.println(test.getReviewEachCus(3, 9));
    }

    //The anh
    public String checkingReviewCus(int cusId, int proId) {
        try {
            String sql1 = "select * from Review where ProductId = ? and CustomerId = ?";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, proId);
            st1.setInt(2, cusId);
            ResultSet rs1 = st1.executeQuery();
            if (rs1.next()) {
                return "Cancel";
            }

            String sql = "select * from OrderDetails where CreatedBy = ? and ProductId = ? order by OrderDetailsId desc";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cusId);
            st.setInt(2, proId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString(10);
            }
        } catch (SQLException e) {
        }
        return "";
    }

    //The Anh
    public Customer getValueCustomer(int id) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT [CustomerId]\n"
                    + "      ,[FullName]\n"
                    + "      ,[Password]\n"
                    + "      ,[UserName]\n"
                    + "      ,[Email]\n"
                    + "      ,[Phone]\n"
                    + "      ,[Address]\n"
                    + "      ,[CreatedById]\n"
                    + "      ,[CreatedOn]\n"
                    + "      ,[ModifiedBy]\n"
                    + "      ,[ModifiedOn]\n"
                    + "  FROM [PhoneStoreWeb].[dbo].[Customer] where CustomerId = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
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
            rs.close();
            stm.close();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return null;
    }

    public List<Customer> getAll() {

        PreparedStatement stm = null;
        ResultSet rs = null;
        List<Customer> list = new ArrayList<>();
        try {
            String sql = "SELECT [CustomerId]\n"
                    + "      ,[FullName]\n"
                    + "      ,[Password]\n"
                    + "      ,[UserName]\n"
                    + "      ,[Email]\n"
                    + "      ,[Phone]\n"
                    + "      ,[Address]\n"
                    + "      ,[CreatedById]\n"
                    + "      ,[CreatedOn]\n"
                    + "      ,[ModifiedBy]\n"
                    + "      ,[ModifiedOn]\n"
                    + "  FROM [PhoneStoreWeb].[dbo].[Customer]";

            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
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
            String sql = "SELECT COUNT(*) FROM Customer";
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
    public List<Customer> getCustomerEachPage(int index, int size) {
        List<Customer> list = new ArrayList<>();
        String sql = "WITH x as (SELECT ROW_NUMBER() over (order by CreatedOn asc) as RowNumber,* from Customer)\n"
                + "SELECT * FROM x where RowNumber between ? and ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, index * size - (size - 1));
            st.setInt(2, index * size);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer c = new Customer(
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getInt(11),
                        rs.getString(12));
                list.add(c);
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
        }

        return list;
    }

    //CUONG
    public int countSearch(String txtSearch) {
        try {
            String sql = "WITH x as (SELECT ROW_NUMBER() over (order by CreatedOn asc) as RowNumber,* from Customer where [UserName] like ?)\n"
                    + "SELECT COUNT(*) FROM x";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }

        return 0;
    }

    //CUONG
    public List<Customer> searchEachPages(String txtSearch, int index, int size) {
        List<Customer> list = new ArrayList<>();
        String sql = "WITH x as (SELECT ROW_NUMBER() over (order by CreatedOn asc) as RowNumber,* from Customer where [UserName] like ?)\n"
                + "SELECT * FROM x  Where RowNumber between ? and ? ";

        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            st.setInt(2, index * size - (size - 1));
            st.setInt(3, index * size);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer c = new Customer(
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getInt(11),
                        rs.getString(12));
                list.add(c);
            }
            rs.close();
            st.close();

        } catch (SQLException e) {
        }

        return list;
    }

    public Customer CheckAccountCustomerByEmail(String Email) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select * from [Customer] where Email = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, Email);
            rs = stm.executeQuery();
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
            rs.close();
            stm.close();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return null;
    }

    public Customer CheckAccountCustomer(String username) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select * from Customer where UserName = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            rs = stm.executeQuery();
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
            rs.close();
            stm.close();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return null;
    }

    //TheAnh
    public List<review> getReviewEachProduct(int productId) {
        List<review> list = new ArrayList<>();
        try {
            String sql = "select * from Review where ProductId = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                review rv = new review(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6));
                list.add(rv);
            }

        } catch (Exception e) {
        }
        return list;
    }

    //TheAnh
    public review getReviewEachCus(int productId, int cusId) {
        try {
            String sql = "select * from Review where ProductId = ? and CustomerId = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            st.setInt(2, cusId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                review rv = new review(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6));
                return rv;
            }

        } catch (Exception e) {
        }
        return null;
    }

    public Customer getCustomerById(int id) {

        PreparedStatement st;
        ResultSet rs;
        try {
            String sql = "select * from [Customer] where CustomerId = ?";
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            if (rs.next()) {
                Customer c = new Customer(
                        rs.getInt("CustomerId"),
                        rs.getString("FullName"),
                        rs.getString("Password"),
                        rs.getString("Username"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("Address"),
                        rs.getInt("CreatedById"),
                        rs.getString("CreatedOn"),
                        rs.getInt("ModifiedBy"),
                        rs.getString("ModifiedOn"));
                return c;
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return null;
    }

    public void update(Customer c) {

        String sql = "UPDATE [dbo].[Customer]\n"
                + "   SET [FullName] = ?\n"
                + "      ,[Password] = ?\n"
                + "      ,[UserName] = ?\n"
                + "      ,[Email] = ?\n"
                + "      ,[Phone] = ?\n"
                + "      ,[Address] = ?\n"
                + "      ,[ModifiedBy] = ?\n"
                + "      ,[ModifiedOn] = ?\n"
                + " WHERE [CustomerId] = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, c.getFullName());
            stm.setString(2, c.getPassword());
            stm.setString(3, c.getUsername());
            stm.setString(4, c.getEmail());
            stm.setString(5, c.getPhone());
            stm.setString(6, c.getAddress());
            stm.setInt(7, c.getModifiedBy());
            stm.setString(8, c.getModifiedOn());
            stm.setInt(9, c.getCustomerId());
            stm.executeUpdate();
            stm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[Customer] WHERE CustomerId=?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
            stm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
