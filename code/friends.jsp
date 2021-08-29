<%@ page  language="java" import="java.sql.*,databaseconnection.*" errorPage="" %>

<%
   String name = null,userid=null,id=null;
try{


   Connection con;
   con =  databasecon.getconnection();  
   Statement st = con.createStatement();

   String email=(String)session.getAttribute("email");
  
   String s = "select id,name from profile where email='"+email+"'";
   
   ResultSet rs = st.executeQuery(s);
  
   if(rs.next())
   {
   id=rs.getString(1);
   name=rs.getString(2);
  
   
 
  session.setAttribute("id",id);
   
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
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="container" class="clear"> 
    <!-- ####################################################################################################### -->
    <div id="portfolio" class="clear"> 
      <%
int fid=0;
	String relationship="Friends";
 	Connection con2=null;
	Statement st2=null;
	ResultSet rs2=null;
	String status="Confirm";
	String sql="select * from request where id='"+id+"' and relationship='"+relationship+"'";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");	
		con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");;
		st2=con2.createStatement();
		rs2=st2.executeQuery(sql);
		
		%>
      <table align="center" height="150">
        <%while(rs2.next()){
				fid=rs2.getInt("fid");
				
				System.out.println("friend id"+fid);
				Connection con3=null;
				Statement st3=null;
				ResultSet rs3=null;
				String statusb="Allow";
				String setting="public";
				String sql3="select * from profile where id='"+fid+"'";
				try
				{
					Class.forName("com.mysql.jdbc.Driver");	
					con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");;
					st3=con3.createStatement();
					rs3=st3.executeQuery(sql3);
					while(rs3.next()){
%>
        <ul>
          <li><img src="viewimage1.jsp?id=<%=rs3.getInt("id")%>" alt="" height="190" /> 
            <h2><%=rs3.getString("name")%></h2>
            <p><%=rs3.getString("upload")%>&nbsp;&nbsp;&nbsp;&nbsp;Uploads<br/>
            </p>
            <p class="readmore"><a href="friends1.jsp?id=<%=rs3.getInt("id")%>">View 
              More &raquo;</a></p>
          </li>
          <%if(rs3.next()){%>
          <li class="last"><img src="viewimage1.jsp?id=<%=rs3.getInt("id")%>" alt="" height="190" /> 
            <h2>Metridiculis conseque quis</h2>
            <h2><%=rs3.getString("name")%></h2>
            <p><%=rs3.getString("upload")%>&nbsp;&nbsp;&nbsp;&nbsp;Uploads<br/>
            </p>
            <p class="readmore"><a href="friends1.jsp?id=<%=rs3.getInt("id")%>">View 
              More &raquo;</a></p>
          </li>
          <%}%>
        </ul>
        <%}
				}
				catch(Exception e3)
					{
						System.out.println(e3);
					}
				}%>
      </table>
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
    </div>
    <!-- ####################################################################################################### -->
    <!-- ####################################################################################################### -->
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper">
  
</div>
<!-- ####################################################################################################### -->
<div class="wrapper">
  <div id="copyright" class="clear"> 
    
    <p align="center">Trust modeling in social tagging of multimedia content</p>
  </div>
</div>
</body>
</html>
