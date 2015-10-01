/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

/**
 *
 * @author student
 */
public class ManageCountryBean {
    private String txtCountryName;
    private String rbStatus;
    private int txtCountryId;

    public String getRbStatus() {
        return rbStatus;
    }

    public void setRbStatus(String rbStatus) {
        this.rbStatus = rbStatus;
    }

    public int getTxtCountryId() {
        return txtCountryId;
    }

    public void setTxtCountryId(int txtCountryId) {
        this.txtCountryId = txtCountryId;
    }

   

    public String getTxtCountryName() {
        return txtCountryName;
    }

    public void setTxtCountryName(String txtCountryName) {
        this.txtCountryName = txtCountryName;
    }
    
    
}
