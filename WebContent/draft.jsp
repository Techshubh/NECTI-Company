<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Draft</title>
</head>
<style>
h1 {font-family: "Roboto", sans-serif;
margin-top: 60px;}
Table {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 60%;
    margin:auto;
}

td, th {
 	 border: 1px solid black;
    padding: 8px;
}

th{background-color: #f2f2f2;}

tr:hover {background-color: #ddd;}

th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
  
    color: Black;
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
  <h1 class="w3-text-teal" align="center">Draft</h1>
  </div>
<table>
  <tr>
    <th>To</th>
    <th>Subject</th>
    <th>Message</th>
  </tr>

<% //out.print("<h2 align='center'>Draft</h2>");

//out.print("<h3>Welcome "+session.getAttribute("username")+"</h3>");
try{
Connection con=(Connection)session.getAttribute("connection");

String query = "select * from draft where fromname='"+session.getAttribute("username")+"'";
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{
String To=rs.getString(1);
String sub=rs.getString(2);
String msg=rs.getString(3);

out.print(" <tr><td>"+To+"</td><td>"+sub+"</td><td>"+msg+"</td></tr>");


 }
}
catch(Exception e)
{
	e.printStackTrace();
}


%>


</table>
</body>
</html>