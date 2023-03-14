<%@page import ="java.sql.*" %>
<%@include file="header.html"%>
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
<table id = "customers">
<tr>
<th>ID</th>
<th>Name</th>
<th>Phone</th>
<th>Gender</th>
<th>Email</th>
<th>Blood Group</th>
<th>Address</th>
<th>Edit</th>
<th>Delete</th>



</tr>

<%

String msg = request.getParameter("msg"); 
if("valid".equals(msg))
	{
		%>
	<center><font color ="red" size = "5">Successfully Updated</font></center>
	<%
	}
%>

	
<%

if("invalid".equals(msg))
	{
		%>
	<center><font color ="red" size = "5">Something went wrong?? Try again</font></center>
	<%
	}
%>
<%

if("deleted".equals(msg))
	{
		%>
	<center><font color ="red" size = "5">Successfully Deleted</font></center>
	<%
	}
%>


<%
			try
			{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

	//get connection
	String url = "jdbc:mysql://localhost:3306/yp_5jan23";
	String username = "root";
	String password = "abc456";
	Connection con = DriverManager.getConnection(url , username , password);
	

	String sql = "select * from donor ";
	Statement stmt = con.createStatement();	
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next())
	{
		
		String name = rs.getString(1);
		String phone =  rs.getString(2);
		String gender = rs.getString(3);
		String email = rs.getString(4);
		String bloodgroup = rs.getString(5);
		String address = rs.getString(6);
		int id =  rs.getInt(7);
		
		
	
	%>
		<tr style = "text-align:center;">
		<td><%=id %></td>
		<td><%=name %></td>
		<td><%= phone %></td>
		<td><%=gender %></td>
		<td><%= email%></td>
		<td><%= bloodgroup%></td>
		<td><%= address%></td>
		<td><a href = "updateDonor.jsp?id=<%=rs.getInt(7)%>">Edit</a></td>
		<td><a href = "deleteDonor.jsp?id=<%=rs.getInt(7)%>">Delete</a></td>
		
		
		</tr>
	<% 	
		}
	}
	catch(SQLException err)
	{
		out.println("issue " + err);

	}


	%>
	

</table>
</center>





</table>
</center>
<br>
<br>
<br>
<br>
<h3><center>All Right Reserved @  2020  </center></h3>
</body>
</html>