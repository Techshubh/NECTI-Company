<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    <%!static Connection con; %>
    
<!DOCTYPE html>
<html>
<head>

<title>Login</title>
 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>


h1 {font-family: "Roboto", sans-serif;
margin-top: 60px;}

.w3-main{


margin:auto;

 margin-top:25px;
}


body {font-family: Arial, Helvetica, sans-serif;}

/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
    background-color:black;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    position: relative;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}



/* The Close Button (x) */
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}


</style>
</head>
<body background="bc.jpg">
<div class="w3-top" id="include_html">

  <div class="w3-bar w3-theme w3-top w3-left-align w3-large">
    <a class="w3-bar-item w3-button w3-right w3-hide-large w3-hover-white w3-large w3-theme-l1" href="javascript:void(0)" onclick="w3_open()"><i class="fa fa-bars"></i></a>
    <a href="index.html" class="w3-bar-item w3-button w3-theme-l1">Home</a>
    <a href="Login.jsp" class="w3-bar-item w3-button w3-hide-small w3-hover-white">SignIn</a>
    <a href="Contact.jsp" style="float:right" class="w3-bar-item w3-button w3-hide-small w3-hover-white">ContactUs</a>
      <a href="Register.jsp" style="float:right" class="w3-bar-item w3-button w3-hide-small w3-hover-white">SignUp</a>
    <a href="AboutUs.jsp" class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-hover-white">AboutUs</a>
  </div>

</div>


  <div class="w3-row w3-padding-20">
   
      <h1 class="w3-text-teal" align="center">Login</h1>
      </div>
    
<table border=1 class="w3-main">
<tr>
<td>

<form class="modal-content animate" action="Login.jsp" method='post'>

    <div class="container">
    	
      <label for="uname"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="uname" required>

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="upass" required>
        
      <button type="submit">Login</button>
    </div>

    <div class="container" style="background-color:#f1f1f1">
     
    </div>
  </form>
<!--<form method=post action='Login.jsp'>
Username:<input type=text name='uname'>
Password:<input type=password name='upass'>
<input type=submit name="Log" value="login">

</form>
  -->

</td>
</tr>

</table>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:necti","hr","hr");
session.setAttribute("connection", con);
if(request.getParameter("uname")!=null)
{String uname=request.getParameter("uname");
String upass=request.getParameter("upass");


String uDpass=null;
String uDemail=null;
try{
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select password,email from Login where username='"+uname+"'");
	
	while(rs.next())
	{
		uDpass=rs.getString(1);
		uDemail=rs.getString(2);
	}
	
	}
	catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}

if(upass.equals(uDpass)&&upass!=null)
{
	session.setAttribute("username", uname);
	session.setAttribute("email", uDemail);
	
	%>
	
	<jsp:forward page="WelcomePage.jsp"></jsp:forward>
	

<%}

else
{
	
%>

	<jsp:include page="error.jsp"></jsp:include>	
		
<% }}%>

</body>
</html>