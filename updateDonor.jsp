<%@include file="header.html"%>
<%@page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="email"], select,input[type="number"]
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	padding:15px;
	width:60%;	
	border-radius: 25px;
	margin-left:20%;
}
h2,h1
{	
	margin-left:20%;
}
hr
{
width:60%;	
}
</style>
</head>
<body>

<form method="post">
<h2>ID</h2>
		
<input type = "number" name = "id" placeholder = "Enter id"  required  />
<h2>Name</h2>
		
<input type = "text" name = "name" placeholder = "Enter Name"  required  />
<h2>Mobile no</h2>		
<input type = "text" name = "phone" placeholder = "Enter mobile no" required/>
<hr>
<h2>Gender</h2>		
<select name = "gender">
<option value = "Male">Male</option>
<option value = "Female">Female</option>
<option value = "Others">Others</option>
</select>
<hr>
<h2>Email</h2>
<input type = "email" name = "email" placeholder = " Enter email "  required />
<h2>Blood Group</h2>
<select name = "bloodgroup">

<option value = "A+">A+</option>
<option value = "A-">A-</option>
<option value = "B+">B+</option>
<option value = "B-">B-</option>
<option value = "O+">O+</option>
<option value = "O-">O-</option>
<option value = "AB+">AB+</option>
<option value = "AB-">AB-</option>
</select>
<h2>Address</h2>
<input type = "text" name = "address" placeholder = "Enter Address"  required  />
			
<button  name ="btn" class = "button1"><span>Submit</button>
			
		</form>
	<%
		if(request.getParameter("btn")!=null)
			{
			
			String name  = request.getParameter("name");
			String phone  = request.getParameter("phone");
			String gender  = request.getParameter("gender");
			String email = request.getParameter("email");
			String bloodgroup = request.getParameter("bloodgroup");
			String address = request.getParameter("address");
			int id =Integer.parseInt(request.getParameter("id"));

		
	
		try
			{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

	//get connection
	String url = "jdbc:mysql://localhost:3306/yp_5jan23";
	String username = "root";
	String password = "abc456";
	Connection con = DriverManager.getConnection(url , username , password);
	String sql = "update donor set name =?, phone =?, gender = ? , email = ? , bloodgroup =?, address=? where id = ?";
	PreparedStatement pst = con.prepareStatement(sql);	
	pst.setString(1 , name);
	pst.setString(2, phone);
	pst.setString(3, gender);
	pst.setString(4, email);
	pst.setString(5, bloodgroup);
	pst.setString(6, address);
	pst.setInt(7, id);
	
	pst.executeUpdate();
	con.close();
	response.sendRedirect("editDeleteList.jsp?msg=valid");

	
	}
		
	catch(SQLException err)
	{
		out.println("issue " + err);

	}
}

	%>












<br>
<br>
<br>
<br>
<h3><center>All Right Reserved @ BTech Days :: 2020  </center></h3>

</body>
</html>