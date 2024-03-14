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
import model.New;

/**
 *
 * @author nobod
 */
public class NewDAO extends DBContext {

    public List<New> getAllNews(int index, int pageSize) {
        List<New> list = new ArrayList<>();
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
                New n = new New();
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

    public New getNewById(int newId) {
        New n = new New();
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

    public List<New> getNewsByGroupId(int newGroupId, int index, int pageSize) {
        List<New> list = new ArrayList<>();
        String sql = "Select n.NewsId, n.Title, n.Description, n.heading, a.FirstName, a.LastName, g.NewsGroupId, g.NewsGroupName,\n"
                + "n.image, n.CreatedBy, n.CreatedOn, n.ModifiedBy, n.ModifiedOn\n"
                + "From News n\n"
                + "Join NewsGroup g On n.NewsGroupId = g.NewsGroupId\n"
                + "Join Admin a On g.CreatedBy = a.CreatedBy\n"
                + "Where g.NewsGroupId = ?\n"
                + "Order By NewsId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, newGroupId);
            ps.setInt(2, (index - 1) * pageSize);
            ps.setInt(3, pageSize);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                New n = new New();
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

    public static void main(String[] args) {
        NewDAO dao = new NewDAO();
        List<New> list = dao.getAllNews(1, 2);
        New n = dao.getNewById(11);
        New n1 = dao.getNewById(12);
        List<New> listGroup = dao.getNewsByGroupId(1, 1, 2);
        System.out.print(listGroup);
    }
}
