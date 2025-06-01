<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook: Register</title>

<%@ include file="AllComponent/AllCSS.jsp" %>
<link rel="stylesheet" href="css/register-style.css">
</head>
<body>

<%@ include file="AllComponent/navbar.jsp" %>

<div class="register-card">
  <h2>Create Account</h2>
  

<!-- Success message -->
<c:if test="${param.msg == 'success'}">
    <div style="color: green; margin-bottom: 15px;"> User registered successfully.</div>
</c:if>

<!-- Error message -->
<c:if test="${param.msg == 'error'}">
    <div style="color: red; margin-bottom: 15px;"> Registration failed. Please try again.</div>
</c:if>
  
  
  <form action="register" method="post">
    <div class="form-group">
      <label for="name">Full Name</label>
      <input type="text" class="form-control" id="name" name="name" placeholder="Enter your full name" required>
    </div>

    <div class="form-group">
      <label for="email">Email address</label>
      <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required>
      <small class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>

    <div class="form-group">
      <label for="phone">Phone Number</label>
      <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter phone number" required>
    </div>

    <div class="form-group">
      <label for="password">Password</label>
      <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
    </div>

    <button type="submit" class="btn btn-primary btn-block">Register</button>
  </form>
</div>

<% if ("true".equals(request.getParameter("success"))) { %>
        <p style="color: green;">Registration Successful!</p>
    <% } %>

<jsp:include page="AllComponent/footer.jsp" />

</body>
</html>
