package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbconnection.DBConnection;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phno = req.getParameter("phone");
        String password = req.getParameter("password");

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO user(name, email, phno, password) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phno);
            ps.setString(4, password);
            
            
            HttpSession session=req.getSession();

            int rows = ps.executeUpdate();

            if (rows > 0) {
                System.out.println("User registered successfully.");
                session.setAttribute("succMsg","User registered successfully.");
                resp.sendRedirect("register.jsp?msg=success");
            } else {
                System.out.println("Registration failed.");
                session.setAttribute("failMsg","Registration failed.");
                resp.sendRedirect("register.jsp?msg=error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("register.jsp?msg=exception");
        }
    }
}
