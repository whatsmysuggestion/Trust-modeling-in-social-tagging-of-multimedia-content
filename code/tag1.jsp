<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<% 
	
	Statement st = null;
	ResultSet rs1=null;
	String password=(String)session.getAttribute("password");
	String email=(String)session.getAttribute("email");
	String name=null,birth=null,gender=null,comment=null,date=null,date1=null;
	int id=0;
	int count1 = 0;
	int gallery = 0;
	int friends=0;
	try{
		
		Class.forName("com.mysql.jdbc.Driver");	
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");
		st=con.createStatement();
		String sql1="select * from profile where email='"+email+"'";
		
		rs1=st.executeQuery(sql1);
		while(rs1.next()){
				name=rs1.getString("name");
				session.setAttribute("name",name);
				birth=rs1.getString("birth");
				gender=rs1.getString("gender");
				comment=rs1.getString("comment");
				date=rs1.getString("date");
				id=rs1.getInt("id");
				Connection con2=null;
				ResultSet rs2=null;
				Statement stmt2=null;
				
					try{
			 
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/five","root", "root");
						stmt2 = con2.createStatement();
						String sql2= "SELECT * FROM view where email='"+email+"'"; 
						rs2 = stmt2.executeQuery(sql2);

						while(rs2.next()){
						count1 = count1+1;
						}
						}
catch(Exception ex){
		out.println(ex.getMessage());
	}
}
	}
	catch(Exception e2){
		out.println(e2.getMessage());
	}
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>Tag page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<link rel="stylesheet" href="styles/prettyPhoto.css" type="text/css" />
<script type="text/javascript" src="scripts/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="scripts/jquery.prettyPhoto.js"></script>
<script type="text/javascript">
$(document).ready(function () { $("a[rel^='prettyPhoto']").prettyPhoto({theme:'light_rounded'}); });
</script>
</head>
<body id="top">
<div class="wrapper col1">
  <div id="header" class="clear"> 
    <div id="topbar" class="clear"> 
      <ul>
        <li class="active"><a href="index.html">Home</a></li>
        <li><a href="tag.jsp">Tags</a></li>
        <li><a href="#">You</a> 
          <ul>
            <li><a href="account.jsp">Your Account</a></li>
            <li><a href="userpage.jsp">Your Profile</a></li>
          </ul>
        </li>
        <li><a href="#">Contacts</a> 
          <ul>
            <li><a href="recentupload.jsp">Recent Uploads</a></li>
            <li><a href="friends.jsp">Your Friends</a></li>
            <li><a href="invite.jsp">Invite Friends</a></li>
          </ul>
        </li>
        <li><a href="upload.jsp">Upload</a></li>
        <li class="last"><a href="gallery.jsp">Gallery</a></li>
      </ul>
      <form action="#" method="post" id="search">
        <fieldset>
        <%=session.getAttribute("name")%> 
        </fieldset>
      </form>
    </div>
    <div id="logo"> 
      <h1><a href="index.html">Trust modeling in social tagging of multimedia 
        content</a></h1>
      <p>In Tags We Trust</p>
    </div>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col2">
  <div id="breadcrumb"> 
    <ul>
      <li class="first">You Are Here</li>
      <li>&#187;</li>
      <li><a href="index.html">Home</a></li>
      <li>&#187;</li>
      <li  class="current"><a href="Tag.jsp">Tag</a></li>
      <li>&#187;</li>
      <li><a href="userpage.jsp">Profile</a></li>
      <li>&#187;</li>
      <li><a href="recentupload.jsp">Contacts</a></li>
      <li>&#187;</li>
      <li><a href="upload.jsp">Upload</a></li>
      <li>&#187;</li>
      <li><a href="gallery.jsp">Gallery</a></li>
    </ul>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="container" class="clear"> 
    <!-- ####################################################################################################### -->
    <div id="gallery" class="clear"> 
      <%
			
		int imageid=0;
	int newid=0;
	
	String fname=null,visible=null,newname=null,n=null;
 	Connection con4=null;
	Statement st4=null;
	ResultSet rs4=null;
	String status="Confirm";
	String view="private";
	String tag=request.getParameter("tag");
	String sql4="select * from view where (tag='"+tag+"' and visible!='"+view+"') or (tag='"+tag+"' and name='"+name+"')  ";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");	
		con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");;
		st4=con4.createStatement();
		rs4=st4.executeQuery(sql4);
		
		%>
      <%while(rs4.next()){
				imageid=rs4.getInt("id");
				fname=rs4.getString("name");
				visible=rs4.getString("visible");
				if(visible.equals("public")){
					newid=imageid;
					newname=fname;	
				}
				else if(fname.equals(name)){
					newid=imageid;
					newname=fname;
				}
				else{
					Connection con3=null;
				Statement st3=null;
				ResultSet rs3=null;
				String relationship="Friends";
				String setting="public";
				String sql3="select * from request where id='"+id+"' and fname='"+fname+"' and relationship='"+relationship+"' ";
				try
				{
					Class.forName("com.mysql.jdbc.Driver");	
					con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");;
					st3=con3.createStatement();
					rs3=st3.executeQuery(sql3);
					if(rs3.next()){
						newid=imageid;
						newname=fname;
					}
				}
				catch(Exception e3)
					{
						System.out.println(e3);
					}
				}
		%>
      <ul>
        <li><a href="view1.jsp?id=<%=newid%>" rel="prettyPhoto[gallery1]" title="Image 1"><img src="view1.jsp?id=<%=newid%>" alt="" /></a> 
          <strong>From&nbsp;&nbsp;&nbsp;<a href="tag2.jsp?nid=<%=newid%>"><%=newname%></a></strong></li>
      </ul>
      <%}%>
      <%
		}
catch(Exception ex4)
	{
		System.out.println(ex4);
	}
	  finally
	{
		con4.close();
		st4.close();
	}
 
  %>
    </div>
    <!-- ####################################################################################################### -->
    <!-- ####################################################################################################### -->
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper">
  <br/>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper">
  <div id="copyright" class="clear"> 
    
    <p align="center">Trust modeling in social tagging of multimedia content</p>
  </div>
</div>
</body>
</html>
