<%@page import ="java.sql.*" %>
<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
.mySlides {display:none;}

input[type="text"], input[type="mail"]
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	margin-left:2%;
	padding:15px;	
}
</style>
</head>
<body>

<div class="header">
  <a href="#default" class="logo"><img class="logo" src="Logo1.png"></a>
  <div class="header-right">
    <a class="active" href="index.jsp">Home</a>
    <a href="adminLogin.jsp">Admin Login</a>
  </div>
</div>

<div style="max-width:100%">
  <img class="mySlides"  src="slide1.jpg" >
  <img class="mySlides"  src="slide2.png" >
</div>
<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>


<body>
  <br>
	<%
	String msg = request.getParameter("msg");
	if("valid".equals(msg))
	{
		%>
	<center><font color ="red" size = "5">Form Submitted Successfully.You will get notified</font></center>
	<%
	}
	%>
	</br>
	<form >
			
			<input type = "text"  name = "name"  placeholder = "Enter Name" id = "name"  required />
			
			
			<input type = "text" name = "phone" placeholder = "enter mobile no "  required  />
		
			<input type = "mail" name = "email" placeholder = "Enter email" required/>
		
			<input type = "text" name = "bloodgroup" placeholder = " Enter BG "  required />
			
			<button  name ="btn" class = "button1"><span>Submit</button>
			
		</form>
	<%
		
			if(request.getParameter("btn")!=null)
			{
		
			
			
			String name  = request.getParameter("name");
			String phone  = request.getParameter("phone");
			String email = request.getParameter("email");
			String bloodgroup = request.getParameter("bloodgroup");
			String status = "pending";

		try
			{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

	//get connection
	String url = "jdbc:mysql://localhost:3306/yp_5jan23";
	String username = "root";
	String password = "abc456";
	Connection con = DriverManager.getConnection(url , username , password);
	String sql = "insert into bank values(? ,? ,? ,? ,?)";
	PreparedStatement pst = con.prepareStatement(sql);	
	pst.setString(1 , name);
	pst.setString(2, phone);
	pst.setString(3, email);
	pst.setString(4, bloodgroup);
	pst.setString(5, status);
	pst.executeUpdate();
	con.close();
	response.sendRedirect("index.jsp?msg=valid");

	
	}
		
	catch(SQLException err)
	{
		out.println("issue " + err);

	}
}

	%>
	
			

 
 
 
 
 
  <br>
  <br>
  </div>
</div>

<div class="row1"> 
<div class="container"> 
<br>         
<br>
    </tbody>
  </table>
</div>
</div>
<h3><center>All Right Reserved  :: 2020  </center></h3>

</body>
</html>

