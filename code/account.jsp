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
      <div id="comments"> 
        <h2>Your Account</h2>
        <ul class="commentlist">
          <li class="comment_even"> 
            <div class="author"><img class="avatar" src="viewimage.jsp?email=<%=(String)session.getAttribute("email")%>" width="32" height="32" alt="" /> 
              <span class="name"><a href="#">Your account:</a></span>&nbsp;&nbsp;&nbsp;&nbsp;You 
              are signed via your ID &nbsp;&nbsp;<%=(String)session.getAttribute("email")%> 
              <br/>
              <br/>
              <span class="name"><a href="#">Your buddy icon:</a></span>&nbsp;&nbsp;&nbsp;&nbsp;<img src="viewimage.jsp?email=<%=(String)session.getAttribute("email")%>" alt="" width="125" height="125" /> 
              <br/>
              <br/>
              <span class="name"><a href="#">Your screen name:</a></span>&nbsp;&nbsp;&nbsp;&nbsp;<%=name%> 
              <br/>
              <br/>
              <span class="name"><a href="#">Your profile:</a></span>&nbsp;&nbsp;&nbsp;&nbsp;<a href="userpage.jsp">View 
              your profile page</a> <br/>
              <br/>
              <span class="name"><a href="#">Your account:</a></span>&nbsp;&nbsp;&nbsp;&nbsp;<a href="deleteaccount.jsp?id=<%=id%>">Delete 
              your account</a> </div>
          </li>
        </ul>
      </div>
    </div>
    <div id="column"> 
      <div class="holder"> </div>
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

</body>
</html>