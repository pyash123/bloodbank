
<%@page import ="java.sql.*" %>

	<%
    if(request.getParameter("id") != null)
	{
	int id = Integer.parseInt(request.getParameter("id"));
		
		
	
		try
			{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

	//get connection
	String url = "jdbc:mysql://localhost:3306/yp_5jan23";
	String username = "root";
	String password = "abc456";
	Connection con = DriverManager.getConnection(url , username , password);
	String sql = "delete from donor  where id = ?";
	PreparedStatement pst = con.prepareStatement(sql);	
	pst.setInt(1, id);
	
	pst.executeUpdate();
	con.close();
	response.sendRedirect("editDeleteList.jsp?msg=deleted");

	
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