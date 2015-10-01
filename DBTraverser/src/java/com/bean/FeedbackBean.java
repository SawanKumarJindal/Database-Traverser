/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;


public class FeedbackBean
{
String Title,Description,Date,SendBy;
int FeedbackId,RegisterId;

    public int getRegisterId() {
        return RegisterId;
    }

    public void setRegisterId(int RegisterId) {
        this.RegisterId = RegisterId;
    }

    public String getDate() {
        return Date;
    }

    public int getFeedbackId() {
        return FeedbackId;
    }

    public void setFeedbackId(int FeedbackId) {
        this.FeedbackId = FeedbackId;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getSendBy() {
        return SendBy;
    }

    public void setSendBy(String SendBy) {
        this.SendBy = SendBy;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }
    
    
    
}
