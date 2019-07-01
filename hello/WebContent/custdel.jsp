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
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	connection = DriverManager.getConnection(connectionURL, "root",
			"2348");
	
	String id=request.getParameter("id");
	
	
	    PreparedStatement ps=connection.prepareStatement("update devices set status='Not Issued' , issueto=?, date=?  where id=? ");  
	    ps.setString(1, "-");
	    ps.setString(2, null);
	    ps.setString(3, id);
	    	              
	    	int i=ps.executeUpdate();  
	    	if (i>0) {
	 	    	response.sendRedirect("custall.jsp");
	 	    	} 
	
} catch (Exception ex) {
	out.println(ex);
	out.println("Unable to connect to database.");
}
%>

</body>
</html>