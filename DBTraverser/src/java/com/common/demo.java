/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.common;

import java.sql.*;

/**
 *
 * @author student
 */
public class demo {
    public  void main(String[] args) {
        Connection conn=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
             conn = DriverManager.getConnection("jdbc:mysql:///dbtraverser", "root", "");
            
        ResultSet rs = null;
        String result = "Group not bought";
        PreparedStatement pstmt = null;
        Statement stmt = null;
        stmt=conn.createStatement();
        rs=stmt.executeQuery("");
       // int i = stmt.executeUpdate("grant  on user12.* to  user12@localhost identified by  user12;");
            
        } catch (Exception e) {
            System.out.println("connect()  " + e);
        }finally{
            try {
                conn.close();
            } catch (Exception e) {
            }
        }
    }
    
}
