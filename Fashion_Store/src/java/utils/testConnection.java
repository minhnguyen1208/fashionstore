/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Vietann
 */
public class testConnection {
     public static void main(String[] args) throws SQLException {
        String jdbcUrl = "jdbc:sqlserver://ZJETANN\\VIETANN:1433;databaseName=FashionStore";
        String username = "sa";
        String password = "12345";

        try {
            // Load the SQL Server JDBC driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            // Establish the connection
            Connection connection = DriverManager.getConnection(jdbcUrl, username, password);

            if (connection != null) {
                System.out.println("Connection successful!");
                connection.close(); // Close the connection when done
            } else {
                System.out.println("Connection failed!");
            }
        } catch (ClassNotFoundException e) {
            System.out.println("SQL Server JDBC driver not found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Connection error.");
            e.printStackTrace();
        }
    }
}

