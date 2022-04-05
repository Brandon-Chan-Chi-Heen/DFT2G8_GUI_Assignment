/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Henry
 */

import entity.Customer;
import java.sql.*;


public class CustomerDA {
    private String host = "jdbc:derby://localhost:1527/Customer";
    private String user = "nbuser";
    private String password = "nbuser";
    private String tableName = "Customer";
    private Connection conn;
    private PreparedStatement stmt;


    public CustomerDA() {
        createConnection();
    }

    public Customer checkLogin(String userName, String pass) {
        String getStr = "SELECT * FROM " + tableName + " WHERE username=? AND password=?";
        Customer c = null;
        try {
            stmt = conn.prepareStatement(getStr);
            stmt.setString(1, userName);
            stmt.setString(2, pass);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                c = new Customer();
                c.setUsername(userName);
                c.setEmail(rs.getString("email"));
                c.setName(rs.getString("name"));
            }
                       
            
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return c;
    }


    public void addRecord(Customer c) {
        String insertStr = "INSERT INTO " + tableName + "(USERNAME, PASSWORD, EMAIL, NAME)VALUES(?, ?, ?, ?)";
        try {
            stmt = conn.prepareStatement(insertStr);
            stmt.setString(1, c.getUsername());
            stmt.setString(2, c.getPassword());
            stmt.setString(3, c.getEmail());
            stmt.setString(4, c.getName());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    private void createConnection() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            System.out.println("***TRACE: Connection established.");
            conn = DriverManager.getConnection(host, user, password);
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    private void shutDown() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                System.out.println(ex);
            }
        }
    }

    public static void main(String[] args) {
        CustomerDA da = new CustomerDA();
        Customer c = da.checkLogin("henruy914", "123456");
        System.out.println(c);
    }
}
