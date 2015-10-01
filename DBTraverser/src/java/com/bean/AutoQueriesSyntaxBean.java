/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

/**
 *
 * @author Supreet
 */
public class AutoQueriesSyntaxBean {
    
    private String title,querySyntax,updateDate;
    private int autoQueryId;

    public int getAutoQueryId() {
        return autoQueryId;
    }

    public void setAutoQueryId(int autoQueryId) {
        this.autoQueryId = autoQueryId;
    }

    public String getQuerySyntax() {
        return querySyntax;
    }

    public void setQuerySyntax(String querySyntax) {
        this.querySyntax = querySyntax;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }
    
    
    
}
