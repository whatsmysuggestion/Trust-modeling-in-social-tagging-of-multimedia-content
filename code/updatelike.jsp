<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>

<%

		String id=request.getParameter("id");
		Statement st = null;
		ResultSet rs1=null;
	
	try{
		
		Class.forName("com.mysql.jdbc.Driver");	
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");
			st=con.createStatement();
			String sql1="select * from view where id='"+id+"'";
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				int lyke=0;
				lyke=rs1.getInt("lyke")+1;
				
				try{
				Class.forName("com.mysql.jdbc.Driver");	
				Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");
				PreparedStatement ps=con.prepareStatement("Update view set lyke=? where id='"+id+"'");
				ps.setInt(1,lyke);
				int x=ps.executeUpdate();
				//String shit=Integer.toString(hit);
				//session.setAttribute("shit",shit);
				response.sendRedirect("tag3.jsp?message=success");
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
