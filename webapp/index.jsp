<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.dbconnection.DBConnection, com.DAO.BookDAOImpli, com.entity.User, java.util.List, com.entity.BookDtls, java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ebook: Index</title>
    <%@ include file="AllComponent/AllCSS.jsp" %>
    <style>
        .back-img {
            background: url("AllComponent/img/background.jpg");
            height: 50vh;
            width: 100%;
            background-size: cover;
            background-repeat: no-repeat;
        }
        .crd-ho:hover {
            background-color: #fcf7f7;
        }
    </style>
</head>
<body style="background-color: #f7f7f7;">

<%
    User u = (User) session.getAttribute("userObj");
    Connection conn = DBConnection.getConnection();
    BookDAOImpli dao = new BookDAOImpli(conn);
%>

<%@ include file="AllComponent/navbar.jsp" %>

<!-- Banner -->
<div class="container-fluid back-img">
   <h2 class="text-center pt-5" style="color: green;">E-Book Management System</h2>
   
</div>

<!-- Recent Books -->
<div class="container mt-4">
    <h3 class="text-center">Recent Books</h3>
    <div class="row">
        <%
            List<BookDtls> recentBooks = dao.getRecentBooks();
            for (BookDtls b : recentBooks) {
        %>
        <div class="col-md-3">
            <div class="card crd-ho mb-3">
                <div class="card-body text-center">
                    <img src="book/<%= b.getPhotoName() %>" alt="book" style="width: 150px; height: 200px;" class="img-thumbnail">
                    <p><%= b.getBookName() %></p>
                    <p><%= b.getAuther() %></p>
                    <p>Category: <%= b.getBookcategory() %></p>
                    <div class="row justify-content-center">
                        <% if ("Old".equals(b.getBookcategory())) { %>
                            <a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-success btn-sm m-1">View Details</a>
                            <a href="#" class="btn btn-danger btn-sm m-1">
                                <i class="fa-solid fa-rupee-sign"></i> <%= b.getPrice() %>
                            </a>
                        <% } else { %>
                            <% if (u == null) { %>
                                <a href="login.jsp" class="btn btn-danger btn-sm m-1">Add to Cart</a>
                            <% } else { %>
                                <a href="cart?bid=<%=b.getBookId() %>&uid=<%=u.getId() %>" class="btn btn-danger btn-sm m-1">Add to Cart</a>
                            <% } %>
                            <a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-success btn-sm m-1">View Details</a>
                            <a href="#" class="btn btn-danger btn-sm m-1">
                                <i class="fa-solid fa-rupee-sign"></i> <%= b.getPrice() %>
                            </a>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
    <div class="text-center mt-2">
        <a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
    </div>
</div>

<hr>

<!-- New Books -->
<div class="container">
    <h3 class="text-center">New Books</h3>
    <div class="row">
        <%
            List<BookDtls> newBooks = dao.getNewBook();
            for (BookDtls b : newBooks) {
        %>
        <div class="col-md-3">
            <div class="card crd-ho mb-3">
                <div class="card-body text-center">
                    <img src="book/<%= b.getPhotoName() %>" alt="book" style="width: 150px; height: 200px;" class="img-thumbnail">
                    <p><%= b.getBookName() %></p>
                    <p><%= b.getAuther() %></p>
                    <p>Category: <%= b.getBookcategory() %></p>
                    <div class="row justify-content-center">
                        <% if (u == null) { %>
                            <a href="login.jsp" class="btn btn-danger btn-sm m-1">Add to Cart</a>
                        <% } else { %>
                            <a href="cart?bid=<%= b.getBookId() %>&uid=<%= u.getId() %>" class="btn btn-danger btn-sm m-1">Add to Cart</a>
                        <% } %>
                        <a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-success btn-sm m-1">View Details</a>
                        <a href="#" class="btn btn-danger btn-sm m-1">
                            <i class="fa-solid fa-rupee-sign"></i> <%= b.getPrice() %>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
    <div class="text-center mt-2">
        <a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
    </div>
</div>

<hr>

<!-- Old Books -->
<div class="container">
    <h3 class="text-center">Old Books</h3>
    <div class="row">
        <%
            List<BookDtls> oldBooks = dao.getOldBooks();
            for (BookDtls b : oldBooks) {
        %>
        <div class="col-md-3">
            <div class="card crd-ho mb-3">
                <div class="card-body text-center">
                    <img src="book/<%= b.getPhotoName() %>" alt="book" style="width: 150px; height: 200px;" class="img-thumbnail">
                    <p><%= b.getBookName() %></p>
                    <p><%= b.getAuther() %></p>
                    <p>Category: <%= b.getBookcategory() %></p>
                    <div class="row justify-content-center">
                        <a href="view_books.jsp?bid=<%= b.getBookId() %>" class="btn btn-success btn-sm m-1">View Details</a>
                        <a href="#" class="btn btn-danger btn-sm m-1">
                            <i class="fa-solid fa-rupee-sign"></i> <%= b.getPrice() %>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
    <div class="text-center mt-2">
        <a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
    </div>
</div>

<jsp:include page="AllComponent/footer.jsp" />

</body>
</html>
