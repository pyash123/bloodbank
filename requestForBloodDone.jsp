<%@page import ="java.sql.*" %>

	
	<%
	String phone = request.getParameter("phone");	

	
	try
			{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

	//get connection
	String url = "jdbc:mysql://localhost:3306/yp_5jan23";
	String username = "root";
	String password = "abc456";
	Connection con = DriverManager.getConnection(url , username , password);
	

	String sql = "update bank set status ='completed' where phone  = ?";
	PreparedStatement pst = con.prepareStatement(sql);	
	pst.setString(1 , phone);
	pst.executeUpdate();
	response.sendRedirect("requestForBlood.jsp");
		
		
	
	 	
		
	}
	catch(SQLException err)
	{
		out.println("issue " + err);

	}


	%>
			


