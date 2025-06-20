

<%@page import="com.dbconnection.DBConnection"%>
<%@page import="com.DAO.BookDAOImpli"%>
<%@page import="com.entity.BookDtls"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Books</title>
        <%@include file="AllComponent/AllCSS.jsp"%>
    </head>
    <body style="background-color: #f0f1f2;">
        <%@include file="AllComponent/navbar.jsp"%>

        <%
            int bid = Integer.parseInt(request.getParameter("bid"));
            BookDAOImpli dao = new BookDAOImpli(DBConnection.getConnection());
            BookDtls b = dao.getBookById(bid);
        %>

        <div class="container p-3">
            <div class="row">
                <div class="col-md-6 text-center  p-5 border bg-white">
                      <img src="book/<%=b.getPhotoName()%>" alt="book" style="width: 150px; height: 200px" class="img-thumbnail"><br>
                    <h4 class="mt-3">Book Name: <span class="text-success"><%=b.getBookName()%></span></h4>
                    <h4>Author Name: <span class="text-success"><%=b.getAuther()%></span></h4>
                    <h4>Category: <span class="text-success"><%=b.getBookcategory()%></span></h4>
                </div>
                <div class="col-md-6 text-center p-5 border bg-white">
                    <h2><%=b.getBookName()%></h2>

                    <%
                        if ("Old".equals(b.getBookcategory())) {%>
                    <h5 class="text-primary">Contact To Seller</h5>
                    <h5 class="text-primary"><i class="fa-solid fa-envelope"></i> Email: <%=b.getEmail()%></h5>
                    <%}
                    %>
                    <div class="row">
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fa-solid fa-money-bill-wave fa-2x"></i>
                            <p>Cash On Delivery</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fa-solid fa-rotate-left fa-2x"></i>
                            <p>Return Available</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fa-solid fa-truck fa-2x"></i>
                            <p>Free Shipping</p>
                        </div>

                    </div>

                    <%if ("Old".equals(b.getBookcategory())) {
                    %>
                    <div class="text-center p-3">

                        <a href="index.jsp" class="btn btn-success"><i class="fa-solid fa-cart-arrow-down"></i> Continue Shopping</a>
                        <a href="" class="btn btn-danger"><i class="fa-solid fa-rupee-sign"></i> <%=b.getPrice()%></a>
                    </div>
                    <%
                    } else {
                    %>

                    <div class="text-center p-3">

                        <a href="" class="btn btn-primary"><i class="fa-solid fa-cart-arrow-down"></i> Add Cart</a>
                        <a href="" class="btn btn-danger"><i class="fa-solid fa-rupee-sign"></i> <%=b.getPrice()%></a>
                    </div>

                    <%}
                    %>



                </div>

            </div>


        </div>
    </body>
</html>
