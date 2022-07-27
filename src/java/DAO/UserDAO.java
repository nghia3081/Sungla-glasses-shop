/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import context.DBContext;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class UserDAO {

    public User getUser(String email, String pass) {
        User u = null;
        try {
            String sql = "Select * from Users where uemail = ? and upass=?";
            Connection con = new DBContext().getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getBoolean(6));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return u;
    }

    public List<User> getAllUser() {
        List<User> list = null;
        try {
            String sql = "Select * from Users";
            Connection con = new DBContext().getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            list = new ArrayList();
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getBoolean(6));
                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Boolean getEmail(String email) {
        User u = null;
        try {
            String sql = "Select * from Users where uemail = ?";
            Connection con = new DBContext().getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getBoolean(6));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return u != null;
    }

    public void updateInformation(User u) {
        try {
            String sql = "update Users set uname=?, uemail=?, upass=?, uaddress=?, isAdmin=? where uid = ?";
            Connection con = new DBContext().getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, u.getUname());
            ps.setString(2, u.getUemail());
            ps.setString(3, u.getUpass());
            ps.setString(4, u.getAddress());
            ps.setBoolean(5, u.isIsAdmin());
            ps.setInt(6, u.getUid());

            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updatePass(String email, String pass) {
        try {
            String sql = "update Users set upass=? where uemail = ?";
            Connection con = new DBContext().getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(2, email);
            ps.setString(1, pass);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void insertUser(User u) {
        try {
            String sql = "Insert into Users values(?,?,?,?,?)";
            Connection con = new DBContext().getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, u.getUname());
            ps.setString(2, u.getUemail());
            ps.setString(3, u.getUpass());
            ps.setString(4, u.getAddress());
            ps.setBoolean(5, u.isIsAdmin());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateUser(User u) {
        try {
            String sql = "UPDATE Users set uname = ?, uemail = ? , upass=?, uaddress=?, uisAdmin=? where uid=?";
            Connection con = new DBContext().getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, u.getUname());
            ps.setString(2, u.getUemail());
            ps.setString(3, u.getUpass());
            ps.setString(4, u.getAddress());
            ps.setBoolean(5, u.isIsAdmin());
            ps.setInt(6, u.getUid());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void removeUser(int uid) {
        try {
            String sql = "Delete from Users where uid=?";
            Connection con = new DBContext().getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, uid);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
