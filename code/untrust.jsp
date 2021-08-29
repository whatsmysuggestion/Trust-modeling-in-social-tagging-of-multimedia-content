<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>

<%

		String id=request.getParameter("select");
		String status="Un Trust";
					
				try{
				Class.forName("com.mysql.jdbc.Driver");	
				Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");
				PreparedStatement ps=con2.prepareStatement("Update view set imagestatus=? where id='"+id+"'");
				ps.setString(1,status);
				int x=ps.executeUpdate();
				response.sendRedirect("content.jsp?message=success");
				}
				catch (Exception ex) 
				{
					out.println(ex.getMessage());
				}
			
		
	
 %>
