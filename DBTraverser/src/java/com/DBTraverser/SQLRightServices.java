/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DBTraverser;

import com.bean.SQLRightBean;
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
public class SQLRightServices {

    public ArrayList getSQLLevelRight() {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        ArrayList a = new ArrayList();
        SQLRightBean obj = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select Right_Id,if(Title is null,'',Title) as title,if(Description is null,'',Description) as d,if(Is_Active is null,0,if(Is_Active = 1,'Active','Inactive')) as status from sqllevelrightmaster;");
            while (rs.next()) {
                obj = new SQLRightBean();
                obj.setTxtRightId(rs.getString("Right_Id"));
                obj.setTxtTitle(rs.getString("title"));
                obj.setTaDescription(rs.getString("d"));
                obj.setRbStatus(rs.getString("status"));

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

    public ArrayList searchSQLLevelRight(String search) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        ArrayList a = new ArrayList();
        SQLRightBean obj = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select Right_Id,if(Title is null,'',Title) as title,if(Description is null,'',Description) as d,if(Is_Active is null,0,if(Is_Active = 1,'Active','Inactive')) as status from sqllevelrightmaster where Title like '%" + search + "%';");
            while (rs.next()) {
                obj = new SQLRightBean();
                obj.setTxtRightId(rs.getString("Right_Id"));
                obj.setTxtTitle(rs.getString("title"));
                obj.setTaDescription(rs.getString("d"));
                obj.setRbStatus(rs.getString("status"));

                a.add(obj);
            }
        } catch (Exception e) {
            System.out.println("searchSQLLevelRight " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("searchSQLLevelRight in finally " + e);
            }
        }
        return a;

    }

    public void changeStatusOfRight(String rightid, String status) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = ConnectDB.connect();
            if (status.equalsIgnoreCase("active")) {
                pstmt = conn.prepareStatement("update sqllevelrightmaster set Is_Active=0 where Right_Id=?");
            } else {
                pstmt = conn.prepareStatement("update  sqllevelrightmaster set Is_Active=1 where Right_Id=?");
            }
            pstmt.setString(1, rightid);
            int i = pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("changeStatusOfRight " + e);
        } finally {
            try {
                pstmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("changeStatusOfRight in finally " + e);
            }
        }

    }

    public String addSqlRight(SQLRightBean obj) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String result = "Not Added ";
        try {
            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("select Right_Id from sqllevelrightmaster where Title=?");
            pstmt.setString(1, obj.getTxtTitle());
            rs = pstmt.executeQuery();
            if (rs.next()) {
                result = "found";
            } else {
                pstmt = conn.prepareStatement("insert into sqllevelrightmaster (Title,Description,Is_Active) values(?,?,?);");
                pstmt.setString(1, obj.getTxtTitle());
                pstmt.setString(2, obj.getTaDescription());
                pstmt.setString(3, obj.getRbStatus());
                int i = pstmt.executeUpdate();
                if (i > 0) {
                    result = "added";
                }

            }
        } catch (Exception e) {
            System.out.println("addSqlRight " + e);
        } finally {
            try {
                pstmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("addSqlRight in finally " + e);
            }
        }
        return result;
    }

    
     public SQLRightBean viewSQLLevelRight(String rightid) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        SQLRightBean obj = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select Right_Id,if(Title is null,'',Title) as title,if(Description is null,'',Description) as d,if(Is_Active is null,0,if(Is_Active = 1,'Active','Inactive')) as status from sqllevelrightmaster where Right_Id="+rightid+" ;");
            while (rs.next()) {
                obj = new SQLRightBean();
                obj.setTxtRightId(rs.getString("Right_Id"));
                obj.setTxtTitle(rs.getString("title"));
                obj.setTaDescription(rs.getString("d"));
                obj.setRbStatus(rs.getString("status"));
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
        return obj;

    }
     
     
    public String editSqlRight(SQLRightBean obj) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        String result = "Not Updated";
        try {
            conn = ConnectDB.connect();
            pstmt=conn.prepareStatement("select * from sqllevelrightmaster where Right_id !=? and Title =?");
            pstmt.setString(1, obj.getTxtRightId());
            pstmt.setString(2, obj.getTxtTitle());
            rs=pstmt.executeQuery();
            if(rs.next()){
                result="title name already exists";
            }else{
            pstmt = conn.prepareStatement("update sqllevelrightmaster set Title=?,Description=?,Is_Active=? where right_Id=?;");
            pstmt.setString(1, obj.getTxtTitle());
            pstmt.setString(2, obj.getTaDescription());
            pstmt.setString(3, obj.getRbStatus());

            pstmt.setString(4, obj.getTxtRightId());

            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = "updated";
            }
            }
        } catch (Exception e) {
            System.out.println("editSqlRight " + e);
        } finally {
            try {
                pstmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("editSqlRight in finally " + e);
            }
        }
        return result;
    }
}
