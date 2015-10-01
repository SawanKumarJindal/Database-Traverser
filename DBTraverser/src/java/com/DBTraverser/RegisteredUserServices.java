/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DBTraverser;

import com.bean.ViewRegisteredUserBean;
import com.bean.RegisteredUserBean;
import com.common.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author student
 */
public class RegisteredUserServices {

    public ArrayList getRegisteredUser(String name) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        ArrayList a = new ArrayList();
        RegisteredUserBean obj = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select um.User_Id,if(um.Status is null,'Inactive',if(um.Status=1,'Active','Inactive')) as status,if(ud.DOB is null,'',substring(DOB,1,10)) as dob,if(ud.Name is null,'',ud.Name) as name,if(ud.Gender is null,'',if(ud.Gender='m','Male','Female')) as gender,if(ud.Email_Id is null,'',ud.Email_Id) as email,if(ud.Phone_Mobile is null,'',ud.Phone_Mobile) as mobile from usermaster um,userdetail ud where um.User_Type='user' and um.User_Id=ud.User_Id and ud.name like '%"+name+"%';");
            while (rs.next()) {
                obj = new RegisteredUserBean();

                obj.setTxtUserId(rs.getInt("um.User_Id"));
                obj.setTxtStatus(rs.getString("status"));
                obj.setTxtName(rs.getString("name"));
                obj.setRbGender(rs.getString("gender"));
                obj.setTxtEmail(rs.getString("email"));
                obj.setTxtMobile(rs.getString("mobile"));
                obj.setTxtBirth(rs.getString("dob"));
                a.add(obj);
            }
        } catch (Exception e) {
            System.out.println("getRegisteredUser " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("getRegisteredUser in finally " + e);
            }
        }
        return a;

    }
  

 public void changeStatusOfUser(String userid,String status) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = ConnectDB.connect();
            if(status.equalsIgnoreCase("Active")){
            pstmt=conn.prepareStatement("update usermaster set Status=0 where User_Id=?;");
            }else{ 
                pstmt=conn.prepareStatement("update usermaster set Status=1 where User_Id=?;");
            }
            
           pstmt.setString(1, userid);
           int i= pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("changeStatusOfUser " + e);
        } finally {
            try {
                pstmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("changeStatusOfUser in finally " + e);
            }
        }

    }
 public void changeStatusUser(String userid,String status) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = ConnectDB.connect();
            if(status.equalsIgnoreCase("Active")){
            pstmt=conn.prepareStatement("update usermaster set Status=1 where User_Id=?;");
            }else{ 
                pstmt=conn.prepareStatement("update usermaster set Status=0 where User_Id=?;");
            }
            
           pstmt.setString(1, userid);
           int i= pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("changeStatusOfUser " + e);
        } finally {
            try {
                pstmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("changeStatusOfUser in finally " + e);
            }
        }

    }
 
 
   
 
  public ViewRegisteredUserBean viewRegisteredUser(String userid) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        ViewRegisteredUserBean obj=null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select if(User_Name is null,'',User_Name) as loginname,if(um.Status is null,'Inactive',if(um.Status=1,'Active','Inactive')) as status,if(um.Last_Login is null,'',substring(um.Last_Login,1,10)) as lastlogin,if(ud.DOB is null,'',substring(DOB,1,10)) as dob,if(ud.Name is null,'',ud.Name) as name,if(ud.Gender is null,'',if(ud.Gender='m','Male','Female')) as gender,if(Address is null,'',Address) as address,if(Pin_Code is null,'',Pin_Code) as pincode,if(Phone_Home is null,'',Phone_Home) as phonehome,if(ud.Email_Id is null,'',ud.Email_Id) as email,if(ud.Phone_Mobile is null,'',ud.Phone_Mobile) as mobile,c.Country_Name,s.State_Name,city.City_Name from usermaster um,userdetail ud,countrymaster c,statemaster s,citymaster city where um.User_Id=ud.User_Id and c.Country_Id=ud.Country_Id and s.State_Id=ud.State_Id and city.City_Id=ud.City_Id and um.User_Id="+userid+";");
            while (rs.next()) {
                obj = new ViewRegisteredUserBean();
                obj.setTxtLoginName(rs.getString("loginname"));
                obj.setRbStatus(rs.getString("status"));
                obj.setTxtName(rs.getString("name"));
                obj.setTxtGender(rs.getString("gender"));
                obj.setTxtDob(rs.getString("dob"));
                obj.setTxtEmail(rs.getString("email"));
                obj.setTxtMobile(rs.getString("mobile"));
                obj.setTxtLastLogin(rs.getString("lastlogin"));
                obj.setTaAddress(rs.getString("address"));
                obj.setTxtPin(rs.getString("pincode"));
                obj.setTxtPhone(rs.getString("phonehome"));
                obj.setTxtEmail(rs.getString("email"));
                obj.setTxtCountry(rs.getString("Country_Name"));
                obj.setTxtState(rs.getString("State_Name"));
                obj.setTxtCity(rs.getString("City_Name"));
    
                
            }
        } catch (Exception e) {
            System.out.println("viewRegisteredUser " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("viewRegisteredUser in finally " + e);
            }
        }
        return obj;

    }
  
  
  

}
