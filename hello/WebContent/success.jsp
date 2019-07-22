<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="styles/style.css" rel="stylesheet">

<title>TechMahindra IMS</title>
<style>
	table,th,td
	{
		border:2px solid green;
	}
	table
	{	margin:5rem auto 5rem auto;
		border-collapse:collapse;
		width:75%;
		text-align:center;
	}
	td
	{
		height:30px;
	}
	tr:nth-child(even)
	{
	  background-color: #F63045;
	}
</style>
</head>
<body>
	<%
    	if ((session.getAttribute("id") == null) || (session.getAttribute("id") == "")) {
    		
	%>
	You are not logged in<br/>
	<a href="http://localhost:8080/hello/index">Please Login</a>
	<%} else {
	%>
	<jsp:include page="sidebar.jsp" />

	<%
    	}
	%>
		<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "dbname";
String userid = "root";
String password = "2348";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
	
	<table>
    	<thead>
        	<tr>
            	<th>Device ID</th>
            	<th>Company</th>
            	<th>Model No.</th>
            	<th>Location</th>
            	<th>Issued Status</th>
        	</tr>
    	</thead>
    	
    	<tbody>
    		<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from users";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

        	<tr>
				<td><%=resultSet.getString("DeviceID") %></td>
				<td><%=resultSet.getString("Company") %></td>
				<td><%=resultSet.getString("ModelNo") %></td>
				<td><%=resultSet.getString("Location") %></td>
		        <td><%=resultSet.getString("IssuedStatus") %></td>
         	</tr>
    	</tbody>
		<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>


	</table>
</body>
</html>