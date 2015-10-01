/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

/**
 *
 * @author student
 */
public class AddEditGroupBean {
    private String txtTitle,taDescription,txtCost;
    private String rbUnlimited,txtValidity;
    private String[] chkSelect;
    private String txtGroupId,rbStatus;

    public String getRbStatus() {
        return rbStatus;
    }

    public void setRbStatus(String rbStatus) {
        this.rbStatus = rbStatus;
    }

    public String[] getChkSelect() {
        return chkSelect;
    }

    public void setChkSelect(String[] chkSelect) {
        this.chkSelect = chkSelect;
    }

    public String getRbUnlimited() {
        return rbUnlimited;
    }

    public void setRbUnlimited(String rbUnlimited) {
        this.rbUnlimited = rbUnlimited;
    }

    public String getTaDescription() {
        return taDescription;
    }

    public void setTaDescription(String taDescription) {
        this.taDescription = taDescription;
    }

    public String getTxtCost() {
        return txtCost;
    }

    public void setTxtCost(String txtCost) {
        this.txtCost = txtCost;
    }

    public String getTxtGroupId() {
        return txtGroupId;
    }

    public void setTxtGroupId(String txtGroupId) {
        this.txtGroupId = txtGroupId;
    }

    public String getTxtTitle() {
        return txtTitle;
    }

    public void setTxtTitle(String txtTitle) {
        this.txtTitle = txtTitle;
    }

    public String getTxtValidity() {
        return txtValidity;
    }

    public void setTxtValidity(String txtValidity) {
        this.txtValidity = txtValidity;
    }
    
    
}
