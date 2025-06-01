<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:Home</title>
<%@ include file="AllCSS.jsp" %> <!-- CSS and Bootstrap -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

</head>
<body>
<%@ include file="navbar.jsp" %> <!-- Navigation bar -->

<%--         <c:if test="${empty userobj}">
            
            <c:redirect url="../login.jsp" />
            
        </c:if> --%>
<div class="container text-center mt-5 admin-dashboard">
    <h2 class="fw-bold mb-5"><i class="fa-solid fa-hands-clapping"></i> Welcome Back, Admin</h2>
    <div class="row justify-content-center g-4">

        <!-- Add Books -->
        <div class="col-md-3">
            <a href="add_books.jsp" class="card-link">
                <div class="card dashboard-card shadow-lg border-0 py-4">
                    <i class="fas fa-plus-square fa-3x text-primary mb-3"></i>
                    <h5 class="fw-semibold">Add Books</h5>
                    <p class="text-muted">Add new titles to the collection</p>
                </div>
            </a>
        </div>

        <!-- All Books -->
        <div class="col-md-3">
            <a href="all_books.jsp" class="card-link">
                <div class="card dashboard-card shadow-lg border-0 py-4">
                    <i class="fas fa-book fa-3x text-danger mb-3"></i>
                    <h5 class="fw-semibold">All Books</h5>
                    <p class="text-muted">Browse complete book list</p>
                </div>
            </a>
        </div>

        <!-- Orders -->
        <div class="col-md-3">
            <a href="orders.jsp" class="card-link">
                <div class="card dashboard-card shadow-lg border-0 py-4">
                    <i class="fas fa-box fa-3x text-warning mb-3"></i>
                    <h5 class="fw-semibold">Orders</h5>
                    <p class="text-muted">Manage recent orders</p>
                </div>
            </a>
        </div>

        <!-- Logout -->
        <div class="col-md-3">
            <a href="../logout" class="card-link">
                <div class="card dashboard-card shadow-lg border-0 py-4">
                    <i class="fas fa-right-from-bracket fa-3x text-success mb-3"></i>
                    <h5 class="fw-semibold">Logout</h5>
                    <p class="text-muted">Sign out of your account</p>
                </div>
            </a>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" /> <!-- Footer -->
</body>
</html>