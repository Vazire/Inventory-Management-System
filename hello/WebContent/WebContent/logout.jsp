<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TechMahindra IMS</title>
</head>
<body>
<%
session.setAttribute("loggedin","no");
session.setAttribute("issued","0");
session.invalidate();
response.sendRedirect("http://localhost:8080/hello/index");
%>
</body>
</html>