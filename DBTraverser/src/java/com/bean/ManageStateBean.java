/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

/**
 *
 * @author student
 */
public class ManageStateBean {
    private int txtCountryId,txtStateId;
    private String rbStatus,txtStateName;

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

    public int getTxtStateId() {
        return txtStateId;
    }

    public void setTxtStateId(int txtStateId) {
        this.txtStateId = txtStateId;
    }

    public String getTxtStateName() {
        return txtStateName;
    }

    public void setTxtStateName(String txtStateName) {
        this.txtStateName = txtStateName;
    }
    
}
