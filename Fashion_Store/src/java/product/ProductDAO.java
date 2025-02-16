/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author tiepk
 */
public class ProductDAO {

    public List<ProductDTO> listProduct() {

        List<ProductDTO> listProduct = new ArrayList<>();
        String sql = "SELECT productID, productName, price, quantity, description, categoryID, status, img, size FROM Product";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                listProduct.add(new ProductDTO(rs.getLong("productID"), rs.getString("productName"), rs.getFloat("price"),
                        rs.getInt("quantity"), rs.getString("description"), rs.getLong("categoryID"), rs.getBoolean("status"),
                        rs.getString("img"), rs.getString("size")));
            }
            return listProduct;

        } catch (Exception ex) {
            System.err.println("Query Product wrong" + ex);
        }

        return null;
    }

    public List<ProductDTO> listProductByCategoryId(int categoryId) {

        List<ProductDTO> listProduct = new ArrayList<>();
        String sql = "SELECT productID, productName, price, quantity, description, categoryName, status, img, size FROM Product WHERE categoryID = ?";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ps.setInt(1, categoryId);

            while (rs.next()) {
                listProduct.add(new ProductDTO(rs.getLong("productID"), rs.getString("productName"), rs.getFloat("price"),
                        rs.getInt("quantity"), rs.getString("description"), rs.getLong("categoryID"), rs.getBoolean("status"),
                        rs.getString("img"), rs.getString("size")));
            }
            return listProduct;

        } catch (Exception ex) {
            System.err.println("Query Product wrong" + ex);
        }

        return null;
    }

    public int getTotalProduct() {
        String sql = "SELECT count(*) FROM Product";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }

        return 0;
    }
    
     public int getTotalProductByCategory(int categoryId) {
        String sql = "SELECT count(*) FROM Product WHERE categoryID = ?";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }

        return 0;
    }

    public List<ProductDTO> pagingProduct(int index) {
        List<ProductDTO> list = new ArrayList<>();
        String sql = "select * from Product \n"
                + "order by productID\n"
                + "OFFSET ? rows fetch next 6 rows only;";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 6);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductDTO(rs.getLong("productID"), rs.getString("productName"), rs.getFloat("price"),
                        rs.getInt("quantity"), rs.getString("description"), rs.getLong("categoryID"), rs.getBoolean("status"),
                        rs.getString("img"), rs.getString("size")));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<ProductDTO> pagingProductByCategoryId(int index, int categoryId) {
        List<ProductDTO> list = new ArrayList<>();
        String sql = "select * from Product WHERE categoryID = ? \n"
                + "order by productID\n"
                + "OFFSET ? rows fetch next 6 rows only;";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ps.setInt(2, (index - 1) * 6);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductDTO(rs.getLong("productID"), rs.getString("productName"), rs.getFloat("price"),
                        rs.getInt("quantity"), rs.getString("description"), rs.getLong("categoryID"), rs.getBoolean("status"),
                        rs.getString("img"), rs.getString("size")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<ProductDTO> getAllProductByCategoryId(int categoryId) {
        List<ProductDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE categoryId = ?";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductDTO(rs.getLong("productID"), rs.getString("productName"), rs.getFloat("price"),
                        rs.getInt("quantity"), rs.getString("description"), rs.getLong("categoryID"), rs.getBoolean("status"),
                        rs.getString("img"), rs.getString("size")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ProductDTO getProductById(Long id) throws Exception {

        String sql = "SELECT productID, productName, price, quantity, description, categoryID, status, img, size FROM Product WHERE productID = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new ProductDTO(rs.getLong("productID"), rs.getString("productName"), rs.getFloat("price"),
                        rs.getInt("quantity"), rs.getString("description"), rs.getLong("categoryID"), rs.getBoolean("status"),
                        rs.getString("img"), rs.getString("size"));
            }
        } catch (SQLException ex) {
            System.out.println("Query load Product error!" + ex.getMessage());
        }
        return null;
    }

    public boolean insert(ProductDTO newProduct) throws Exception {
        String sql = "INSERT INTO Product (productName, price, quantity, description, categoryID, status, img, size) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
       
        try {

            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, newProduct.getProductName());
            ps.setFloat(2, newProduct.getPrice());
            ps.setInt(3, newProduct.getQuantity());
            ps.setString(4, newProduct.getDescription());
            ps.setLong(5, newProduct.getCategoryId());
            ps.setBoolean(6, newProduct.getStatus());
            ps.setString(7, newProduct.getImg());
            ps.setString(8, newProduct.getSize());
            
            int row = ps.executeUpdate();

            if (row > 0) {
                return true;
            }

        } catch (SQLException ex) {
            System.err.println("Query Insert Product error" + ex);
        }
        return false;
    }

    public boolean update(ProductDTO product) throws Exception {

        String sql = "UPDATE Product SET productName = ?, price = ?, quantity = ?, description = ?, categoryID = ?, status = ?, img = ?, size = ? WHERE productID = ?";

        try {

            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, product.getProductName());
            ps.setFloat(2, product.getPrice());
            ps.setInt(3, product.getQuantity());
            ps.setString(4, product.getDescription());
            ps.setLong(5, product.getCategoryId());
            ps.setInt(6, 0);
            ps.setString(7, product.getImg());
            ps.setString(8, product.getSize());
            ps.setLong(9, product.getId());

            int row = ps.executeUpdate();

            if (row > 0) {
                return true;
            }

        } catch (SQLException ex) {
            System.err.println("Query Update fail" + ex);
        }

        return false;
    }

    public boolean delete(Long id) throws Exception {

        String sql = "DELETE FROM Product WHERE productID = ?";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setLong(1, id);

            int row = ps.executeUpdate();

            if (row > 0) {
                return true;
            }

        } catch (SQLException ex) {
            System.err.println("Delete Error:" + ex);
        }

        return false;
    }
}
