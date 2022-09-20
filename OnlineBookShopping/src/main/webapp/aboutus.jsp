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
background-image: url('bookb.webp');
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
.container-1
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

.container{
background-color:#ced2c2;
    width: 1000px;
    position: absolute;
    transform: translate(-50%,-50%);
    top: 55%;
    left: 50%;
    height: 570px;
    text-align:center;
    overflow: hidden;
    border: none;
    border-radius: 8px;
    box-shadow: -1px 5px 15px black;
}

/*Area of images*/
.wrapper{
    width: 100%;
    display: flex;
    animation: slide 8s infinite;

}

img{
    width: 100%;
}
/*Animation activated by keyframes*/
@keyframes slide{
    0%{
        transform: translateX(0);
    }
    25%{
        transform: translateX(0);
    }
    30%{
        transform: translateX(-100%);
    }
    50%{
        transform: translateX(-100%);
    }
    55%{
        transform: translateX(-200%);
    }
    75%{
        transform: translateX(-200%);
    }
    80%{
        transform: translateX(-300%);
    }
    100%{
        transform: translateX(-300%);
    }
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
	<a href="login.jsp" class="link"  id="aboutus" rel="aboutus">Admin Login</a>
  	<a href="customerLogin.jsp" class="link"  id="aboutus" rel="aboutus">Customer Login</a>
  	<a href="contactus.jsp">Contact Us</a>
</div>

<!-- Container -->
<div class="container">
	<h1 style="padding-top:30px;">Welcome to Online Book Store</h1>
	<h4>Bringing People and Knowledge Together for Over 50 Years.</h4>


<!--Area of the images-->
   <div class="wrapper">
      <img src="bs1.jpg">
      <img src="bs2.jpg">
      <img src="bs5.jpg">
      <img src="bs4.jpg">
   </div>



</div>

</body>
</html>