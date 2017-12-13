<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat"%>
<html> 
	<body>
		<%
				List<String> list = new ArrayList<String>();
				list = (List<String>)session.getAttribute("Data");
				out.print(request.getParameter("Type"));
				list.add(request.getParameter("Number"));
				list.add(request.getParameter("Type"));
				list.add(request.getParameter("Typeofservices"));
				
				%>
					fill information of your card:
					<form action="reserved.jsp">
						<table>
							<tr>    
								<td>Card Number</td><td><input type="text" name="cnumber"></td>
							</tr>
							<tr>
								<td>expiration date(please enter MM/yy)</td><td><input type="text" name="expdate"></td>
							</tr>
							<tr>
								<td>card type(please enter credit or debit)</td><td><input type="text" name="ctype"></td>
							</tr>
							<tr>
								<td>security code</td><td><input type="text" name="seccode"></td>
							</tr>
							<tr>
								<td>name</td><td><input type="text" name="name"></td>
							</tr>
							<tr>
								<td>Billing Address</td><td><input type="text" name="addr"></td>
							</tr>
						</table>
						<br>
						<input type="submit" value="submit">
					</form>
				<%

				%>
	</body>
</html>