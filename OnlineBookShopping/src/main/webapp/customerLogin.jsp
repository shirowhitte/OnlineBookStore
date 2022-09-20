<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Book Shopping Portal</title>
<style>
body {
  background-image: url('book.jpg');
}

p
{
float:left;}
fieldset
{
	width:300px;
	margin:auto;
	padding-top:50px;
	border:none;
}
input[type=submit] {
  background-color: #04AA6D;
  border: none;
  color: white;
  padding: 8px 16px;
  text-decoration: none;
  border-radius: 20px 20px;
  margin: 4px 2px;
  cursor: pointer;
  width:100px;
}
input[type=reset] {
  background-color: red;
  border: none;
  color: white;
  padding: 8px 16px;
  text-decoration: none;
  border-radius: 20px 20px;
  margin: 4px 2px;
  cursor: pointer;
  width:100px;
}
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
	background-color:lightyellow;
	border: none;
	text-align: center;
	padding: 20px;
	height: 300px;
	width: 600px;
	margin: auto;
	margin-top: 50px;
}

</style>

<script>
function validateForm() 
{
	  let x = document.forms["userLoginForm"]["uid"].value;
	  let y = document.forms["userLoginForm"]["pwd"].value;
	  if (x == "" && x!=) 
	  {
	    alert("ID must be filled out");
	    return false;
	  }
	  else if(y=="")
		  {
		  alert("Password must be filled out.");
		  return false;
		  }
}
</script>
</head>
<body bgcolor="#ffe5d9">
<%
Connection conn = null;
String driverName = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user="dbuser";
String password = "dbuser";

try{
	Class.forName(driverName);
	conn = DriverManager.getConnection(url, user, password);
	if(conn!=null){
		//out.println("DB connected successfully!!");
	}
	else{
		out.println("Sorry..!! Something went wrong");
	}
	conn.close();
}
catch(SQLException e)
{
	e.printStackTrace();
}
%>
<br>
<h2  style="color:white;"><center>Online Book Shopping Portal</center></h2>

<div class="topnav">
<a href="aboutus.jsp" >About Us</a>
	<a href="login.jsp" class="link"  id="aboutus" rel="aboutus">Admin Login</a>
  	<a href="customerLogin.jsp" class="link"  id="aboutus" rel="aboutus">Customer Login</a>
  	<a href="contactus.jsp">Contact Us</a>
</div>

<div class="container">
<fieldset>
<form method="post" action="customerPortal.jsp" name="userLoginForm" onsubmit="return validateForm()" >
<p>
<label for="uid" name="uid" id="uid" >Enter User ID</label> &nbsp;&nbsp;&nbsp;
<input style="float:right;" type ="text" name="uid" id="uid"/>
</p>
<p>
<label for="pwd" name="pwd" id="pwd">Enter Password</label>&nbsp;&nbsp;
<input style="float:right;" type="password" name="pwd" id="pwd"/>
</p>
<p style="float:right;">
<input type="submit" value="Login"/>
<input type="reset" value="Clear"/>
</p>


</form>
<p>Does not own an account? Click <a href="customerRegister.jsp">here</a> to register.</p>
</fieldset>
<h3><center><% String e = request.getParameter("error");
if(e==null)
{
	
}
else
{
	out.println(e);
}
%></center></h3>
</div>

</body>
</html>