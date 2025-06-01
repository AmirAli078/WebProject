package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpli;
import com.dbconnection.DBConnection;
import com.entity.BookDtls;

@WebServlet("/addBookServlet")
@MultipartConfig
public class BooksAddServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            // Collect form data
            String bookName = req.getParameter("bookName");
            String auther = req.getParameter("authorName");
            String price = req.getParameter("price");
            String categories = req.getParameter("category");
            String status = req.getParameter("status");
            Part part = req.getPart("photo");
            String fileName = part.getSubmittedFileName();

            // Define path for saving the uploaded image
            String path = getServletContext().getRealPath("") + File.separator + "book";
            File uploadDir = new File(path);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs(); // Create directory if it doesn't exist
            }

            // Save uploaded file
            part.write(path + File.separator + fileName);
            System.out.println("File saved to: " + path);

            // Create book object
            BookDtls b = new BookDtls(bookName, auther, price, categories, status, fileName, "admin");

            // Save book to database
            BookDAOImpli dao = new BookDAOImpli(DBConnection.getConnection());
            boolean isAdded = dao.addBooks(b);

            HttpSession session = req.getSession();
            if (isAdded) {
                session.setAttribute("succMsg", "Book added successfully.");
                resp.sendRedirect("admin/add_books.jsp?msg=success");
            } else {
                session.setAttribute("failMsg", "Failed to add book.");
                resp.sendRedirect("admin/add_books.jsp?msg=error");
            }

        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = req.getSession();
            session.setAttribute("failMsg", "Something went wrong. Please try again.");
            resp.sendRedirect("admin/add_books.jsp?msg=exception");
        }
    }
}
