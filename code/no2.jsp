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
<title>Your Friends</title>
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
      <li><a href="#">Home</a></li>
      <li>&#187;</li>
      <li><a href="#">Grand Parent</a></li>
      <li>&#187;</li>
      <li><a href="#">Parent</a></li>
      <li>&#187;</li>
      <li class="current"><a href="#">Child</a></li>
    </ul>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="container" class="clear"> 
    <!-- ####################################################################################################### -->
    <div id="portfolio" class="clear"> 
      <%
			
		Connection con3=null;
		PreparedStatement ps3=null;
		ResultSet rs3=null;
		String newname=null,newemail=null;
		String pid=request.getParameter("nid");
		Class.forName("com.mysql.jdbc.Driver");
		con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");
		Statement st3 = con3.createStatement();
		try{
			
			rs3=st3.executeQuery("select * from view where id='"+id+"' ");
			if(rs3.next()){
			newname=rs3.getString("name");
			newemail=rs3.getString("email");
			}
		%>
      <ul>
        <li><img src="view1.jsp?id=<%=id%>" alt="" height="190" /> 
          <h2><%=rs3.getString("name")%></h2>
          <p class="readmore"><a href="#">View More &raquo;</a></p>
        </li>
        <li class="last"><img src="viewimage.jsp?email=<%=newemail%>" alt="" height="190" /> 
          <h2>Metridiculis conseque quis</h2>
          <h2><%=newname%></h2>
          <br/></p>
          <p class="readmore"><a href="#">View More &raquo;</a></p>
        </li>
      </ul>
      <%
	}
catch(Exception e3)
	{
		System.out.println(e3);
	}
	  finally
	{
		con3.close();
		//ps2.close();
		st3.close();
	}
	
%>
    </div>
    <!-- ####################################################################################################### -->
    <div class="pagination"> 
      <ul>
        <li class="prev"><a href="#">&laquo; Previous</a></li>
        <li><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li class="splitter">&hellip;</li>
        <li><a href="#">6</a></li>
        <li class="current">7</li>
        <li><a href="#">8</a></li>
        <li><a href="#">9</a></li>
        <li class="splitter">&hellip;</li>
        <li><a href="#">14</a></li>
        <li><a href="#">15</a></li>
        <li class="next"><a href="#">Next &raquo;</a></li>
      </ul>
    </div>
    <!-- ####################################################################################################### -->
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper">
  <div id="footer"> 
    <div class="faux clear"> 
      <div class="footbox"> 
        <h2>Lacus interdum</h2>
        <ul>
          <li><a href="#">Lorem ipsum dolor</a></li>
          <li><a href="#">Suspendisse in neque</a></li>
          <li><a href="#">Praesent et eros</a></li>
          <li><a href="#">Lorem ipsum dolor</a></li>
          <li><a href="#">Suspendisse in neque</a></li>
          <li class="last"><a href="#">Praesent et eros</a></li>
        </ul>
      </div>
      <div class="footbox"> 
        <h2>Lacus interdum</h2>
        <p>Conguequam tempor moles uada leo at orci loborta disse intesque leo 
          elis. Etenim congue sapien natis ultris vel euis fauctor at sapibus 
          tempus. Tricesut aenean curabitae aliquam urna.</p>
      </div>
      <div class="footbox"> 
        <h2>Lacus interdum</h2>
        <ul>
          <li><a href="#">Lorem ipsum dolor</a></li>
          <li><a href="#">Suspendisse in neque</a></li>
          <li><a href="#">Praesent et eros</a></li>
          <li><a href="#">Lorem ipsum dolor</a></li>
          <li><a href="#">Suspendisse in neque</a></li>
          <li class="last"><a href="#">Praesent et eros</a></li>
        </ul>
      </div>
      <div class="footbox last"> 
        <h2>Lacus interdum</h2>
        <ul>
          <li><a href="#">Lorem ipsum dolor</a></li>
          <li><a href="#">Suspendisse in neque</a></li>
          <li><a href="#">Praesent et eros</a></li>
          <li><a href="#">Lorem ipsum dolor</a></li>
          <li><a href="#">Suspendisse in neque</a></li>
          <li class="last"><a href="#">Praesent et eros</a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper">
  <div id="copyright" class="clear"> 
    <p class="fl_left">Copyright &copy; 2011 - All Rights Reserved - <a href="#">Domain 
      Name</a></p>
    <p class="fl_right">Template by <a href="http://www.os-templates.com/" title="Free Website Templates">OS 
      Templates</a></p>
  </div>
</div>
</body>
</html>
