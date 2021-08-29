<%@ page import="java.sql.*"  import="databaseconnection.*" errorPage="" %>
<%
				String email=(String)session.getAttribute("email");
				String id=null;
				ResultSet rs=null;
				try
				{

					Class.forName("com.mysql.jdbc.Driver");

					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");
					Statement st = con.createStatement();	
	

					String qry="select * from gallery where email='"+email+"'";
					rs =st.executeQuery(qry);
		
		
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
      <li><a href="Tag.jsp">Tag</a></li>
      <li>&#187;</li>
      <li><a href="userpage.jsp">Profile</a></li>
      <li>&#187;</li>
      <li><a href="recentupload.jsp">Contacts</a></li>
      <li>&#187;</li>
      <li><a href="upload.jsp">Upload</a></li>
      <li>&#187;</li>
      <li  class="current"><a href="gallery.jsp">Gallery</a></li>
    </ul>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="container" class="clear"> 
    <!-- ####################################################################################################### -->
    <div id="gallery" class="clear"> 
      <%
			while(rs.next())
			{
				id=rs.getString("imageid");
			%>
      <ul>
        <li><a href="view2.jsp?id=<%=id%>" rel="prettyPhoto[gallery1]" title="Image 1"><img src="view2.jsp?id=<%=id%>" alt="" /></a> 
          <strong>From&nbsp;<%=rs.getString("from1")%>&nbsp;on&nbsp;<%=rs.getString("date")%></strong></li>
        <%if(rs.next()){%>
        <li><a href="view2.jsp?id=<%=rs.getString("imageid")%>" rel="prettyPhoto[gallery1]" title="Image 2"><img src="view2.jsp?id=<%=rs.getString("imageid")%>" alt="" /></a> 
          <strong>From&nbsp;<%=rs.getString("from1")%>&nbsp;on&nbsp;<%=rs.getString("date")%></strong></li>
        <%}%>
        <%if(rs.next()){%>
        <li class="last"><a href="view2.jsp?id=<%=rs.getString("imageid")%>" rel="prettyPhoto[gallery1]" title="Image 3"><img src="view2.jsp?id=<%=rs.getString("imageid")%>" alt="" /></a> 
          <strong>From&nbsp;<%=rs.getString("from1")%>&nbsp;on&nbsp;<%=rs.getString("date")%></strong></li>
        <%}%>
      </ul>
      <%}%>
      <%

	}
	catch(Exception e2){
		out.println(e2.getMessage());
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
