<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>


<%

java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;

ResultSet rs=null;
PreparedStatement psmt1=null;

String str = request.getParameter("id");
 String[] temp;
 String delimiter = " ";
	String temp1=null, temp2=null;
 temp = str.split(delimiter,2);
for(int i =0; i < temp.length ; i++){
}
String id = temp[0];
String from1 = temp[1];
String email = (String)session.getAttribute("email");

try{

	Class.forName("com.mysql.jdbc.Driver");	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");

	psmt1=con.prepareStatement("insert into gallery(imageid,from1,email,date) values(?,?,?,?)");
	psmt1.setString(1,id);
	psmt1.setString(2,from1);
	psmt1.setString(3,email);
	psmt1.setString(4,strDateNew);


int s = psmt1.executeUpdate();
response.sendRedirect("tag3.jsp?message=tagged successfully");

con.close();
psmt1.close();

}catch(Exception ex){

out.println("Error in connection : "+ex);

}

%>
