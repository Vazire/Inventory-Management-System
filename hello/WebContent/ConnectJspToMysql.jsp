<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ConnectMySQL</title>
</head>
<body>
	<% 
try {
/*here ims is the database name. you have to give the database name you have created and 3306 is the default sql port */
String connectionURL = "jdbc:mysql://localhost:3306/dbname"; 
 
Connection connection = null; 
 
Class.forName("com.mysql.jdbc.Driver").getDeclaredConstructor().newInstance(); 
 
/* "root" and "2348" are the mysql username and password  */
 
connection = DriverManager.getConnection(connectionURL, "root", "2348");
 
if(!connection.isClosed())
%>
<% 
out.println("Successfully connected to " + "MySQL server using TCP/IP...");
connection.close();
}
catch(Exception ex){
%>
<%
out.println("Unable to connect to database.");
}
%>
</body>
</html>