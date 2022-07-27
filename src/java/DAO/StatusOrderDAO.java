/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import context.DBContext;
import entity.ProductOrder;
import entity.StatusOrder;
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
public class StatusOrderDAO {

    public List<StatusOrder> getAllStatusOrder(int oid) {
        List<StatusOrder> list = new ArrayList<>();
        try {
            String sql = "select * from StatusOrder wh\n" +
"            String sql = \"select * from Sere oid = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, oid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                StatusOrder statusorder = new StatusOrder(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5));
                list.add(statusorder);

            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<StatusOrder> getAllStatusOrder() {
        List<StatusOrder> list = new ArrayList<>();
        try {
            String sql = "select * from StatusOrder";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                StatusOrder statusorder = new StatusOrder(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5));
                list.add(statusorder);

            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void insertStatus(StatusOrder s) {
        try {
            String sql = "Insert into StatusOrder values(?,?,?,?)";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, s.getOid());
            ps.setString(2, s.getStatus());
            ps.setString(3, s.getDetails());
            ps.setString(4, s.getUpdateTime());
            ps.execute();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteStatusByOID(int oid) {
        try {
            String sql = "Delete from StatusOrder where oid = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, oid);
            
            ps.execute();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
