/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CommentNews;

/**
 *
 * @author nobod
 */
public class CommentNewsDAO extends DBContext {
    
    //CUONG
    public CommentNews getCmtByCusId(int cusId) {
        CommentNews cn = new CommentNews();
        String sql = "SELECT [CommentID]\n"
                + "      ,[Content]\n"
                + "      ,[Star]\n"
                + "      ,[CreatedBy]\n"
                + "      ,[CreatedOn]\n"
                + "      ,[ModifiedBy]\n"
                + "      ,[ModifiedOn]\n"
                + "      ,[NewsId]\n"
                + "  FROM [dbo].[CommentNews]\n"
                + "  Where [CreatedBy] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cusId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                cn.setCmtId(rs.getInt(1));
                cn.setContent(rs.getString(2));
                cn.setStar(rs.getInt(3));
                cn.setCreatedby(rs.getInt(4));
                cn.setCreatedOn(rs.getString(5));
                cn.setModifiedBy(rs.getInt(6));
                cn.setModifiedOn(rs.getString(7));
                cn.setNewsId(rs.getInt(8));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cn;
    }
    //CUONG
    public List<Integer> getAllStar(int newsId) {
        List<Integer> list = new ArrayList<>();
        String sql = "SELECT [Star]\n"
                + "  FROM [PhoneStoreWeb].[dbo].[CommentNews]\n"
                + "  Where [NewsId]= ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, newsId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int star = rs.getInt(1);
                list.add(star);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<CommentNews> getAllComment() {
        List<CommentNews> list = new ArrayList<>();
        String sql = "SELECT cmt.[CommentID]\n"
                + "      ,cmt.[Content]\n"
                + "      ,cmt.[Star]\n"
                + "      ,cmt.[CreatedBy]\n"
                + "      ,cmt.[CreatedOn]\n"
                + "      ,cmt.[ModifiedBy]\n"
                + "      ,cmt.[ModifiedOn]\n"
                + "      ,cmt.[NewsId]\n"
                + "	  ,c.FullName\n"
                + "  FROM [CommentNews] cmt\n"
                + "  Join Customer c on cmt.CreatedBy = c.CustomerId\n";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CommentNews cn = new CommentNews();
                cn.setCmtId(rs.getInt(1));
                cn.setContent(rs.getString(2));
                cn.setStar(rs.getInt(3));
                cn.setCreatedby(rs.getInt(4));
                cn.setCreatedOn(rs.getString(5));
                cn.setModifiedBy(rs.getInt(6));
                cn.setModifiedOn(rs.getString(7));
                cn.setNewsId(rs.getInt(8));
                cn.setCusName(rs.getString(9));
                list.add(cn);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<CommentNews> getAllCommentById(int newsId) {
        List<CommentNews> list = new ArrayList<>();
        String sql = "SELECT cmt.[CommentID]\n"
                + "      ,cmt.[Content]\n"
                + "      ,cmt.[Star]\n"
                + "      ,cmt.[CreatedBy]\n"
                + "      ,cmt.[CreatedOn]\n"
                + "      ,cmt.[ModifiedBy]\n"
                + "      ,cmt.[ModifiedOn]\n"
                + "      ,cmt.[NewsId]\n"
                + "	  ,c.FullName\n"
                + "  FROM [CommentNews] cmt\n"
                + "  Join Customer c on cmt.CreatedBy = c.CustomerId\n"
                + "  Where cmt.[NewsId] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, newsId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CommentNews cn = new CommentNews();
                cn.setCmtId(rs.getInt(1));
                cn.setContent(rs.getString(2));
                cn.setStar(rs.getInt(3));
                cn.setCreatedby(rs.getInt(4));
                cn.setCreatedOn(rs.getString(5));
                cn.setModifiedBy(rs.getInt(6));
                cn.setModifiedOn(rs.getString(7));
                cn.setNewsId(rs.getInt(8));
                cn.setCusName(rs.getString(9));
                list.add(cn);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        CommentNewsDAO dao = new CommentNewsDAO();
        List<CommentNews> list = dao.getAllCommentById(6);

        System.out.print(list);
    }

    public void addCommentNews(CommentNews c) {

        String sql = "INSERT INTO [dbo].[CommentNews]\n"
                + "           ([Content]\n"
                + "           ,[Star]\n"
                + "           ,[CreatedBy]\n"
                + "           ,[CreatedOn]\n"
                + "           ,[NewsId])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getContent());
            st.setInt(2, c.getStar());
            st.setInt(3, c.getCreatedby());
            st.setString(4, c.getCreatedOn());
            st.setInt(5, c.getNewsId());

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
            System.out.println("SQL Query: " + sql);
            e.printStackTrace();
        }
    }

    public void editCommentNews(CommentNews c) {
        String sql = "UPDATE [dbo].[CommentNews]\n"
                + "   SET [Content] = ?\n"
                + "      ,[Star] = ?\n"
                + "      ,[ModifiedBy] = ?\n"
                + "      ,[ModifiedOn] = ?\n"
                + "      ,[NewsId] = ?\n"
                + " WHERE CommentID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getContent());
            st.setInt(2, c.getStar());
            st.setInt(3, c.getModifiedBy());
            st.setString(4, c.getModifiedOn());
            st.setInt(5, c.getNewsId());
            st.setInt(6, c.getCmtId());
            // Thực hiện thêm dữ liệu vào cơ sở dữ liệu
            int rowsAffected = st.executeUpdate();

            // Đóng tài nguyên PreparedStatement sau khi sử dụng
            st.close();

//            if (rowsAffected > 0) {
//                System.out.println("Dữ liệu đã được sửa thành công.");
//            } else {
//                System.out.println("Sửa dữ liệu không thành công.");
//            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void delete(int cmtId) {
        String sql = "DELETE FROM [dbo].[CommentNews] WHERE CommentID = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cmtId);
            stm.executeUpdate();
            stm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    
    
    
}
