<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Choose</title>
</head>
<body>
	<h1>Choose a category to review</h1>
	<%
		try
		{
			//Create a connection string
			String url = "jdbc:mysql://cs336database.c89rkcpk4ocp.us-east-2.rds.amazonaws.com:3306/BarBeerDrinkerSample";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");
			
			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "root", "hotelcs336");
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
					
			String entity = request.getParameter("r_choose");
						
			String str = "select * from Customer where CID =" + entity;
					
			ResultSet result = stmt.executeQuery(str);
						
			//Make an HTML table to show the results in:
			out.print("<table>");
						
			//make a row
			out.print("<tr>");
						
			//make a column
			out.print("<td>");
						
			//print out column header
			out.print("Category");
			out.print("</td>");
			out.print("</tr>");
			
			if(result.getBoolean("isRoomReviewed") == true && result.getBoolean("isBreakfastReviewed") == true && result.getBoolean("isServiceReviewed") == true)
			{
				out.print("All categories are reviewed.");
			}
						
			if (result.getBoolean("isRoomReviewed") != true)
			{
				out.print("<tr>");
				out.print("<td>");
				out.print("Room Review ");
				out.print("<form method=get action=Review.jsp enctype=text/plain>");
				out.print("<input type=text name=room_chosen value="+ entity + "  >");
				out.print("<input type=button value=Choose>");
				out.print("</form>");
				out.print("</form>");
				out.print("</td>");
				out.print("</tr>");
			}
					
			if (result.getBoolean("isBreakfastReviewed") != true)
			{
				out.print("<tr>");
				out.print("<td>");
				out.print("Breakfast Review ");
				out.print("<form method=get action=Review.jsp enctype=text/plain>");
				out.print("<input type=text name=breakfast_chosen value="+ entity + "  >");
				out.print("<input type=button value=Choose>");
				out.print("</form>");
				out.print("</form>");
				out.print("</td>");
				out.print("</tr>");
			}
					
			if (result.getBoolean("isServiceReviewed") != true)
			{
				out.print("<tr>");
				out.print("<td>");
				out.print("Service Review ");
				out.print("<form method=get action=Review.jsp enctype=text/plain>");
				out.print("<input type=text name=service_chosen value="+ entity + "  >");
				out.print("<input type=button value=Choose>");
				out.print("</form>");
				out.print("</form>");
				out.print("</td>");
				out.print("</tr>");
			}
					
			out.print("</table>");
		}
		catch (Exception e) 
		{
			out.print("Function is not available.");
		}
	%>
	<br>

<br>	
<pre>					<input type="button" value="Back" onClick = "javascript:location.href='hello.jsp'">	<input type="button" value="Logout" onClick = "javascript:location.href='welcome.jsp'"> </pre>
</body>
</html>