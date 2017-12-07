<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%
		List<String> list = new ArrayList<String>();
		
	
		try {
			//Create a connection string
			String url = "jdbc:mysql://cs336database.c89rkcpk4ocp.us-east-2.rds.amazonaws.com:3306/hoteldatabase";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");
			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "root", "hotelcs336");
					
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			// get the uername from welcome.jsp
			String username_entity = request.getParameter("Customer");
			// get the password from welcome.jsp
			String password_entity = request.getParameter("password_password");
			
			// Need to check if the database contains this username
			
			username_entity = "Customer";
			String str = "SELECT * FROM " + username_entity;
			ResultSet result = stmt.executeQuery(str);
			
			
			while (result.next()){
				String name = result.getString("Name");
				out.print(name);
			}
			//out.print(str);
			
		} catch (Exception e){
			
		}
		
	%>
</body>
</html>