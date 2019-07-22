<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TechMahindra IMS</title>
</head>
<body>
<%
    String user = request.getParameter("uname");
	String email = request.getParameter("email");
	String loc = request.getParameter("loc");
    String pwd = request.getParameter("pass");
    String userid= request.getParameter("id");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbname",
            "root", "2348");
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into members(username, password, email, id , regdate, loc) values ('" + user + "','" + pwd + "','" + email + "','"+ userid +"', CURDATE(), '"+ loc  +"')");
    if (i > 0) {
       
	    session.setAttribute("username", user);
	    session.setAttribute("userid", userid);
	     
	    response.sendRedirect("http://localhost:8080/hello/security");
       
    } else {
        response.sendRedirect("http://localhost:8080/hello/reg");
    }
%>
</body>
</html>