/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.common;




import com.bean.CountryStateCityBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author student
 */
public class CountryStateCityServices {
    
    public  ArrayList getAllCountryList(){
        Connection con = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        Statement stmt = null;
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            rs=stmt.executeQuery("select * from countrymaster");
            
            while (rs.next()) {
               CountryStateCityBean obj=new CountryStateCityBean();
               obj.setTxtCountryId(rs.getInt("Country_Id"));
               obj.setDdlCountryName(rs.getString("Country_Name"));
               al.add(obj);
            }
        } catch (Exception e) {
            System.out.println("getAllCountryList() " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("" + e);
            }
        }
        return al;
    }
    
     public  ArrayList getAllStateList(int id){
        Connection con = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        Statement stmt = null;
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            rs=stmt.executeQuery("select State_Id,State_Name from statemaster where Country_Id='"+id+"'");
            while (rs.next()) {
               CountryStateCityBean obj=new CountryStateCityBean();
               obj.setTxtStateId(rs.getInt("State_Id"));
               obj.setDdlStateName(rs.getString("State_Name"));
               al.add(obj);
            }
        } catch (Exception e) {
            System.out.println("getAllStateList() " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("" + e);
            }
        }
        return al;
    }
     
      public ArrayList getAllCityList(int id){
        Connection con = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        Statement stmt = null;
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            rs=stmt.executeQuery("select City_Id,City_Name from citymaster where State_Id='"+id+"'");
            while (rs.next()) {
               CountryStateCityBean obj=new CountryStateCityBean();
               obj.setTxtCityId(rs.getInt("City_Id"));
               obj.setDdlCityName(rs.getString("City_Name"));
                al.add(obj);
            }
        } catch (Exception e) {
            System.out.println("getAllCityList() " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("" + e);
            }
        }
        return al;
    }
      
      
    
}
