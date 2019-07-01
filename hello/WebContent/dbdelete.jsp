<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	String id = request.getParameter("did");    
	String com = request.getParameter("dname");
	int i=0;
	
	
	    PreparedStatement ps=connection.prepareStatement(  
	    	    "select * from devices where   id=? and company=?",  ResultSet.TYPE_SCROLL_SENSITIVE,
	              ResultSet.CONCUR_UPDATABLE);  
	    	  
	    	ps.setString(1,id);  
	    	ps.setString(2,com);  
	    	              
	    	ResultSet rs=ps.executeQuery();  
	    	 while (rs.next()) {
	    		   rs.deleteRow();
	    		   i++;
	    	 }
	    	if(i>0) response.sendRedirect("alldevices.jsp");
} catch (Exception ex) {
	out.println(ex);
	out.println("Unable to connect to database.");
}
%>

</body>
</html>