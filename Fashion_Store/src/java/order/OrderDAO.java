/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

import account.AccountDTO;
import cart.Cart;
import item.Item;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author tinit
 */
public class OrderDAO {

    public void addOrder(AccountDTO account, Cart cart) throws Exception, SQLException {
        LocalDate currentDate = java.time.LocalDate.now();
        Date date = Date.valueOf(currentDate);
        try {
            Connection con = DBUtils.getConnection();
            String sql = "INSERT INTO [Order] (accountID, date, totalMoney, status) VALUES (?, ?, ?, N'Processing')";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, account.getId());
            ps.setDate(2, date);
            ps.setDouble(3, cart.getTotalMoney());
            int rowsAffected = ps.executeUpdate(); // Use executeUpdate() here

            if (rowsAffected > 0) {
                //Get id of Order vừa add
                String sqll = "SELECT TOP 1 orderID FROM [Order] ORDER BY orderID DESC";
                PreparedStatement pss = con.prepareStatement(sqll);
                ResultSet rs = pss.executeQuery();

                // Add to OrderDetails
                if (rs.next()) {
                    int orderID = rs.getInt(1);
                    for (Item i : cart.getItems()) {
                        String sql2 = "INSERT INTO [OrderDetails] (address, phoneNumber, quantity, price, productID, orderID) VALUES (?, ?, ?, ?, ?, ?)";
                        PreparedStatement ps2 = con.prepareStatement(sql2);
                        ps2.setString(1, account.getAddress());
                        ps2.setString(2, account.getPhoneNumber());
                        ps2.setInt(3, i.getQuantity());
                        ps2.setDouble(4, i.getPrice());
                        ps2.setLong(5, i.getProduct().getId());
                        ps2.setInt(6, orderID);
                        ps2.executeUpdate(); // Use executeUpdate() here

                        String updateProductQtySql = "UPDATE Product SET quantity = quantity - ? WHERE productID = ?";
                        PreparedStatement updateProductQtyPs = con.prepareStatement(updateProductQtySql);
                        updateProductQtyPs.setInt(1, i.getQuantity());
                        updateProductQtyPs.setLong(2, i.getProduct().getId());
                        updateProductQtyPs.executeUpdate();
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<OrderDTO> getListOrder(int accountId) {
        List<OrderDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM [Order] WHERE [accountID] = ?";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Long id = rs.getLong("orderID");
                Date date = rs.getDate("date");
                double totalMoney = rs.getDouble("totalMoney");
                String status = rs.getString("status");
                list.add(new OrderDTO(id, totalMoney, date, status));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<OrderDTO> getAllOrder() {
        List<OrderDTO> list = new ArrayList<>();
        String sql = "SELECT o.*, a.username\n"
                + "FROM [Order] o\n"
                + "JOIN Account a ON o.accountID = a.id;";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Long id = rs.getLong("orderID");
                Date date = rs.getDate("date");
                double totalMoney = rs.getDouble("totalMoney");
                String status = rs.getString("status");
                String username = rs.getString("username");
                list.add(new OrderDTO(id, totalMoney, date, status, username));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
    
    public String getStatusOrderById(int orderId) {
        String status = "";
        String sql = "SELECT status FROM [Order] WHERE [orderID] = ?";
        
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                status = rs.getString("status");
            }
            return status;
        } catch (Exception e) {
        }
        return null;
    }
    
    public boolean updateStatusOrder(String status, Long orderId) {
        String sql = "UPDATE [Order] SET status = ? WHERE [orderID] = ?";
        
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setLong(2, orderId);
            
            int rowAffect = ps.executeUpdate();
            if (rowAffect > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Eror: " + e.getMessage());;
        }
        return false;
    }

}
