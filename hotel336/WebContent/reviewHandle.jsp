<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Review</title>
</head>
<body>
	<%
		try{
			//Create a connection string
			String url = "jdbc:mysql://cs336database.c89rkcpk4ocp.us-east-2.rds.amazonaws.com:3306/hoteldatabase";
			
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");
			
			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "root", "hotelcs336");
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//get the rate
			String r = request.getParameter("rate");
			//get the comment
			String comment = request.getParameter("comment");
			//get cid
			String id = request.getParameter("cid");
			//get invoice number
			String inno = request.getParameter("InvoiceNo");
			//get category
			String category = request.getParameter("category");
			//generate reviewid
			String step1 = id+inno;
			String step2 = step1+Integer.toString((category.charAt(0)+0));
			int reviewid = 0;
		}catch(Exception e){
			
		}
	%>
</body>
</html>