package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpli;
import com.DAO.CartDAOImpl;
import com.dbconnection.DBConnection;
import com.entity.BookDtls;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {

            int bid = Integer.parseInt(req.getParameter("bid"));
            int uid = Integer.parseInt(req.getParameter("uid"));

            BookDAOImpli dao = new BookDAOImpli(DBConnection.getConnection());
            BookDtls b = dao.getBookById(bid);

            Cart c = new Cart();
            c.setBid(bid);
            c.setUserId(uid);
            c.setBookName(b.getBookName());
            c.setAuthor(b.getAuther());
            c.setPrice(Double.parseDouble(b.getPrice()));
            c.setTotalPrice(Double.parseDouble(b.getPrice()));

            CartDAOImpl dao2 = new CartDAOImpl(DBConnection.getConnection());
            boolean f = dao2.addCart(c);

            HttpSession session = req.getSession();

            if (f) {
                session.setAttribute("addCart", "Book Added to cart");
                resp.sendRedirect("all_new_book.jsp");
                System.out.print("Add to cart Successfully!");

            } else {
            	 System.out.print("Add to cart Not  Successfully!");
                session.setAttribute("failed", "Something Wrong ion Server");
                resp.sendRedirect("all_new_book.jsp");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
