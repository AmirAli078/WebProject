

<%@page import="com.dbconnection.DBConnection"%>
<%@page import="com.DAO.BookDAOImpli"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
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

            #toast {
                min-width: 300px;
                position: fixed;
                bottom: 30px;
                left: 50%;
                margin-left: -125px;
                background: #333;
                padding: 10px;
                color: white;
                text-align: center;
                z-index: 1;
                font-size: 18px;
                visibility: hidden;
                box-shadow: 0px 0px 100px #000;
            }

            #toast.display {
                visibility: visible;
                animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
            }

            @keyframes fadeIn {
                from {
                    bottom:0;
                    opacity: 0;
                }

                to {
                    bottom: 30px;
                    opacity: 1;
                }

            }
            @keyframes fadeOut {
                form {
                    bottom:30px;
                    opacity: 1;
                }

                to {
                    bottom: 0;
                    opacity: 0;
                }
            }


        </style>
    </head>
    <body>
        
        <%
            User u = (User) session.getAttribute("userobj");
        %>



        <c:if test="${not empty addCart}">

            <div id="toast"> ${addCart} </div>

            <script type="text/javascript">
                showToast();
                function showToast(content)
                {
                    $('#toast').addClass("display");
                    $('#toast').html(content);
                    setTimeout(() => {
                        $("#toast").removeClass("display");
                    }, 2000)
                }
            </script>

            <c:remove var="addCart" scope="session"/>
        </c:if>





        <%@include file="AllComponent/navbar.jsp"%>
        <div class="container-fluid">
            <div class="row p-3">


                <% BookDAOImpli dao = new BookDAOImpli(DBConnection.getConnection());
                    List<BookDtls> list = dao.getAllNewBook();
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


                                <%
                                    if (u == null) {
                                %>
                                <a href="login.jsp" class="btn btn-danger btn-sm ml">Add cart</a>

                                <%
                                } else {
                                %>
                                <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml">Add cart</a>
                                <%}
                                %>



                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>


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
