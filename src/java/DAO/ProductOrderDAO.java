/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import context.DBContext;
import entity.Product;
import entity.ProductOrder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class ProductOrderDAO {

    public List<ProductOrder> getAllProduct() {
        List<ProductOrder> list = new ArrayList<>();
        try {
            String sql = "select * from ProductOrder";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductOrder productorder = new ProductOrder(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getDouble(8), rs.getInt(9), rs.getString(10), rs.getInt(11), rs.getString(12));
                list.add(productorder);

            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getOid() {
        int a = 0;
        try {
            String sql = "select max(oid) from ProductOrder";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                a = rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return a;
    }

    public List<ProductOrder> getAllProduct(int uid) {
        List<ProductOrder> list = new ArrayList<>();
        try {
            String sql = "select * from ProductOrder where uid=?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, uid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductOrder productorder = new ProductOrder(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getDouble(8), rs.getInt(9), rs.getString(10), rs.getInt(11), rs.getString(12));
                list.add(productorder);

            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void insertOrder(ProductOrder p) {
        try {
            String sql = "Insert into ProductOrder values(?,?,?,?,?,?,?,?,?,?,?)";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, p.getUname());
            ps.setString(2, p.getUemail());
            ps.setString(3, p.getUaddress());
            ps.setString(4, p.getUphone());
            ps.setString(5, p.getPname());
            ps.setString(6, p.getPdes());
            ps.setDouble(7, p.getPprice());
            ps.setInt(8, p.getPquantity());
            ps.setString(9, p.getOpay());
            ps.setInt(10, p.getUid());
            ps.setString(11, p.getOrderTime());
            ps.execute();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteOrder(int uid) {
        try {
            String sql = "Delete From ProductOrder where uid=?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, uid);
            ps.execute();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
