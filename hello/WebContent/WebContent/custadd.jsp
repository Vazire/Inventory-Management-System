<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>  
<%@page import="java.sql.*" %>
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Desk</title>
<link rel="stylesheet" href="styles/custadd.css">
<style>
.card {
	padding:0px;
	background: #fff;
	/*  max-width: 360px;*/
	/*  border-radius: 20px;*/
	margin: 40px 30px;
	border-radius:1rem;
}
.shadow1 {
	box-shadow: 0 5px 10px rgba(154, 160, 185, .05), 0 15px 40px rgba(166, 173, 201, .4);
	border-radius:1rem;
}



</style>
</head>
<body>
<% if(session.getAttribute("loggedin")=="no") 
{
	response.sendRedirect("http://localhost:8080/hello/index");
}
%>
<%@include file="sidebar.jsp" %>
 

 <div class="  card shadow1 " style="text-align:center;width:500px;margin:140px auto;">









<h1 style="background-color:#e60000;color:#fff;" >
  Choose Device

</h1>

<br>

               

<div style="text-align:center;">

<form action="dbcustadd.jsp" method="post" style="display:inline-block" >


    <label for="favcity">
    <select id="favcity" name="select">
    <option value="0">Choose Device</option>
    <%
try {
	
	String connectionURL = "jdbc:mysql://localhost:3306/dbname";
	Connection connection = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	connection = DriverManager.getConnection(connectionURL, "root","2348");
	
	String to=(String)session.getAttribute("username");     
	
	
	PreparedStatement ps=connection.prepareStatement("select * from devices where status='Not Issued' and location in(select loc from members where username=?)");  
	    	  
	ps.setString(1, to);
	ResultSet rs=ps.executeQuery();  
	while (rs.next()) {
	 	    
	 	    
	 	    	String id=rs.getString("id");
	 	    	String model=rs.getString("model");
	 	    	String device= model.replaceAll(" ","");
	 	       
	 	       %>
	 	   
     
      				<option value=<%=id %>><%=device %></option>
     
   
       
 
	 	       <%
	 	       
	 	    } 
	
} catch (Exception ex) {
	out.println(ex);
	out.println("Unable to connect to database.");
}
%>
 </select>
 </label>
 
<div class="form-group" style="text-align:center; margin-top:20px;">
       <input type="submit" name="add" class="btn  btn-lg" value="Issue Device" style="color:#e60000;background-color:#fff;border: 1px solid #e60000;outline:none;">
       
</div>
  
    
</form>



                



            </div>
            

   
        </div>
      
        
       
        
  


</body>
</html>