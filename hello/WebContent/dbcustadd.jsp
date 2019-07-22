<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<% if(session.getAttribute("loggedin")=="no") 
{
	response.sendRedirect("http://localhost:8080/hello/index");
}
%>
<%
try {
	
	String connectionURL = "jdbc:mysql://localhost:3306/dbname";
	Connection connection = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	connection = DriverManager.getConnection(connectionURL, "root","2348");
	
	
	String device = request.getParameter("select");
	String to=(String)session.getAttribute("username");     
	
	PreparedStatement st = connection.prepareStatement("update devices set status='Issued' , issueto=? , date=now() where id=? and location in (select loc from members where username=?)");
	PreparedStatement st1 = connection.prepareStatement("insert into track(deviceid,model,location,issueto,memberid,dateofissue) values(?,(select model from devices where id=?),(select location from devices where id=?),?,(select id from members where username=?),(select date from devices where id=?))"); 
	
	st.setString(1, to);
	st.setString(2, device);
	st.setString(3, to);
	
	st1.setString(1,device);
	st1.setString(2,device);
	st1.setString(3,device);
	st1.setString(4,to);
	st1.setString(5,to);
	st1.setString(6,device);
	
	
	
	
	
	int i=st.executeUpdate();
    
	if (i > 0 ) {
		
		int j = st1.executeUpdate();
		if (j>0)
		response.sendRedirect("http://localhost:8080/hello/all");
	 
	} else {
		 out.println(device);
	   
	}	
	 	       
	 	       
	 	      
	 	    
	
} 

	catch (Exception ex) {
		out.println(ex);
		out.println("Unable to connect to database.");
}
%>
</body>
</html>