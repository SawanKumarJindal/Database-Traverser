/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DBTraverser;

import com.bean.ManageFAQBean;
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
public class ManageFAQServices {

    public List getFaq() {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        List a = new ArrayList();
        ManageFAQBean obj = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from faqmaster;");
            while (rs.next()) {
                obj = new ManageFAQBean();
                obj.setFaqId(rs.getInt("FAQ_Id"));
                obj.setAnswer(rs.getString("Answer"));
                obj.setFaq(rs.getString("FAQ"));
                obj.setIsActive(rs.getInt("Is_Active"));
                a.add(obj);

            }


        } catch (Exception e) {
            System.out.println("getFaq " + e);
        }
        return a;
    }

    public void addFaq(String f, String a, String s) {
        Connection conn = null;
        Statement stmt = null;
        ManageFAQBean obj = null;
        int p = 10;
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        String dates = dateFormat.format(date);
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            if (s.equalsIgnoreCase("Active")) {
                p = 1;
            } else if (s.equalsIgnoreCase("InActive")) {
                p = 0;

            }
            System.out.println("insert into faqmaster(FAQ,Answer,Is_Active) values('" + f + "','" + a + "'," + p + ");");
            int i = stmt.executeUpdate("insert into faqmaster(FAQ,Answer,Is_Active,Update_Date) values('" + f + "','" + a + "'," + p + ",'" + dates + "');");
            if (i > 0) {
                System.out.println("success");

            } else {
                System.out.println("nope..");
            }


        } catch (Exception e) {
            System.out.println("addFaq " + e);
        }

    }
}
