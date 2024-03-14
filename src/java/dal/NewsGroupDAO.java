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
import model.NewsGroup;

/**
 *
 * @author nobod
 */
public class NewsGroupDAO extends DBContext {

    public List<NewsGroup> getAllNewsGroup() {
        List<NewsGroup> list = new ArrayList<>();            
        String sql = "SELECT [NewsGroupId]\n"
                + "      ,[NewsGroupName]\n"
                + "      ,[CreatedBy]\n"
                + "      ,[CreatedOn]\n"
                + "      ,[ModifiedBy]\n"
                + "      ,[ModifiedOn]\n"
                + "  FROM [dbo].[NewsGroup]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                NewsGroup n = new NewsGroup();
                n.setNewsGroupId(rs.getInt(1));
                n.setNewsGroupName(rs.getString(2));
                list.add(n);
            }
        } catch (SQLException e) {
        }
        return list;
    }
}
