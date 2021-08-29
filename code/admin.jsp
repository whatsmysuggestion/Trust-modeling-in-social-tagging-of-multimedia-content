<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>


<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>Admin Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
</head>
<body id="top">
<div class="wrapper col1">
  <div id="header" class="clear"> 
    <div id="topbar" class="clear"> 
      <ul>
        <li><a href="index.html">Home</a></li>
        <li class="active"><a href="index.html">Back</a></li>
      </ul>
      <form action="#" method="post" id="search">
        <fieldset>
        <legend>Site Search</legend>
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
      <li class="current"><a href="admin.jsp">User Profile</a></li>
      <li>&#187;</li>
    </ul>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="container" class="clear"> 
    <!-- ####################################################################################################### -->
    <div id="content"> 
      <%
			
	
	Statement st2 = null;
	ResultSet rs2=null;
	String select=request.getParameter("select");
	String sname=null,sbirth=null,sgender=null,scomment=null,sdate=null,sdate1=null,sstatus=null,sreport=null,supload=null;
	int sid=0;
	int scount1 = 0;
	int sgallery = 0;
	int sfriends=0;
	try{
		
		Class.forName("com.mysql.jdbc.Driver");	
			Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");
		st2=con2.createStatement();
		String sql2="select * from profile where id='"+select+"'";
		
		rs2=st2.executeQuery(sql2);
		while(rs2.next()){
				sname=rs2.getString("name");
				
				sbirth=rs2.getString("birth");
				sgender=rs2.getString("gender");
				scomment=rs2.getString("comment");
				sdate=rs2.getString("date");
				sid=rs2.getInt("id");
%>
      <img class="imgr" src="viewimage1.jsp?id=<%=select%>" alt="" width="125" height="125" /> 
      <p>Id:<%=rs2.getString("id")%></p>
      <p>Name:<%=rs2.getString("name")%></p>
      <p>Email:<%=rs2.getString("email")%></p>
      <p>Birth:<%=rs2.getString("birth")%></p>
      <p>Gender:<%=rs2.getString("gender")%></p>
      <p>About me:<%=rs2.getString("comment")%></p>
      <p>Date of join:<%=rs2.getString("date")%></p>
      <p>Uploads:<%=rs2.getString("upload")%></p>
      <p>Report:<%=rs2.getString("report")%></p>
      <p>Status:<%=rs2.getString("status")%></p>
      <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <a href="warning.jsp?select=<%=rs2.getInt("id")%>">Warning</a>&nbsp;&nbsp;&nbsp;&nbsp; 
        <a href="bane.jsp?select=<%=rs2.getInt("id")%>">Bane</a></p>
      <%
}
	}
	catch(Exception e3){
		out.println(e3.getMessage());
	}
%>
      <br/>
      <br/>
      <h2>User Profile</h2>
      <table summary="Summary Here" cellpadding="0" cellspacing="0">
        <thead>
          <tr> 
            <th>ID</th>
            <th>NAME</th>
            <th>EMAIL</th>
            <th>STATUS</th>
            <th>REPORT</th>
            <th>UPLOAD</th>
            <th>WARNING</th>
            <th>BANE</th>
          </tr>
        </thead>
        <tbody>
          <%
				
	
	Statement st = null;
	ResultSet rs1=null;
	String password=(String)session.getAttribute("password");
	String email=(String)session.getAttribute("email");
	String name=null,birth=null,gender=null,comment=null,date=null,date1=null,status=null,report=null,upload=null;
	int id=0;
	int count1 = 0;
	int gallery = 0;
	int friends=0;
	try{
		
		Class.forName("com.mysql.jdbc.Driver");	
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");
		st=con.createStatement();
		String sql1="select * from profile ORDER BY report DESC";
		
		rs1=st.executeQuery(sql1);
		while(rs1.next()){
				name=rs1.getString("name");
				session.setAttribute("name",name);
				birth=rs1.getString("birth");
				gender=rs1.getString("gender");
				comment=rs1.getString("comment");
				date=rs1.getString("date");
				id=rs1.getInt("id");
			%>
          <tr class="light"> 
            <td><a href="admin1.jsp?select=<%=rs1.getInt("id")%>"><%=rs1.getInt("id")%></a></td>
            <td><a href="admin1.jsp?select=<%=rs1.getInt("id")%>"><%=rs1.getString("name")%></a></td>
            <td><a href="admin1.jsp?select=<%=rs1.getInt("id")%>"><%=rs1.getString("email")%></a></td>
            <td><a href="admin1.jsp?select=<%=rs1.getInt("id")%>"><%=rs1.getString("status")%></a></td>
            <td><a href="admin1.jsp?select=<%=rs1.getInt("id")%>"><%=rs1.getString("report")%></a></td>
            <td><a href="admin1.jsp?select=<%=rs1.getInt("id")%>"><%=rs1.getString("upload")%></a></td>
            <td><a href="warning.jsp?select=<%=rs1.getInt("id")%>">Warning</a></td>
            <td><a href="bane.jsp?select=<%=rs1.getInt("id")%>">Bane</a></td>
          </tr>
          <%if(rs1.next()){%>
          <tr class="dark"> 
            <td><a href="admin1.jsp?select=<%=rs1.getInt("id")%>"><%=rs1.getInt("id")%></a></td>
            <td><a href="admin1.jsp?select=<%=rs1.getInt("id")%>"><%=rs1.getString("name")%></a></td>
            <td><a href="admin1.jsp?select=<%=rs1.getInt("id")%>"><%=rs1.getString("email")%></a></td>
            <td><a href="admin1.jsp?select=<%=rs1.getInt("id")%>"><%=rs1.getString("status")%></a></td>
            <td><a href="admin1.jsp?select=<%=rs1.getInt("id")%>"><%=rs1.getString("report")%></a></td>
            <td><a href="admin1.jsp?select=<%=rs1.getInt("id")%>"><%=rs1.getString("upload")%></a></td>
            <td><a href="warning.jsp?select=<%=rs1.getInt("id")%>">Warning</a></td>
            <td><a href="bane.jsp?select=<%=rs1.getInt("id")%>">Bane</a></td>
          </tr>
          <%}
			}
	}
	catch(Exception e2){
		out.println(e2.getMessage());
	}
		%>
        </tbody>
      </table>
    </div>
    <div id="column"> 
      <div class="subnav"> 
        <h2>Admin Page</h2>
        <ul>
          <li><a href="admin.jsp">User Profile</a></li>
          <li><a href="content.jsp">User Content</a></li>
        </ul>
      </div>
    </div>
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
