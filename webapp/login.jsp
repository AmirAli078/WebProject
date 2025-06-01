<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>EBook: Login</title>

    <%@ include file="AllComponent/AllCSS.jsp" %>
    <link rel="stylesheet" href="css/login-style.css">
</head>
<body>

    <%@ include file="AllComponent/navbar.jsp" %>

    <div class="login-card">
        <h2>User Login</h2>

        <!-- Success message from registration or logout -->
        <c:if test="${not empty sessionScope.succMsg}">
            <div style="color: green; margin-bottom: 15px;">
                ${sessionScope.succMsg}
            </div>
            <c:remove var="succMsg" scope="session" />
        </c:if>

        <!-- Failed login message -->
        <c:if test="${not empty sessionScope.failedMsg}">
            <div style="color: red; margin-bottom: 15px;">
                ${sessionScope.failedMsg}
            </div>
            <c:remove var="failedMsg" scope="session" />
        </c:if>

        <form action="loginProcess" method="post">
            <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
            </div>

            <button type="submit" class="btn btn-primary btn-block">Login</button>
            <a href="register.jsp" class="btn btn-secondary btn-block">Create Account</a>
        </form>
    </div>

    <jsp:include page="AllComponent/footer.jsp" />

</body>
</html>
