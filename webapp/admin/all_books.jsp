<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.dbconnection.DBConnection"%>
<%@page import="com.DAO.BookDAOImpli"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>EBook: All Books</title>
    
    <%@ include file="AllCSS.jsp" %>
    <link rel="stylesheet" href="css/register-style.css">
</head>
<body>

<%@ include file="navbar.jsp" %>
<%--         <c:if test="${empty userobj}">
            
            <c:redirect url="../login.jsp" />
            
        </c:if> --%>

<div class="container mt-5">
    <h2 class="text-center mb-4"><i class="fa-solid fa-book"></i> All Books List</h2>

    <!-- Book Table -->
    <div class="table-responsive">
        <table class="table table-hover table-bordered text-center">
            <thead class="thead-dark">
                <tr>
                    <th>Book Id</th>
                    <th>Book Image</th>
                    <th>Book Name</th>
                    <th>Author</th>
                    <th>Price</th>
                    <th>Category</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
                
            <tbody>
            <%
                BookDAOImpli dao = new BookDAOImpli(DBConnection.getConnection());
                List<BookDtls> list = dao.getAllBooks();
                for(BookDtls b : list) {
            %>
                <tr>
                    <td><%= b.getBookId() %></td>
                    <td><img src="<%= request.getContextPath() %>/book/<%= b.getPhotoName() %>" style="width: 50px; height: 50px;">
                    </td>
                    <td><%= b.getBookName() %></td>
                    <td><%= b.getAuther() %></td>
                    <td><%= b.getPrice() %> Rs</td>
                    <td><%= b.getBookcategory() %></td>
                    <td><%= b.getStatus() %></td>
                    <td>
                        <a href="edit_book.jsp?id=<%= b.getBookId() %>" class="btn btn-sm btn-info mx-1">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                        <a href="../delete?id=<%= b.getBookId() %>" class="btn btn-sm btn-danger mx-1" onclick="return confirm('Are you sure you want to delete this book?');">
                            <i class="fas fa-trash-alt"></i> Delete
                        </a>
                    </td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
