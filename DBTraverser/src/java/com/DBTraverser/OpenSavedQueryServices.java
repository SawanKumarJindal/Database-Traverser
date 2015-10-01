/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DBTraverser;

import com.bean.OpenSavedQueryBean;
import com.common.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Supreet
 */
public class OpenSavedQueryServices {

    public List getQuery(String id) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        List a = new ArrayList();
        OpenSavedQueryBean obj = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from usersavedqueries where User_Id='" + id + "';");
            while (rs.next()) {
                obj = new OpenSavedQueryBean();
                obj.setTitle(rs.getString("Title"));
                obj.setQuery(rs.getString("Query_Description"));
                obj.setUpdateDate(rs.getString("Update_Date"));
                obj.setId(rs.getInt("SavedQuery_Id"));
                a.add(obj);

            }
        } catch (Exception e) {
            System.out.println("getQuery " + e);
        }
        return a;
    }
    public List searchQuery(String id,String search) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        List a = new ArrayList();
        OpenSavedQueryBean obj = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
           // System.out.println("select * from usersavedqueries where User_Id='" + id + "' and Title like '%"+search+"%';");
            rs = stmt.executeQuery("select * from usersavedqueries where User_Id='" + id + "' and Title like '%"+search+"%';");
            while (rs.next()) {
                obj = new OpenSavedQueryBean();
                obj.setTitle(rs.getString("Title"));
                obj.setQuery(rs.getString("Query_Description"));
                obj.setUpdateDate(rs.getString("Update_Date"));
                obj.setId(rs.getInt("SavedQuery_Id"));
                a.add(obj);

            }
        } catch (Exception e) {
            System.out.println("getQuery " + e);
        }
        return a;
    }

    public void deleteQuery(String id) {
        Connection conn = null;
        Statement stmt = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
           // stmt.executeQuery("delete from usersavedqueries where SavedQuery_Id='" + id + "';");
           stmt.executeUpdate("delete from usersavedqueries where SavedQuery_Id='" + id + "';");
        } catch (Exception e) {
            System.out.println("deleteQuery   " + e);
        }
    }
    
    
    public String getQuery1(String Id) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        String query1 = "";
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from usersavedqueries where SavedQuery_Id='" + Id + "';");

            while (rs.next()) {



                query1 = rs.getString("Query_Description");


            }


        } catch (Exception e) {
            System.out.println("getQuery1 " + e);
        }
        return query1;

    }

    public String saveQuery(String title, String query, int id) {
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        String result = "not added";
        try {
            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("insert into usersavedqueries(Title,Query_Description,User_Id,Update_Date)values(?,?,?,sysdate());");
            pstmt.setString(1, title);
            pstmt.setString(2, query);
            pstmt.setInt(3, id);
            System.out.println(""+pstmt);
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = "successfully added";
            }
        } catch (Exception e) {
            System.out.println("OpenSavedQueryServices  saveQuery " + e);
        }
        return result;
    }

    public String saveQueryToolQuery(String query, String id) {
        Connection conn = null;
        Statement stmt = null;
        String result = "not added";
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            System.out.println("insert into usersavedqueries(Title,Query_Description,User_Id,Update_Date)values('" + query + "'," + id + ");");
            int i = stmt.executeUpdate("insert into usersavedqueries(Title,Query_Description,User_Id,Update_Date)values('','" + query + "'," + id + ",sysdate());");
            if (i > 0) {
                result = "successfully added";
            }
        } catch (Exception e) {
            System.out.println("OpenSavedQueryServices  saveQueryToolQuery " + e);
        }
        return result;
    }
}
