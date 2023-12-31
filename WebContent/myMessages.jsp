<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Messages</title>
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> 
<style>
@import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
body {
    font-family: 'Poppins', sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    background-image: url('img/white-concrete-wall.jpg');
    background-size: cover;
    
}

.title{
	margin: 30px;
    padding: 20px;
    padding-top: 10px;
    color: #333;
    text-align:center;
}

.msg-container {
    margin: 30px;
    padding: 20px;
    padding-top: 10px;
    background-color: rgb(0, 123, 255, 0.2);
    border: 2px solid #007bff;
    border-radius: 10px;
    color: #333;
}

#msg-info {
    max-width: 800px;
    margin: 0 auto;
    text-align: center;
}

table {
    width: 100%;
    border-collapse: separate; /* Use separate instead of collapse */
    margin-top: 20px;
    border-radius: 10px;
    overflow: hidden;
    border: 2px solid rgb(0, 123, 255);
}

th, td {
    padding: 10px;
    text-align: left;
    border-collapse:separate;
    border: 1px solid  rgba(0, 123, 255, 0.25);
    border-radius: 100px;
    overflow: hidden;
}

th {
    background-color: #007bff;
    color: #fff;
}
/* Add this CSS to center the button container and center-align the buttons */

.button-container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top:20px;
}

.action-button {
    padding: 10px 20px;
    margin: 0 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    text-decoration: none;
    display: inline-block;
    transition: background-color 0.3s;
    color: #fff;
}

.update-button {
    background-color: #4CAF50; /* Green color */
}

.delete-button {
    background-color: #FF5733; /* Red color */
}

.back-button {
    background-color: #007bff;
}

.action-button:hover {
    background-color: #0056b3;
}


</style>
</head>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.Objects" %>

<%
	HttpSession session1 = request.getSession(false);
    String userName = (session1 != null) ? (String) session1.getAttribute("UserName") : null;
%>

<body style="background-image: url('img/white-concrete-wall.jpg');
background-size: cover;
background-repeat: no-repeat;">
   
    <header class="header">
        <div class="hcontainer">
            <nav class="navbar">
               <div class="logo"><a href="#"><img src="img/logo.jpg" alt="logo"></a></div>
               <ul class="nav-links">
                    <li><a href="index.jsp">Home</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropbtn">Services</a>
                        <div class="dropdown-content">
                            <a href="#">Book an Appointment</a>
                            <a href="#">Order Medicine</a>
                        </div>
                    </li>
                    <li><a href="about_us.jsp">About Us</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                </ul>
                <div class="nav-buttons">
                    <% if (userName != null) { %>
                    <a href="displayappointments.jsp" class="sbutton">My Appointments</a>
                    <a href="user_info.jsp" class="sbutton"><%=userName %></a>
                    <a href="logout.jsp" class="sbutton">Logout</a>
                <% } else { %>  	
                    <a href="register.jsp" class="sbutton">Sign Up</a>
                    <a href="login.jsp" class="sbutton">Sign In</a>
                <% } %>
                </div>
            </nav>
        </div>
        
    </header>
    <div class=title><h2>My messages</h2></div>

<c:forEach var="msg" items="${messages}">
	
	<c:set var="id" value="${msg.msgId }"/>
	<c:set var="name" value="${msg.name}"/>
	<c:set var="email" value="${msg.email}"/>
	<c:set var="phone" value="${msg.phone}"/>
	<c:set var="subject" value="${msg.subject}"/>
	<c:set var="message" value="${msg.message}"/>
	
	<c:url value="UpdateMessage.jsp" var="msgupdate">
	<c:param name="id" value="${msg.msgId}"></c:param>
	<c:param name="name" value="${msg.name}"></c:param>
	<c:param name="email" value="${msg.email}"></c:param>
	<c:param name="phone" value="${msg.phone}"></c:param>
	<c:param name="subject" value="${msg.subject}"></c:param>
	<c:param name="message" value="${msg.message}"></c:param>
	</c:url>
	
	<c:url value="DeleteMessage.jsp" var="msgdelete">
	<c:param name="id" value="${msg.msgId}"></c:param>
	<c:param name="name" value="${msg.name}"></c:param>
	<c:param name="email" value="${msg.email}"></c:param>
	<c:param name="phone" value="${msg.phone}"></c:param>
	<c:param name="subject" value="${msg.subject}"></c:param>
	<c:param name="message" value="${msg.message}"></c:param>
	</c:url>
   
    <div class="msg-container">
        <div id="msg-info">
            <table>
                <tr>
                    <td>Message ID</td>
                    <td> ${msg.msgId }</td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td> ${msg.name}</td>
                </tr>
                <tr>
                    <td>E-mail</td>
                    <td>${msg.email}</td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td>${msg.phone}</td>
                </tr>
                <tr>
                    <td>Subject</td>
                    <td>${msg.subject}</td>
                </tr>
                <tr>
                    <td>Message</td>
                    <td>${msg.message}</td>
                </tr>
            </table>
        </div>
        <div class="msgUD">
		    <div class="button-container">
		    	<a href="${msgupdate}"> <button class="action-button update-button" type="submit">Update</button></a>
		        <a href="${msgdelete}"><button class="action-button delete-button" type="Submit">Delete</button></a>
		        <a href="contact.jsp"><button class="action-button back-button">Back</button></a>
		    </div>
		</div>
    </div>
</c:forEach>





<footer class="footer">
        <div class="fcontainer">
            <div class="row">
                <div class="footer-col">
                    <h4>Company</h4>
                    <ul>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Privacy Policies</a></li>
                        <li><a href="#">T & C</a></li>
                        <li><a href="#">Blog</a></li>
                    </ul>
                </div>               
                <div class="footer-col">
                    <h4>Get Help</h4>
                    <ul>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">Live Chat</a></li>
                        <li><a href="#">Refund</a></li>
                    </ul>
                </div>               
 
                <div class="footer-col">
                    <h4>Payment</h4>
                    <div class="payment-links">
                        <a href="#"><i class="fab fa-cc-visa"></i></a>
                        <a href="#"><i class="fab fa-cc-mastercard"></i></a>
                        <a href="#"><i class="fab fa-cc-amex"></i></a>
                        <a href="#"><i class="fab fa-cc-paypal"></i></a>
                    </div>
                </div>
                <div class="footer-col">
                    <h4>follow us</h4>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
            </div>
        </div>
                <div class="copyright"> <p>&copy; 2023 E-Channelling</p>
            <p><a href="#"> By NexTech Visionaries</a></p>
        </div>
    </footer>


</body>
</html>