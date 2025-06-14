<%@page import="com.dbconnection.DBConnection"%>
<%@page import="com.DAO.BookDAOImpli"%>
<%@page import="com.entity.BookDtls"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Add Books</title>
         <%@ include file="AllCSS.jsp" %>
    </head>
    <body style="background-color: #f0f2f2;">
        <%@include file="navbar.jsp"%>
<%--                 <c:if test="${empty userobj}">
            
            <c:redirect url="../login.jsp" />
            
        </c:if>
 --%>
        <div class="container">
            <div class="row p-2">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center"> Edit Books </h4>

                           

                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                BookDAOImpli dao = new BookDAOImpli(DBConnection.getConnection());
                                BookDtls b = dao.getBookById(id);
                            %>



                            <form action="../editbooks" method="post">
                                <input type="hidden" name="id" value="<%=b.getBookId()%>">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Book Name*</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" name="bName" value="<%=b.getBookName()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Author's Name*</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" name="author" value="<%=b.getAuther()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Price*</label>
                                    <input type="number" class="form-control" id="exampleInputPassword1" name="price" value="<%=b.getPrice()%>">
                                </div>



                                <div class="form-group">
                                    <label for="inputState">Book Status</label>
                                    <select id="inputState" name="status" class="form-control">
                                        <%
                                            if ("Active".equals(b.getStatus())) {
                                        %>
                                         <option value="Active">Available</option>
                                        <option value="Inactive">Out of Stock</option>
                                        <%
                                        } else {
                                        %>
                                        <option value="Inactive">Out of Stock</option>
                                        <option value="Active">Available</option>
                                        <%
                                            }
                                          %>


                                    </select>
                                </div>
                                
                                <button type="submit" class="btn btn-primary">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="margin-top: 130px;">
            <%@include file="footer.jsp" %>
        </div>

    </body>
</html>
