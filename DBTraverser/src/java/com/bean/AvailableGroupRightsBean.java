/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import java.util.ArrayList;

/**
 *
 * @author sumit
 */
public class AvailableGroupRightsBean {
    private String txtGroupId,txtCost,taDescription,txtTitle;
    private String txtUnlimited,txtValidity,txtAllocationDate;
    private  ArrayList alRights;

    public String getTxtAllocationDate() {
        return txtAllocationDate;
    }

    public void setTxtAllocationDate(String txtAllocationDate) {
        this.txtAllocationDate = txtAllocationDate;
    }

    public String getTxtUnlimited() {
        return txtUnlimited;
    }

    public void setTxtUnlimited(String txtUnlimited) {
        this.txtUnlimited = txtUnlimited;
    }

    public String getTxtValidity() {
        return txtValidity;
    }

    public void setTxtValidity(String txtValidity) {
        this.txtValidity = txtValidity;
    }

    public String getTxtTitle() {
        return txtTitle;
    }

    public void setTxtTitle(String txtTitle) {
        this.txtTitle = txtTitle;
    }

    public ArrayList getAlRights() {
        return alRights;
    }

    public void setAlRights(ArrayList alRights) {
        this.alRights = alRights;
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
    
    
}
