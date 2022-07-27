/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Admin
 */
public class StatusOrder {
    private int sId;
    private int oid;
    private String status;
    private String details;
    private String updateTime;

    public StatusOrder() {
    }

    public StatusOrder(int sId, int oid, String status, String details, String updateTime) {
        this.sId = sId;
        this.oid = oid;
        this.status = status;
        this.details = details;
        this.updateTime = updateTime;
    }

    public int getsId() {
        return sId;
    }

    public void setsId(int sId) {
        this.sId = sId;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }
    
    
    
}
