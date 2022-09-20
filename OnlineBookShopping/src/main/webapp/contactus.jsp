<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Store</title>
<style type=text/css>   

body
{
background-image: url('book4.jpg');
}
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
	background-image: url('white.jpg');
	background-color:#ced2c2;
	border: none;
	text-align: center;
	padding: 20px;
	height: 450px;
	width: 60%;
	margin: auto;
	margin-top: 50px;
	border-radius: 8px;
    box-shadow: -1px 5px 15px black;
	
	
}

.container-1{
background-color:#ced2c2;
    width: 1000px;
    position: absolute;
    transform: translate(-50%,-50%);
    top: 55%;
    left: 50%;
    height: px;
    text-align:center;
    overflow: hidden;
    border: none;
    border-radius: 8px;
    box-shadow: -1px 5px 15px black;
}

</style>
<script>
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>
</head>
<body><h1 style="text-align:center;color:white;">Online Book Shopping</h1>
<!-- Top navigation -->
<div class="topnav">
	<a href="aboutus.jsp" >About Us</a>
  	<a href="login.jsp">Admin Login</a>
  	<a href="customerLogin.jsp">Customer Login</a>
  	<a href="contactus.jsp">Contact Us</a>
</div>

<!-- Container -->
<div class="container">


	<table style="width: 100%; table-layout:fixed;">
    <tr>
      <td style="width:100px;"></td>
        <td style="width:40%">
        <h2>Contact Us</h2>
                <p>Singapore Hotline: 1800 88 2930</p>	
				<p>Malaysia Hotline: +60 0182738274</p>	
				<p>Thailand Hotline: 1800 88 8194</p>	
				<p>Indonesia Hotline: 1800 88 1242</p>	
				<p>Headquater: 
				<address>
					Blk 35 Mandalay Road
						No. 1234 Mandalay Towers Singapore 
						308215 SINGAPORE
				</address>
				</p>	
 
        </td>
        <td style="width:100px;"></td>
         <td style="width:60%">
               <div class="mapouter"><div class="gmap_canvas"><iframe width="535" height="500" id="gmap_canvas" src="https://maps.google.com/maps?q=singapore%20Blk%2035%20mandalay%20road&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><a href="https://www.embedgooglemap.net/blog/divi-discount-code-elegant-themes-coupon/"></a><br><style>.mapouter{position:relative;text-align:right;height:400px;width:400px;}</style><a href="https://www.embedgooglemap.net">embedgooglemap.net</a><style>.gmap_canvas {overflow:hidden;background:none!important;height:400px;width:400px;}</style></div></div>
     
        </td>
    </tr>

</table>

</div>

</body>
</html>