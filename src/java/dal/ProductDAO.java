/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Image;
import model.Product;

/**
 *
 * @author Admin
 */
public class ProductDAO extends DBContext {

    private final LocalDate curDate = java.time.LocalDate.now();
    private final String date = curDate.toString();
    
    //Cuong
    public List<Product> getTop5Product() {
        List<Product> list = new ArrayList<>();
        
        try {
            String sql = "SELECT TOP 5 o.ProductId, SUM(o.Quantity) AS totalSales, P.Name, P.Capacity\n"
                    + "                 FROM [dbo].[Product] p\n"
                    + "			join [dbo].[OrderDetails] o  On o.ProductId = p.ProductId\n"
                    + "                 GROUP BY o.productID, P.Name, P.Capacity\n"
                    + "                 ORDER BY totalSales DESC;";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
              Product p = new Product();
              p.setProductId(rs.getInt(1));
              p.setTotalSales(rs.getInt(2));
              p.setName(rs.getString(3));
              p.setCapacity(rs.getInt(4));         
              p.setImage(getImageByProductId(rs.getInt(1)));
              list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    //CUONG
    public List<Product> filterByNamePrice(int cateID, int value, int index, int pageSize) {
        List<Product> list = new ArrayList<>();
        String sql = "select *from Product\n"
                + "where 1=1";
        if (cateID != 0) {
            if (value == 0) {
                sql += "and [CategoryId] = " + cateID;
            }
            if (value == 1) {
                sql += "and [CategoryId] = " + cateID + " and 0 < Price and Price < 2000000";
            }
            if (value == 2) {
                sql += "and [CategoryId] = " + cateID + " and 2000000 < Price and Price < 7000000";
            }
            if (value == 3) {
                sql += "and [CategoryId] = " + cateID + " and 7000000 < Price and Price < 13000000";
            }
            if (value == 4) {
                sql += "and [CategoryId] = " + cateID + " and 13000000 < Price and Price < 20000000";
            }
            if (value == 5) {
                sql += "and [CategoryId] = " + cateID + " and 20000000 < Price ";
            }
        } else {
            if (value == 1) {
                sql += " and 0 < Price and Price < 2000000";
            }
            if (value == 2) {
                sql += " and 2000000 < Price and Price < 7000000";
            }
            if (value == 3) {
                sql += " and 7000000 < Price and Price < 13000000";
            }
            if (value == 4) {
                sql += " and 13000000 < Price and Price < 20000000";
            }
            if (value == 5) {
                sql += " and 20000000 < Price ";
            }
        }
        sql += "ORDER BY PRICE OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * pageSize);
            ps.setInt(2, pageSize);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getInt(11),
                        getImageByProductId(rs.getInt(1)));
                list.add(p);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    //TheAnh
    public int avarageStarOfProduct(int proId) {
        try {
            String sql = "SELECT AVG(star) as avgStar FROM Review WHERE ProductId = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, proId);
            ResultSet rs = st.executeQuery();
            if(rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    

    //TheAnh
    public void updateReview(int proId, int cusId, String cmt, int star) {
        try {
            String sql = "UPDATE [dbo].[Review]\n"
                    + "   SET [comment] = ?\n"
                    + "      ,[star] = ?\n"
                    + "      ,[time_new] = ?\n"
                    + " WHERE ProductId = ? and CustomerId = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cmt);
            st.setInt(2, star);
            st.setString(3, date);
            st.setInt(4, proId);
            st.setInt(5, cusId);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    //TheAnh
    public void DeleteReview(int rvId) {
        try {
            String sql = "DELETE FROM [dbo].[Review]\n"
                    + "      WHERE reviewID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, rvId);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    //TheAnh
    public void insertReview(int proId, int cusId, String cmt, int star) {
        try {
            String sql = "INSERT INTO [dbo].[Review]\n"
                    + "           ([ProductId]\n"
                    + "           ,[CustomerId]\n"
                    + "           ,[comment]\n"
                    + "           ,[star]\n"
                    + "           ,[time_new])\n"
                    + "     VALUES\n"
                    + "           (?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, proId);
            st.setInt(2, cusId);
            st.setString(3, cmt);
            st.setInt(4, star);
            st.setString(5, date);
            st.executeUpdate();
        } catch (SQLException e) {
        }

    }

    //TOAN
    public int getTotalProduct() {
        String sql = "select COUNT(*) from Product ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return 0;
    }

    //TOAN
    public List<Product> getProductPaging(int index, int numberPerPage) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product p\n"
                + "order by p.ProductId\n"
                + "offset ? rows fetch next ? rows only ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * numberPerPage);
            st.setInt(2, numberPerPage);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product p = new Product(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
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
            System.out.println(e);
        }

        return list;
    }

    //TOAN
    public List<Product> getAllProductByCate(String cateName) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product p\n"
                + "join Category c on p.CategoryId=c.CategoryId\n"
                + "where c.CategoryName ='" + cateName + "'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
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

    //TOAN
    public List<Product> getAllProductBySQL(
            String txtSearch, String typeSort,
            String priceSort, String cateName, int index, int numberPerPage
    ) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product p\n"
                + "join Category c on p.CategoryId=c.CategoryId\n"
                + "where 1=1";
        if (txtSearch != null && !txtSearch.equals("")) {
            sql += " and c.CategoryName like N'%" + txtSearch + "%'";
        }

        if (priceSort != null && !priceSort.equals("")) {
            switch (priceSort) {
                case "< 5 triệu":
                    sql += " and p.price <= 5000000";
                    break;
                case "5 - 10 triệu":
                    sql += " and p.price >= 5000000 and p.price <= 10000000";
                    break;
                case "10 - 15 triệu":
                    sql += " and p.price >= 10000000 and p.price <= 15000000";
                    break;
                case "15 - 30 triệu":
                    sql += " and p.price >= 15000000 and p.price <= 30000000";
                    break;
                case "> 30 triệu":
                    sql += " and p.price >= 30000000";
                    break;
                default:
                    throw new AssertionError();
            }
        }
        if (cateName != null && !cateName.equals("")) {
            sql += " and c.CategoryName ='" + cateName + "'";
        }
        if (typeSort != null && !typeSort.equals("")) {
            switch (typeSort) {
                case "Newest":
                    sql += " order by p.ProductId desc";
                    break;
            }
        }

        if (!sql.contains("order by")) {
            sql += " order by p.ProductId\n";
        }
        sql += " offset " + ((index - 1) * numberPerPage) + " rows fetch next " + numberPerPage + " rows only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
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
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getAllProductBySQLs(
            String txtSearch, String typeSort,
            String priceSort, String cateName
    ) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product p\n"
                + "join Category c on p.CategoryId=c.CategoryId\n"
                + "where 1=1";
        if (txtSearch != null && !txtSearch.equals("")) {
            sql += " and c.CategoryName like N'%" + txtSearch + "%'";
        }

        if (priceSort != null && !priceSort.equals("")) {
            switch (priceSort) {
                case "< 5 triệu":
                    sql += " and p.price<=5000000";
                    break;
                case "5 - 10 triệu":
                    sql += " and p.price >=5000000 and p.price<=10000000";
                    break;
                case "10 - 15 triệu":
                    sql += " and p.price >=10000000 and p.price<=15000000";
                    break;
                case "15 - 30 triệu":
                    sql += " and p.price >=15000000 and p.price<=30000000";
                    break;
                case "> 30 triệu":
                    sql += " and p.price>=30000000";
                    break;
                default:
                    throw new AssertionError();
            }
        }
        if (cateName != null && !cateName.equals("")) {
            sql += " and c.CategoryName ='" + cateName + "'";
        }
        if (typeSort != null && !typeSort.equals("")) {
            switch (typeSort) {
                case "Newest":
                    sql += " order by p.ProductId desc";
                    break;
            }
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
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
            System.out.println(e);
        }
        return list;
    }

    public int getCountProductFilterBySQL(
            String txtSearch, String typeSort,
            String priceSort, String cateName
    ) {
        String sql = "select count(*) from Product p\n"
                + "join Category c on p.CategoryId=c.CategoryId\n"
                + "where 1=1";
        if (txtSearch != null && !txtSearch.equals("")) {
            sql += " and c.CategoryName like N'%" + txtSearch.trim() + "%'";
        }

        if (priceSort != null && !priceSort.equals("")) {
            switch (priceSort) {
                case "< 5 triệu":
                    sql += " and p.price<=5000000";
                    break;
                case "5 - 10 triệu":
                    sql += " and p.price >=5000000 and p.price<=10000000";
                    break;
                case "10 - 15 triệu":
                    sql += " and p.price >=10000000 and p.price<=15000000";
                    break;
                case "15 - 30 triệu":
                    sql += " and p.price >=15000000 and p.price<=30000000";
                    break;
                case "> 30 triệu":
                    sql += " and p.price>=30000000";
                    break;
                default:
                    throw new AssertionError();
            }
        }
        if (cateName != null && !cateName.equals("")) {
            sql += " and c.CategoryName ='" + cateName + "'";
        }
        if (typeSort != null && !typeSort.equals("")) {
            switch (typeSort) {
                case "Newest":
                    sql += " order by p.ProductId desc";
                    break;
            }
        }
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Product> getProductByTarget(int targetTop, String target) {
        List<Product> list = new ArrayList<>();
        String sql = "select top " + targetTop + " * from Product order by " + target + " desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
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

    public List<Product> searchEachPages(String txtSearch, int index, int size) {
        List<Product> list = new ArrayList<>();
        String sql = "WITH x as (SELECT ROW_NUMBER() over (order by Price asc) as RowNumber,* from Product where [name] like ?)\n"
                + "SELECT * FROM x  Where RowNumber between ? and ? ";

        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            st.setInt(2, index * size - (size - 1));
            st.setInt(3, index * size);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getString(11),
                        rs.getInt(12),
                        getImageByProductId(rs.getInt(2)));
                list.add(p);
            }

        } catch (SQLException e) {
        }

        return list;
    }

    public int count() {
        try {
            String sql = "SELECT COUNT(*) FROM Product";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }

        return 0;
    }

    public List<Product> getProductEachPage(int index, int size) {
        List<Product> list = new ArrayList<>();
        String sql = "WITH x as (SELECT ROW_NUMBER() over (order by Price asc) as RowNumber,* from Product)\n"
                + "SELECT * FROM x where RowNumber between ? and ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, index * size - (size - 1));
            st.setInt(2, index * size);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getString(11),
                        rs.getInt(12),
                        getImageByProductId(rs.getInt(2)));
                list.add(p);
            }
        } catch (SQLException e) {
        }

        return list;
    }

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

    public Product getCategoryByNameRam(String name, int capacity) {

        PreparedStatement st;
        ResultSet rs;
        try {
            String sql = "SELECT * FROM [dbo].[Product] where Name = ? and capacity = ?";
            st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, capacity);
            rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getInt(11),
                        getImageByProductId(rs.getInt(1)));
                return p;
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.err.println(e);
        }
        return null;
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
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

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String sql = "select *from Product\n"
                + "where [name] like ?";

        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
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

    public static void main(String[] args) {
        ProductDAO test = new ProductDAO();
        Product p = test.getProdctById(3);
        System.out.println(p.getName());
    }

    //CUONG
    public void insert(Product p, String image) {
        PreparedStatement stm, stm1;
        int proId;
        try {
            String sql = "INSERT INTO [dbo].[Product]\n"
                    + "           ([CategoryId]\n"
                    + "           ,[Name]\n"
                    + "           ,[Description]\n"
                    + "           ,[Quantity]\n"
                    + "           ,[Price]\n"
                    + "           ,[CreatedBy]\n"
                    + "           ,[CreatedOn]\n"
                    + "           ,[Capacity])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?,?)";
            stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, p.getCategoryId());
            stm.setString(2, p.getName());
            stm.setString(3, p.getDescription());
            stm.setInt(4, p.getQuantity());
            stm.setDouble(5, p.getPrice());
            stm.setInt(6, p.getCreatedby());
            stm.setString(7, p.getCreatedOn());
            stm.setInt(8, p.getCapacity());
            int n = stm.executeUpdate();
            if (n > 0) {
                ResultSet generatedKeys = stm.getGeneratedKeys();
                if (generatedKeys.next()) {
                    proId = generatedKeys.getInt(1);  // Retrieve the generated account ID
                    String sql1 = "INSERT INTO [dbo].[ProductImage]\n"
                            + "           ([ImagePath]\n"
                            + "           ,[CreatedOn]\n"
                            + "           ,[ProductId])\n"
                            + "     VALUES\n"
                            + "           (?,?,?)";
                    stm1 = connection.prepareStatement(sql1);

                    stm1.setString(1, image);
                    stm1.setString(2, date);
                    stm1.setInt(3, proId);
                    stm1.executeUpdate();
                    stm1.close();
                }

            }

            stm.close();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void delete(int id) {
        String sql1 = "DELETE FROM ProductImage WHERE ProductId = ?";
        try {
            PreparedStatement stm1 = connection.prepareStatement(sql1);
            stm1.setInt(1, id);
            stm1.executeUpdate();
            stm1.close();
        } catch (SQLException e) {
            System.out.println(e);
        }

        String sql = "DELETE FROM [Product] WHERE ProductId=?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
            stm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(Product p, String image) {
        String sql1 = "UPDATE [dbo].[ProductImage]\n"
                + "   SET [ImagePath] = ?          \n"
                + " WHERE ProductId = ?";
        try {
            PreparedStatement stm1 = connection.prepareStatement(sql1);
            stm1.setString(1, image);
            stm1.setInt(2, p.getProductId());
            stm1.executeUpdate();
        } catch (SQLException e) {

        }

        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [CategoryId] = ?\n"
                + "      ,[Name] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[Quantity] = ?\n"
                + "      ,[Price] = ?\n"
                + "      ,[CreatedBy] = ?\n"
                + "      ,[CreatedOn] = ?\n"
                + "      ,[ModifiedBy] = ?\n"
                + "      ,[ModifiedOn] = ?\n"
                + "      ,[Capacity]=?\n"
                + " WHERE [productID] = ? ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, p.getCategoryId());
            stm.setString(2, p.getName());
            stm.setString(3, p.getDescription());
            stm.setInt(4, p.getQuantity());
            stm.setDouble(5, p.getPrice());
            stm.setInt(6, p.getCreatedby());
            stm.setString(7, p.getCreatedOn());
            stm.setInt(8, p.getModifiedBy());
            stm.setString(9, p.getModifiedOn());
            stm.setInt(10, p.getCapacity());
            stm.setInt(11, p.getProductId());
            stm.executeUpdate();
            stm.close();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Product getProdctById(int id) {
        String sql = "select * from Product where ProductId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getInt(11),
                        getImageByProductId(id));
                return p;
            }

        } catch (SQLException e) {
        }

        return null;
    }

    public List<Product> getProdctByCategoryId(int pid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where CategoryId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
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
}
