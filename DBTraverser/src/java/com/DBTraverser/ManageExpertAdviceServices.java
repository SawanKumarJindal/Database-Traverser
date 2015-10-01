/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DBTraverser;

import com.bean.QueryBean;
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
public class ManageExpertAdviceServices {
    
     public ArrayList getExpertAdviceForUser(int userid,String search) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        QueryBean obj = null;
        ArrayList list = new ArrayList();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select er.request_Id,if(er.Query_Request is null,'',er.Query_Request) as QueryRequest,if(er.Post_Date is null,'',substring(er.Post_Date,1,10)) as PostDate,if(es.Solution_Id is null,'Not Available','Available') as solution from expertqueryrequest er left join expertquerysolution es on er.request_id=es.Request_id where er.user_id="+userid+" and er.Query_Request like '%"+search+"%'");
            while (rs.next()) { 
                obj = new QueryBean();
                obj.setTxtRequestId(rs.getInt("er.request_Id"));
                obj.setTaDescription(rs.getString("solution"));
                obj.setTxtQueryRequest(rs.getString("QueryRequest"));
                obj.setTxtPostDate(rs.getString("PostDate"));
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
     
    
    
     
      public boolean addQueryExpert(QueryBean obj) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean flag=false;
        try {
            conn = ConnectDB.connect();
            
                pstmt=conn.prepareStatement("insert into expertqueryrequest (User_id,Query_Request,DB_Script_File_Path,DB_Script_Description,Post_Date,Status) values(?,?,?,?,sysdate(),1)");
                pstmt.setInt(1, obj.getTxtUserId());
                pstmt.setString(2, obj.getTxtQueryRequest());
                pstmt.setString(3, obj.getFlQueryScriptFile());
                pstmt.setString(4, obj.getTaDescription());
                System.out.println(""+pstmt);
                int i=pstmt.executeUpdate();
                if(i>0){
                    flag=true;
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
        return flag;
      }
      
      
      
       public QueryBean viewQueryForUser(int requestid) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        QueryBean obj = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select if(er.Query_Request is null,'',er.Query_Request) as QueryRequest,if(er.Post_Date is null,'',substring(er.Post_Date,1,10)) as PostDate,if(er.DB_Script_description is null,'',er.DB_Script_description) as description,if(er.DB_Script_File_Path is null,'',er.DB_Script_File_Path) as filepath,if(es.Solution_Id is null,'Not Available','Available') as solution,if(es.Solution_Id is null,0,es.Solution_Id) as solutionid from expertqueryrequest er left join expertquerysolution es on er.request_id=es.Request_id where er.Request_id="+requestid+"");
            while (rs.next()) { 
                obj = new QueryBean();
                obj.setTxtSolutionId(rs.getInt("solutionid"));
                obj.setTxtSolution(rs.getString("solution"));
                obj.setTxtQueryRequest(rs.getString("QueryRequest"));
                obj.setTaDescription(rs.getString("description"));
                obj.setTxtPostDate(rs.getString("PostDate"));
                obj.setFlQueryScriptFile(rs.getString("filepath"));
            }
        } catch (Exception e) {
            System.out.println("viewQueryForUser  " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("in finally viewQueryForUser   " + e);
            }
        }
        return obj;
    }
       public QueryBean viewQuerySolutionsForUser(int solutionid) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        QueryBean obj = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select ud.Name,if(es.Response_Date is null,'',substring(es.Response_Date,1,10)) as responsedate,if(es.Solution_Description is null,'',es.Solution_Description) as description,if(es.Solution_File_Path is null,'',es.Solution_File_Path) as solutionpath from expertquerysolution es inner join userdetail ud  on ud.User_Id=es.Expert_User_Id where es.Solution_id="+solutionid+"");
            while (rs.next()) { 
                obj = new QueryBean();
                
                obj.setTxtUserName(rs.getString("ud.Name"));
                obj.setTaDescription(rs.getString("description"));
                
                obj.setTxtPostDate(rs.getString("responsedate"));
                obj.setFlQueryScriptFile(rs.getString("solutionpath"));
            }
        } catch (Exception e) {
            System.out.println("viewQueryForUser  " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("in finally viewQueryForUser   " + e);
            }
        }
        return obj;
    }
       
       
       
       public ArrayList getRequestForAdviceByExpert() {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        QueryBean obj = null;
        ArrayList list = new ArrayList();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select er.request_Id,if(er.Query_Request is null,'',er.Query_Request) as QueryRequest,if(er.Post_Date is null,'',substring(er.Post_Date,1,10)) as PostDate,ud.Name from userdetail ud inner join expertqueryrequest er on er.User_id=ud.User_id");
            while (rs.next()) { 
                obj = new QueryBean();
                obj.setTxtRequestId(rs.getInt("er.request_Id"));
                obj.setTxtUserName(rs.getString("ud.Name"));
                obj.setTxtQueryRequest(rs.getString("QueryRequest"));
                obj.setTxtPostDate(rs.getString("PostDate"));
                list.add(obj);
            }
        } catch (Exception e) {
            System.out.println("getRequestForAdviceByExpert " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("in finally getRequestForAdviceByExpert   " + e);
            }
        }
        return list;
    }
       
       
       public QueryBean getRequestForAdviceByExpert(int requestid) {
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        QueryBean obj = new QueryBean();
        
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select er.request_Id,if(er.Query_Request is null,'',er.Query_Request) as QueryRequest,if(er.Post_Date is null,'',substring(er.Post_Date,1,10)) as PostDate,er.DB_Script_File_Path,er.DB_Script_description as description,ud.Name from userdetail ud inner join expertqueryrequest er on er.User_id=ud.User_id and er.Request_id="+requestid+"");
            while (rs.next()) { 
                
                obj.setTxtRequestId(rs.getInt("er.request_Id"));
                obj.setTxtUserName(rs.getString("ud.Name"));
                obj.setTxtQueryRequest(rs.getString("QueryRequest"));
                obj.setTxtPostDate(rs.getString("PostDate"));
               obj.setFlQueryScriptFile(rs.getString("er.DB_Script_File_Path"));
               obj.setTaDescription(rs.getString("description"));
            }
        } catch (Exception e) {
            System.out.println("getRequestForAdviceByExpert " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                System.out.println("in finally getRequestForAdviceByExpert   " + e);
            }
        }
        return obj;
    }
       
       
       
       public boolean postQueryResponse(QueryBean obj) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean flag=false;
        try {
            conn = ConnectDB.connect();
            
                pstmt=conn.prepareStatement("insert into expertquerysolution (Request_id,Expert_User_Id,Solution_File_Path,Solution_Description,Response_Date) values(?,?,?,?,sysdate())");
                pstmt.setInt(1, obj.getTxtRequestId());
                pstmt.setInt(2, obj.getTxtUserId());
                pstmt.setString(3, obj.getFlQueryScriptFile());
                pstmt.setString(4, obj.getTaDescription());
                System.out.println(""+pstmt);
                int i=pstmt.executeUpdate();
                if(i>0){
                    flag=true;
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
        return flag;
      }
       
       
     
}
