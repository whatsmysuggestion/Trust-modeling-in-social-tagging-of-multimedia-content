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
            <li><a href="recentupload.jsp">Recent Usploads</a></li>
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
      <li><a href="recentupload.jsp">Contacts</a></li>
      <li>&#187;</li>
      <li  class="current"><a href="upload.jsp">Upload</a></li>
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
        <h2>Upload here</h2>
        <ul class="commentlist">
          <li class="comment_even"> 
            <div class="author"><img class="avatar" src="viewimage.jsp?email=<%=(String)session.getAttribute("email")%>" width="32" height="32" alt="" /> 
              <%
				int n=1,s=0;
 				Connection con2=null;
				Statement st2=null;
				ResultSet rs2=null;
				String sql2="select max(id) from view";
				try
					{
		
					Class.forName("com.mysql.jdbc.Driver");	
					con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");
					st2=con2.createStatement();
					rs2=st2.executeQuery(sql2);
					if(rs2.next())
					{
						if(rs2.getInt(1)==0)
						n=1;
					else
						n=rs2.getInt(1)+1;
						session.setAttribute( "id", n );
					}
				%>
              <form enctype="multipart/form-data" action="uploadinsert.jsp" method="post" name="form" onsubmit="return validation();">
                <p> 
                  <label for="id"><small>Id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</small></label>
                  <input type="text" name="id" id="id" value="<%=n%>" />
                </p>
                <p> 
                  <label for="tag"><small>Tag:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</small></label>
                  <input type="text" name="tag" />
                </p>
                <p> 
                  <label for="title"><small>Title:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</small></label>
                  <input type="text" name="title" />
                </p>
                <p> 
                  <label for="name"><small>Visible:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                  </small></label>
                  <input type="radio" name="visible" value="private">
                  Private 
                  <input type="radio" name="visible" value="public">
                  Public 
                  <input type="radio" name="visible" value="Friends">
                  Friends </p>
                <p> 
                  <textarea type="text" name="description" placeholder="Description:" cols="29"></textarea>
                </p>
                <p> 
                  <label for="name"><small>Select Image:&nbsp;&nbsp; </small></label>
                  <input type="file" id="files" name="image" multiple />
                </p>
                <output id="list"></output> 
                <script>
  				function handleFileSelect(evt) {
   				var file = evt.target.files; // FileList object

    			// Loop through the FileList and render image files as thumbnails.
    			for (var i = 0, f; f = file[i]; i++) {

				  // Only process image files.
				  if (!f.type.match('image.*')) {
					continue;
				  }
			
				  var reader = new FileReader();
			
				  // Closure to capture the file information.
				  reader.onload = (function(theFile) {
					return function(e) {
					  // Render thumbnail.
					  var span = document.createElement('span');
					  span.innerHTML = ['<img class="thumb" src="', e.target.result,
										'" title="', theFile.name, '"/>'].join('');
					  document.getElementById('list').insertBefore(span, null);
					};
				  })(f);
			
				  // Read in the image file as a data URL.
				  reader.readAsDataURL(f);
				}
			  }
			
			  document.getElementById('files').addEventListener('change', handleFileSelect, false);
			</script>
                <input type="reset" value="Clear" name="reset" class="submit_bg">
                <input type="submit" value="Upload" name="update" class="submit_bg">
              </form>
              <%
}
catch(Exception e)
	{
		System.out.println(e);
	}
	  finally
	{
		con2.close();
		st2.close();
	}
 
%>
            </div>
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
