<!DOCTYPE html>
<html lang="en">
<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="submit"]
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	margin-left:35%;
	padding:15px;
	width:33%;	
	border-radius: 25px;
}
</style>
</head>
<body>
<div class="header">
  <a href="#default" class="logo"><img class="logo" src="Logo1.png"></a>
  <div class="header-right">
    <a href="index.jsp">Home</a>
    <a class="active" href="adminLogin.jsp">Admin Login</a>
  </div>
</div>
<body>
<div class="container">
<br>

	<form method ="post">
	<div class = "form-group">
	<center><h2>Username</h2></center>		
	<input type = "text"  name = "username"  placeholder = "Enter username" id = "name"  required />
	<center><h2>Password</h2></center>		
	<input type = "password" name = "password" placeholder = "enter password"  required  />
		
	<br><br>		
	<center><button  name ="btn" class = "button"><span>Submit</button></center>
			
		</form>
	<br>
	<%
	
	if(request.getParameter("btn")!=null)
			{
		
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	if("admin".equals(username) && "pyash123".equals(password))
	{
		response.sendRedirect("home.jsp");

	}
	else
	{
		response.sendRedirect("adminLogin.jsp");
	}
}
	%>
	
	
	
	
</div>
<br>
<br>
<br>
<br>
<h3><center>All Right Reserved @ BTech Days :: 2020  </center></h3>
</body>
</html>
