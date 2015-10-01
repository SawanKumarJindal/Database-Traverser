/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

/**
 *
 * @author student
 */
public class CountryStateCityBean {
    
    private int txtCountryId,txtStateId,txtCityId;
    private String ddlCountryName,ddlStateName,ddlCityName;

    public int getTxtCityId() {
        return txtCityId;
    }

    public void setTxtCityId(int txtCityId) {
        this.txtCityId = txtCityId;
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

    public String getDdlCityName() {
        return ddlCityName;
    }

    public void setDdlCityName(String ddlCityName) {
        this.ddlCityName = ddlCityName;
    }

    public String getDdlCountryName() {
        return ddlCountryName;
    }

    public void setDdlCountryName(String ddlCountryName) {
        this.ddlCountryName = ddlCountryName;
    }

    public String getDdlStateName() {
        return ddlStateName;
    }

    public void setDdlStateName(String ddlStateName) {
        this.ddlStateName = ddlStateName;
    }

    
    
}
