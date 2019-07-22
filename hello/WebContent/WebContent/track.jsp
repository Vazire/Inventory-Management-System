<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>TechM IMS | Track Devices</title>
<link rel="stylesheet" href="styles/table.css">

</head>
<body>

<% if(session.getAttribute("adlogin")=="no") 
{
	response.sendRedirect("http://localhost:8080/hello/adminlogin");
}
%>

<nav class="navbar navbar-expand-lg navbar-light bg-white">
		<a class="navbar-brand" href=""><img class="main" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAaYAAAB3CAMAAAB/uhQPAAAArlBMVEX////lFjVlYmLlEjPkAB/40NPmHjtbWFhiX1/kACbkBS7kACzyoKn509frZHLkACqTkZHqXWyHhYV/fX15dnbMy8va2trtdIDnNUxaVlbpSVzug433xsrkACPAv7/jABrwlZ763uH98vP0r7b1usD96+3ufIjJycm3trabmprzpaziAADjABPY2NhwbW3vjJboPlKlpKTy8vLqVGXsbHrnLUXpTl+wr69OSkrm5eUqFJgEAAAI2ElEQVR4nO2cfVu6PBSAU0gBX1CzDMtQMyujssx+9f2/2FNqcPY+cKA+nvufrisYO+xmuJ1NT04QBDFGuZoWp+gQn88hRde+H5SdcjqcctEhngXJMxK8FF37fpBS0i9Fh9gBT5LTLbr2/QA1HQSo6SBATQcBajoIUNNBgJoOAtR0EJQdGtIJc7j46S1q+pnid2leCEsvzPGzokNETTzOq0BT9XnX4aAmPvdamr4vtPlmCr+f36iJa0ZNPPQ0dQJ9HPIi350vjUT810VcFUfTReuMpfO2B32/KPQ0tdJk1pMm/+Eh0CnqJKlwjqbnL3Zo80vwwnbd/yk5aIKvqptAq0j1Ji7B0VQVFXO+jmVBKgdN5SAu9/6lV6KaVMVq6kgq/zqS/pSvJs1yzmNSFaNJ2iGdI1k4zFeT8HVFFQB9gtb0Ln9tBscxjshV07feJ5MD59C0pq68auct3/bZEzJo4g+7eJouaE0ObzAedN9BVZSmf4oO6XTybZ89Ib0mp/vIQ0OTU3574EBWSmg6e2fG4rSmwrNZOyGDpkfuKS/JKQJNTksnIFJTi0kyOmT3Qk0AE5o0k+3KZNED6R41JZjQVP2nFZA6p3cDQ0ZNACOa7rUC0ki9oibBWRqawBl5azojPr60rnroZNZ0/g/w8NBFTXmSWVMrICY/6nkTatqCzJoexdkB1GQc1HQQ5KApaVzUZIocNAXxWh1qMkVmTW+CnKgTJDlr1GSKzJreuwEv2+10wDVQkymMTW95oCZToKaDIIMm/YYhNT1olUFNPDKs3gbau3nIhQy9BkVNPLLshXB0PZHLgnrdCTXxyLRlJei2JCRjPWqRPWg9fwv5K4OaeGTbWcTftbKmmjQcvWXFqQp3nsc7T1ATD/MbwKrJPiFmZ5EQBzVJ0dOk2oYFCMC2bs19eqhJiZ6mFN2C2D6kbRc1ydHTBHc6KNqbKCZZ7UBNadDU9K351QpqS7diAzhq0kVT08nNl07HqNKJpHtNT6hJzn0Av34n+VbXc7nK7Aym2zpg2+xe69uCqEnBcwdyITv1viWdLzlO94ZT6r0V8FY86AWQWJPGzx7CJZQAv0VtCvJ3QfnEr9vnewC/d5+rT0EQBEEQBEEQBEEQBEEQBCmO+tbcNowFM6vPYuqTNAWHgJmxeGQ1Ek2Qe3XewN2SQei/js0EY4FgwnaKgnM7KWjPzQQjB4ZqL3KvrmKVtsZy3VPjwXjNFAX7HijYNxKLAiLUNE/U9tVtISq6Nh0MahJVt42n8M5wMKhJVN02eJ+Gg0FNouq2IhqZDQY1iarbCndoNhjUJKpuK0zEipp0qtsKy8B0xYgmt5B508FqujQbTEZNVvhhaK4tZ5eaPJtgAJ7R9fEBOOiSgvdDk+8amcCp2aEmr3kNmUwWLmHCbU8mydFZxd83TVbU2z4IPXaoyb+ijy5gf6p9UEfbtf3S5FsFdaWTPdM0GQARNp24G8P3HqPpbrqsKLj8INPgPE23l5yC/Vcy6fGrKe5Kcca+4aoC2ITR4+idfPAq3lBaXIo0jRS3bW3ytLd9VVjL/jC+S7mmaxtqYlYs2qCz0ZoakW8pqdkVeFGOpnrEK+e50ZTS5G660rgdB9II1RGs8MM5letqVOyapEA0Wgo01VW3ba9HOIvQU4b1c5d/RrbS1ANvPUrT2NUbQloR6FCsplEkKujC+vq1P22z0I3nTQ1bVJjBC4kkyvWTNHp/KnrpXQvj3RCub/dKM7RBP19NbWJ8IcECWSZWk2S+4INneF5av5BHcxtMb1NoKlkuGMeLH474XIGmpeLhdNcv5obKZlLgI09Nt6FuHDBpy2iauuJypTD5RKmv/1xFXimjpt8eEvNJz0RI7JloCHGnaH6rwt6ogqiRn6axnWLWnHQnWpP8FUIn5SfWSmpGTaUovpCqMy3pUNu6NW5uVfr0UazH1/lo6ssfRxI33rxAa/LkskMYy90iXJ+dVZMdd86ZvBVXz3cmTfZw3arar7wfLD83TbNU7eO/cjV9nDQVn29wKfI2/HsysmpKnpYrab0u83jravI3kVmpEnThOCdNo6jmyaCiTKol7r03ieiC9A0kg4/bKC4q0mQprubW/8pNKU2wZC3ss6GKNXm1mJ9R/3qU0rSlrcPcZV6apu2mlCX5ySXQxF7kMyRvIdE0DpOSAk1Wn7pa2yZtCDW5LgilN+GFKtDk2c1ezHRTsrGQt07brhEXyU2TkusB9CTQRKemfm2Qn3mJpiH4NBFoGrD7/nowxyLUZL8yBelQBZpqGTeGNYnPxt1pIq8r0MTN6ZWg30RTm7ssSGri7HmExUSa/Clbjg6Vr8kqpWgRgjmMa4eaiGlgGk2w2wBN/NVbpaZTeIJAU8jf46GhyR+maREIkUrdpSb4HKfRRN7Atpru4CRcoCliizGh8jXxatSDuAxq0tEUssWYUA9V03BpD7jY/fWg9Kg1nbZdQetsihSjaVwZUFMjcJHh6pRj1lSPhNkVK2Qvk5umT8ksfpNyOGJNp7JU0Xo1qhBN0swlamrL8p0FarolZo0UqEm6eFCgJmmCGTVJ0+O70lSjvlsYoiZwiuVTzfO00nRatKZBb0ixXtVBTas2W9Kt87oTTewVN6Cm2ACHojW5ohkealpVKWgd1ESAmv4/mvhfKj4OTc2D0eTRG2I5oZrWVPSA3PvscZlmXW8qXlPJs2ssRFYu+0hvym8eIlFRxIDc49ziLxqL7Pui6efWOMDj2edNgtYhtxLsIgvBYe81qTCYheCAmgSaXlETh73TNEm1DRM17UiTPInNcpia9L8VQle7L5pm6e4gnaaFbL2JQ26rt03ZghPL/mk6eY3StGU6TaMoXV9dafLD5DcEImbn4PUT+P2BJ+ZH85pRcjSsJP+fgv+rSaqtwWC43zueEAHFmuagYBj/fMcpcTJPE3HCEN74PMUtRAvtGlcnVULhpTis1jZOIczOwTFxmMnnjuDRhrCcirhaeTCrhuUH1OAGQkbBSyZITiBr0rwBdY1suykRXQXZL/4DX0qZooSeQrEAAAAASUVORK5CYII="></a>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item">
				<a class="nav-link" href="#">Welcome,Admin!</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="adminlogout.jsp">Logout</a>
			</li>
		</ul>	
	</nav>

<div class="t">

<table>
  
  <thead>
    <tr>
            <th class="ttitle" colspan="6">
                <h2>TechMahindra Inventory</h2>
            </th>
        </tr>
    <tr>
            
             <th>Device ID</th>
         	 <th>Model </th>
             <th>Location</th>
             <th>Issued to</th>
             <th>Date of Issue</th>
             <th>Date of Return</th>
           
    </tr>
  </thead>
  

<%
try {
	
	String connectionURL = "jdbc:mysql://localhost:3306/dbname";
	Connection connection = null;
	Class.forName("com.mysql.jdbc.Driver").getDeclaredConstructor().newInstance();
	connection = DriverManager.getConnection(connectionURL, "root",
			"2348");
	
	
	
	
	    PreparedStatement ps=connection.prepareStatement("select * from track ");  
	    	  
	    	 
	    	              
	    	ResultSet rs=ps.executeQuery();  
	    	 while (rs.next()) {
	 	    
	 	    	String id      =rs.getString("deviceid");
	 	    	String model   =rs.getString("model");
	 	    	String location=rs.getString("location");
	 	    	String to      =rs.getString("issueto");
	 	   	    String datei   =rs.getString("dateofissue");
	 	   	    String dater   =rs.getString("dateofreturn");
	 	        if(dater==null)dater="-";
	 	       
	 	       %>
	 	   

  <tbody>
    <tr>
     
      <td data-label="Device ID"><%=id %></td>
      <td data-label="Model No."><%=model %></td>
      <td data-label="Location"><%=location %></td>
      <td data-label="Issued To"><%=to %></td>
      <td data-label="Date of Issue"><%=datei %></td>
      <td data-label="Date of Issue"><%=dater %></td>
    </tr>
   
  </tbody>


	 	       
	 	       
	 	       
	 	       <%
	 	       
	 	    } 
	
} catch (Exception ex) {
	out.println(ex);
	out.println("Unable to connect to database.");
}
%>

	</table>
</div> 	       


</body>
</html>