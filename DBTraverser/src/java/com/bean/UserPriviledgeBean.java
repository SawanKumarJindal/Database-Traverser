/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

/**
 *
 * @author student
 */
public class UserPriviledgeBean {
     private String canRetrieve;
    private String canInsert;
    private String canUpdate;
    private String canDelete;
    private String canDrop;
    private String canCreate;
    private String canAlter;

    public String isCanAlter() {
        return canAlter;
    }

    public void setCanAlter(String canAlter) {
        this.canAlter = canAlter;
    }

    public String isCanCreate() {
        return canCreate;
    }

    public void setCanCreate(String canCreate) {
        this.canCreate = canCreate;
    }

    public String isCanDelete() {
        return canDelete;
    }

    public void setCanDelete(String canDelete) {
        this.canDelete = canDelete;
    }

    public String isCanDrop() {
        return canDrop;
    }

    public void setCanDrop(String canDrop) {
        this.canDrop = canDrop;
    }

    public String isCanInsert() {
        return canInsert;
    }

    public void setCanInsert(String canInsert) {
        this.canInsert = canInsert;
    }

    public String isCanRetrieve() {
        return canRetrieve;
    }

    public void setCanRetrieve(String canRetrieve) {
        this.canRetrieve = canRetrieve;
    }

    public String isCanUpdate() {
        return canUpdate;
    }

    public void setCanUpdate(String canUpdate) {
        this.canUpdate = canUpdate;
    }
    
    
}
