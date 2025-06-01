

<%@page import="com.dbconnection.DBConnection"%>
<%@page import="com.DAO.BookDAOImpli"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All New Book</title>
        <%@include file="AllComponent/AllCSS.jsp"%>
        <style type="text/css">
            
            .crd-ho:hover{
                background-color: #fcf7f7;

            }

        </style>
    </head>
    <body>
        <%@include file="AllComponent/navbar.jsp"%>
        <div class="container-fluid">
            <div class="row p-3">
                

                    <% BookDAOImpli dao = new BookDAOImpli(DBConnection.getConnection());
                    List<BookDtls> list = dao.getAllOldBook();
                    for (BookDtls b : list) {
                %>

                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
  <img src="book/<%=b.getPhotoName()%>" alt="book" style="width: 150px; height: 200px" class="img-thumbnail">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuther()%></p>
                            <P>Categories: <%=b.getBookcategory()%></p>
                            <div class="row">
                                
                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-rupee-sign"></i> <%=b.getPrice()%></a>
                            </div> 
                        </div>
                    </div>
                </div>
                <%
                    }
                %>


                </div>

            </div>
        
    </body>
</html>
