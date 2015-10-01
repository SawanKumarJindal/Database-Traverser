/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DBTraverser;

import com.bean.ManageProfileRegisteredUserBean;
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
public class ManageProfileRegisteredUserServices {

    public ManageProfileRegisteredUserBean getProfileInfo(int id) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        ManageProfileRegisteredUserBean obj = new ManageProfileRegisteredUserBean();
        try {

            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select ud.Address,if(ud.Country_Id is null,'0',ud.Country_Id) as CountryId,if(ud.DOB is null,'',substring(ud.DOB,1,10)) as dob,ud.Email_Id,if(ud.Gender is null,' ',ud.Gender) as gender,ud.name,ud.Phone_Home,ud.Phone_Mobile,ud.Pin_Code,if(ud.City_Id is null,0,ud.City_Id) as CityId,if(ud.State_Id is null,0,ud.State_Id) as StateId,um.User_Name from usermaster um,userdetail ud where um.User_Id=ud.User_Id && ud.User_Id=" + id + " ;");
            if (rs.next()) {

                obj.setTaAddress(rs.getString("ud.Address"));
                obj.setDdlCountry(rs.getInt("CountryId"));
                obj.setTxtBirth(rs.getString("dob"));
                obj.setTxtEmail(rs.getString("ud.Email_Id"));
                obj.setRbGender(rs.getString("gender"));
                obj.setTxtName(rs.getString("ud.Name"));
                obj.setTxtPhone(rs.getString("ud.Phone_Home"));
                obj.setTxtMobile(rs.getString("ud.Phone_Mobile"));
                obj.setTxtPin(rs.getString("ud.Pin_Code"));
                obj.setDdlCity(rs.getInt("CityId"));
                obj.setDdlState(rs.getInt("StateId"));
                obj.setTxtUsername(rs.getString("um.User_Name"));


            }

        } catch (Exception e) {
            System.out.println("getInfo " + e);
        }
        return obj;

    }

    public String update(ManageProfileRegisteredUserBean objBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String result="failed";
        try {
            conn = ConnectDB.connect();
            pstmt=conn.prepareStatement("update userdetail set Name=?,DOB=?,Gender=?,Address=?,Country_Id=?,State_Id=?,City_Id=?,Pin_Code=?,Phone_Home=?,Phone_Mobile=?,Email_Id=? where User_Id=?;");
            pstmt.setString(1, objBean.getTxtName());
            pstmt.setString(2, objBean.getTxtBirth());
            pstmt.setString(3, objBean.getRbGender());
            pstmt.setString(4, objBean.getTaAddress());
            pstmt.setInt(5, objBean.getDdlCountry());
            pstmt.setInt(6, objBean.getDdlState());
            pstmt.setInt(7, objBean.getDdlCity());
            pstmt.setString(8, objBean.getTxtPin());
            pstmt.setString(9, objBean.getTxtPhone());
            pstmt.setString(10, objBean.getTxtMobile());
            pstmt.setString(11, objBean.getTxtEmail());
            pstmt.setInt(12, objBean.getTxtUserId());
            System.out.println(""+pstmt);
            int i=pstmt.executeUpdate();
            if (i > 0) {
                result="updated";
            } 

        } catch (Exception e) {
            System.out.println("update " + e);
        }finally{
            try {
                pstmt.close();
                conn.close();
            } catch (Exception e) {
            }
        }
        return result;

    }

    public String checkCode(String code) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        Statement stmt1 = null;
        List a = new ArrayList();

        int i = 0;
        try {

            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            stmt1 = conn.createStatement();
            rs = stmt.executeQuery("select * from usermaster where keyss='" + code + "';");
            while (rs.next()) {
                int id = rs.getInt("User_Id");
                i = stmt1.executeUpdate("update usermaster set Status=1 where User_Id=" + id + ";");
            }



        } catch (Exception e) {
            System.out.println("check code " + e);
        }
        if (i > 0) {
            return "success";
        } else {
            return "failed";
        }


    }
}
