<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<link rel="stylesheet" href="AllComponent/AllCSS.css">

<!-- Top Bar: E Book | Search | Register/Login -->
<div class="d-flex justify-content-between align-items-center px-4 py-3 bg-light border-bottom">

    <!-- Left: E Book Logo -->
    <div class="h4 mb-0" style="color: green;">
        <i class="fa-solid fa-book"></i> E Book
    </div>

    <!-- Center: Search Bar -->
    <div class="flex-grow-1 mx-4">
        <form class="form-inline my-2 my-lg-0" action="search.jsp" method="get">
            <input class="form-control mr-sm-2" type="search" name="query" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>

    <!-- Right: Conditional Login/Logout and User/Admin Display -->
    <div>
        <c:if test="${not empty userObj}">
            <c:choose>
                <c:when test="${userObj.name == 'Admin'}">
                    <a class="btn btn-dark text-white">
                        <i class="fa-solid fa-user-shield"></i> Admin
                    </a>
                </c:when>
                <c:otherwise>
                    <a class="btn btn-success text-white">
                        <i class="fa-solid fa-user"></i> ${userObj.name}
                    </a>
                </c:otherwise>
            </c:choose>
            <a href="../logout" class="btn btn-primary text-white">
                <i class="fa-solid fa-right-to-bracket"></i> Logout
            </a>
        </c:if>

        <c:if test="${empty userObj}">
            <a href="login.jsp" class="btn btn-success">
                <i class="fa-solid fa-right-to-bracket"></i> Login
            </a>
            <a href="register.jsp" class="btn btn-primary text-white">
                <i class="fa-solid fa-user-plus"></i> Register
            </a>
        </c:if>
    </div>
</div>

<!-- Navigation Bar with Dark Blue Background -->
<nav class="navbar navbar-expand-lg" style="background-color: #001f3f;">
    <a class="navbar-brand text-white" href="index.jsp">
        <i class="fa-solid fa-house"></i>
    </a>

    <!-- Toggler for responsive -->
    <button class="navbar-toggler" type="button" data-toggle="collapse"
        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
        aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Collapsible Content -->
    <div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">

        <!-- Left Nav Links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link text-white nav-hover" href="home.jsp">
                    Home <span class="sr-only">(current)</span>
                </a>
            </li>
        </ul>

        <!-- Right Buttons -->
        <div class="d-flex">
            <button class="btn btn-outline-light mr-2 nav-hover">
                <i class="fa-solid fa-gear"></i> Setting
            </button>
            <button class="btn btn-outline-light nav-hover">
                <i class="fa-solid fa-address-card"></i> Contact Us
            </button>
        </div>
    </div>
</nav>
