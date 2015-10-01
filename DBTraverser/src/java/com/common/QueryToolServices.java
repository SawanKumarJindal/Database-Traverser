/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.common;

import com.bean.LoginBean;
import com.bean.settingsBean;
import com.bean.autoqueriesbean;
import com.DBTraverser.encode;
import com.bean.UserPriviledgeBean;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class QueryToolServices {

    public LoginBean getData(String user, String pass) {

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        LoginBean objBean = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select Password,um.User_Name,um.User_Id,if(um.Status is null,0,um.Status) as status,if(um.User_Type is null,'',um.User_Type) as UserType from usermaster um,userdetail ud where um.User_Id=ud.User_Id and User_Name='" + user + "';");
            while (rs.next()) {
                if (rs.getString("Password").equals(pass)) {

                    objBean = new LoginBean();
                    objBean.setUser_Id(rs.getInt("um.User_Id"));
                    objBean.setUser_Name(rs.getString("um.User_Name"));
                    objBean.setStatus(rs.getInt("status"));
                    objBean.setUser_Type(rs.getString("UserType"));
                    break;
                }
            }
        } catch (Exception e) {
            System.out.println("getData() " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("in finally  getData   " + e);
            }
        }
        return objBean;
    }

    public settingsBean settings(int Id) {

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        settingsBean objBean = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select *,if(Is_Active is null,0,Is_Active) as Active from databasesettings where User_Id=" + Id + ";");
            while (rs.next()) {
                objBean = new settingsBean();
                objBean.setConnectionPassword(rs.getString("Connection_Password"));
                objBean.setConnectionUsername(rs.getString("Connection_Username"));
                objBean.setConnectionUrl(rs.getString("Connection_Url"));
                objBean.setDatabaseName(rs.getString("Database_Name"));
                objBean.setDatabaseSettingsId(rs.getInt("DatabaseSettings_Id"));
                objBean.setIsActive(rs.getInt("Active"));
                objBean.setPort(rs.getString("Port"));
                objBean.setRegisteredUserId(rs.getInt("User_Id"));
                objBean.setServerIp(rs.getString("Server_Ip"));

            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("settings() " + e);
        }
        return objBean;
    }

    public List getTables(String name, String url, String user, String password) {
        List list = new ArrayList();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            stmt = conn.createStatement();
            rs = stmt.executeQuery("show tables;");

//          
            while (rs.next()) {

                list.add(rs.getString(1));
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("getTables() " + e);
        }
        return list;
    }

    
      public List getTableData(String user, String password, String dbname,
      String tbname, String url) {
     
      Connection conn = null; Statement stmt = null; ResultSet rs = null; List
      a = new ArrayList(); List list = new ArrayList();
     
      try { Class.forName("com.mysql.jdbc.Driver"); conn =
      DriverManager.getConnection(url, user, password); stmt =
      conn.createStatement();
     
      rs = stmt.executeQuery("select * from " + tbname + ";");
      ResultSetMetaData rsmd = rs.getMetaData(); int j = rsmd.getColumnCount();
      for (int i = 1; i <= j; i++) { a.add(rsmd.getColumnName(i)); } while
      (rs.next()) { String arr[] = new String[a.size()]; for (int b = 0; b <
      a.size(); b++) { arr[b] = rs.getString((String) a.get(b)); }
      list.add(arr);
     
     
      }
     
     
      rs.close(); stmt.close(); conn.close(); } catch (Exception e) {
      System.out.println("getTableData() " + e); } return list;
    }
     
    public List getTableColumnData(String user, String password, String dbname, String tbname, String url) {

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        List a = new ArrayList();


        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            stmt = conn.createStatement();
            System.out.println("select * from " + tbname + ";");
            rs = stmt.executeQuery("select * from " + tbname + ";");
            ResultSetMetaData rsmd = rs.getMetaData();
            int j = rsmd.getColumnCount();
            for (int i = 1; i <= j; i++) {
                a.add(rsmd.getColumnName(i));
            }


            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("getTableData() " + e);
        }
        return a;
    }

    public List getAutoQueryData() {

        Connection conn = null;
        Statement stmt = null;
        autoqueriesbean obj = null;
        ResultSet rs = null;
        List a = new ArrayList();
        try {

            conn = ConnectDB.connect();
            stmt = conn.createStatement();

            rs = stmt.executeQuery("select * from autoqueriessyntax;");

            while (rs.next()) {
                obj = new autoqueriesbean();
                obj.setTitle(rs.getString("Title"));
                obj.setSyntax(rs.getString("Query_Syntax"));
                a.add(obj);
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("getAutoQueryData() " + e);
        }
        return a;
    }

    public List SelectQueryCName(String query, String url, String user, String password) {

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        List list = new ArrayList();

        try {

            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            ResultSetMetaData rsmd = rs.getMetaData();
            int j = rsmd.getColumnCount();

            while (rs.next()) {
                String arr[] = new String[j];
                for (int b = 0; b < j; b++) {
                    arr[b] = rs.getString(b + 1);
                }
                list.add(arr);

            }


            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("selectquerycname() " + e);
        }
        return list;
    }

    public List selectTableColumnData(String query, String url, String user, String password, int id) {

        Connection conn = null;
        Statement stmt = null;

        ResultSet rs = null;
        List a = new ArrayList();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            stmt = conn.createStatement();

            rs = stmt.executeQuery(query);
            ResultSetMetaData rsmd = rs.getMetaData();
            int j = rsmd.getColumnCount();
            for (int i = 1; i <= j; i++) {
                a.add(rsmd.getColumnName(i));
            }

            rs.close();
            stmt.close();
            conn.close();
            recent(id, query);
        } catch (Exception e) {
            System.out.println("selectTableData() " + e);
        }
        return a;
    }

    public List selectTableData(String query, String url, String user, String password, int id) {

        Connection conn = null;
        Statement stmt = null;
        System.out.println("query  "+query);
        ResultSet rs = null;
        List a = new ArrayList();
        List list = new ArrayList();
        List listAllData = new ArrayList();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            stmt = conn.createStatement();

            rs = stmt.executeQuery(query);
            ResultSetMetaData rsmd = rs.getMetaData();
            int j = rsmd.getColumnCount();
            for (int i = 1; i <= j; i++) {
                a.add(rsmd.getColumnName(i));
            }


            while (rs.next()) {
                String arr[] = new String[j];
                for (int b = 0; b < j; b++) {
                    arr[b] = rs.getString(b + 1);
                }
                list.add(arr);

            }




        } catch (Exception e) {
            a.add("Exception   :" + e);
            System.out.println("selectTableData() " + e);
        } finally {
            recent(id, query);
            listAllData.add(a);
            listAllData.add(list);
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                 System.out.println("selectTableData()  in finally  " + e);
            }
        }
        return listAllData;
    }

    public void recent(int id, String query) {

        Connection conn1 = null;
        encode obj = new encode();
        String query1 = obj.encoder(query);
        Statement stmt1 = null;
        Calendar currentDate = Calendar.getInstance();
        SimpleDateFormat formatter =
                new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String dateNow = formatter.format(currentDate.getTime());

        try {
            conn1 = ConnectDB.connect();
            stmt1 = conn1.createStatement();
            int p = stmt1.executeUpdate("insert into queryinghistorymaster(User_Id,Query,Create_Date)values(" + id + ",'" + query1 + "','" + dateNow + "');");

            stmt1.close();
            conn1.close();
        } catch (Exception e) {
            System.out.println(e);
        }



    }

    public String InsertQueryCName(String query, String url, String user, String password, int id) {

        Connection conn = null;
        Statement stmt = null;
        String str = "";
        try {

            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            stmt = conn.createStatement();

            System.out.println(query);
            int i = stmt.executeUpdate(query);

            stmt.close();
            if (query.startsWith("create")) {
                str = "table created successfully";
            } else {
                if (i > 0) {
                    str = i + " row affected";
                }
            }

        } catch (Exception e) {

            str = "Error: " + e.getMessage();
        } finally {
            try {
                conn.close();
                recent(id, query);

            } catch (Exception e) {
                System.out.println(e);
            }

        }
        return str;
    }

    public void updateLoginTime(int id) {
        try {
            Connection conn1 = ConnectDB.connect();
            Statement stmt1 = conn1.createStatement();
            int p = stmt1.executeUpdate("update usermaster set Last_Login=sysdate() where User_Id=" + id + ";");
            stmt1.close();
            conn1.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public String getUserpriviledge(int userid) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String privelege = "";
        try {
            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("select slrm.title  from registeredusergroup rug,groupmaster gm,grouprights gr,sqllevelrightmaster slrm where rug.group_id=gm.group_id and gm.group_id=gr.group_id and gr.right_id=slrm.right_id and rug.user_id=? and rug.Is_Active=1;");
            pstmt.setInt(1, userid);
            rs = pstmt.executeQuery();
            while (rs.next()) {

                privelege += rs.getString(1) + " ";
            }

        } catch (Exception e) {
            System.out.println("" + e);
        }
        return privelege;
    }
}
