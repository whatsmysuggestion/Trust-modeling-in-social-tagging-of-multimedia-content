

<%@ page import="java.sql.*,java.lang.*,databaseconnection.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<form enctype="multipart/form-data" action="uploadinsert1.jsp" method="post" name="form" onsubmit="return validation();">
				 <%
				int n=1,s=0;
 				Connection con2=null;
				Statement st2=null;
				ResultSet rs2=null;
				String sql2="select max(id) from view";
				try
					{
		
					Class.forName("com.mysql.jdbc.Driver");	
					con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/five","root", "root");
					st2=con.createStatement();
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
            <table height="200" width="300">
				<tr>
					<td>ID:</td>
					<td>&nbsp;<input type="text" name="id" value="<%=n%>"></td>
				</tr>
				<tr>
					<td>Tag:</td>
					<td>&nbsp;<input type="text" name="tag"></td>
				</tr>
				<tr>
					<td>Title:</td>
					<td>&nbsp;<input type="text" name="title"></td>
				</tr>
				<tr>
					<td>Visible:</td>
					<td>&nbsp;<input type="radio" name="visible" value="private">Private<input type="radio" name="visible" value="public">Public</td>
				</tr>
				<tr>
					<td>Description:</td>
					<td>&nbsp;<textarea name="description"></textarea></td>
				</tr>

				<tr>
					<table align="center" background="images/templatemo_header.jpg">
              <td>Select Image:&nbsp;&nbsp;  
                <input type="file" id="files" name="image" multiple />
				<output id="list"></output></td>

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
</table>
				</tr>
				
				<tr>
					<td><input type="reset" value="Clear" name="reset" class="submit_bg"></td>
					<td><input type="submit" value="Upload" name="update" class="submit_bg"></td>
				</tr>
				
			</table>

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
</form>
