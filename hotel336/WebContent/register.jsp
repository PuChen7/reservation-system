<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hotel | Register</title>
<link href="https://fonts.googleapis.com/css?family=VT323" rel="stylesheet">
<style>
	h1{
	 font-size: 300%;
	 font-weight: bold;
	 text-align: center;
	 font-family: 'VT323', monospace;
	}
	
	.form {
		text-align: center;
	}
</style>

</head>
<body>
	<h1>Register</h1>
	<div class="form">
		<!-- register -->
		<form action = "register_control.jsp" method = "post">
			Username: <input type = "text" name = "register_username">
		    <br />
		    Email: <input type = "text" name = "register_email">
		    <br />
		    Driver License: <input type = "text" name = "register_cid">
		    <br />
		    Address: <input type = "text" name = "register_addr">
		    <br />
		    Phone Number: <input type = "text" name = "register_phone">
		    <br />
		    Password: <input type = "password" name = "register_password" />
		    *Password length should between 1-16.
		    <br>
	    <input type = "submit" value = "Register" />
		</form>
	</div>
</body>
</html>