<%@ page import="java.sql.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

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
	  let qty = document.forms["addToCart"]["qty"].value;
	 // let bauthor = document.forms["addBookForm"]["bauthor"].value;
	  //let bprice = document.forms["addBookForm"]["bprice"].value;
	  var stock =  document.getElementById('bbbstock').innerHTML;
	  var s = parseInt(stock);
	  if (qty == "") 
	  {
	    alert("Quantity must be filled out");
	    return false;
	  }
	  else if(qty>s)
		  {
		  	alert("Not enough stock to be purchased.");
		    return false;
		  }
	  
	  else
		  {
		  alert("Order has been added successfully.");
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

function hello() 
{
	document.getElementById('category').style.display="block";
	document.getElementById('purchaseBook').style.display="block";
		  
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
	  <div class="float-child-c2" id="c3">
	  <center>
	   <h2>Confirm Purchase Book</h2>
	
		<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Author</th>
			<th>Stock</th>
			<th>Price</th>
			<th>Image</th>
		</tr>
		<% 
		try
		{
			if(request.getParameter("addCart")!=null)
			{
				int bid = Integer.parseInt(request.getParameter("addCart"));
				Statement stmt = conn.createStatement();
				//ResultSet rs = stmt.executeQuery("select * from book where bid=?");
				PreparedStatement p = conn.prepareStatement("Select * from book where bid=?");
				p.setInt(1, bid);
				p.executeUpdate();
				while(p.getResultSet().next())
				{
					out.println("<form action='carts.jsp' method='post' onsubmit='return validateForm()' name='addToCart'>");
					out.println("<tr>");
					out.println("<td>"+p.getResultSet().getInt(1)+"</td>");
					out.println("<td>"+p.getResultSet().getString(2)+"</td>");
					out.println("<td>"+p.getResultSet().getString(3)+"</td>");
					out.println("<td>"+p.getResultSet().getInt(4)+"</td>");
					out.println("<td>"+p.getResultSet().getDouble(5)+"</td>");
					out.println("<td><img style='length:100px;width:100px;'src='img/"+p.getResultSet().getString(7)+"'></td>");
					out.println("<input type='hidden' value="+p.getResultSet().getInt(1)+" name='bookID'/>");
					out.println("<input type='hidden' value="+ final_id +" name='customerID'/>");
					int s = p.getResultSet().getInt(4);
					%>
					
					<input type="hidden" name="s" id="s" valus="<%=s%>"/>
					<%
					//out.println("<input type='hidden' value='"+ p.getResultSet().getInt(4) +"' name='bbstock' id='bbstock'/>");
					out.println("<p style='display:none' id='bbbstock'>"+p.getResultSet().getInt(4)+"</p>");
					out.println("</tr></table>");
					out.println("<br><br><label for='qty' name='qty' id='qty'>Insert Quantity</label>");
					out.println("<input type='text' name='qty' id='qty'/><br><br>");
					out.println("<input type='submit' value='Confirm Purchase'>");
					out.println("</form>");
				}
			}
			else
			{
				response.sendRedirect("transactionHistory.jsp");
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		%>
		</table>
		</center>
	</div>
	
	

  
</div>
</body>
</html>
<% 

if(request.getParameter("qty")!=null && request.getParameter("customerID")!=null && request.getParameter("bookID")!=null)
{

		//int bbstock = Integer.parseInt(request.getParameter("bbstock"));
		int cid = Integer.parseInt(request.getParameter("customerID"));
		int bid = Integer.parseInt(request.getParameter("bookID"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		//double bprice = Double.parseDouble(request.getParameter("bprice"));
		//out.println("<p id='ssstock'>""</p>");
		Date d = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");  
		String strDate = dateFormat.format(d);  
		PreparedStatement s = conn.prepareStatement("insert into bookOrder values(order_seq.nextval,?,?,?,? )");
		s.setInt(1, bid);
		s.setInt(2, cid);
		s.setInt(3, qty);
		s.setString(4, strDate);
		
		PreparedStatement getStock = conn.prepareStatement("select bstock from book where bid=?");
		getStock.setInt(1, bid);
		getStock.executeUpdate();
		getStock.getResultSet().next();
		int stock = getStock.getResultSet().getInt(1);
		
		//out.println("<p id='bbbstock'>"+stock+"</p>");
		int final_stock = stock - qty;
		PreparedStatement update = conn.prepareStatement("update book set bstock = ? where bid=?");
		update.setInt(1, final_stock);
		update.setInt(2, bid);
		update.executeUpdate();
		
		int exec = s.executeUpdate();
		
		if(exec<=0)
		{
			out.println("Something went wrong");
		}
		
		conn.close();
	}

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

