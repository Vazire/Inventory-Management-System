<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
try {
	
	String connectionURL = "jdbc:mysql://localhost:3306/dbname";
	Connection connection = null;
	Class.forName("com.mysql.jdbc.Driver").getDeclaredConstructor().newInstance();
	connection = DriverManager.getConnection(connectionURL, "root",
			"2348");
	String a1 = request.getParameter("q1");    
	String a2 = request.getParameter("q2");
	
	
	
	 String to;
		to=(String)session.getAttribute("userid");     
	PreparedStatement st = connection.prepareStatement("update members set a1=? , a2=? where id=?");
	st.setString(1, a1);
	st.setString(2, a2);
	st.setString(3, to);
	int i=st.executeUpdate();
	if (i > 0) {
	  
	     
	    response.sendRedirect("http://localhost:8080/hello/welcome");
	 
	} else {
		out.println(to);
	}	
	
} catch (Exception ex) {
	out.println(ex);
	
	out.println("Unable to connect to database.");
}
%>

</body>
</html>