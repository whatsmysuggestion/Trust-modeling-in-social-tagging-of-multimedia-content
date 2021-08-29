<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>

<%

		String email=(String)session.getAttribute("email");
		
		Statement st = null;
		ResultSet rs1=null;
	
	try{
		
		Class.forName("com.mysql.jdbc.Driver");	
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");
			st=con.createStatement();
			String sql1="select * from profile where email='"+email+"'";
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				int hit=0;
				hit=rs1.getInt(12)+1;
				
				try{
				Class.forName("com.mysql.jdbc.Driver");	
				Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");
				PreparedStatement ps=con.prepareStatement("Update profile set upload=? where email='"+email+"'");
				ps.setInt(1,hit);
				int x=ps.executeUpdate();
				String shit=Integer.toString(hit);
				
				response.sendRedirect("upload.jsp");
				}
				catch (Exception ex) 
				{
					out.println(ex.getMessage());
				}
			}	
	}
	catch (Exception e) 
		{
			out.println(e.getMessage());
		}
		
	
 %>
