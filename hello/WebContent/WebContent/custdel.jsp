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
	connection = DriverManager.getConnection(connectionURL, "root","2348");
	
	String id=request.getParameter("id");
	String to=(String)session.getAttribute("username");  

	
	    PreparedStatement ps=connection.prepareStatement("update devices set status='Not Issued' , issueto=?, date=?  where id=? ");  
	    ps.setString(1, "-");
	    ps.setString(2, null);
	    ps.setString(3, id);
	    PreparedStatement ps1=connection.prepareStatement("update track set dateofreturn=now() where deviceid=? and issueto=? and  dateofreturn is NULL");
	    ps1.setString(1,id);
	    ps1.setString(2,to);
	    
	    
	    	int i=ps.executeUpdate();  
	    	if (i>0) {
	    		int j=ps1.executeUpdate();
	    		if(j>0)
	 	    	response.sendRedirect("http://localhost:8080/hello/all");
	 	    	} 
	
} catch (Exception ex) {
	out.println(ex);
	out.println("Unable to connect to database.");
}
%>

</body>
</html>