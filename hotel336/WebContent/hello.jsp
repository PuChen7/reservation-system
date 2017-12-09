<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hello</title>
</head>
<body>
	<h1>Hello</h1>
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
			
			String entity = request.getAttribute("cid").toString();
				
			String str = "select * from Hotel h join Contain c on h.HotelID = c.HotelID join Reservation r on c.InvoiceNo = r.InvoiceNo";
			
			ResultSet result = stmt.executeQuery(str);
				
			//Make an HTML table to show the results in:
			out.print("<table>");
				
			//make a row
			out.print("<tr>");
				
			//make a column
			out.print("<td>");
				
			//print out column header
			out.print("Hotel ID");
			out.print("</td>");
				
			//make a column
			out.print("<td>");
			out.print("Hotel Location");
			out.print("</td>");
			out.print("</tr>");
				
			//parse out the results
			while (result.next()) 
			{
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current Hotel ID:
				out.print(result.getInt("HotelID"));
				out.print("</td>");
				out.print("<td>");
				//Print out current Hotel Location:
				out.print(result.getString("Location"));
				out.print("</td>");
				//Make the Choose button
				out.print("<td>");
				out.print("<form method=get action=choose.jsp enctype=text/plain>");
				out.print("<input type=text name=r_choose value="+ entity + "  >");
				out.print("<input type=button value=Choose>");
				out.print("</form>");
				out.print("</td>");
				out.print("</tr>");
			}
			out.print("</table>");
		} 
		catch (Exception e) 
		{
			out.print("No reservations available.");
		}
	%>
	<br>
	<br>
	<form method="get" action="search.jsp" enctype=text/plain>
	Start a new reservation <input type = "button" name = "start" value = "Start"/>
	</form>
	<br>
	<pre>					<input type="button" value="Logout" onClick = "javascript:location.href='welcome.jsp'"> </pre>
</body>
</html>