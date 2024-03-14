/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import model.News;

/**
 *
 * @author nobod
 */
public class NewsDAO extends DBContext {

    public List<News> getAllNews(int index, int pageSize) {
        List<News> list = new ArrayList<>();
        try {
            String sql = "Select n.NewsId, n.Title, n.Description, n.heading, a.FirstName, a.LastName, g.NewsGroupId, g.NewsGroupName,\n"
                    + "n.image, n.CreatedBy, n.CreatedOn, n.ModifiedBy, n.ModifiedOn	\n"
                    + "From News n\n"
                    + "Join NewsGroup g On n.NewsGroupId = g.NewsGroupId\n"
                    + "Join Admin a On g.CreatedBy = a.CreatedBy\n"
                    + "Order By NewsId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * pageSize);
            ps.setInt(2, pageSize);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                News n = new News();
                n.setNewsId(rs.getInt(1));
                n.setTitle(rs.getString(2));
                n.setDescription(rs.getString(3));
                n.setHeading(rs.getString(4));
                n.setFirstName(rs.getString(5));
                n.setLastName(rs.getString(6));
                n.setNewGroupId(rs.getInt(7));
                n.setNewGroupname(rs.getString(8));
                n.setImage(rs.getString(9));
                n.setCreatedby(rs.getInt(10));
                n.setCreatedOn(rs.getString(11));
                n.setModifiedBy(rs.getInt(12));
                n.setModifiedOn(rs.getString(13));
                list.add(n);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public News getNewById(int newId) {
        News n = new News();
        String sql = "Select n.NewsId, n.Title, n.Description, n.heading, a.FirstName, a.LastName, g.NewsGroupId, g.NewsGroupName,\n"
                + "n.image, n.CreatedBy, n.CreatedOn, n.ModifiedBy, n.ModifiedOn\n"
                + "From News n\n"
                + "Join NewsGroup g On n.NewsGroupId = g.NewsGroupId\n"
                + "Join Admin a On g.CreatedBy = a.CreatedBy\n"
                + "Where n.NewsId = ?";
        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, newId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                n.setNewsId(rs.getInt(1));
                n.setTitle(rs.getString(2));
                n.setDescription(rs.getString(3));
                n.setHeading(rs.getString(4));
                n.setFirstName(rs.getString(5));
                n.setLastName(rs.getString(6));
                n.setNewGroupId(rs.getInt(7));
                n.setNewGroupname(rs.getString(8));
                n.setImage(rs.getString(9));
                n.setCreatedby(rs.getInt(10));
                n.setCreatedOn(rs.getString(11));
                n.setModifiedBy(rs.getInt(12));
                n.setModifiedOn(rs.getString(13));
            }
        } catch (SQLException e) {
        }
        return n;
    }

    

    public List<News> getNewsByGroupId(int newGroupId, int index, int pageSize, int none) {
        List<News> list = new ArrayList<>();
        String sql = "Select n.NewsId, n.Title, n.Description, n.heading, a.FirstName, a.LastName, g.NewsGroupId, g.NewsGroupName,\n"
                + "n.image, n.CreatedBy, n.CreatedOn, n.ModifiedBy, n.ModifiedOn\n"
                + "From News n\n"
                + "Join NewsGroup g On n.NewsGroupId = g.NewsGroupId\n"
                + "Join Admin a On g.CreatedBy = a.CreatedBy\n"
                + "Where g.NewsGroupId = ?\n"
                + "AND n.NewsId <> ?\n"
                + "Order By NewsId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, newGroupId);
            ps.setInt(2, none);
            ps.setInt(3, (index - 1) * pageSize);
            ps.setInt(4, pageSize);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                News n = new News();
                n.setNewsId(rs.getInt(1));
                n.setTitle(rs.getString(2));
                n.setDescription(rs.getString(3));
                n.setHeading(rs.getString(4));
                n.setFirstName(rs.getString(5));
                n.setLastName(rs.getString(6));
                n.setNewGroupId(rs.getInt(7));
                n.setNewGroupname(rs.getString(8));
                n.setImage(rs.getString(9));
                n.setCreatedby(rs.getInt(10));
                n.setCreatedOn(rs.getString(11));
                n.setModifiedBy(rs.getInt(12));
                n.setModifiedOn(rs.getString(13));
                list.add(n);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public static void main(String[] args) {
        NewsDAO dao = new NewsDAO();
        List<News> list = dao.getNewsByGroupId(1, 1, 6, 6);
      
//        int gr = dao.getRecommendByNews(6);
        System.out.println(list);
        

    }

    public int getTotalNewsoGroup(int grId) {
        String sql = "select COUNT(*) from News Where NewsGroupId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, grId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return 0;
    }

    public int getTotalNews() {
        String sql = "select COUNT(*) from News ";
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

    public void addNews(News n) {
        PreparedStatement st;
        try {
            String sql = "INSERT INTO [dbo].[News]\n"
                    + "           ([Title]\n"
                    + "           ,[Description]\n"
                    + "           ,[NewsGroupId]\n"
                    + "           ,[heading]\n"
                    + "           ,[image]\n"
                    + "           ,[CreatedBy]\n"
                    + "           ,[CreatedOn])\n" // Thêm dấu đóng ngoặc cho danh sách cột
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?)";

            st = connection.prepareStatement(sql);
            st.setString(1, n.getTitle());
            st.setString(2, n.getDescription());
            st.setInt(3, n.getNewGroupId());
            st.setString(4, n.getHeading());
            st.setString(5, n.getImage());
            st.setInt(6, n.getCreatedby());
            st.setString(7, n.getCreatedOn());

            // Thực hiện thêm dữ liệu vào cơ sở dữ liệu
            int rowsAffected = st.executeUpdate();

            // Đóng tài nguyên PreparedStatement sau khi sử dụng
            st.close();

//            if (rowsAffected > 0) {
//                System.out.println("Dữ liệu đã được thêm thành công.");
//            } else {
//                System.out.println("Thêm dữ liệu không thành công.");
//            }
        } catch (SQLException e) {
            // Xử lý SQLException
            // hoặc ghi log cho ngoại lệ

        }
    }

    public void updateNews(News n) {

        String sql = "UPDATE [dbo].[News]\n"
                + "   SET [Title] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[NewsGroupId] = ?\n"
                + "      ,[heading] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[ModifiedBy] = ?\n"
                + "      ,[ModifiedOn] = ?\n"
                + " WHERE NewsId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, n.getTitle());
            st.setString(2, n.getDescription());
            st.setInt(3, n.getNewGroupId());
            st.setString(4, n.getHeading());
            st.setString(5, n.getImage());
            st.setInt(6, n.getModifiedBy());
            st.setString(7, n.getModifiedOn());
            st.setInt(8, n.getNewsId());
            st.executeUpdate();
            st.close();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getCountNewsSearch(String textSearch) {
        
        String[] keywords = textSearch.split("\\s+");

        // Xây dựng điều kiện tìm kiếm trong SQL
        StringBuilder conditionBuilder = new StringBuilder();
        for (String keyword : keywords) {
            if (!keyword.isEmpty()) {
                if (conditionBuilder.length() > 0) {
                    conditionBuilder.append(" OR ");
                }
                conditionBuilder.append("n.Title LIKE N'%" + keyword + "%' OR g.NewsGroupName LIKE N'%" + keyword + "%'");
            }
        }
        String sql = "select COUNT(*)" 
                + "From News n\n"
                + "Join NewsGroup g On n.NewsGroupId = g.NewsGroupId\n"
                + "Join Admin a On g.CreatedBy = a.CreatedBy\n"
                + "WHERE " + conditionBuilder.toString() + "";
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
    
    
    public List<News> getNewsByTittle(String textSearch,int index, int pageSize) {
        List<News> list;
        list = new ArrayList<>();

        // Tách chuỗi thành mảng các từ khóa
        String[] keywords = textSearch.split("\\s+");

        // Xây dựng điều kiện tìm kiếm trong SQL
        StringBuilder conditionBuilder = new StringBuilder();
        for (String keyword : keywords) {
            if (!keyword.isEmpty()) {
                if (conditionBuilder.length() > 0) {
                    conditionBuilder.append(" OR ");
                }
                conditionBuilder.append("n.Title LIKE N'%" + keyword + "%' OR g.NewsGroupName LIKE N'%" + keyword + "%'");
            }
        }
//        n.Title like N'%" + textSearch + "%' or g.NewsGroupName like N'%" + textSearch + "%'\n";
        
        String sql = "Select n.NewsId, n.Title, n.Description, n.heading, a.FirstName, a.LastName, g.NewsGroupId, g.NewsGroupName,\n"
                + "n.image, n.CreatedBy, n.CreatedOn, n.ModifiedBy, n.ModifiedOn\n"
                + "From News n\n"
                + "Join NewsGroup g On n.NewsGroupId = g.NewsGroupId\n"
                + "Join Admin a On g.CreatedBy = a.CreatedBy\n"
                + "WHERE " + conditionBuilder.toString() + " "
                + "Order By n.NewsId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * pageSize);
            ps.setInt(2, pageSize);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                News n = new News();
                n.setNewsId(rs.getInt(1));
                n.setTitle(rs.getString(2));
                n.setDescription(rs.getString(3));
                n.setHeading(rs.getString(4));
                n.setFirstName(rs.getString(5));
                n.setLastName(rs.getString(6));
                n.setNewGroupId(rs.getInt(7));
                n.setNewGroupname(rs.getString(8));
                n.setImage(rs.getString(9));
                n.setCreatedby(rs.getInt(10));
                n.setCreatedOn(rs.getString(11));
                n.setModifiedBy(rs.getInt(12));
                n.setModifiedOn(rs.getString(13));
                list.add(n);
            }
            
        } catch (SQLException e) {
            System.out.println("SQL Query: " + sql);
            e.printStackTrace();
        }
        return list;
    }
    
    

    public void delete(int id) {
        String sql = "DELETE FROM News WHERE NewsId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
            stm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public int getRecommendByNews(int newsId){
        int grId = 0;
        String sql = "Select n.NewsId, g.NewsGroupId\n"
                + "From News n\n"
                + "Join NewsGroup g On n.NewsGroupId = g.NewsGroupId\n"
                + "Where n.NewsId = ?\n";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, newsId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                grId = rs.getInt(2);
            }
        } catch (SQLException e) {
        }
        return grId;
    }
    
    
}
