<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hotel CS336</title>
</head>

<body>
Welcome to Hotel 336! <!--  HTML way for output -->
<br>
<br>

<!-- Login -->
<form action = "main.jsp" method = "post">
	Username: <input method = "get" type = "text" name = "Customer">
    <br />
    Password: <input method = "get" type = "text" name = "customer_password" />
    <br>
    <input type = "submit" value = "Submit" />
    <input type = "submit" value = "Register" />
</form>



</body>
</html>