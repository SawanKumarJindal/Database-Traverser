
package com.DBTraverser;

import com.bean.ManageExpertBean;
import com.bean.AddEditExpertBean;
import com.common.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class ManageExpertServices {

    public List getExpertData() {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        ManageExpertBean obj = null;
        List list = new ArrayList();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select a.User_Id,if(a.Name,'',a.Name) as name,if(a.Gender is null,'',if(a.Gender=1,'Male','Female')) as gender,a.Email_Id,if(a.DOB is null,'',substring(a.DOB,1,10)) as dob,if(b.Status is null,'',if(b.Status=1,'Active','Inactive')) status,b.User_Name,concat(if(c.Department is null,'NA',c.Department),'/',if(c.Designation is null,'NA',c.Designation)) as Dd,concat(if(a.Phone_Home is null,'',a.Phone_Home),'/ ',if(a.Phone_Mobile is null,'',a.Phone_Mobile)) as contact from userdetail a,usermaster b,employeedetail c   where a.User_id=b.User_Id and c.Employee_Id=b.User_Id and b.User_Type='QueryExpert';");
            while (rs.next()) {
                obj = new ManageExpertBean();
                obj.setDOB(rs.getString("dob"));
                obj.setDepartment(rs.getString("Dd"));
                obj.setUser_Name(rs.getString("User_Name"));
                obj.setEmail(rs.getString("Email_Id"));
                obj.setGender(rs.getString("gender"));
                obj.setName(rs.getString("name"));
                obj.setStatus(rs.getString("status"));
                obj.setUser_Id(rs.getInt("User_Id"));
                obj.setContact(rs.getString("contact"));
                list.add(obj);
            }
        } catch (Exception e) {
            System.out.println("Manage Expert Services" + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("in finally getExpertData   " + e);
            }
        }
        return list;
    }
    public List getExpertData(String name) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        ManageExpertBean obj = null;
        List list = new ArrayList();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
           rs = stmt.executeQuery("select a.User_Id,if(a.Name,'',a.Name) as name,if(a.Gender is null,'',if(a.Gender=1,'Male','Female')) as gender,a.Email_Id,if(a.DOB is null,'',substring(a.DOB,1,10)) as dob,if(b.Status is null,'',if(b.Status=1,'Active','Inactive')) status,b.User_Name,concat(if(c.Department is null,'NA',c.Department),'/',if(c.Designation is null,'NA',c.Designation)) as Dd,concat(if(a.Phone_Home is null,'',a.Phone_Home),'/ ',if(a.Phone_Mobile is null,'',a.Phone_Mobile)) as contact from userdetail a,usermaster b,employeedetail c   where a.User_id=b.User_Id and c.Employee_Id=b.User_Id and b.User_Type='QueryExpert' and a.Name like '%"+name+"%';");
            while (rs.next()) {
                obj = new ManageExpertBean();
                obj.setDOB(rs.getString("DOB"));
                obj.setDepartment(rs.getString("Dd"));
                obj.setUser_Name(rs.getString("User_Name"));
                obj.setEmail(rs.getString("Email_Id"));
                obj.setGender(rs.getString("Gender"));
                obj.setName(rs.getString("name"));
                obj.setStatus(rs.getString("Status"));
                obj.setUser_Id(rs.getInt("User_Id"));
                obj.setContact(rs.getString("contact"));
                list.add(obj);
            }
        } catch (Exception e) {
            System.out.println("Manage Expert Services" + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("in finally getExpertData   " + e);
            }
        }
        return list;
    }
    
     public void changeStatusOfExpert(String userid, String status) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = ConnectDB.connect();
            if (status.equalsIgnoreCase("active")) {
                pstmt = conn.prepareStatement("update usermaster set Status=0 where User_Id=?;");
            } else {
                pstmt = conn.prepareStatement("update usermaster set Status=1 where User_Id=?;");
            }
            pstmt.setString(1, userid);
            int i = pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("changeStatusOfExpert " + e);
        } finally {
            try {
                pstmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("changeStatusOfExpert in finally " + e);
            }
        }
    }
     
     
      public String addQueryExpert(AddEditExpertBean obj) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String result = "Record Not Added ";
        try {
            conn = ConnectDB.connect();
            pstmt=conn.prepareStatement("select User_Id from usermaster where User_Name =?");
            pstmt.setString(1, obj.getTxtUsername());
            rs=pstmt.executeQuery();
            if(rs.next()){
                return "Username Already Exists";
            }
            pstmt=conn.prepareStatement("insert into usermaster (User_Name,Password,User_Type,Status) values(?,?,'QueryExpert',1)");
            pstmt.setString(1, obj.getTxtUsername());
            pstmt.setString(2, obj.getTxtPassword());
          //  pstmt.setString(3, obj.getRbStatus());
            int i=pstmt.executeUpdate();
            if(i>0){
                pstmt=conn.prepareStatement("select max(User_Id) as max from usermaster");
                rs=pstmt.executeQuery();
                int max=0;
                if(rs.next()){
                    max=rs.getInt("max");
                }
                pstmt=conn.prepareStatement("insert into userdetail values(?,?,?,?,?,?,?,?,?,?,?,?)");
                pstmt.setInt(1, max);
                pstmt.setString(2, obj.getTxtName());
                pstmt.setString(3, obj.getRbGender());
                pstmt.setString(4, obj.getTxtDOB());
                pstmt.setString(5, obj.getTaAddress());
                pstmt.setInt(6, obj.getDdlCountry());
                pstmt.setInt(7, obj.getDdlState());
                pstmt.setInt(8, obj.getDdlCity());
                pstmt.setString(9, obj.getTxtPin());
                pstmt.setString(10, obj.getTxtPhone());
                pstmt.setString(11, obj.getTxtMobile());
                pstmt.setString(12, obj.getTxtEmailID());
                i=pstmt.executeUpdate();
                if(i>0){
                    pstmt=conn.prepareStatement("insert into employeedetail values(?,?,?,?,?)");
                    pstmt.setInt(1, max);
                    pstmt.setString(2, obj.getTxtDepartment());
                    pstmt.setString(3, obj.getTxtDesignation());
                    pstmt.setString(4, obj.getTxtDOJ());
                    pstmt.setString(5, obj.getTaOtherDetails());
                    i=pstmt.executeUpdate();
                    if(i>0){
                        result="added";
                    }
                }
            }
            
        }
        catch(Exception e){
            System.out.println("addQueryExpert " + e);
        }finally {
            try {
                pstmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("addQueryExpert in finally " + e);
            }
        }
        return result;
      }
      
      
       public AddEditExpertBean viewExpertQueryDetail(String userid) {
        Connection con = null;
        ResultSet rs = null;
        Statement stmt = null;
        AddEditExpertBean obj = new AddEditExpertBean();
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            rs = stmt.executeQuery("select um.User_Name,um.Password,if(um.Status is null,0,um.Status)as status,ud.Name,if(ud.Gender is null,'F',ud.Gender) as gender,if(ud.DOB is null,'',substring(ud.DOB,1,10)) as dob,if(ud.Address is null,'',ud.Address) as address,if(ud.Country_Id is null,0,ud.Country_Id) as countryid,if(ud.State_Id is null,0,ud.State_Id) as stateid,if(ud.City_Id is null,0,ud.City_Id) as cityid,if(ud.Pin_Code is null,'',ud.Pin_Code) as pin,if(ud.Phone_Mobile is null,'',ud.Phone_Mobile) as mobile,if(ud.Phone_Home is null,'',ud.Phone_Home) as phone,if(ud.Email_Id is null,'',ud.Email_Id) as emailid,if(e.Department is null,'',e.Department) as department,if(e.Designation is null,'',e.Designation) as designation,if(e.DOJ is null,'',substring(e.DOJ,1,10)) as doj,if(e.Other_details is null,'',e.Other_details) as other from  usermaster um,userdetail ud,employeedetail e where um.User_id=ud.User_Id and um.User_Id=e.Employee_Id and um.User_Id='"+userid+"'");
            while (rs.next()) {
                obj.setTxtUsername(rs.getString("um.User_Name"));
                obj.setTxtPassword(rs.getString("um.Password"));
                obj.setRbStatus(rs.getString("status"));
                
                obj.setTxtName(rs.getString("ud.Name"));
                obj.setRbGender(rs.getString("gender"));
                obj.setTxtDOB(rs.getString("dob"));
                obj.setTaAddress(rs.getString("address"));
                obj.setDdlCountry(rs.getInt("countryid"));
                obj.setDdlState(rs.getInt("stateid"));
                obj.setDdlCity(rs.getInt("cityid"));
                
                obj.setTxtPhone(rs.getString("phone"));
                obj.setTxtMobile(rs.getString("mobile"));
                obj.setTxtPin(rs.getString("pin"));
                obj.setTxtEmailID(rs.getString("emailid"));
                obj.setTxtDepartment(rs.getString("department"));
                obj.setTxtDesignation(rs.getString("designation"));
                obj.setTxtDOJ(rs.getString("doj"));
                obj.setTaOtherDetails(rs.getString("other"));
            }
        } catch (Exception e) {
            System.out.println("viewExpertQueryDetail() " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("in finally block of viewExpertQueryDetail()" + e);
            }
        }
        return obj;
    }
       
       
       
      public String editQueryExpert(AddEditExpertBean obj) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String result = "Record Not updated ";
        try {
            conn = ConnectDB.connect();
            
            pstmt=conn.prepareStatement("update usermaster set Password=?,Status=? where user_id=?");
            
            pstmt.setString(1, obj.getTxtPassword());
            pstmt.setString(2, obj.getRbStatus());
            pstmt.setString(3, obj.getTxtUserId());
            
            int i=pstmt.executeUpdate();
            if(i>0){
                
                pstmt=conn.prepareStatement("update userdetail set Name=?,Gender=?,DOB=?,Address=?,Country_Id=?,State_id=?,City_Id=?,Pin_Code=?,Phone_Mobile=?,phone_Home=?,Email_Id=? where user_id=?");
                
                pstmt.setString(1, obj.getTxtName());
                pstmt.setString(2, obj.getRbGender());
                pstmt.setString(3, obj.getTxtDOB());
                pstmt.setString(4, obj.getTaAddress());
                pstmt.setInt(5, obj.getDdlCountry());
                pstmt.setInt(6, obj.getDdlState());
                pstmt.setInt(7, obj.getDdlCity());
                pstmt.setString(8, obj.getTxtPin());
                pstmt.setString(9, obj.getTxtPhone());
                pstmt.setString(10, obj.getTxtMobile());
                pstmt.setString(11, obj.getTxtEmailID());
                pstmt.setString(12, obj.getTxtUserId());
                
                i=pstmt.executeUpdate();
                if(i>0){
                    pstmt=conn.prepareStatement("update employeedetail set department=?,designation=?,DOJ=?,Other_details=? where Employee_id=?");
                    
                    pstmt.setString(1, obj.getTxtDepartment());
                    pstmt.setString(2, obj.getTxtDesignation());
                    pstmt.setString(3, obj.getTxtDOJ());
                    pstmt.setString(4, obj.getTaOtherDetails());
                    pstmt.setString(5, obj.getTxtUserId());
                    
                    i=pstmt.executeUpdate();
                    if(i>0){
                        result="updated";
                    }
                }
            }
            
        }
        catch(Exception e){
            System.out.println("addQueryExpert " + e);
        }finally {
            try {
                pstmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("addQueryExpert in finally " + e);
            }
        }
        return result;
      }
     
}
