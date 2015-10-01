/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DBTraverser;

import com.bean.ManageRequestBean;
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
public class ManageRequestServices {

    public List getRequest() {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        List a = new ArrayList();
        ManageRequestBean obj = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select if(res.Response_Text is null ,'Pending',res.Response_Text) as Response_Text,if(res.Response_Date is null,'N/A',substring(res.Response_Date,1,10)) as Response_Date,req.Title,req.Description,if(req.Request_Date is null,'',substring(req.Request_Date,1,10)) as RequestDate,req.Request_Id from responsemaster as res right outer join requestmaster as req on  req.Request_Id=res.Request_Id;");
            while (rs.next()) {
                obj = new ManageRequestBean();

                obj.setDescription(rs.getString("req.Description"));
                obj.setRequestDate(rs.getString("RequestDate"));
                obj.setResponse(rs.getString("Response_Text"));
                obj.setResponseDate(rs.getString("Response_Date"));
                obj.setTitle(rs.getString("req.Title"));
                obj.setRequestId(rs.getInt("req.Request_Id"));
                a.add(obj);
            }
        } catch (Exception e) {
            System.out.println("getRequest " + e);
        }
        return a;

    }
    public ManageRequestBean viewRequestAdmin(String id) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        ManageRequestBean obj = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select if(res.Response_Text is null ,'Pending',res.Response_Text) as Response_Text,req.Title,req.Description,if(req.Request_Date is null,'',substring(req.Request_Date,1,10)) as RequestDate,req.Request_Id from responsemaster as res right outer join requestmaster as req on  req.Request_Id=res.Request_Id where req.Request_Id='"+id+"';");
            while (rs.next()) {
                obj = new ManageRequestBean();

                obj.setDescription(rs.getString("req.Description"));
                obj.setRequestDate(rs.getString("RequestDate"));
                obj.setResponse(rs.getString("Response_Text"));
                obj.setTitle(rs.getString("req.Title"));
            }
        } catch (Exception e) {
            System.out.println("viewRequestAdmin " + e);
        }
        return obj;

    }

    public List getUserRequest(String id) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        List a = new ArrayList();
        ManageRequestBean obj = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select if(res.Response_Text is null ,'Pending',res.Response_Text) as Response_Text,if(res.Response_Date is null,'---',substring(res.Response_Date,1,10)) as Response_Date,req.Title,req.Description,if(req.Request_Date is null,'....',substring(req.Request_Date,1,10)) as RequestDate,req.Request_Id from responsemaster as res right outer join requestmaster as req on  req.Request_Id=res.Request_Id where req.User_Id=" + id + ";");
            while (rs.next()) {
                obj = new ManageRequestBean();

                obj.setDescription(rs.getString("req.Description"));
                obj.setRequestDate(rs.getString("RequestDate"));
                obj.setResponse(rs.getString("Response_Text"));
                obj.setResponseDate(rs.getString("Response_Date"));
                obj.setTitle(rs.getString("req.Title"));
                obj.setRequestId(rs.getInt("req.Request_Id"));
                a.add(obj);
            }
        } catch (Exception e) {
            System.out.println("getRequest " + e);
        }
        return a;

    }

    public String postRequest(String t, String d, int id) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        String result = "error in posting";
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            int i = stmt.executeUpdate("insert into requestmaster(User_Id,Title,Description,Request_Date) values(" + id + ",'" + t + "','" + d + "',sysdate());");
            if (i > 0) {
                result = "posted";
            }

        } catch (Exception e) {
            System.out.println("postRequest " + e);
        }
        return result;

    }

    public ManageRequestBean viewResponse(String id) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        List a = new ArrayList();
        ManageRequestBean obj = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select req.Request_Id,if(res.Response_Text is null,'N/A',res.Response_Text) as ResponseText,if(res.Response_Date is null,'N/A',substring(res.Response_Date,1,10)) as ResponseDate,req.Title,req.Description,if(req.Request_Date is null,'N/A',substring(req.Request_Date,1,10)) as RequestDate from requestmaster req left join responsemaster res on req.Request_Id=res.Request_Id where req.Request_Id=" + id + "; ");
            while (rs.next()) {
                obj = new ManageRequestBean();
                obj.setDescription(rs.getString("req.Description"));
                obj.setRequestDate(rs.getString("RequestDate"));
                obj.setResponse(rs.getString("ResponseText"));
                obj.setResponseDate(rs.getString("ResponseDate"));
                obj.setTitle(rs.getString("req.Title"));
                obj.setRequestId(rs.getInt("req.Request_Id"));


            }


        } catch (Exception e) {
            System.out.println("viewResponse " + e);
        }
        return obj;

    }

    public String postResponse(String id, String res) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        String result="Not posted successfully";
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        String dates = dateFormat.format(date);
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();


            int i = stmt.executeUpdate("insert into responsemaster(Response_Text,Response_Date,Request_Id) values('" + res + "','" + dates + "'," + id + ") ;");
            if (i > 0) {
                result="Posted Successfully";
            } 
        } catch (Exception e) {
            System.out.println("post Response " + e);
        }
        return result;

    }

    public void editResponse(String id, String res) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;

        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        String dates = dateFormat.format(date);
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();

            System.out.println("update responsemaster set Response_Text='" + res + "' Response_Date='" + dates + "' where Request_Id=" + id + ";");
            int i = stmt.executeUpdate("update responsemaster set Response_Text='" + res + "', Response_Date='" + dates + "' where Request_Id=" + id + ";");
            if (i > 0) {
                System.out.println("Updated");
            } else {
                System.out.println(" not Updated");
            }

        } catch (Exception e) {
            System.out.println("edit Response " + e);
        }


    }
}
