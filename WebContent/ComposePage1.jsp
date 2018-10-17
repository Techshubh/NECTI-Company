<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,javax.mail.*,javax.mail.internet.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ComposePage</title>
</head>
<style>
Table {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #ddd;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2;}

tr:hover {background-color: #ddd;}

th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
</style>
<body>
<% 
out.print("<h2 align='center'>Compose</h2>");
//out.print("<h3>Welcome "+session.getAttribute("username")+"</h3>"); 

%>

<form>

<table>
<tr>
<th>Mail</th>
<th></th>
<tr>
<td>To:</td>
<td><input type='text' name='To' placeholder='Enter To Email'></td>
</tr>
<tr>
<td>Subject:</td>
<td><input type='text' name='Sub' placeholder='Enter Subject'></td>
</tr>
<tr>
<td>Message:</td>
<td>

<textarea rows="4" cols="50" name='Body' placeholder='Enter a message to send'>
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
	 //Creating a result for getting status that messsage is delivered or not!

    String result;

    // Get recipient's email-ID, message & subject-line from index.html page

    final String to = request.getParameter("To");

    final String subject =request.getParameter("Sub");

    final String messg = request.getParameter("Body");

 

    // Sender's email ID and password needs to be mentioned

    final String from = "shubhamissingle@gmail.com";

    final String pass = "shubhamproveyourself";

 

    // Defining the gmail host

    String host = "smtp.gmail.com";

 

    // Creating Properties object

    Properties props = new Properties();

 

    // Defining properties

    props.put("mail.smtp.host", host);

    props.put("mail.transport.protocol", "smtp");

    props.put("mail.smtp.auth", "true");

    props.put("mail.smtp.starttls.enable", "true");

    props.put("mail.user", from);

    props.put("mail.password", pass);

    props.put("mail.port", "465");

 

    // Authorized the Session object.

    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

        @Override

        protected PasswordAuthentication getPasswordAuthentication() {

            return new PasswordAuthentication(from, pass);

        }

    });

 

    try {

        // Create a default MimeMessage object.

        MimeMessage message = new MimeMessage(mailSession);

        // Set From: header field of the header.

        message.setFrom(new InternetAddress(from));

        // Set To: header field of the header.

        message.addRecipient(Message.RecipientType.TO,

                new InternetAddress(to));

        // Set Subject: header field

        message.setSubject(subject);

        // Now set the actual message

        message.setText(messg);

        // Send message

        Transport.send(message);

        result = "Your mail sent successfully....";

    } catch (MessagingException mex) {

        mex.printStackTrace();

        result = "Error: unable to send mail....";

    }

    if(result!=null)
    {
    	out.println(result);
    }
}
else if(request.getParameter("Draft")!=null)
{	String rst=null;
	try{
		Connection con=(Connection)session.getAttribute("connection");

		String query = "insert into Draft values(?,?,?) ";
		PreparedStatement pr=con.prepareStatement(query);
		pr.setString(1,request.getParameter("To"));
		pr.setString(2, request.getParameter("Sub"));
		pr.setString(3, request.getParameter("Body"));
		pr.executeUpdate();
		rst = "Draft Saved ";
		}
		catch(Exception e)
		{
			rst = "Error";
		}

	if(rst!=null)
	{
		out.println(rst);
	}
}




	

%>


</body>
</html>