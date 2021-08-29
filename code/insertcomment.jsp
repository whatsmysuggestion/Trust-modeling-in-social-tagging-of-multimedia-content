<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Personalized Image Search</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script type="text/javascript">

</script>
</head>

<body>

<%



ResultSet rs=null;
PreparedStatement psmt1=null;

FileInputStream fis;

String a = (String)session.getAttribute("pid");
String b = (String)session.getAttribute("name");
String c = (String)session.getAttribute("email");
String d = request.getParameter("comment");

java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;

try{

Class.forName("com.mysql.jdbc.Driver");	
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");

psmt1=con.prepareStatement("insert into comment(id,name,email,comment,date) values(?,?,?,?,?)");
psmt1.setString(1,a);
psmt1.setString(2,b);
psmt1.setString(3,c);
psmt1.setString(4,d);
psmt1.setString(5,strDateNew);

int s = psmt1.executeUpdate();
response.sendRedirect("tag3.jsp?message=success");

con.close();
psmt1.close();

}catch(Exception ex){

out.println("Error in connection : "+ex);

}

%>

</body>
</html>