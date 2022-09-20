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
function updateForm() 
{
 
	  let price = document.forms["updateBookForm"]["price"].value;
	  let update = document.forms["updateBookForm"]["update"].value;
	  if(update=="")
		{
		 alert("Book price must be filled out");
		    return false;
		}
	  else if(update=="price" && price=="")
		{
		 alert("Book price must be filled out");
		    return false;
		}
	else{
		  alert("Book has been updated successfully.");
		 return true;
	}
		  
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

	<!-- update book -->
	 <div class="float-child-c2" id="c4">
	   <fieldset>
	   <h2><center>Update Book Form</center></h2>
		<form method="post" action="updateBook.jsp" name="updateBookForm" onsubmit="return updateForm()">
		<p>
		<label for="bn" name="bn" id="bn" >Select Book ID</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select id="bn" name="bn" style="width:180px;">
		<%
		try{
		Statement stmt = conn.createStatement();
		ResultSet book = stmt.executeQuery("select bid from book");
		while(book.next())
		{
			out.println("<option value="+book.getInt(1)+">"+book.getInt(1)+"</option>");
		}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		%>
		</select>
		</p>
		<p>
		<label for="update" name="update" id="update">Select Option</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select id="update" name="update" style="width:180px;" onchange="validateUpdate(this)">
			<option value="">Option</option>
			<option value="price">Update Price</option>
			<option value="stock">Update Stock</option>
		</select>
		</p>
		<p id="bs" style="display:none;">
		<label for="stock" name="stock" id="stock">Select Stock</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select id="stock" name="stock" style="width:180px;">
			<option value="50">50</option>
			<option value="100">100</option>
			<option value="150">150</option>
			<option value="200">200</option>
		</select>
		</p>
		<p id="bp" style="display:none;">
		<label for="price" name="price" id="price">Enter Price</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="price" name="price" id="price"/>
		</p>
		
		<input type="submit" value="Update Book"/>
		</form>
		</fieldset>
	</div>
</div>
</body>
</html>
<% 


	if(request.getParameter("bname")!=null && request.getParameter("bauthor")!=null && request.getParameter("bstock")!=null &&request.getParameter("bprice")!=null)
	{
		
		String bname = request.getParameter("bname");
		String bauthor = request.getParameter("bauthor");
		int bstock = Integer.parseInt(request.getParameter("bstock"));
		double bprice = Double.parseDouble(request.getParameter("bprice"));
	
		PreparedStatement s = conn.prepareStatement("insert into book values(book_seq.nextval,?,?,?,? )");
		s.setString(1, bname);
		s.setString(2, bauthor);
		s.setInt(3, bstock);
		s.setDouble(4, bprice);
		
		int exec = s.executeUpdate();
		
		if(exec<=0)
		{
			out.println("Something went wrong");
		}
		
		conn.close();
	}


	
	if(request.getParameter("update")!=null)
	{
		String update = request.getParameter("update");
	
		if(update.equalsIgnoreCase("price"))
		{
			PreparedStatement s = conn.prepareStatement("update book set bprice = ? where bid=?");
			double bp = Double.parseDouble(request.getParameter("price"));
			int bname = Integer.parseInt(request.getParameter("bn"));
			s.setDouble(1, bp);
			s.setInt(2, bname);
			int exec = s.executeUpdate();
			
			if(exec<=0)
			{
				out.println("Something went wrong");
			}
		}
		else if(update.equalsIgnoreCase("stock"))
		{
			PreparedStatement s = conn.prepareStatement("update book set bstock = ? where bid=?");
			int bs = Integer.parseInt(request.getParameter("stock"));
			int bname = Integer.parseInt(request.getParameter("bn"));
			s.setInt(1, bs);
			s.setInt(2, bname);
			int exec = s.executeUpdate();
			
			if(exec<=0)
			{
				out.println("Something went wrong");
			}
		}
	
		
		conn.close();
	}
	if(request.getParameter("bnamedel")!=null)
	{
		int bname = Integer.parseInt(request.getParameter("bnamedel"));
	
			PreparedStatement s = conn.prepareStatement("delete from book where bid=?");
			s.setInt(1, bname);
			int exec = s.executeUpdate();
			
			if(exec<=0)
			{
				out.println("Something went wrong");
			}
		
		conn.close();
	}

}
else
{
	
	//RequestDispatcher rd = request.getRequestDispatcher("homepage.jsp");
	//rd.include(request, response);
	//out.println("<h3><center>Login Failed...</center></h3>");
	response.sendRedirect("login.jsp?error=Login Failed..!");
}


	
	
	
	
	
	
	
	
	
	
	


%>