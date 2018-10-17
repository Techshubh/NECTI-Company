<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Registration</title>
<head>
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
body {
    font-family: Arial, Helvetica, sans-serif;
   
}

* {
    box-sizing: border-box;
}

/* Add padding to containers */
.container {
	width:50%;
	 border: 1px solid #000000;
	
    padding: 16px;
    background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
   
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
}

/* Overwrite default styles of hr */
hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
    background-color: black;
    color: white;
    padding: 16px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}

.registerbtn:hover {
    opacity: 1;
}

/* Add a blue text color to links */
a {
    color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
    background-color: #f1f1f1;
    text-align: center;
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
   
      <h1 class="w3-text-teal" align="center">Register</h1>
      </div>

<form  action="Register.jsp">
  <div class="container" style="margin:auto;">
  
   
    <p>Please fill in this form to create an account.</p>
    <hr>
	<label for="email"><b>EmailID</b></label>
    <input type="text" placeholder="Enter EmailId" name="email" required>
	
    <label for="email"><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="username" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>

    <label for="psw-repeat"><b>Repeat Password</b></label>
    <input type="password" placeholder="Repeat Password" name="psw-repeat" required>
    
    <hr>
    <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>

    <button type="submit" class="registerbtn">Register</button>
  </div>
  
  <div class="container signin" style="margin:auto;" >
    <p>Already have an account? <a href="Login.jsp">Sign in</a>.</p>
  </div>
</form>
<%
if(request.getParameter("username")!=null)
{	
	if(!request.getParameter("psw").equals(request.getParameter("psw-repeat")))
	{
		out.print("<b><font color=red>Password not match</color></b>");
	}
	else
	{
	Connection con=(Connection)session.getAttribute("connection");
String query = "insert into login values(?,?,?)";
try {
	PreparedStatement preparedStmt = con.prepareStatement(query);
	preparedStmt.setString(1, request.getParameter("username"));
	preparedStmt.setString(2, request.getParameter("psw"));
	preparedStmt.setString(3, request.getParameter("email"));
	preparedStmt.executeUpdate();
	%>
	<jsp:include page="Success.jsp"></jsp:include>
<%} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
}
}

%>

</body>
</html>