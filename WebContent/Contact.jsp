<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Contact</title>

<style>
html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif;}
.w3-sidebar {
  z-index: 3;
  width: 250px;
  top: 43px;
  bottom: 0;
  height: inherit;
}
</style>
</head>
<body background="bc.jpg">

<div class="w3-top" id="c">


  <div class="w3-bar w3-theme w3-top w3-left-align w3-large">
    <a class="w3-bar-item w3-button w3-right w3-hide-large w3-hover-white w3-large w3-theme-l1" href="javascript:void(0)" onclick="w3_open()"><i class="fa fa-bars"></i></a>
    <a href="index.html" class="w3-bar-item w3-button w3-theme-l1">Home</a>
    <a href="Contact.jsp" style="float:right" class="w3-bar-item w3-button w3-hide-small w3-hover-white">ContactUs</a>
    <a href="AboutUs.jsp" class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-hover-white">AboutUs</a>
  </div>

</div>

<div class="w3-main">

  <div class="w3-row w3-padding-64">
   
      <h1 class="w3-text-teal" align="center">Contact Us</h1>
      </div>
      </div>
     
      
<%
if(session.getAttribute("username")!=null)
	out.print("<h3>Welcome "+session.getAttribute("username")+"</h3>");
else
{%>
	 <div style="margin-left:45%">
		<h3>Welcome Guest</h3>
	</div>
<%
}
	
%>

<form action="Contact.jsp">
<table style="width:550px;border:0;margin:auto" cellpadding="8" cellspacing="0">
<tr> 
<td>
<label for="Name">Name*:</label>
</td> 
<td>
<input name="Name" type="text" maxlength="60" style="width:250px;" />
</td> 
</tr> 
<tr> 
<td>
<label for="PhoneNumber">Phone number:</label>
</td> 
<td>
<input name="PhoneNumber" type='text' maxlength="43" style="width:250px;" />
</td> 
</tr> 
<tr> 
<td>
<label for="FromEmailAddress">Email address*:</label>
</td> 
<td>
<input name="FromEmailAddress" type="text" maxlength="90" style="width:250px;" />
</td> 
</tr> 
<tr> 
<td>
<label for="Comments">Comments*:</label>
</td> 
<td>
<textarea name="Comments" rows="7" cols="40" style="width:350px;"></textarea>
</td> 
</tr> 
<tr> 
<td>
* - required fields
</td> 
<td>

<input name="skip_Submit" type="submit" value="Submit" />

</td> </tr>

</table>
</form>
<%
if(request.getParameter("Name")!=null)
{
Connection con;
if(session.getAttribute("connection")!=null)
{	con=(Connection)session.getAttribute("connection");
		
	}
else
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:necti","hr","hr");
}
String query = "insert into contact values(?,?,?,?)";
try {
	PreparedStatement preparedStmt = con.prepareStatement(query);
	preparedStmt.setString(1, request.getParameter("Name"));
	preparedStmt.setString(2, request.getParameter("PhoneNumber"));
	preparedStmt.setString(3, request.getParameter("FromEmailAddress"));
	preparedStmt.setString(4, request.getParameter("Comments"));
	preparedStmt.executeUpdate();
	%>
	<jsp:include page="Success.jsp">
	<jsp:param value="Data Submitted Successfully" name="ContactForm"/>
	</jsp:include>
<%}
catch(Exception e)
{
	
}
}

%>
</body>
</html>