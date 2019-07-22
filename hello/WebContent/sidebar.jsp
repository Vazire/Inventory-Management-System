<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="styles/sidenavbar.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/50b5c9c94b.js"></script>
<title>Insert title here</title>
</head>
<body>
	<!-- Side navigation -->
	<div class="sidenav">
		<a><img src="https://png.pngtree.com/svg/20170331/1ec867769d.svg"></a>
		<a href="#" class="welcome"><%=session.getAttribute("username")%></a>
		<div class="content">
			
			<a href="http://localhost:8080/hello/profile"><i class="fas fa-user-circle fa-xs"></i><span>About</span></a>
  			<a href="http://localhost:8080/hello/all"><i class="fas fa-tachometer-alt fa-xs"></i><span>Issued Devices</span></a>
  			<a href="http://localhost:8080/hello/available"><i class="fas fa-briefcase fa-xs"></i><span>Available Devices</span></a>
  			<a href="http://localhost:8080/hello/choose-device"><i class="fas fa-briefcase-medical fa-xs"></i><span>Issue Devices</span></a>
  			<a href="logout.jsp"><i class="fas fa-sign-out-alt fa-xs"></i><span>Logout</span></a>
  		
  		</div>
	</div>

</body>
</html>