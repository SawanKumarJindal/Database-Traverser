/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.common;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * 
 */
public class ConnectDB {

    static Connection conn;

    public static Connection connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql:///dbtraverser", "root", "");
        } catch (Exception e) {
            System.out.println("connect()  " + e);
        }
        return conn;
    }
}
