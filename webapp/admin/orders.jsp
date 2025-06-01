<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>EBook: All Orders</title>

    <%@ include file="AllCSS.jsp" %>
    <link rel="stylesheet" href="css/register-style.css">
</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="container mt-5">
    <h2 class="text-center mb-4"><i class="fas fa-shopping-cart"></i> All Orders List</h2>

    <div class="table-responsive">
        <table class="table table-hover table-bordered text-center">
            <thead class="thead-dark">
                <tr>
                    <th>Order ID</th>
                    <th>Customer Name</th>
                    <th>Email</th>
                    <th>Phone No</th>
                    <th>Book Name</th>
                    <th>Author</th>
                    <th>Price</th>
                    <th>Payment Type</th>
                </tr>
            </thead>

            <!-- Dummy data start -->
            <tr>
                <td>101</td>
                <td>Ali Khan</td>
                <td>ali.khan@example.com</td>
                <td>0312-1234567</td>
                <td>Java Complete Reference</td>
                <td>Herbert Schildt</td>
                <td>Rs. 450</td>
                <td>COD</td>
            </tr>
            <tr>
                <td>102</td>
                <td>Sana Ahmed</td>
                <td>sana.ahmed@example.com</td>
                <td>0301-9876543</td>
                <td>HTML & CSS</td>
                <td>Jon Duckett</td>
                <td>Rs. 300</td>
                <td>Online Payment</td>
            </tr>
            <tr>
                <td>103</td>
                <td>Umar Farooq</td>
                <td>umar.farooq@example.com</td>
                <td>0333-7654321</td>
                <td>Spring Boot Guide</td>
                <td>Craig Walls</td>
                <td>Rs. 550</td>
                <td>COD</td>
            </tr>
            <!-- Dummy data end -->

            <tbody>
            <c:forEach var="order" items="${orderList}">
                <tr>
                    <td>${order.id}</td>
                    <td>${order.customerName}</td>
                    <td>${order.email}</td>
                    <td>${order.phone}</td>
                    <td>${order.bookName}</td>
                    <td>${order.author}</td>
                    <td>Rs. ${order.price}</td>
                    <td>${order.paymentType}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
