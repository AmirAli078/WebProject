package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class CartDAOImpl implements CartDAO {

    private Connection conn;

    public CartDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean addCart(Cart c) {
        boolean f = false;
        try {
            String sql = "INSERT INTO cart(bid, uid, bookName, author, price, total_price) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, c.getBid());
            ps.setInt(2, c.getUserId());
            ps.setString(3, c.getBookName());
            ps.setString(4, c.getAuthor());
            ps.setDouble(5, c.getPrice());
            ps.setDouble(6, c.getTotalPrice());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<Cart> getBookByUser(int userId) {
        List<Cart> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM cart WHERE uid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            double totalPrice = 0;
            while (rs.next()) {
                Cart c = new Cart();
                c.setCid(rs.getInt("cid"));
                c.setBid(rs.getInt("bid"));
                c.setUserId(rs.getInt("uid"));
                c.setBookName(rs.getString("bookName"));
                c.setAuthor(rs.getString("author"));
                c.setPrice(rs.getDouble("price"));

                totalPrice += rs.getDouble("total_price");
                c.setTotalPrice(totalPrice);

                list.add(c);

                // Print to console
                System.out.println("Cart Item: " + c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean deleteBook(int bid, int uid, int cid) {
        boolean f = false;
        try {
            String sql = "DELETE FROM cart WHERE bid=? AND uid=? AND cid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, bid);
            ps.setInt(2, uid);
            ps.setInt(3, cid);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return f;
    }
}
