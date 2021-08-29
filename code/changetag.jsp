<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>

<%
				String str = request.getParameter("changetag");
 				String[] temp;
				String delimiter = ",";
				String temp1=null, temp2=null;
 				temp = str.split(delimiter,2);
				for(int i =0; i < temp.length ; i++){
				}

		String id=temp[0];
		String tag=temp[1];
		
					
				try{
				Class.forName("com.mysql.jdbc.Driver");	
				Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");
				PreparedStatement ps=con2.prepareStatement("Update view set tag=? where id='"+id+"'");
				ps.setString(1,tag);
				int x=ps.executeUpdate();
				response.sendRedirect("content.jsp?message=success");
				}
				catch (Exception ex) 
				{
					out.println(ex.getMessage());
				}
			
		
	
 %>
