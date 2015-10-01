/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DBTraverser;

import com.bean.ManageAutoQuerySyntaxBean;
import com.common.ConnectDB;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

/**
 *
 * @author Supreet
 */
public class ManageAutoQuerySyntaxServices {

    public List showQueries() {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        List a = new ArrayList();
        ManageAutoQuerySyntaxBean obj = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from autoqueriessyntax;");
            while (rs.next()) {
                obj = new ManageAutoQuerySyntaxBean();
                obj.setAutoQueryId(rs.getInt("AutoQuery_Id"));
                obj.setQuerySyntax(rs.getString("Query_Syntax"));
                obj.setTitle(rs.getString("Title"));
                obj.setUpdateDate(rs.getString("Update_Date"));
                a.add(obj);

            }


        } catch (Exception e) {
            System.out.println("showQueries " + e);
        }
        return a;
    }

    public List viewQuery(String id) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        List a = new ArrayList();
        ManageAutoQuerySyntaxBean obj = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();

            rs = stmt.executeQuery("select * from autoqueriessyntax where AutoQuery_Id=" + id + "  ;");
            while (rs.next()) {
                obj = new ManageAutoQuerySyntaxBean();

                obj.setQuerySyntax(rs.getString("Query_Syntax"));
                obj.setTitle(rs.getString("Title"));

                a.add(obj);

            }


        } catch (Exception e) {
            System.out.println("viewQuery " + e);
        }
        return a;
    }

    public List update(String title, String syntax, String id) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        List a = new ArrayList();
        ManageAutoQuerySyntaxBean obj = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();

            int i = stmt.executeUpdate("update autoqueriessyntax set Title='" + title + "',Query_Syntax='" + syntax + "' where AutoQuery_Id=" + id + "  ;");
            if (i > 0) {
                System.out.println("query syntax updated");
            } else {
                System.out.println("query syntax updation failed");
            }

        } catch (Exception e) {
            System.out.println("update " + e);
        }
        return a;
    }
    
        public void addAutoQuery(String t, String d) {
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        try {
            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("insert into autoqueriessyntax(Title,Query_Syntax,Update_Date) values(?,?,sysdate())");
           pstmt.setString(1, t);
           pstmt.setString(2, d);
            System.out.println(""+pstmt);
           int i=pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("in AutoQueriesSyntaxServices addAutoQuery  " + e);
        }


    }
    
}
