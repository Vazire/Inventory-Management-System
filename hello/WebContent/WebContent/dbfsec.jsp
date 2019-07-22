<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %> <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	String id = request.getParameter("id");
	   
	
	    PreparedStatement ps=connection.prepareStatement(  
	    	    "select * from members where   id=?");  
	    	  
	    	ps.setString(1,id);  
	     
	    	              
	    	ResultSet rs=ps.executeQuery();  
	    	 if (rs.next()) {
	 	    	String an1=rs.getString("a1");
	 	    	String an2=rs.getString("a2");
	 	    	if(a1.equals(an1)&&a2.equals(an2)){
	 	    		
	 	        response.sendRedirect("http://localhost:8080/hello/forgot");
	 	    	}
	 	     else {
	 	    	 session.setAttribute("invalid","true");
	 	    	response.sendRedirect("http://localhost:8080/hello/fsec");
	 	    }
	    	 }
	    	 else out.println("Please Register first <a href='http://localhost:8080/hello/reg'>try again</a>");
	
} catch (Exception ex) {
	out.println(ex);
	out.println("Unable to connect to database.");
}
%>

</body>
</html>