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
  background-image: url('book2.jpg');
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
	height: 400px;
	width: 600px;
	margin: auto;
	margin-top: 50px;
}

</style>

<script>
function validateForm() 
{
	  let firstname = document.forms["userLoginForm"]["firstname"].value;
	  let lastname = document.forms["userLoginForm"]["lastname"].value;
	  let contact = document.forms["userLoginForm"]["contact"].value;
	  let email = document.forms["userLoginForm"]["pwd"].value;
	  if (firstname == "") 
	  {
	    alert("Firstname must be filled out");
	    return false;
	  }
	  else if (lastname == "") 
	  {
	    alert("Lastname must be filled out");
	    return false;
	  }
	  else if (contact == "") 
	  {
	    alert("Contact must be filled out");
	    return false;
	  }
	  else if(email=="")
		  {
		  alert("Email must be filled out.");
		  return false;
		  }
	  else
		  {
			  alert("Account has been registered successfully");
			  return true;
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
}
catch(SQLException e)
{
	e.printStackTrace();
}
%>
<br>
<h2 style="color:white"><center>Customer registration</center></h2>

<div class="topnav">
	<a href="aboutus.jsp" >About Us</a>
	<a href="login.jsp" class="link"  id="aboutus" rel="aboutus">Admin Login</a>
  	<a href="customerLogin.jsp" class="link"  id="aboutus" rel="aboutus">Customer Login</a>
  	<a href="contactus.jsp">Contact Us</a>
</div>

<div class="container">
<fieldset>
<form method="post" action="customerRegister.jsp" name="userLoginForm" onsubmit="return validateForm()" >
<p>
<label for="firstname" name="firstname" id="firstname">Enter Firstname</label>&nbsp;&nbsp;
<input style="float:right;" type="text" name="firstname" id="firstname"/>
</p>
<p>
<label for="lastname" name="lastname" id="lastname">Enter Lastname</label>&nbsp;&nbsp;
<input style="float:right;" type="text" name="lastname" id="lastname"/>
</p>
<p>
<label for="pwd" name="pwd" id="pwd">Enter Email</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input style="float:right;" type="text" name="pwd" id="pwd"/>
</p>
<p>
<label for="contact" name="contact" id="contact">Enter Contact</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input style="float:right;" type="text" name="contact" id="contact"/>
</p>
<p style="float:right" width:100px;>
<input type="submit" style="width:100px;"value="Register"/>
<input type="reset" style="width:100px;"value="Clear"/>
</p>



</form>

</fieldset>
<p><center>Click <a href="customerLogin.jsp">here</a> to go back.</center></p>
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
<%
if(request.getParameter("firstname")!=null && request.getParameter("lastname")!=null && request.getParameter("contact")!=null &&request.getParameter("pwd")!=null)
	{
		
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String contact = request.getParameter("contact");
		String email = request.getParameter("pwd");
		
	
		PreparedStatement s = conn.prepareStatement("insert into customer values(customer_seq.nextval,?,?,?,?,null)");
		s.setString(1, firstname);
		s.setString(2, lastname);
		s.setString(3, email);
		s.setString(4, contact);
		
		int exec = s.executeUpdate();
		
		if(exec<=0)
		{
			out.println("Something went wrong");
		}
		
		conn.close();
	}
	
	%>