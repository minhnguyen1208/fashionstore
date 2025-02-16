/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import utils.DBUtils;

/**
 *
 * @author tinit
 */
public class AccountDAO {

    public AccountDTO login(String username, String password) {
        String sql = "SELECT id, username, email, fullName, password, address, role, phoneNumber, status FROM Account WHERE username = ? and password = ?";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                AccountDTO user = new AccountDTO();
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("fullName"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getLong("role"));
                user.setAddress(rs.getString("address"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setStatus(rs.getLong("status"));

                return user;
                
            }
        } catch (Exception e) {
            System.out.println("Login is wrong" + e.getMessage());
        }

        return null;
    }

    public AccountDTO register(String username, String password, String email, String address, String phoneNumber, String fullName) {
        String sql = "INSERT INTO Account (username, password, email, address, phoneNumber, fullName, role, status) VALUES (?, ?, ?, ?, ?, ?, 0, 1)";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, address);
            ps.setString(5, phoneNumber);
            ps.setString(6, fullName);

            ps.executeQuery();
        } catch (Exception e) {
        }

        return null;
    }

    public AccountDTO getAccount(int id) {
        String sql = "SELECT * FROM Account where id = ?";
        AccountDTO account = null;
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                account = new AccountDTO();
                account.setId(rs.getInt("id"));
                account.setEmail(rs.getString("email"));
                account.setUsername(rs.getString("username"));
                account.setRole(rs.getLong("role"));
                account.setAddress(rs.getString("address"));
                account.setPhoneNumber(rs.getString("phoneNumber"));
                account.setStatus(rs.getLong("status"));
            }
            return account;
        } catch (Exception e) {
        }
        return null;
    }

    public List<AccountDTO> getAllAccount() {
        String sql = "SELECT * FROM Account";
        List<AccountDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AccountDTO account = new AccountDTO();
                account.setId(rs.getInt("id"));
                account.setEmail(rs.getString("email"));
                account.setUsername(rs.getString("username"));
                account.setRole(rs.getLong("role"));
                account.setAddress(rs.getString("address"));
                account.setPhoneNumber(rs.getString("phoneNumber"));
                account.setFullName(rs.getString("fullName"));
                account.setStatus(rs.getLong("status"));
                list.add(account);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean updateStatusAccount(Long status, Long id) {
        String sql = "UPDATE Account SET status = ? WHERE id = ?";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setLong(1, status);
            ps.setLong(2, id);
            int row = ps.executeUpdate();

            if (row > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean updateRoleAccount(Long role, Long id) {
        String sql = "UPDATE Account SET role = ? WHERE id = ?";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setLong(1, role);
            ps.setLong(2, id);
            
            int row = ps.executeUpdate();
            
            if (row > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean delelteAccount(Long id) {
        String sql = "DELETE FROM Account WHERE id = ?";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setLong(1, id);
            int row = ps.executeUpdate();

            if (row > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public void logout(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession(false);

            if (session != null) {
                session.removeAttribute("account");
            }
        } catch (Exception e) {
        }
    }
}
