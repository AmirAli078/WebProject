<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1> Home jsp </h1>

  <!-- Success message -->
<c:if test="${not empty userObj}">
<h1>name:${userObj.name}</h1>
<h1>name:${userObj.email}</h1>
   <div style="color: green; margin-bottom: 15px;"> User Login successfully.</div>
</c:if>
</body>
</html>