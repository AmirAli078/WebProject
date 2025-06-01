package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.dbconnection.DBConnection;
import com.entity.User;

@WebServlet("/loginProcess")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            // Get email and password from the login form
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            // Validate form inputs (basic null check)
            if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
                HttpSession session = req.getSession();
                session.setAttribute("failedMsg", "Please enter email and password.");
                resp.sendRedirect("login.jsp");
                return;
            }

            // Get database connection
            Connection conn = DBConnection.getConnection();
            UserDAOImpl dao = new UserDAOImpl(conn);

            // Get session
            HttpSession session = req.getSession();

            // Admin Login Logic
            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                User admin = new User();
                admin.setEmail(email);
                admin.setName("Admin");

                session.setAttribute("userObj", admin);
                resp.sendRedirect("admin/home.jsp");
                return;
            }

            // Regular User Login
            User user = dao.login(email, password);

            if (user != null) {
                session.setAttribute("userObj", user);
                resp.sendRedirect("index.jsp");
            } else {
                session.setAttribute("failedMsg", "Invalid email or password!");
                resp.sendRedirect("login.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp"); // Optional: redirect to a general error page
        }
    }
}