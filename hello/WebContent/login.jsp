<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
<link href="styles/style.css" rel="stylesheet">
<title>TechMahindra IMS</title>
</head>
<body>

	 <%
try {
	
	String connectionURL = "jdbc:mysql://localhost:3306/dbname";
	Connection connection = null;
	Class.forName("com.mysql.jdbc.Driver").getDeclaredConstructor().newInstance();
	connection = DriverManager.getConnection(connectionURL, "root",
			"2348");
	String id = request.getParameter("id");    
	String pass = request.getParameter("pass");
	
	PreparedStatement ps=connection.prepareStatement("select * from members where   id=?");  
	ps.setString(1,id);  
	     
	    	              
	ResultSet rs=ps.executeQuery();  
	if (rs.next()) {
	 	   String name=rs.getString("username");
	 	   String p=rs.getString("password");
	 	   if(p.equals(pass)){
	 	        session.setAttribute("username", name);
	 	 
	 	         session.setAttribute("loggedin","yes");
	 	         response.sendRedirect("custprofile.jsp");
	 	    	}
	 	    else {
	 	         out.println("Invalid credentials <a href='index.jsp'>try again</a>");
	 	    }
	    	}
	    	else out.println("Please Register first <a href='reg.jsp'>try again</a>");
	
} 
	catch (Exception ex) {
	out.println(ex);
	out.println("Unable to connect to database.");
}
%>


</body>
</html>