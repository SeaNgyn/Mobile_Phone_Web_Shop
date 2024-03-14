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
import model.Role;

/**
 *
 * @author nobod
 */
public class RoleDAO extends DBContext {

    public List<Role> getAllRole() {
        List<Role> list = new ArrayList<>();
        try {
            String sql = "SELECT [RoleId]\n"
                    + "      ,[Rolename]\n"
                    + "      ,[Description]\n"
                    + "      ,[CreatedBy]\n"
                    + "      ,[CreatedOn]\n"
                    + "      ,[ModifiedBy]\n"
                    + "      ,[ModifiedOn]\n"
                    + "  FROM [dbo].[Role]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setRoleId(rs.getInt(1));
                r.setRoleName(rs.getString(2));               
                list.add(r);
            }
            rs.close();
            stm.close();
        } catch (SQLException e) {
        }
        return list;
    }
}
