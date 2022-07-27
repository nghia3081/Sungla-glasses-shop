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
public class ProductOrder {
    private int oid;
    private int uid;
    private String uname;
    private String uemail;
    private String uaddress;
    private String uphone;
    private String pname;
    private String pdes;
    private double pprice;
    private int pquantity;
    private String opay;
    private String orderTime;
    public ProductOrder() {
    }

    public ProductOrder(int oid, String uname, String uemail, String uaddress, String uphone, String pname, String pdes, double pprice, int pquantity, String opay, int uid, String orderTime) {
        this.oid = oid;
        this.uid = uid;
        this.uname = uname;
        this.uemail = uemail;
        this.uaddress = uaddress;
        this.uphone = uphone;
        this.pname = pname;
        this.pdes = pdes;
        this.pprice = pprice;
        this.pquantity = pquantity;
        this.opay = opay;
        this.orderTime = orderTime;
    }

    public int getOid() {
        return oid;
    }

    public String getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail;
    }

    public String getUaddress() {
        return uaddress;
    }

    public void setUaddress(String uaddress) {
        this.uaddress = uaddress;
    }

    public String getUphone() {
        return uphone;
    }

    public void setUphone(String uphone) {
        this.uphone = uphone;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPdes() {
        return pdes;
    }

    public void setPdes(String pdes) {
        this.pdes = pdes;
    }

    public double getPprice() {
        return pprice;
    }

    public void setPprice(double pprice) {
        this.pprice = pprice;
    }

    public int getPquantity() {
        return pquantity;
    }

    public void setPquantity(int pquantity) {
        this.pquantity = pquantity;
    }

    public String getOpay() {
        return opay;
    }

    public void setOpay(String opay) {
        this.opay = opay;
    }
    
    
    
}
