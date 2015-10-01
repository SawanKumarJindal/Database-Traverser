/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DBTraverser;

import com.bean.*;
import com.common.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class CommonServices {

    public List getFeedback() {
        List list = new ArrayList();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        FeedbackBean objBean = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();

            rs = stmt.executeQuery("select * from feedbackmaster;");
            while (rs.next()) {
                objBean = new FeedbackBean();
                objBean.setDate(rs.getString("Sent_Date"));
                objBean.setDescription(rs.getString("Description"));
                objBean.setFeedbackId(rs.getInt("Feedback_Id"));
                objBean.setTitle(rs.getString("Title"));
                objBean.setRegisterId(rs.getInt("User_Id"));
                list.add(objBean);
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("getFeedBack() " + e);
        }
        return list;


    }

    public LoginBean ForgotPassword(String un) {

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        LoginBean objBean = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from usermaster as um inner join userdetail as ud on ud.User_Id=um.User_Id where um.User_Name='" + un + "'");
            if (rs.next()) {
                objBean = new LoginBean();

                objBean.setUser_Name(rs.getString("User_Name"));
                objBean.setPassword(rs.getString("Password"));
                objBean.setEmail(rs.getString("Email_Id"));

            }

        } catch (Exception e) {
            System.out.println("Exception in ForgotPassword(String un) " + e);
        } finally {
            try {
                conn.close();
                stmt.close();
                rs.close();
            } catch (Exception e) {
                System.out.println("Exception in ForgotPassword(String un) in finally " + e);
            }
        }
        return objBean;
    }

    public FeedBean getUserData(String id) {

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        FeedBean objBean = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();

            rs = stmt.executeQuery("select * from userdetail where User_Id=" + id + ";");
            while (rs.next()) {
                objBean = new FeedBean();
                objBean.setName(rs.getString("Name"));
                objBean.setPhone(rs.getString("Phone_Mobile"));
                objBean.setEmail(rs.getString("Email_Id"));


            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("getUserFeedBack() " + e);
        }
        return objBean;


    }

    public String passChange(String user, String pass, String oldpass) {
        String msg = "not";
        Connection conn = null;
        Statement stmt = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            int i = stmt.executeUpdate("update usermaster set Password='" + pass + "' where User_Id='" + user + "' and Password='" + oldpass + "';");
            if (i > 0) {
                msg = "changed";
            }
        } catch (Exception e) {
            System.out.println("ChangePassword() " + e);
        } finally {
            try {
                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return msg;
    }

    public List getrecentActivity(int id) {

        List list = new ArrayList();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        HistoryBean objBean = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();

            rs = stmt.executeQuery("select * from queryinghistorymaster where User_Id=" + id + ";");

            while (rs.next()) {
                objBean = new HistoryBean();
                objBean.setDate(rs.getString("Create_Date"));
                objBean.setQuery(rs.getString("Query"));

                list.add(objBean);
            }

        } catch (Exception e) {
            System.out.println("getrecentActivity() " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("getrecentActivity()   in finally  " + e);
            }
        }
        return list;

    }

    public String check(String username) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from usermaster where User_Name='" + username + "';");

            while (rs.next()) {
                return "UserName Exists";

            }
        } catch (Exception e) {
            System.out.println("Check() " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("Check()   in finally  " + e);
            }
        }

        return "Username Available";
    }

    public String getCode() {
        Random r = new Random();
        String s[] = {"a", "b", "d", "c", "0", "9", "3", "G", "E", "H", "F", "K", "z", "t", "j", "7", "4", "1", "A", "C", "B", "D", "2", "8", "k", "m", "h", "q", "S", "T", "U", "O", "5", "10", "r", "s", "u", "w", "y", "L", "M", "N", "J", "I", "f", "i", "g", "R", "Q", "P", "B", "6", "e", "l", "p", "v", "W", "Y", "Z", "X", "x", "n", "o", "V"};
        String code = "";
        for (int i = 0; i < 100; i++) {
            System.out.println(r.nextInt(34));
        }
        for (int i = 0; i < 16; i++) {
            System.out.println(r.nextInt(32));
            code += s[r.nextInt(6)];
        }

        return code;

    }

    public String signup(RegisteredUserBean objBean, String random) {
        Connection conn = null;
        Statement stmt = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String result = "Error in creating new user account";
        int id = 0;
        try {

            conn = ConnectDB.connect();
            stmt = conn.createStatement();

            pstmt = conn.prepareStatement("select User_name from usermaster where User_Name=?");
            pstmt.setString(1, objBean.getTxtUsername());
            rs = pstmt.executeQuery();
            if (rs.next()) {
                result = "Username already exists";
            } else {

                pstmt = conn.prepareStatement("insert into usermaster(User_Name,Password,User_Type,Status,keyss) values(?,?,'User',-1,?)");
                pstmt.setString(1, objBean.getTxtUsername());
                pstmt.setString(2, objBean.getTxtPassword());
                pstmt.setString(3, random);
                int i = pstmt.executeUpdate();
                rs = stmt.executeQuery("select max(User_Id) as id from usermaster;");
                if (rs.next()) {
                    id = rs.getInt("id");
                }


                pstmt = conn.prepareStatement("insert into userdetail(User_Id,Name,Gender,DOB,Address,Country_Id,State_Id,City_Id,Pin_Code,Phone_Mobile,Phone_Home,Email_Id) values(?,?,?,?,?,?,?,?,?,?,?,?)");
                pstmt.setInt(1, id);
                pstmt.setString(2, objBean.getTxtName());
                pstmt.setString(3, objBean.getRbGender());
                pstmt.setString(4, objBean.getTxtBirth());
                pstmt.setString(5, objBean.getTaAddress());
                pstmt.setInt(6, objBean.getDdlCountry());
                pstmt.setInt(7, objBean.getDdlState());
                pstmt.setInt(8, objBean.getDdlCity());
                pstmt.setString(9, objBean.getTxtPin());
                pstmt.setString(10, objBean.getTxtPhone());
                pstmt.setString(11, objBean.getTxtMobile());
                pstmt.setString(12, objBean.getTxtEmail());
                i = pstmt.executeUpdate();

                // query to create new database

                pstmt = conn.prepareStatement("create database " + objBean.getTxtUsername() + "");
                try {
                    i = pstmt.executeUpdate();
                } catch (Exception e) {
                    System.out.println("signup  error in creating database " + pstmt + e);
                }
                if (i > 0) {


                    i = stmt.executeUpdate("create user '" + objBean.getTxtUsername() + "'@'localhost' identified by '" + objBean.getTxtPassword() + "';");
                    i = stmt.executeUpdate("grant select,create,insert on " + objBean.getTxtUsername() + ".* to '" + objBean.getTxtUsername() + "'@'localhost' identified by '" + objBean.getTxtPassword() + "';");
                    i = stmt.executeUpdate("flush privileges;");

                    int db = stmt.executeUpdate("insert into databasesettings(User_Id,Database_name,Connection_Username,Connection_Password,Connection_Url,Server_IP,Port,Is_Active) values(" + id + ",'" + objBean.getTxtUsername() + "','" + objBean.getTxtUsername() + "','" + objBean.getTxtPassword() + "','jdbc:mysql:///" + objBean.getTxtUsername() + "','127.0.0.1','3306',1);");

                    if (db > 0) {
                        result = "User Created Successfully";
                    }
                }
                String message = "This a confimation email that your account has been created.. Please enter ur Activation code provided below to activate your account and use the servces.Your Activation code is " + random + " .Enter this code at the input box provided at the page";
                SendSMTP.sendMail(objBean.getTxtEmail(), message, "Account Activation");
            }


        } catch (Exception e) {

            System.out.println("sign up" + e);

        } finally {
            try {
                rs.close();
                pstmt.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("sign up in finally   " + e);
            }
        }
        return result;
    }
}
