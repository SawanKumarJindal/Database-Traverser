/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DBTraverser;

import com.common.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author sumit
 */
public class FeedBackServices {
    
    public String insertFeedBack(int id,String title,String desc){
         Connection con = null;
        PreparedStatement pstmt = null;
        String result = "record not added";
        try {
            con = ConnectDB.connect();
            pstmt = con.prepareStatement("INSERT INTO `dbtraverser`.`feedbackmaster` ( `User_Id`, `Title`, `Description`, `Sent_Date`, `Is_Active`) VALUES (?,?,?,sysdate(),1);");
            pstmt.setInt(1, id);
            pstmt.setString(2, title);
            pstmt.setString(3, desc);
            System.out.println("1  " + pstmt);
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = "added";
            }
        } catch (Exception e) {
            System.out.print("Exception in insertFeedBack()" + e);
        } finally {
            try {
                con.close();
                pstmt.close();
            } catch (Exception e) {
                System.out.print("Exception in finally of insertFeedBack()" + e);
            }
        }
        return result;
    }
    
    public boolean deleteFeedBack(int feedbackid){
         Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag=false;
        try{
            con = ConnectDB.connect();
            pstmt = con.prepareStatement("delete from feedbackmaster where FeedBack_Id=?;");
            pstmt.setInt(1, feedbackid);
            int i=pstmt.executeUpdate();
            if(i>0){
                flag=true;
            }
        
        }catch(Exception e){
            System.out.println("deleteFeedBack   "+e);
        }finally {
            try {
                con.close();
                pstmt.close();
            } catch (Exception e) {
                System.out.print("Exception in finally of deleteFeedBack()" + e);
            }
        }
        
        return flag;
    }
    
}
