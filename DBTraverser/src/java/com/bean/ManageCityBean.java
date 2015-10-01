/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

/**
 *
 * @author student
 */
public class ManageCityBean {
    private int  txtStateId,txtCityId;
    private String txtCityName,rbStatus;

    public String getRbStatus() {
        return rbStatus;
    }

    public void setRbStatus(String rbStatus) {
        this.rbStatus = rbStatus;
    }

    public int getTxtCityId() {
        return txtCityId;
    }

    public void setTxtCityId(int txtCityId) {
        this.txtCityId = txtCityId;
    }

    public String getTxtCityName() {
        return txtCityName;
    }

    public void setTxtCityName(String txtCityName) {
        this.txtCityName = txtCityName;
    }

    public int getTxtStateId() {
        return txtStateId;
    }

    public void setTxtStateId(int txtStateId) {
        this.txtStateId = txtStateId;
    }
    
    
}
