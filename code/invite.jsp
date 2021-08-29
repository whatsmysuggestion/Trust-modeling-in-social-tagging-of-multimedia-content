<%@ page import="java.sql.*"  import="databaseconnection.*" errorPage="" %>
<%
 String uname = null,uid=null,fid=null,fname=null,email=null,rid=null;
try{

  
   Connection con;
   con =  databasecon.getconnection();  
   Statement st = con.createStatement();
 
   //fname=(String)session.getAttribute("fname");
   //sname=(String)session.getAttribute("sname");
   email=(String)session.getAttribute("email");
  
   String s = "select id,name from profile where email='"+email+"'";
   
   ResultSet rs = st.executeQuery(s);
  
   if(rs.next())
   {
   uid=rs.getString("id");
   uname=rs.getString("name");
   }
   else
   out.print("Please check your login credentials");
  
}
catch(Exception e)
{
System.out.println(e);
}
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>Commercial Photography | Gallery</title>
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
        <%=(String)session.getAttribute("name")%> 
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
      <li><a href="userpage.jsp">Profile</a></li>
      <li>&#187;</li>
      <li  class="current"><a href="recentupload.jsp">Contacts</a></li>
      <li>&#187;</li>
      <li><a href="upload.jsp">Upload</a></li>
      <li>&#187;</li>
      <li><a href="gallery.jsp">Gallery</a></li>
    </ul>
    <div style="position:absolute; left:820px; top:20px;"> 
      <form name="f" action="#" method="post">
        <input type="text" name="search" placeholder="Search here" onkeypress="checkEnter(event)">
      </form>
    </div>
    <!--<form action="#" method="post" id="search">
        <fieldset>
        <legend>Site Search</legend>
        <input type="text" name="search" value="Search Our Website&hellip;" onfocus="this.value=(this.value=='Search Our Website&hellip;')? '' : this.value ;" />
        <input type="image" id="go" src="images/submit.gif" alt="Submit" />
        </fieldset>
      </form>-->
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="container" class="clear"> 
    <!-- ####################################################################################################### -->
    <div id="gallery" class="clear"> 
      <%
			
		Connection con2=null;
		PreparedStatement ps2=null;
		ResultSet rs2=null;
		String pid=null;
		//String email=(String)session.getAttribute("email");
		String search=request.getParameter("search");
		String search1=null;
		//if(search.equals)
		Class.forName("com.mysql.jdbc.Driver");
		con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");
		Statement st2 = con2.createStatement();
		try{
			
			rs2=st2.executeQuery("select * from profile where (email='"+search+"') or name like '%"+search+"%'");
			while(rs2.next()){
			fid=rs2.getString("id");
			fname=rs2.getString("name");
			rid=uid+","+uname+","+fid+","+fname;
		%>
      <ul>
        <li><a href="viewimage1.jsp?id=<%=rs2.getString("id")%>" rel="prettyPhoto[gallery1]" title="Image 1"><img src="viewimage1.jsp?id=<%=fid%>" alt="" /></a> 
          <strong><%=rs2.getString("name")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="request.jsp?id=<%=rid%>">Send 
          Request</a></strong></li>
        <%if(rs2.next()){
		rid=uid+","+uname+","+rs2.getString("id")+","+rs2.getString("name");
		%>
        <li><a href="viewimage1.jsp?id=<%=rs2.getString("id")%>" rel="prettyPhoto[gallery1]" title="Image 2"><img src="viewimage1.jsp?id=<%=rs2.getString("id")%>" alt="" /></a> 
          <strong><%=rs2.getString("name")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="request.jsp?id=<%=rid%>">Send 
          Request</a></strong></li>
        <%}%>
        <%if(rs2.next()){
		rid=uid+","+uname+","+rs2.getString("id")+","+rs2.getString("name");
		%>
        <li><a href="viewimage1.jsp?id=<%=rs2.getString("id")%>" rel="prettyPhoto[gallery1]" title="Image 2"><img src="viewimage1.jsp?id=<%=rs2.getString("id")%>" alt="" /></a> 
          <strong><%=rs2.getString("name")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="request.jsp?id=<%=rid%>">Send 
          Request</a></strong></li>
        <%}%>
      </ul>
      <%}%>
      <%
	}
catch(Exception e)
	{
		System.out.println(e);
	}
	  finally
	{
		con2.close();
		//ps2.close();
		st2.close();
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
