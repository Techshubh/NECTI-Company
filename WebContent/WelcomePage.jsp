<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Home</title>

</head>
<style>
h1 {font-family: "Roboto", sans-serif;
margin-top: 60px;}
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
   
      <h1 class="w3-text-teal" align="center">Welcome <%out.print(session.getAttribute("username")); %></h1>
      </div>
	
	
	
</body>
</html>