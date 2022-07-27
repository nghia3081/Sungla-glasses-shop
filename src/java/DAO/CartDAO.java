/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import context.DBContext;
import entity.Cart;
import entity.Category;
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
public class CartDAO {

    public List<Cart> getAllCart(int uid) {
        List<Cart> list = new ArrayList<>();
        try {
            String sql = "select * from Cart where uid=?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, uid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getDouble(6), rs.getInt(7), rs.getDouble(8));
                list.add(cart);

            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Cart getProductInCartByUidAndPid(int uid, int pid) {
        Cart pInCart = null;
        try {
            String sql = "select * from Cart where uid=? and pid = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, uid);
            ps.setInt(2, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pInCart = new Cart(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getDouble(6), rs.getInt(7), rs.getDouble(8));

            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pInCart;
    }

    public void updateProductInCart(double price, int quantity, int uid, int pid) {
        try {
            String sql = "UPDATE Cart set pquantity=?, pprice=?, ptotal=? where uid=? and pid=?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setDouble(2, price);
            ps.setDouble(3, price * quantity);
            ps.setInt(4, uid);
            ps.setInt(5, pid);

            ps.execute();

        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertToCart(Cart a) {
        try {
            String sql = "INSERT INTO Cart values(?,?,?,?,?,?,?)";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, a.getPid());
            ps.setInt(2, a.getUid());
            ps.setString(3, a.getPname());
            ps.setString(4, a.getPimg());
            ps.setDouble(5, a.getPprice());
            ps.setInt(6, a.getPquantity());
            ps.setDouble(7, a.getPtotal());

            ps.execute();

        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void removeInCart(int uid) {
        try {
            String sql = "Delete from Cart where uid=?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, uid);

            ps.execute();

        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void removeInCart(int pid, int uid) {
        try {
            String sql = "Delete from Cart where uid=? and pid=?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, uid);
            ps.setInt(2, pid);

            ps.execute();

        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
