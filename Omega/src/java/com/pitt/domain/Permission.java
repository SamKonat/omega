/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pitt.domain;

/**
 *
 * @author dilis
 */
public class Permission {
    private String iD;
    private String permissionName;
    private String description; //string

    public String getiD() {
        return iD;
    }

    public void setiD(String iD) {
        this.iD = iD;
    }

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Permission{" + "iD=" + iD + ", permissionName=" + 
                permissionName + ", description=" + description + '}';
    }
    
}
