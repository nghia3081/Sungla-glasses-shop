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
public class Cart {
    private int tid;
    private int pid;
    private int uid;
    private String pname;
    private String pimg;
    private double pprice;
    private int pquantity;
    private double ptotal;

    public Cart() {
    }

    public Cart(int tid, int pid, int uid, String pname, String pimg, double pprice, int pquantity, double ptotal) {
        this.tid = tid;
        this.pid = pid;
        this.uid = uid;
        this.pname = pname;
        this.pimg = pimg;
        this.pprice = pprice;
        this.pquantity = pquantity;
        this.ptotal = ptotal;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPimg() {
        return pimg;
    }

    public void setPimg(String pimg) {
        this.pimg = pimg;
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

    public double getPtotal() {
        return ptotal;
    }

    public void setPtotal(double ptotal) {
        this.ptotal = ptotal;
    }

   
    
   
}
