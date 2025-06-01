<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:add books</title>
<%@ include file="AllCSS.jsp" %> <!-- CSS and Bootstrap -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
<%@ include file="navbar.jsp" %> <!-- Navigation bar -->
<%--         <c:if test="${empty userobj}">
            
            <c:redirect url="../login.jsp" />
            
        </c:if> --%>
<div class="register-card">
    <h2>Add New Book</h2>

   <!-- Success message -->
<c:if test="${param.msg == 'success'}">
    <div style="color: green; margin-bottom: 15px;">${sessionScope.succMsg}</div>
</c:if>

<!-- Error message -->
<c:if test="${param.msg == 'error' || param.msg == 'exception'}">
    <div style="color: red; margin-bottom: 15px;">${sessionScope.failMsg}</div>
</c:if>
   

    <form action="../addBookServlet" method="post" enctype="multipart/form-data">

        <div class="form-group">
            <label for="bookName">Book Name</label>
            <input type="text" class="form-control" id="bookName" name="bookName" placeholder="Enter book name" required>
        </div>

        <div class="form-group">
            <label for="authorName">Author Name</label>
            <input type="text" class="form-control" id="authorName" name="authorName" placeholder="Enter author name" required>
        </div>

        <div class="form-group">
            <label for="price">Price (Rs.)</label>
            <input type="number" class="form-control" id="price" name="price" placeholder="Enter price" required>
        </div>

        <div class="form-group">
            <label for="category">Select Category</label>
            <select class="form-control" id="category" name="category" required>
                <option value="" disabled selected>-- Select Category --</option>
                <option value="New">New Book</option>
                <option value="Old">Old Book</option>
                <option value="Programming">Recent Book</option>
             
            </select>
        </div>

        <div class="form-group">
            <label for="status">Book Status</label>
            <select class="form-control" id="status" name="status" required>
                <option value="" disabled selected>-- Select Status --</option>
                <option value="Available">Available</option>
                <option value="Out of Stock">Out of Stock</option>
            </select>
        </div>

        <div class="form-group">
            <label for="photo">Upload Book Photo</label>
            <input type="file" class="form-control-file" id="photo" name="photo" required>
        </div>

        <button type="submit" class="btn btn-success btn-block mt-3">Add Book</button>
    </form>
</div>
<jsp:include page="footer.jsp" /> <!-- Footer -->
</body>
</html>