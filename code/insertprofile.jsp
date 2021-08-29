<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>



<html>
<head>
</head>
<body>

<%

		
		Statement st = null;
		ResultSet rs1=null;
		int id=0;
		
	try{
		
			Class.forName("com.mysql.jdbc.Driver");	
			Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root");
			st=con1.createStatement();
			String sql1="select max(id) from profile";
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				if(rs1.getInt(1)==0)
					id=1;
				else
					id=rs1.getInt(1)+1;
				ArrayList list = new ArrayList();
		ServletContext context = getServletContext();

		String dirName =context.getRealPath("\\Gallery");
		String paramname=null;
		String file=null;
		String name=null,birth=null,gender=null,email=null,password=null,status="Allow",image=null,comment=null;
		int report=0;
		int upload=0;
		java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;
 
		File file1 = null;
			
		
		try {
			
			MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB

			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				
				if(paramname.equalsIgnoreCase("name"))
				{
					name=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("birth"))
				{
					birth=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("gender"))
				{
					gender=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("email"))
				{
					email=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("password"))
				{
					password=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("comment"))
				{
					comment=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("image"))
				{
					image=multi.getParameter(paramname);
				}
				}
					
			int f = 0;
	Enumeration files = multi.getFileNames();	
	while (files.hasMoreElements()) 
	{
		paramname = (String) files.nextElement();
		if(paramname.equals("d1"))
		{
			paramname = null;
		}
		
		if(paramname != null)
		{
			f = 1;
			image = multi.getFilesystemName(paramname);
			String fPath = context.getRealPath("\\Gallery\\"+image);
			file1 = new File(fPath);
			FileInputStream fs = new FileInputStream(file1);
			list.add(fs);
		}		
	}
	        FileInputStream fs1 = null;
            //name=dirName+"\\Gallery\\"+image;
			
			
			
	 
			
			
			Class.forName("com.mysql.jdbc.Driver");	
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trust","root", "root"); 

			PreparedStatement ps=con.prepareStatement("INSERT INTO profile VALUES(?,?,?,?,?,?,?,?,?,?,?,?)");
				ps.setString(1,image);
               	ps.setInt(2,id);
				ps.setString(3,name);	
       			ps.setString(4,birth);
       			ps.setString(5,gender);
			    ps.setString(6,email);
			    ps.setString(7,password);
				ps.setString(8,comment);
				ps.setString(9,status);
				ps.setString(10,strDateNew);
				ps.setInt(11,report);
				ps.setInt(12,upload);
											
				
       if(f == 0)
			ps.setObject(1,null);
		else if(f == 1)
		{
			fs1 = (FileInputStream)list.get(0);
			ps.setBinaryStream(1,fs1,fs1.available());
		}	
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("index.html?message=success");
			}
			else
			{
				response.sendRedirect("index.html?message=fail");
			}
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
			}	
	}
	catch (Exception eq) 
		{
			out.println(eq.getMessage());
		}
		
	
 %>

	
 %>
</body>
</html>