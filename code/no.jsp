<%
	int imageid=0;
	int newid=0;
	String fname=null,visible=null;
 	Connection con2=null;
	Statement st2=null;
	ResultSet rs2=null;
	String status="Confirm";
	string tag=request.getParameter("tag");
	String sql="select * from view where tag='"+tag+"'";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");	
		con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");;
		st2=con2.createStatement();
		rs2=st2.executeQuery(sql);
		
		%>
		
				
				<%while(rs2.next()){
				imageid=rs2.getInt("imageid");
				fname=rs2.getString("fname");
				visible=rs2.getString("visible");
				if(visible.equals("public")){
					newid=imageid;	
				}
				else{
					Connection con3=null;
				Statement st3=null;
				ResultSet rs3=null;
				String statusb="Allow";
				String setting="public";
				String sql3="select * from request where id='"+id+"' and fname='"+fname+"'  or (user='"+fname+"' and statusa='"+statusb+"')";
				try
				{
					Class.forName("com.mysql.jdbc.Driver");	
					con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");;
					st3=con3.createStatement();
					rs3=st3.executeQuery(sql3);
					if(rs3.next()){
						newid=imageid;
					}
				}
				catch(Exception e3)
					{
						System.out.println(e3);
					}
				}
				//html code
				System.out.print("new id"+newid)
				}%>
		

		<%
		}
catch(Exception ex)
	{
		System.out.println(ex);
	}
	  finally
	{
		con2.close();
		st2.close();
	}
 
  %>