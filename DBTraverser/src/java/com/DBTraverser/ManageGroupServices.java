/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DBTraverser;

import com.bean.SQLRightBean;
import com.bean.ManageGroupBean;
import com.bean.AddEditGroupBean;
import com.common.ConnectDB;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;

/**
 *
 * @author student
 */
public class ManageGroupServices {

    public ArrayList getGroupDetail() {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        ArrayList a = new ArrayList();
        ManageGroupBean obj = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select Group_Id,if(Title is null,'',Title) as title,if(Is_Active is null,'Inactive',if(Is_Active=1,'Active','Inactive')) as status,if(Cost is null,'N/A',Cost) as cost,if(Validity_In_Days is null,0,Validity_In_Days) as validity,if(Is_Unlimited_Validity is null,'No',if(Is_Unlimited_Validity=1,'Yes','No')) as unlimited from groupmaster;");
            while (rs.next()) {
                obj = new ManageGroupBean();
                obj.setTxtGroupId(rs.getString("Group_Id"));
                obj.setTxtTitle(rs.getString("title"));
                obj.setTxtCost(rs.getString("cost"));
                obj.setTxtActive(rs.getString("status"));
                obj.setTxtValidity(rs.getString("validity"));
                obj.setTxtUnlimited(rs.getString("unlimited"));
                a.add(obj);
            }
        } catch (Exception e) {
            System.out.println("getGroupDetail   " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("getGroupDetail   in finally " + e);
            }
        }
        return a;

    }

    public ArrayList searchGroupDetail(String title) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        ArrayList a = new ArrayList();
        ManageGroupBean obj = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select Group_Id,if(Title is null,'',Title) as title,if(Is_Active is null,'Inactive',if(Is_Active=1,'Active','Inactive')) as status,if(Cost is null,'N/A',Cost) as cost,if(Validity_In_Days is null,0,Validity_In_Days) as validity,if(Is_Unlimited_Validity is null,'No',if(Is_Unlimited_Validity=1,'Yes','No')) as unlimited from groupmaster where Title like '%" + title + "%';");
            while (rs.next()) {
                obj = new ManageGroupBean();
                obj.setTxtGroupId(rs.getString("Group_Id"));
                obj.setTxtTitle(rs.getString("title"));
                obj.setTxtCost(rs.getString("cost"));
                obj.setTxtActive(rs.getString("status"));
                obj.setTxtValidity(rs.getString("validity"));
                obj.setTxtUnlimited(rs.getString("unlimited"));
                a.add(obj);
            }
        } catch (Exception e) {
            System.out.println("searchGroupDetail   " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("searchGroupDetail   in finally " + e);
            }
        }
        return a;

    }

    public void changeStatusOfGroup(String groupid, String status) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = ConnectDB.connect();
            if (status.equalsIgnoreCase("active")) {
                pstmt = conn.prepareStatement("update groupmaster set Is_Active=0 where Group_Id=?;");
            } else {
                pstmt = conn.prepareStatement("update groupmaster set Is_Active=1 where Group_Id=?;");
            }
            pstmt.setString(1, groupid);
            int i = pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("changeStatusOfGroup " + e);
        } finally {
            try {
                pstmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("changeStatusOfGroup in finally " + e);
            }
        }

    }

    public ArrayList getSQLLevelRight() {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        ArrayList a = new ArrayList();
        SQLRightBean obj = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select Right_Id,if(Title is null,'',Title) as title,if(Description is null,'',Description) as d from sqllevelrightmaster;");
            while (rs.next()) {
                obj = new SQLRightBean();
                obj.setTxtRightId(rs.getString("Right_Id"));
                obj.setTxtTitle(rs.getString("title"));
                obj.setTaDescription(rs.getString("d"));

                a.add(obj);
            }
        } catch (Exception e) {
            System.out.println("getSQLLevelRight " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("getSQLLevelRight in finally " + e);
            }
        }
        return a;

    }

    public String addGroupDetail(AddEditGroupBean obj) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String result = "Not Added ";
        try {
            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("select Group_Id from groupmaster where Title=?;");
            pstmt.setString(1, obj.getTxtTitle());
            rs = pstmt.executeQuery();
            if (rs.next()) {
                result = "found";
            } else {
                pstmt = conn.prepareStatement("insert into groupmaster (Title,Description,Is_Active,Cost,Validity_In_Days,Is_Unlimited_validity) values(?,?,?,?,?,?);");
                pstmt.setString(1, obj.getTxtTitle());
                pstmt.setString(2, obj.getTaDescription());
                pstmt.setString(3, obj.getRbStatus());
                pstmt.setString(4, obj.getTxtCost());
                if(obj.getTxtValidity()==null){
                    obj.setTxtValidity("0");
                }
                pstmt.setString(5, obj.getTxtValidity());
                pstmt.setString(6, obj.getRbUnlimited());
                int i = pstmt.executeUpdate();
                if (i > 0) {
                    result = "added";
                    pstmt = conn.prepareStatement("select max(Group_Id) as id from groupmaster;");
                    rs = pstmt.executeQuery();
                    if (rs.next()) {
                        int id = rs.getInt("id");
                        String str[] = obj.getChkSelect();
                        if (str.length > 0) {
                            for (i = 0; i < str.length; i++) {
                                pstmt = conn.prepareStatement("insert into grouprights values(?,?);");
                                pstmt.setInt(1, id);
                                pstmt.setString(2, str[i]);
                                 pstmt.executeUpdate();

                            }
                        }
                    }
                }

            }
        } catch (Exception e) {
            System.out.println("addGroupDetail   " + e);
        } finally {
            try {
                pstmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("addGroupDetail in finally " + e);
            }
        }
        return result;
    }

    public AddEditGroupBean viewGroupDetail(String groupid) {
        Connection conn = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        Statement stmt = null;
        AddEditGroupBean obj = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select Title,if(Description is null,'',Description) as d,if(Is_Active is null,'Inactive',if(Is_Active=1,'Active','Inactive')) as status,if(Cost is null,'',Cost) as cost,if(Validity_In_Days is null,0,Validity_In_Days) as validity,if(Is_Unlimited_validity is null,'0',Is_Unlimited_validity) as unlimited from groupmaster where Group_Id=" + groupid + ";");
            if (rs.next()) {
                obj = new AddEditGroupBean();

                obj.setTxtTitle(rs.getString("title"));
                obj.setTaDescription(rs.getString("d"));
                obj.setRbStatus(rs.getString("status"));
                obj.setTxtCost(rs.getString("cost"));
                obj.setTxtValidity(rs.getString("validity"));
                obj.setRbUnlimited(rs.getString("unlimited"));

            }
            rs = stmt.executeQuery("select count(Right_Id) as c from grouprights where Group_Id=" + groupid + ";");
            //System.out.println("opoppou");
            String str[];
            int i = 0;
            if (rs.next()) {
                // System.out.println("opoppou rsssssssssss in data"+rs.getInt("c"));
                str = new String[rs.getInt("c")];
                rs1 = stmt.executeQuery("select Right_Id from grouprights where Group_Id=" + groupid + ";");
                while (rs1.next()) {
                    str[i] = rs1.getString("Right_Id");
                    i++;
                    // System.out.println("in database  in rs  i   "+i);
                }
                obj.setChkSelect(str);
            }

        } catch (Exception e) {
            System.out.println("viewGroupDetail " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("viewGroupDetail in finally " + e);
            }
        }
        return obj;

    }

    public String updateGroupDetail(AddEditGroupBean obj) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String result = "Not updated ";
        try {
            conn = ConnectDB.connect();

            pstmt = conn.prepareStatement("update groupmaster set Title=?,Description=?,Is_Active=?,Cost=?,Validity_In_Days=?,Is_Unlimited_validity=? where group_Id=?;");
            pstmt.setString(1, obj.getTxtTitle());
            pstmt.setString(2, obj.getTaDescription());
            pstmt.setString(3, obj.getRbStatus());
            pstmt.setString(4, obj.getTxtCost());
            pstmt.setString(5, obj.getTxtValidity());
            pstmt.setString(6, obj.getRbUnlimited());
            pstmt.setString(7, obj.getTxtGroupId());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = "updated";
                String str[]=obj.getChkSelect();
                
                // To delete record
                int flag=0;
                pstmt=conn.prepareStatement("select Right_Id from grouprights where Group_Id=?");
                pstmt.setString(1, obj.getTxtGroupId());
                rs=pstmt.executeQuery();
                String rightid="";
                while(rs.next()){
                    rightid=rs.getString("Right_Id");
                    for(i=0;i<obj.getChkSelect().length;i++){
                        if(str[i].equalsIgnoreCase(rightid)){
                        flag=1;break;
                        }
                    }
                    if(flag==0){
                        pstmt=conn.prepareStatement("delete from grouprights where Right_Id=?");
                        pstmt.setString(1, rightid);
                        System.out.println("delete "+pstmt);
                        int j=pstmt.executeUpdate();
                    }
                    flag=0;
                }
                
                
                
                // ******************************* //  
                
                
                for(i=0;i<obj.getChkSelect().length;i++){
                    pstmt=conn.prepareStatement("select * from grouprights where Group_Id=? and Right_Id=?");
                    pstmt.setString(1, obj.getTxtGroupId());
                    pstmt.setString(2, str[i]);
                    rs=pstmt.executeQuery();
                    if(rs.next()){
                        /*pstmt=conn.prepareStatement("delete from grouprights where Right_Id=?");
                        pstmt.setString(1, str[i]);
                        System.out.println("delete "+pstmt);
                        int j=pstmt.executeUpdate();*/
                    }else{
                        pstmt=conn.prepareStatement("insert into grouprights values(?,?)");
                        pstmt.setString(1, obj.getTxtGroupId());
                        pstmt.setString(2, str[i]);
                        int j=pstmt.executeUpdate();
                    }
                }               
            }
        } catch (Exception e) {
            System.out.println("updateGroupDetail   " + e);
        } finally {
            try {
                pstmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("updateGroupDetail  in finally " + e);
            }
        }
        return result;
    }
}
