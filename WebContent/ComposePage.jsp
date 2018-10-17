<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,javax.mail.*,javax.mail.internet.*,java.sql.*,java.time.*,java.time.format.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>ComposePage</title>
 <%response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);%>
</head>
<style>
h1 {font-family: "Roboto", sans-serif;
margin-top: 60px;}
Table {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  	margin:auto;
  	margin-top:20px;
}

td, th {
   
    padding: 8px;
}
body {
    margin: 0;
}

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 15%;
    background-color: #f1f1f1;
    position: fixed;
    height: 100%;
    overflow: auto;
}

li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
}

li a.active {
    background-color: #4CAF50;
    color: white;
}

li a:hover:not(.active) {
    background-color: #555;
    color: white;
}

</style>
<body background="bc.jpg">
<div class="w3-top" id="include_html">

  <div class="w3-bar w3-theme w3-top w3-left-align w3-large">
  
    <a href="WelcomePage.jsp" class="w3-bar-item w3-button w3-theme-l1">Home</a>
    
      <a href="Logout.jsp" style="float:right" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Logout</a>
  
  </div>

</div>

	<ul>
  <li><a href="ComposePage.jsp">Compose</a></li>
  <li><a href="ComposePage.jsp">Compose</a></li>
  <li><a href="Inbox.jsp">Inbox</a></li>
  <li><a href="draft.jsp">Draft</a></li>
  	<% 
	String s=(String)session.getAttribute("username");
	if(s.equalsIgnoreCase("shubham"))
	{
		%>
		
	<li><a href="ContactQuery.jsp">Contact Query</a></li>
	<%} %>
  
</ul>
	
<div class="w3-row w3-padding-20">
  <h1 class="w3-text-teal" align="center">Compose</h1>
  <% 
//out.print("<h2 align='center'>Compose</h2>");
  
//out.print("<h3>Welcome "+session.getAttribute("username")+"</h3>"); 

%>
  
  
     

</div>
<form>

<table>
<tr>
<th>Mail</th>

<tr>
<td>To:</td>
<td><input type='text' size=35 name='To' placeholder='Enter To Email'></td>
</tr>
<tr>
<td>Subject:</td>
<td><input type='text' size=35 name='Sub' placeholder='Enter Subject'></td>
</tr>
<tr>
<td>Message:</td>
<td>

<textarea rows="20" cols="80" name='Body' placeholder='Enter a message to send'>
</textarea>
</td>
</tr>
<tr>
<td></td>
<td><input type='submit' name='send' value='Send'> <input type='submit' name='Draft' value='Draft'></td>

</tr>
</table>
</form>
<%
if(request.getParameter("send")!=null)
{
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyy");  
	   LocalDateTime now = LocalDateTime.now();  
	
 
try{
	Connection con=(Connection)session.getAttribute("connection");

	String query = "insert into inbox values(?,?,?,?,?) ";
	PreparedStatement pr=con.prepareStatement(query);
	pr.setString(1,request.getParameter("To"));
	pr.setString(2, request.getParameter("Sub"));
	pr.setString(3, dtf.format(now)+"");
	pr.setString(4, (String)session.getAttribute("username"));
	pr.setString(5, request.getParameter("Body"));
	pr.executeUpdate();
	String rst = "Message sent Successfully ";
	

if(rst!=null)
{%>
<div style="margin-left:31%;">
	<%out.println(rst);%>
</div>

	
<%}

        

 } 

catch (Exception mex) {
		mex.printStackTrace();
        out.print("unable to send mail");
        

    }

    }
else if(request.getParameter("Draft")!=null)
{	String rst=null;
	try{
		Connection con=(Connection)session.getAttribute("connection");

		String query = "insert into Draft values(?,?,?,?) ";
		PreparedStatement pr=con.prepareStatement(query);
		pr.setString(1,request.getParameter("To"));
		pr.setString(2, request.getParameter("Sub"));
		pr.setString(3, request.getParameter("Body"));
		pr.setString(4, (String)session.getAttribute("username"));
		pr.executeUpdate();
		rst = "Draft Saved ";
		}
		catch(Exception e)
		{
			rst = "Error";
		}

	if(rst!=null)
	{%>
	<div style="margin-left:31%;">
	<%out.println(rst);%>
</div>
	<% }
}




	

%>


</body>
</html>