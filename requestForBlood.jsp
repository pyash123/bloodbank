<%@include file="header.html"%>
<%@page import ="java.sql.*" %>
<html>
<head>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 95%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<br>
<center>
<table id  = "customers">
	<tr>
	<th>Name</th>		
	<th>Mobile Number</th>
	<th>Email</th>
	<th>Blood Group</th>
	<th>Done</th>
	<th>Delete</th>
	</tr>
	<tr>
	<%
	
			try
			{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

	//get connection
	String url = "jdbc:mysql://localhost:3306/yp_5jan23";
	String username = "root";
	String password = "abc456";
	Connection con = DriverManager.getConnection(url , username , password);
	

	String sql = "select * from bank where status ='pending' ";
	Statement stmt = con.createStatement();	
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next())
	{
		
		String name = rs.getString(1);
		String phone =  rs.getString(2);
		String email = rs.getString(3);
		String bloodgroup = rs.getString(4);
		
		
		
	
	%>
		<tr style = "text-align:center;">
		<td><%=name %></td>
		<td><%= phone %></td>
		<td><%= email%></td>
		<td><%= bloodgroup%></td>
		<td><a href ="requestForBloodDone.jsp?phone=<%=rs.getString(2)%>">Done</a></td>
		<td><a href ="requestForBloodDelete.jsp?phone=<%=rs.getString(2)%>">Delete</a></td>
		
		</tr>
	<% 	
		}
	}
	catch(SQLException err)
	{
		out.println("issue " + err);

	}


	%>
			




</center>
<br>
<br>
<br>
<br>
<h3><center>All Right Reserved @ BTech Days :: 2020  </center></h3>
</body>
</html>