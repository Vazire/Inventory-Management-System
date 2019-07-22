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
	connection = DriverManager.getConnection(connectionURL, "root","2348");
	String id = request.getParameter("adid");    
	String pass = request.getParameter("adpass");
	
	
	
	PreparedStatement ps=connection.prepareStatement("select * from admin where   adminid=?");  
	ps.setString(1,id);  
	     
	    	              
	ResultSet rs=ps.executeQuery();  
	    	if (rs.next()) {
	 	    	String name=rs.getString("adminid");
	 	    	String p=rs.getString("adminpass");
	 	    	if(p.equals(pass)){
	 	       session.setAttribute("adlogin","yes");
	 	        response.sendRedirect("http://localhost:8080/hello/alldevices");
	 	        
	 	    	}
	 	     else {
	 	    	 out.println(p);
	 	        out.println("Invalid credentials <a href='http://localhost:8080/hello/adminlogin'>try again</a>");
	 	    }
	    			}
	    	
}
	    	 	
 catch (Exception ex) {
	out.println(ex);
	out.println("Unable to connect to database.");
}
%>

</body>
</html>