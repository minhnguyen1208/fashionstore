/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author tinit
 */
public class CategoryDAO {

    public List<CategoryDTO> getAllCategory() {
        List<CategoryDTO> listCategory = new ArrayList<>();
        String sql = "SELECT * FROM Category";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("categoryID");
                String categoryName = rs.getString("categoryName");
                CategoryDTO category = new CategoryDTO(id, categoryName);
                listCategory.add(category);
                
            }
            return listCategory;
        } catch (Exception e) {
        }
        return null;
    }
}
