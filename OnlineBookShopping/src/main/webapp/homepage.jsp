<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Store</title>
<style type=text/css>   
/* Add a black background color to the top navigation */
.topnav 
{
  position: relative;
  background-color: #333;
  overflow: hidden;
  text-align: center;
}

/* Style the links inside the navigation bar */
.topnav a 
{
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
  text-align: center;
  display: inline-block;
  padding-left: 80px;
   padding-right: 80px;
}

/* Change the color of links on hover */
.topnav a:hover 
{
  background-color: #ddd;
  color: black;
}

/* Container styling */
.container
{
	background-color:#ced2c2;
	border: none;
	text-align: center;
	padding: 20px;
	height: 520px;
	width: 1000px;
	margin: auto;
	margin-top: 50px;
}
</style>
</head>
<body><h1 style="text-align:center;">Online Book Shopping</h1>
<!-- Top navigation -->
<div class="topnav">
	<a href="aboutus.jsp" >About Us</a>
  	<a href="login.jsp">Admin Login</a>
  	<a href="customerLogin.jsp">Customer Login</a>
  	<a href="contactus.jsp">Contact Us</a>
</div>

<!-- Container -->
<div class="container">
	<h1 style="padding-top:30px;">Welcome to Online Book Store</h1>
	<img style="length:300px;width:500px;"src="bookstore.jpg">
	<h4>Bringing People and Knowledge Together for Over 50 Years.</h4>
</div>

</body>
</html>