/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orderDetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author tinit
 */
public class orderDetailsDAO {

    public List<orderDetailsDTO> getListOrderDetail(int orderId) throws Exception {
        String sql = "SELECT OD.*, P.productName, P.img, O.status FROM OrderDetails OD\n"
                + "JOIN Product P ON OD.productId = P.productId\n"
                + "JOIN [Order] O ON OD.orderID = O.orderID\n"
                + "WHERE OD.orderId = ?";
        List<orderDetailsDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("orderDetailsID");
                int productId = rs.getInt("productID");
                String address = rs.getString("address");
                String phoneNumber = rs.getString("phoneNumber");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                String productName = rs.getString("productName");
                String img = rs.getString("img");
                String status = rs.getString("status");
                list.add(new orderDetailsDTO(id, productId, quantity, phoneNumber, address, price, productName, img, status));
            }
            return list;
        } catch (SQLException e) {
            System.out.println("Error" + e.getMessage());
        }
        return null;
    }
}
