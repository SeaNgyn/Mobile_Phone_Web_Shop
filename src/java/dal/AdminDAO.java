/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Admin;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nobod
 */
public class AdminDAO extends DBContext {

    public List<Admin> getAll() {

        PreparedStatement stm = null;
        ResultSet rs = null;
        List<Admin> list = new ArrayList<>();
        try {
            String sql = "SELECT [AdminId]\n"
                    + "      ,[FirstName]\n"
                    + "      ,[LastName]\n"
                    + "      ,[UserName]\n"
                    + "      ,[Password]\n"
                    + "      ,[RoleId]\n"
                    + "      ,[Email]\n"
                    + "      ,[CreatedBy]\n"
                    + "      ,[CreatedOn]\n"
                    + "      ,[ModifiedBy]\n"
                    + "      ,[ModifiedOn]\n"
                    + "  FROM [dbo].[Admin]";

            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Admin c = new Admin();
                c.setAdminId(rs.getInt(1));
                c.setFirstname(rs.getString(2));
                c.setLastname(rs.getString(3));
                c.setUsername(rs.getString(4));
                c.setPassword(rs.getString(5));
                c.setRoleId(rs.getInt(6));
                c.setEmail(rs.getString(7));
                c.setCreatedById(rs.getInt(8));
                c.setCreatedOn(rs.getString(9));
                c.setModifiedBy(rs.getInt(10));
                c.setModifiedOn(rs.getString(11));
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
            String sql = "SELECT COUNT(*) FROM Admin";
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
    public List<Admin> getAdminEachPage(int index, int size) {
        List<Admin> list = new ArrayList<>();
        String sql = " WITH x AS (\n"
                + "    SELECT \n"
                + "        ROW_NUMBER() OVER (ORDER BY a.CreatedOn ASC) AS RowNumber,\n"
                + "        a.AdminId, a.FirstName, a.LastName, a.UserName, \n"
                + "        a.Password, r.RoleName, a.Email, a.CreatedBy, \n"
                + "        a.CreatedOn, a.ModifiedBy, a.ModifiedOn, \n"
                + "        b.FirstName AS CreatedByFirstName\n"              
                + "    FROM \n"
                + "        Admin a \n"
                + "        JOIN Admin b ON a.CreatedBy = b.AdminId\n"
                + "        JOIN Role r ON a.RoleId = r.RoleId\n"
                + ")\n"
                + "  SELECT * FROM x where RowNumber between ? and ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, index * size - (size - 1));
            st.setInt(2, index * size);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Admin c = new Admin();
                c.setAdminId(rs.getInt(2));
                c.setFirstname(rs.getString(3));
                c.setLastname(rs.getString(4));
                c.setUsername(rs.getString(5));
                c.setPassword(rs.getString(6));
                c.setRoleName(rs.getString(7));
                c.setEmail(rs.getString(8));
                c.setCreatedById(rs.getInt(9));
                c.setCreatedOn(rs.getString(10));
                c.setModifiedBy(rs.getInt(11));
                c.setModifiedOn(rs.getString(12));
                c.setCreatedName(rs.getString(13));
                list.add(c);
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
        }

        return list;
    }
    
    //CUONG
    public List<Admin> searchEachPages(String txtSearch, int index, int size) {
        List<Admin> list = new ArrayList<>();
        String sql = "WITH x as (SELECT ROW_NUMBER() over (order by CreatedOn asc) as RowNumber,* from Admin where [UserName] like ?)\n"
                + "SELECT * FROM x  Where RowNumber between ? and ? ";

        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            st.setInt(2, index * size - (size - 1));
            st.setInt(3, index * size);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Admin c = new Admin();
                c.setAdminId(rs.getInt(2));
                c.setFirstname(rs.getString(3));
                c.setLastname(rs.getString(4));
                c.setUsername(rs.getString(5));
                c.setPassword(rs.getString(6));
                c.setRoleId(rs.getInt(7));
                c.setEmail(rs.getString(8));
                c.setCreatedById(rs.getInt(9));
                c.setCreatedOn(rs.getString(10));
                c.setModifiedBy(rs.getInt(11));
                c.setModifiedOn(rs.getString(12));
                list.add(c);
            }
            rs.close();
            st.close();

        } catch (SQLException e) {
        }

        return list;
    }

    public void insert(Admin p) {

        PreparedStatement stm;
        try {
            String sql = "INSERT INTO [dbo].[Admin]\n"
                    + "           ([FirstName]\n"
                    + "           ,[LastName]\n"
                    + "           ,[UserName]\n"
                    + "           ,[Password]\n"
                    + "           ,[RoleId]\n"
                    + "           ,[Email]\n"
                    + "           ,[CreatedBy]\n"
                    + "           ,[CreatedOn])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?,?)";
            stm = connection.prepareStatement(sql);
            stm.setString(1, p.getFirstname());
            stm.setString(2, p.getLastname());
            stm.setString(3, p.getUsername());
            stm.setString(4, p.getPassword());
            stm.setInt(5, p.getRoleId());
            stm.setString(6, p.getEmail());
            stm.setInt(7, p.getCreatedById());
            stm.setString(8, p.getCreatedOn());
            stm.executeUpdate();
            stm.close();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public static void main(String[] args) {
        try {
            AdminDAO dao = new AdminDAO();
            Admin a = dao.getAll().get(1);
            System.out.println(a.getCreatedOn());
        } catch (Exception e) {
            System.err.println(e);
        }
    }

    public void update(Admin p) {

        String sql = "UPDATE [dbo].[Admin]\n"
                + "   SET [FirstName] = ?\n"
                + "      ,[LastName] = ?\n"
                + "      ,[UserName] = ?\n"
                + "      ,[Password] = ?\n"
                + "      ,[RoleId] = ?\n"
                + "      ,[Email] = ?\n"
                + "      ,[ModifiedBy] = ?\n"
                + "      ,[ModifiedOn] = ?\n"
                + " WHERE AdminId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, p.getFirstname());
            stm.setString(2, p.getLastname());
            stm.setString(3, p.getUsername());
            stm.setString(4, p.getPassword());
            stm.setInt(5, p.getRoleId());
            stm.setString(6, p.getEmail());
            stm.setInt(7, p.getModifiedBy());
            stm.setString(8, p.getModifiedOn());
            stm.setInt(9, p.getAdminId());
            stm.executeUpdate();
            stm.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Admin getCheckUser(String username) {

        PreparedStatement st;
        ResultSet rs;
        try {
            String sql = "SELECT * FROM [dbo].[Admin] where UserName = ? ";
            st = connection.prepareStatement(sql);
            st.setString(1, username);
            rs = st.executeQuery();
            if (rs.next()) {
                Admin c = new Admin(rs.getInt("AdminId"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getInt("RoleId"),
                        rs.getString("Email"),
                        rs.getInt("CreatedBy"),
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

    public Admin getCategoryById(int adminid) {

        PreparedStatement st;
        ResultSet rs;
        try {
            String sql = "select * from [Admin] where AdminId = ?";
            st = connection.prepareStatement(sql);
            st.setInt(1, adminid);
            rs = st.executeQuery();
            if (rs.next()) {
                Admin c = new Admin(
                        rs.getInt("AdminId"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getInt("RoleId"),
                        rs.getString("Email"),
                        rs.getInt("CreatedBy"),
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

    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[Admin] WHERE AdminId=?";
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
