<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hotel CS336</title>

<link href="https://fonts.googleapis.com/css?family=VT323" rel="stylesheet">
<style>

.form {
	text-align: center;
}

h1 {
	padding-top: 2cm;
 	font-size: 400%;
	 font-weight: bold;
	 text-align: center;
	  font-family: 'VT323', monospace;
  /*padding-left: 310px;*/
   -webkit-animation: fadein 2s; /* Safari, Chrome and Opera > 12.1 */
       -moz-animation: fadein 2s; /* Firefox < 16 */
            animation: fadein 3s;
}
@keyframes fadein {
    from { opacity: 0; }
    to   { opacity: 1; }
}
/* Firefox < 16 */
@-moz-keyframes fadein {
    from { opacity: 0; }
    to   { opacity: 1; }
}
/* Safari, Chrome and Opera > 12.1 */
@-webkit-keyframes fadein {
    from { opacity: 0; }
    to   { opacity: 1; }
}

nav {
  font-family: 'Quicksand', sans-serif;
  font-size: 18px;
    height: 50px;
    display: inline;
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: white;
    position: fixed;
    top: 0;
    width: 100%;
    border-bottom:1px solid black;
}

ul {
  list-style-type: none;
  padding-right: 80px;
}

 li {
    float: right;
}

 li a {
    color: black;
    text-align: center;
    padding: 14px 16px;
    padding-right: 30px;
    text-decoration: none;
}

 li a:hover {
  color: #040CFC;
}

.tag {
  text-decoration: none;
  float: left;
  display: inline;
  text-align: left;
  padding-top: 14px;
  margin-left: 60px;
}


</style>
</head>

<body>

<nav>            
			<div class="tag">Welcome | Hotel 336</div>
            <ul>
                <li><a href="#contact">Contact</a></li>
                <li><a href="aboutus.html">About Us</a></li>
                <li><a class="active" href="welcome.jsp">Home</a></li>
            </ul>           
</nav>


<h1> Welcome to Hotel 336! </h1> <!--  HTML way for output -->
<br>
<br>
<div class = "form">
	<!-- Login -->
	<form action = "main.jsp" method = "post">
		Username: <input type = "text" name = "username" />
	    <br />
	    Driver License: <input type = "text" name = "cid">
	    <br>
	    Password: <input type = "password" name = "password" />
	    <br>
	    <input type = "submit" value = "Login" />
	</form>

New user? Register first to login: <br>
<input type = "submit" value = "Register" onClick = "javascript:location.href='register.jsp'"/>
</div>


</body>
</html>