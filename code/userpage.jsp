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
						con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");
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
<title>User page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
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
        <%=name%> 
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
      <li><a href="Tag.jsp">Tag</a></li>
      <li>&#187;</li>
      <li  class="current"><a href="userpage.jsp">Profile</a></li>
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
    <div id="content"> 
      <h1> <%=name%></h1>
      <img src="viewimage.jsp?email=<%=(String)session.getAttribute("email")%>" alt="" width="125" height="125" /> 
      <div id="comments"> 
        <h2>Archives</h2>
        <ul class="commentlist">
          <li class="comment_even"> 
            <div class="author"><img class="avatar" src="viewimage.jsp?email=<%=(String)session.getAttribute("email")%>" width="32" height="32" alt="" /> 
              <span class="name"><a href="#">My Uploads:</a></span>&nbsp;&nbsp;&nbsp;&nbsp;<%=count1%>&nbsp;&nbsp;pictures 
              you are uploaded<br/>
              <br/>
              <%
	int fid=0;
	String relationship="Friends";
 	Connection con4=null;
	Statement st4=null;
	ResultSet rs4=null;
	String status="Confirm";
	String sql4="select * from request where id='"+id+"' and relationship='"+relationship+"' and status='"+status+"'";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");	
		con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");;
		st4=con4.createStatement();
		rs4=st4.executeQuery(sql4);
		while(rs4.next()){
				fid=rs4.getInt("fid");
				
				System.out.println("friend id"+fid);
				Connection con5=null;
				Statement st5=null;
				ResultSet rs5=null;
				String statusb="Allow";
				String setting="public";
				String sql5="select * from profile where id='"+fid+"'";
				try
				{
					Class.forName("com.mysql.jdbc.Driver");	
					con5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");;
					st5=con5.createStatement();
					rs5=st5.executeQuery(sql5);
					while(rs5.next()){
					friends = friends+1;
					}
				}
				catch(Exception e5)
					{
						System.out.println(e5);
					}
				}
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
              <span class="name"><a href="#">My Friends:</a></span>&nbsp;&nbsp;&nbsp;&nbsp;<%=friends%>&nbsp;&nbsp;peoples 
              are friends with you<br/>
              <br/>
              <%
				int imageid=0;
				
				
				Connection con3=null;
				ResultSet rs3=null;
				Statement stmt3=null;
				
					try{
			 
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						con3=DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");
						stmt3 = con3.createStatement();
						String sql3= "SELECT * FROM gallery where email='"+email+"'"; 
						rs3 = stmt3.executeQuery(sql3);

						while(rs3.next()){
						//from=rs1.getString("from");
						date1=rs3.getString("date");
						
						imageid=rs3.getInt("imageid");
						gallery = gallery+1;
						}
						}
					catch(Exception ex3){
						out.println(ex3.getMessage());
					}
			%>
              <span class="name"><a href="#">My Gallery:</a></span>&nbsp;&nbsp;&nbsp;&nbsp;<%=gallery%>&nbsp;&nbsp;pictures 
              in your gallery </div>
          </li>
        </ul>
      </div>
    </div>
    <div id="column"> 
      <div class="subnav"> 
        <h2>Profile</h2>
        <p> 
          <label for="name"><small>Email: </small></label>
          <label for="name"><small>&nbsp;&nbsp;<%=email%></small></label>
        </p>
        <p> 
          <label for="name"><small>Gender: </small></label>
          <label for="name"><small>&nbsp;&nbsp;<%=gender%></small></label>
        </p>
        <p> 
          <label for="name"><small>Date of Birth: </small></label>
          <label for="name"><small>&nbsp;&nbsp;<%=birth%></small></label>
        </p>
        <p> 
          <label for="name"><small>About me: </small></label>
          <label for="name"><small>&nbsp;&nbsp;<%=comment%></small></label>
        </p>
        <p> 
          <label for="name"><small>Joined in: </small></label>
          <label for="name"><small>&nbsp;&nbsp;<%=date%></small></label>
        </p>
      </div>
      <div class="holder"> 
        <h2>Friend Request</h2>
        <%
	//int fid1=0;
	String rid3=null,rid1=null,rid2=null,fname1=null,fid1=null;
	System.out.print("my id"+id);
 	Connection con6=null;
	Statement st6=null;
	ResultSet rs6=null;
	String status1="waiting for approve";
	String sql6="select distinct id,name from request where fid='"+id+"' and status = '"+status1+"'";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");	
		con6 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");
		st6=con6.createStatement();
		rs6=st6.executeQuery(sql6);
		while(rs6.next()){
			fid1=rs6.getString("id");
			fname1=rs6.getString("name");
			rid3=id+","+name+","+fid1+","+fname1;
			rid1=id+","+name+","+fid1+","+fname1+",Confirm";
			rid2=id+","+name+","+fid1+","+fname1+",Ignore";
		%>
        <h1><%=rs6.getString("name")%></h1>
        <h2 class="title"><img src="viewimage1.jsp?id=<%=rs6.getString("id")%>" alt="" width="50" height="50" /> 
          <a href="viewrequest1.jsp?id=<%=rid1%>">Confirm</a>&nbsp;&nbsp;&nbsp;<a href="viewrequest1.jsp?id=<%=rid2%>">Ignore</a></h2>
        <%}%>
      </div>
    </div>
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
<%
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
</body>
</html>
