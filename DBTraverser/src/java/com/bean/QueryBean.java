/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

/**
 *
 * @author sumit
 */
public class QueryBean {
    private int txtUserId,txtRequestId,txtSolutionId;
    private String txtQueryRequest,flQueryScriptFile,taDescription;
    private String txtPostDate,txtSolution;
    private String txtUserName;

    public String getTxtUserName() {
        return txtUserName;
    }

    public void setTxtUserName(String txtUserName) {
        this.txtUserName = txtUserName;
    }
    
    public String getTxtSolution() {
        return txtSolution;
    }

    public void setTxtSolution(String txtSolution) {
        this.txtSolution = txtSolution;
    }

    public int getTxtSolutionId() {
        return txtSolutionId;
    }

    public void setTxtSolutionId(int txtSolutionId) {
        this.txtSolutionId = txtSolutionId;
    }


    public String getTxtPostDate() {
        return txtPostDate;
    }

    public void setTxtPostDate(String txtPostDate) {
        this.txtPostDate = txtPostDate;
    }

    

    public int getTxtRequestId() {
        return txtRequestId;
    }

    public void setTxtRequestId(int txtRequestId) {
        this.txtRequestId = txtRequestId;
    }

    public String getFlQueryScriptFile() {
        return flQueryScriptFile;
    }

    public void setFlQueryScriptFile(String flQueryScriptFile) {
        this.flQueryScriptFile = flQueryScriptFile;
    }

    public String getTaDescription() {
        return taDescription;
    }

    public void setTaDescription(String taDescription) {
        this.taDescription = taDescription;
    }

    public String getTxtQueryRequest() {
        return txtQueryRequest;
    }

    public void setTxtQueryRequest(String txtQueryRequest) {
        this.txtQueryRequest = txtQueryRequest;
    }

    public int getTxtUserId() {
        return txtUserId;
    }

    public void setTxtUserId(int txtUserId) {
        this.txtUserId = txtUserId;
    }
    
}
