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

.byname, .byhighest, .bylowest
{
display:none;
}
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
  width:110px;
}
p
{
float:left;}
.float-container {
    border: none;
    padding: 20px;
}

.float-child-c1 {
    width: 8%;
    float: left;
    padding: 20px;
    border:  none;
    height:400px;
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
  padding: 12px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  width:130px;
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
	width:70%;
	background-color:lightyellow;
}

th
{	width:100px;
	background-color:lightblue;
	text-align:center;}
td{
width:100px;
text-align:center;}

</style>

<script>


function hello() 
{
	document.getElementById('category').style.display="block";
	document.getElementById('purchaseBook').style.display="block";
		  
}

function validateUpdate(select)
{
	document.getElementById('category').value= select.value;

	}


</script>
</head>
<body bgcolor="#fbfaf0">
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
PreparedStatement ps = conn.prepareStatement("select * from customer where cid=? and cemail=?");
int final_id = 0;
//first session 
//get uid from session
if(session.getAttribute("cid")!=null && session.getAttribute("cpwd")!=null)
{

	int it = Integer.parseInt(session.getAttribute("cid").toString());
	//int i = (Integer)session.getAttribute("uid");
	String p=(String)session.getAttribute("cpwd");  
	ps.setInt(1,it);
	ps.setString(2, p);
	final_id = it;
	
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
	session.setAttribute("cid",id); 
	session.setAttribute("cpwd",pwd); 
	ps.setInt(1,id);
	ps.setString(2, pwd);
	final_id = id;
}

if(ps.executeUpdate()>0)
{
	%>
	<br>
	<% 
	//Statement sr = conn.createStatement();
	PreparedStatement r = conn.prepareStatement("select cfirstname from customer where cid=?");
	r.setInt(1,final_id);
	r.executeUpdate();
	
	while(r.getResultSet().next())
	{
	%>
<h2 style="color:white"><center>Welcome <%=r.getResultSet().getString(1) %></center></h2>
<%} %>

<div class="float-container">

  <div class="float-child-c1">
	  <center>
	  	<button onclick="hello()" class="button" name="book">Books</button><br><br>
	  	<button style="display:none; width:100px;background-color:pink;" class="button" name="purchaseBook"  id="purchaseBook" onclick="location.href='purchaseBook.jsp'">View Books</button>
	  	<button style="display:none; width:100px;margin-bottom:20px;background-color:pink;" class="button" name="category"  id="category" onclick="location.href='category.jsp'">Category</button>
	  	<button class="button" name="searchBook"  onclick="location.href='customerSearch.jsp'">Search Books</button><br><br>
	  	<button class="button" name="transactionHistory"  onclick="location.href='transactionHistory.jsp'">Transaction History</button><br><br>
	  	<button class="button" name="transactionHistory"  onclick="location.href='logout.jsp'">Log Out</button>
	  </center>
  </div>
  
  
	<!--  view book -->
	  <div class="float-child-c2" id="c3" style="overflow-y:auto;">
	  <center>
	   <h2>View Book</h2>
	   <form action="category.jsp" method="post">
	   <label for ="sort" id="sort" name="sort">Select Category</label>
		<select name="sort" id="sort" onchange="validateUpdate(this)" style="width:60%">
		<%
		Statement st = conn.createStatement();
		ResultSet c = st.executeQuery("select * from category");
		while(c.next())
		{
		%>
		<option value="<%=c.getString(1)%>"><%=c.getString(1)%></option>
		<% 
		}
		out.println("</select>");
		out.println("<input type='submit' value='Enter' style='width:100px;height:30px'><br><br>");
		out.println("</form>");
		
		try
		{	
			if(request.getParameter("sort")!=null)
			{
				%>
				<table>
				<center>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Author</th>
					<th>Stock</th>
					<th>Price</th>
					<th>Image</th>
					<th>Add to Cart</th>
				</tr>

					<%
				String category = request.getParameter("sort");
				Statement stmt = conn.createStatement();
				PreparedStatement rs = conn.prepareStatement("select * from book where cname=? order by bid");
				rs.setString(1,category);
				
				rs.executeUpdate();
				out.println("<h3>Category: "+category+"</h3>");
				//PreparedStatement p = conn.prepareStatement("Select * from book;");
				while(rs.getResultSet().next())
				{
					out.println("<form action='carts.jsp' method='post'>");
					out.println("<tr>");
					out.println("<td>"+rs.getResultSet().getInt(1)+"</td>");
					out.println("<td>"+rs.getResultSet().getString(2)+"</td>");
					out.println("<td>"+rs.getResultSet().getString(3)+"</td>");
					out.println("<td>"+rs.getResultSet().getInt(4)+"</td>");
					out.println("<td>"+rs.getResultSet().getDouble(5)+"</td>");
					out.println("<td><img style='length:100px;width:100px;'src='img/"+rs.getResultSet().getString(7)+"'></td>");
					out.println("<input type='hidden' value="+rs.getResultSet().getInt(1)+" name='addCart'>");
					out.println("<td><input type='submit' value='Purchase'></td>");
					out.println("</form>");
					out.println("</tr>");
				}
			}
			else
			{
				out.println("<h3>Nothing to show</h3>");
			}
			
			
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		%>

		</center>
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
	response.sendRedirect("customerLogin.jsp?error=Login Failed..!");
}


%>