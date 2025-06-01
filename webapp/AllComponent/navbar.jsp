<link rel="stylesheet" href="AllComponent/Style.css">

<!-- Top Bar -->
<div class="d-flex justify-content-between align-items-center px-4 py-3 bg-light border-bottom">
    <!-- Left: Logo -->
    <div class="h4 mb-0" style="color: green;">
        <i class="fa-solid fa-book"></i> E Book
    </div>

    <!-- Center: Search -->
    <div class="flex-grow-1 mx-4">
        <form class="form-inline my-2 my-lg-0" action="search_book.jsp" method="get">
            <input class="form-control mr-sm-2" type="search" name="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>

    <!-- Right: Login/Register or User Info -->
    <div>
        <c:choose>
            <c:when test="${not empty userobj}">
                <div class="d-flex align-items-center gap-2">
                    <a href="checkout.jsp" class="me-2">
                        <i class="fa-solid fa-cart-plus fa-2x"></i>
                    </a>
                    <a href="login.jsp" class="btn btn-success me-2">
                        <i class="fa-solid fa-user"></i> ${userobj.name}
                    </a>
                    <a href="logout" class="btn btn-primary text-white">
                        <i class="fa-solid fa-right-to-bracket"></i> Logout
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="d-flex align-items-center gap-2">
                    <a href="login.jsp" class="btn btn-success">
                        <i class="fa-solid fa-right-to-bracket"></i> Login
                    </a>
                    <a href="register.jsp" class="btn btn-primary text-white">
                        <i class="fa-solid fa-user-plus"></i> Register
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- Navigation Bar -->
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg" style="background-color: #001f3f;">
    <div class="container-fluid">

        <!-- Brand -->
        <a class="navbar-brand text-white nav-hover" href="index.jsp">
            <i class="fa-solid fa-house"></i>
        </a>

        <!-- Toggler -->
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar content -->
        <div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">

            <!-- Left Nav Items -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link text-white nav-hover" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white nav-hover" href="all_recent_book.jsp">
                        <i class="fa-solid fa-book-open"></i> Recent Book
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white nav-hover" href="all_new_book.jsp">
                        <i class="fa-solid fa-book-open"></i> New Book
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white nav-hover" href="all_old_book.jsp">
                        <i class="fa-solid fa-book"></i> Old Book
                    </a>
                </li>
            </ul>

            <!-- Right Side Buttons -->
            <div class="d-flex">
                <a class="btn btn-outline-light me-2 nav-hover" href="#">
                    <i class="fa-solid fa-gear"></i> Setting
                </a>
                <a class="btn btn-outline-light nav-hover" href="#">
                    <i class="fa-solid fa-address-card"></i> Contact Us
                </a>
            </div>

        </div>
    </div>
</nav>
