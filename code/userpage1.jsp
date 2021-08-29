<%@ page  language="java" import="java.sql.*,databaseconnection.*" errorPage="" %>
<%
	//int fid1=0;
	String rid3=null,rid1=null,rid2=null,fname1=null,id1="2",fid1=null;
 	Connection con6=null;
	Statement st6=null;
	ResultSet rs6=null;
	String status1="waiting for approve";
	String sql6="select distinct id,name from request where fid='"+id1+"' and status = '"+status1+"'";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");	
		con6 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");
		st6=con6.createStatement();
		rs6=st6.executeQuery(sql6);
		while(rs6.next()){
			fid1=rs6.getString("id");
			fname1=rs6.getString("name");
			//rid3=id+","+name+","+fid1+","+fname1;
			//rid1=id+","+name+","+fid1+","+fname1+",Confirm";
			//rid2=id+","+name+","+fid1+","+fname1+",Ignore";
		
        System.out.print("new"+fid1);
       }
		}
catch(Exception ex6)
	{
		System.out.println(ex6);
	}
	  finally
	{
		con6.close();
		st6.close();
	}
 

  %>