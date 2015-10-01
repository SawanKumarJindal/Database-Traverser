/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DBTraverser;

import com.bean.AvailableGroupRightsBean;
import com.common.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author sumit
 */
public class AvailableGroupRightsServices {

    public ArrayList getPresentGroupAndRight(String userid) {
        Connection conn = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        Statement stmt = null;
        Statement stmt1 = null;
        ArrayList alPresent = new ArrayList();
        AvailableGroupRightsBean objBean = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            stmt1 = conn.createStatement();
            rs = stmt.executeQuery("select rg.Group_Id,if(rg.Is_Unlimited_Validity is null,'No',if(rg.Is_Unlimited_Validity=1,'Yes','No')) as unlimited,if(rg.Validity_Till_Date is null,'',substring(rg.Validity_Till_Date,1,10)) as validity,if(rg.Allocation_Date is null,'',substring(rg.Allocation_Date,1,10)) as allocation,if(gm.Title is null,'',gm.Title) as title,if(gm.Description is null,'',gm.Description) as description,if(gm.Cost is null,'',gm.Cost) as cost from registeredusergroup rg,groupmaster gm where rg.Group_Id=gm.Group_Id and rg.Is_Active=1 and rg.User_Id='" + userid + "';");
            while (rs.next()) {
                objBean = new AvailableGroupRightsBean();
                objBean.setTxtGroupId(rs.getString("rg.Group_Id"));
                objBean.setTxtTitle(rs.getString("title"));
                objBean.setTaDescription(rs.getString("description"));
                objBean.setTxtCost(rs.getString("cost"));
                objBean.setTxtUnlimited(rs.getString("unlimited"));
                objBean.setTxtValidity(rs.getString("validity"));
                objBean.setTxtAllocationDate(rs.getString("allocation"));

                ArrayList al1 = new ArrayList();
                rs1 = stmt1.executeQuery("select if(sm.Title is null,'',sm.Title) as title from sqllevelrightmaster sm,grouprights gr where sm.Right_Id=gr.Right_Id and gr.group_Id='" + objBean.getTxtGroupId() + "';");
                while (rs1.next()) {
                    //  System.out.println("title 1  "+rs1.getString("title")+"select if(sm.Title is null,'',sm.Title) as title from sqllevelrightmaster sm,grouprights gr where sm.Right_Id=gr.Right_Id and gr.Group_Id='" + objBean.getTxtGroupId() + "';");
                    al1.add(rs1.getString("title"));
                }
                objBean.setAlRights(al1);
                alPresent.add(objBean);
            }

        } catch (Exception e) {
            System.out.println("getPresentGroupAndRight " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("getPresentGroupAndRight in finally " + e);
            }
        }
        return alPresent;

    }

    public ArrayList getAvailableGroupAndRight(String userid) {
        Connection conn = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        Statement stmt = null;
        Statement stmt1 = null;
        AvailableGroupRightsBean objBean = null;
        ArrayList alAvailable = new ArrayList();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            stmt1 = conn.createStatement();
            rs = stmt.executeQuery("select Group_Id,if(Is_Unlimited_Validity is null,'No',if(Is_Unlimited_Validity=1,'Yes','No')) as unlimited,if(Validity_In_Days is null,'',Validity_In_Days) as validity,if(Title is null,'',Title) as title,if(Description is null,'',Description) as description,if(Cost is null,'',Cost) as cost from groupmaster  where  Group_Id not in (select Group_Id from registeredusergroup where User_Id=" + userid + " and Is_Active=1);");
            while (rs.next()) {
                objBean = new AvailableGroupRightsBean();
                objBean.setTxtGroupId(rs.getString("Group_Id"));
                objBean.setTxtTitle(rs.getString("title"));
                objBean.setTaDescription(rs.getString("description"));
                objBean.setTxtCost(rs.getString("cost"));
                objBean.setTxtUnlimited(rs.getString("unlimited"));
                objBean.setTxtValidity(rs.getString("validity"));

                ArrayList al1 = new ArrayList();
                //  System.out.println("title   select if(sm.Title is null,'',sm.Title) as title from sqllevelrightmaster sm,grouprights gr where sm.Right_Id=gr.Right_Id and gr.group_Id='" + objBean.getTxtGroupId() + "';");
                rs1 = stmt1.executeQuery("select if(sm.Title is null,'',sm.Title) as title from sqllevelrightmaster sm,grouprights gr where sm.Right_Id=gr.Right_Id and gr.group_Id='" + objBean.getTxtGroupId() + "';");
                while (rs1.next()) {
                    //   System.out.println("title   "+rs1.getString("title")+"select if(sm.Title is null,'',sm.Title) as title from sqllevelrightmaster sm,grouprights gr where sm.Right_Id=gr.Right_Id and gr.group_Id='" + objBean.getTxtGroupId() + "';");
                    al1.add(rs1.getString("title"));
                }
                objBean.setAlRights(al1);
                alAvailable.add(objBean);
            }

        } catch (Exception e) {
            System.out.println("getAvailableGroupAndRight " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("getAvailableGroupAndRight   in finally " + e);
            }
        }
        return alAvailable;

    }

    public String buyAvailableGroup(String userid, String groupid) {
        Connection conn = null;
        ResultSet rs = null;
        String result = "Group not bought";
        PreparedStatement pstmt = null;
        Statement stmt = null;
        String username = "", password = "";
        String privilege = "insert create select ";
        try {
            int unlimited = 0;
            String validity = "";
            conn = ConnectDB.connect();

            pstmt = conn.prepareStatement("select Group_Id from registeredusergroup where User_id=? and Group_Id=? and Is_Active=1");
            pstmt.setString(1, userid);
            pstmt.setString(2, groupid);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                result = "Group already bought";
            } else {

                pstmt = conn.prepareStatement("select Validity_In_days,Is_Unlimited_Validity from groupmaster where group_Id=?");
                pstmt.setString(1, groupid);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    result = "y";
                    validity = rs.getString("Validity_In_days");
                    unlimited = rs.getInt("Is_Unlimited_Validity");

                }
                if (result.equalsIgnoreCase("y")) {
                    int i = 0;
                    pstmt = conn.prepareStatement("select adddate(sysdate(),interval '" + validity + "' day) as date");
                    rs = pstmt.executeQuery();
                    if (rs.next()) {
                        validity = rs.getString("date");
                        pstmt = conn.prepareStatement("insert into registeredusergroup (User_id,Group_Id,Allocation_Date,Is_Active,Is_Unlimited_validity,Validity_till_Date) values(?,?,sysdate(),1,?,?)");
                        pstmt.setString(1, userid);
                        pstmt.setString(2, groupid);
                        pstmt.setInt(3, unlimited);
                        pstmt.setString(4, validity);
                        System.out.println("1......  " + pstmt);
                        i = pstmt.executeUpdate();

                    }
                    if (i > 0) {
                        result = "Group bought successfully";
                        pstmt = conn.prepareStatement("select max(registeredusergroup_Id) as r from registeredusergroup");
                        rs = pstmt.executeQuery();
                        if (rs.next()) {
                            i = rs.getInt("r");
                        }
                        pstmt = conn.prepareStatement("update registeredusergroup set Is_Active=0 where User_id=? and registeredusergroup_Id!=?");
                        pstmt.setString(1, userid);
                        pstmt.setInt(2, i);
                        i = pstmt.executeUpdate();
                        if (i > 0) {
                            result = "Group bought successfully  and added";

                            pstmt = conn.prepareStatement("select user_name,password from usermaster where user_Id=" + userid + "");
                            rs = pstmt.executeQuery();
                            if (rs.next()) {
                                username = rs.getString("user_name");
                                password = rs.getString("password");
                            }

                            pstmt = conn.prepareStatement("select right_id from grouprights where group_Id=?");
                            pstmt.setString(1, groupid);
                            rs = pstmt.executeQuery();
                            ResultSet rs1 = null;

                            while (rs.next()) {
                                pstmt = conn.prepareStatement("select Title from sqllevelrightmaster where right_id=?");
                                pstmt.setInt(1, rs.getInt("right_id"));
                                rs1 = pstmt.executeQuery();
                                rs1.next();
                                privilege += rs1.getString("Title") + " ";

                            }

                        }
                    }

                }
            }


        } catch (Exception e) {
            System.out.println("buyAvailableGroup " + e);
        } finally {
            try {

                privilege = privilege.trim();
                privilege = privilege.replaceAll(" ", ",");

                if (!privilege.equals("") || !privilege.equals(",")) {

                    stmt = conn.createStatement();
                    int i = stmt.executeUpdate("REVOKE ALL PRIVILEGES, GRANT OPTION from  '" + username + "'@'localhost' identified by '" + password + "';");
                    i = stmt.executeUpdate("grant " + privilege + " on " + username + ".* to '" + username + "'@'localhost' identified by '" + password + "';");
                    i = stmt.executeUpdate("flush privileges;");
                }
                rs.close();
                stmt.close();
                pstmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("buyAvailableGroup   in finally " + e);
            }
        }
        return result;

    }

    public ArrayList getOldGroupAndRights(String userid) {
        Connection conn = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        Statement stmt = null;
        Statement stmt1 = null;
        ArrayList alPresent = new ArrayList();
        AvailableGroupRightsBean objBean = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            stmt1 = conn.createStatement();
            rs = stmt.executeQuery("select rg.Group_Id,if(rg.Is_Unlimited_Validity is null,'No',if(rg.Is_Unlimited_Validity=1,'Yes','No')) as unlimited,if(rg.Validity_Till_Date is null,'',substring(rg.Validity_Till_Date,1,10)) as validity,if(rg.Allocation_Date is null,'',substring(rg.Allocation_Date,1,10)) as allocation,if(gm.Title is null,'',gm.Title) as title,if(gm.Description is null,'',gm.Description) as description,if(gm.Cost is null,'',gm.Cost) as cost from registeredusergroup rg,groupmaster gm where rg.Group_Id=gm.Group_Id and rg.Is_Active=0 and rg.User_Id='" + userid + "';");
            while (rs.next()) {
                objBean = new AvailableGroupRightsBean();
                objBean.setTxtGroupId(rs.getString("rg.Group_Id"));
                objBean.setTxtTitle(rs.getString("title"));
                objBean.setTaDescription(rs.getString("description"));
                objBean.setTxtCost(rs.getString("cost"));
                objBean.setTxtUnlimited(rs.getString("unlimited"));
                objBean.setTxtValidity(rs.getString("validity"));
                objBean.setTxtAllocationDate(rs.getString("allocation"));

                ArrayList al1 = new ArrayList();
                rs1 = stmt1.executeQuery("select if(sm.Title is null,'',sm.Title) as title from sqllevelrightmaster sm,grouprights gr where sm.Right_Id=gr.Right_Id and gr.group_Id='" + objBean.getTxtGroupId() + "';");
                while (rs1.next()) {
                    //  System.out.println("title 1  "+rs1.getString("title")+"select if(sm.Title is null,'',sm.Title) as title from sqllevelrightmaster sm,grouprights gr where sm.Right_Id=gr.Right_Id and gr.Group_Id='" + objBean.getTxtGroupId() + "';");
                    al1.add(rs1.getString("title"));
                }
                objBean.setAlRights(al1);
                alPresent.add(objBean);
            }

        } catch (Exception e) {
            System.out.println("getPresentGroupAndRight " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("getPresentGroupAndRight in finally " + e);
            }
        }
        return alPresent;

    }

    public ArrayList getTotalCollection(String startdate, String enddate) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        ArrayList al = new ArrayList();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select sum(Cost) as total,Allocation_date  from registeredusergroup rg,groupmaster g where g.Group_Id=rg.Group_Id and Allocation_date between '" + startdate + "' and '" + enddate + "' group by substring(rg.Allocation_date,1,10);");
            while (rs.next()) {
                ArrayList alst = new ArrayList();
                alst.add(rs.getString("total"));
                alst.add(rs.getString("Allocation_date"));
                al.add(alst);
            }

        } catch (Exception e) {
            System.out.println("getTotalCollection  " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("getTotalCollection  in finally " + e);
            }
        }
        return al;

    }
}
