<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Book Shopping Portal</title>
<style>
.container
{
	margin:auto;
	width:60%;
	height:400px;
	text-align:center;
	background-color:lightyellow;
}
fieldset
{
	width:300px;
	margin:auto;
	padding-top:80px;
	border:none;

}
.portal
{
	text-align:center;
	width:500px;
	margin:auto;
	padding-top:180px;
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
  width:300px;
}
p
{
float:left;}
.float-container {
    border: none;
    padding: 20px;
}

.float-child-c1 {
    width: 7%;
    float: left;
    padding: 20px;
    border:  none;
    height:370px;
    margin-left:50px;
    background-color:lightyellow;
    margin-top:100px;
    margin-right:50px;
}  
.float-child-c2 {
    width: 70%;
    float: left;
    padding: 20px;
    border: none;
     height:500px;
     background-color:#faebbd;
     margin:auto;
      background-image: url('wall.jpg');
}  

.button {
  background-color: #c0c6ed;
  border: none;
  color: black;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
 	width:110px;
 	height:60px;
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
	background-color:#ced2c2;
	border: none;
	text-align: center;
	padding: 20px;
	height: 520px;
	width: 1000px;
	margin: auto;
	margin-top: 50px;
}

table
{
	width:80%;
	background-color:lightyellow;
}

th
{
	background-color:lightblue;
	text-align:center;}
td{
text-align:center;}

</style>

<script>

	
function validateForm() 
{
	  let bname = document.forms["addBookForm"]["bname"].value;
	  let bauthor = document.forms["addBookForm"]["bauthor"].value;
	  let bprice = document.forms["addBookForm"]["bprice"].value;
	  if (bname == "") 
	  {
	    alert("Book name must be filled out");
	    return false;
	  }
	  else if(bauthor=="")
		{
		alert("Book author must be filled out.");
		 return false;
		  }
	  else if(bprice=="")
	  {
	  alert("Book price must be filled out.");
	  return false;
	  }
	  else
		  {
		  alert("Book has been added successfully.");

		  return true;
		  }
}

function updateForm() 
{
 
		
		  alert("Book has been updated successfully.");
		 
		  return true;
		  
}
function deleteForm() 
{

		  alert("Book has been deleted successfully.");
		  return true;
		  
}

function validateUpdate(select)
{
	if(select.value=="price")
		{
			document.getElementById('bp').style.display="block";
			document.getElementById('bs').style.display="none";
		}
	else if(select.value=="stock")
		{
			document.getElementById('bs').style.display="block";
			document.getElementById('bp').style.display="none";
		}
	}

</script>
</head>
<body bgcolor="#ecddd0">
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

//int userid = (Integer)(session.getAttribute("userid"));
//String userpassword=(String)session.getAttribute("password");
PreparedStatement ps = conn.prepareStatement("select * from admin where aid=? and apwd=?");

//first session 
//get uid from session
if(session.getAttribute("userid")!=null && session.getAttribute("password")!=null)
{

	int it = Integer.parseInt(session.getAttribute("userid").toString());
	//int i = (Integer)session.getAttribute("uid");
	String p=(String)session.getAttribute("password");  
	ps.setInt(1,it);
	ps.setString(2, p);
	
}
//second session
//get uid from form(previous page)
else if(request.getParameter("uid")!=null && request.getParameter("pwd")!=null)
{
	int id = Integer.parseInt(request.getParameter("uid"));
	String pwd = request.getParameter("pwd");
	//session.setAttribute("userid",id); 
	//session.setAttribute("password",pwd); 
	//int i = Integer.valueOf((String) session.getAttribute("uid"));
	//int i = (Integer)session.getAttribute("uid");
	//String p=(String)session.getAttribute("password");  
	session.setAttribute("userid",id); 
	session.setAttribute("password",pwd); 
	ps.setInt(1,id);
	ps.setString(2, pwd);
}

if(ps.executeUpdate()>0)
{
	%>
	<br>
<h2><center>Welcome Admin</center></h2>


<div class="float-container">

  <div class="float-child-c1">
	  <center>
	  	<button class="button" name="addBook" onclick="location.href='addBook.jsp'">Add Books</button><br><br>
	  	<button class="button" name="viewBook"  onclick="location.href='viewBook.jsp'">View Books</button><br><br>
	  	<button class="button" name="updateBook"  onclick="location.href='updateBook.jsp'">Update Books</button><br><br>
	  	<button class="button" name="deleteBook"  onclick="location.href='deleteBook.jsp'">Delete Books</button><br><br>
	  	<button class="button" name="deleteBook"  onclick="location.href='login.jsp'">Logout</button>
	  </center>
  </div>
  
  	<div class="float-child-c2" id="portal" style="display:block;">
	   <div class="portal">
	   		<h1>Welcome to Admin Portal</h1>
			<h3>Teamwork makes the dream work!</h3>
		</div>
	</div>
  
</div>
</body>
</html>
<% 
conn.close();
}
else
{
	
	//RequestDispatcher rd = request.getRequestDispatcher("homepage.jsp");
	//rd.include(request, response);
	//out.println("<h3><center>Login Failed...</center></h3>");
	response.sendRedirect("login.jsp?error=Login Failed..!");
}


	
	
	
	
	
	
	
	
	
	
	


%>
