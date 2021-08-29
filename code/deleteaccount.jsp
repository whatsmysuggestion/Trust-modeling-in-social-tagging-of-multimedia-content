
<%@ page import="java.sql.*"%>
	
	<% 
    
	String id = request.getParameter("id");
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
			
        try
		{
			Class.forName("com.mysql.jdbc.Driver");	
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");
		
	    st=con.createStatement();
	    String sql="delete from profile  where id='"+id+"'";
 	    st.executeUpdate(sql);
			
		%>
		<jsp:forward page="index.html"/>
		
		<%
	}catch(SQLException e1)	{ out.println("Database error"+e1.getMessage()); }

	finally
	{
	     st.close();
	      con.close();
	}
            %>
			
             </form>
       </body> 	
</html>