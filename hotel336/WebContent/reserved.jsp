<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat"%>
<html>
	<title>Success!</title>
	<body>
		<h1>Your reservation has been processed.</h1>
		<%
				String url = "jdbc:mysql://cs336database.c89rkcpk4ocp.us-east-2.rds.amazonaws.com/hoteldatabase";
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, "root", "hotelcs336");
				Statement stmt = con.createStatement();

				List<String> list = new ArrayList<String>();
				list = (List<String>)session.getAttribute("Date");

				int room_no = Integer.valueOf(request.getParameter("room_no"));
				int hotelid = Integer.valueOf(list.get(2));
				String inDate = list.get(0);
				String outDate = list.get(1);
				
				out.print("<li>Room Number:"+room_no+"</li>");
				out.print("<li>In Date:"+inDate+"</li>");
				out.print("<li>Out Date:"+outDate+"</li>");
					 
				SimpleDateFormat formater = new SimpleDateFormat("MM/dd/yyyy");
				Date sd = formater.parse(inDate);
				Date ed = formater.parse(outDate);
				
				long diff = Math.abs(sd.getTime() - ed.getTime());
				long diffDays = diff / (24 * 60 * 60 * 1000);
				
				out.print("<li>NoOfDays:"+diffDays+"</li>");
				
				int invoiceno =  (int) (Math.random() * 10000);
				out.print("<li>Invoice#:"+invoiceno+"</li>");
				
				String str = "SELECT Price, Discount FROM Has_Room where Has_Room.HotelID = "+ hotelid+ " AND Has_Room.Room_no ="+room_no;
				ResultSet result = stmt.executeQuery(str);
				result.next();
				float price = result.getFloat("Price");
				float discount = result.getFloat("Discount");
				out.print("<li>price per day:"+price+"</li>");
				out.print("<li> discount:"+discount+"</li>");
				float totalamt = price*discount*diffDays;
				out.print("<li> TotalAmt:"+totalamt+"</li>");
				Date ResDate = new java.util.Date();
				out.print("<li> ResDate:"+ResDate+"</li>");
				
				String insert = "INSERT INTO Reservation (InvoiceNo, ResDate, TotalAmt)"
						+ "VALUES (?, ?, ?)";
				
				PreparedStatement ps = con.prepareStatement(insert);

				
				ps.setInt(1, invoiceno);
				ps.setDate(2, new java.sql.Date(ResDate.getTime()));
				ps.setFloat(3, totalamt);

				ps.executeUpdate();
				
				String insert2 = "INSERT INTO Reserves (HotelID, Room_No, InvoiceNo, OutDate, InDate, NoOfDays)"
						+ "VALUES (?, ?, ?, ?, ?, ?)";
				
				PreparedStatement ps2 = con.prepareStatement(insert2);

				
				ps2.setInt(1, hotelid);
				ps2.setInt(2, room_no);
				ps2.setInt(3, invoiceno);
				ps2.setDate(4, new java.sql.Date(ed.getTime()));
				ps2.setDate(5, new java.sql.Date(sd.getTime()));
				ps2.setInt(6, (int)diffDays);
				ps2.executeUpdate();
				
		%>
		<form action = "service.jsp">
			<%
				List<Integer> list2 = new ArrayList<Integer>();
				list2.add(hotelid);
				list2.add(invoiceno);
				session.setAttribute("Data", list2);
			%>
			<input type = "submit" value = "continue">
		</form>
		
		
	</body>
</html>