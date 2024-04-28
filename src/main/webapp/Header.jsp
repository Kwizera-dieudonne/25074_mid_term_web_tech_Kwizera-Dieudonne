<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="Header.css" rel="stylesheet">
</head>
<body>
<%
    // Retrieve user role from session
    String userRole = (String) session.getAttribute("userRole");
%>
<nav class="navbar">
<div class="navbar_logo">
<img alt="logo" src="images/download2.png"><br>

</div>
<div class="navbar_content">
<ul class="navbar_links">
<%
    // Customize navbar based on user role
    if (userRole != null) {
        if (userRole.equalsIgnoreCase("admin")) {
%>
            <li class="link"><a href="/">Home</a></li>
			<li class="link"><a href="ErrorPage.jsp">About</a></li>
			<li class="link"><a href="/">Admission</a></li>
			<li class="link"><a href="StudentHome.jsp">Academics</a></li>
             <li class="link"><a href="TeacherHome.jsp">Media Center</a></li>
              <li class="link"><a href="TeacherHome.jsp">Research</a></li>
              <li class="link"><a href="StudentRegistration.jsp">Apply</a></li>
              <li class="link"><a href="DashBoard.jsp">DashBoard</a></li>
<%
        } else if (userRole.equalsIgnoreCase("teacher")) {
%>
        <li class="link"><a href="/">Home</a></li>
		<li class="link"><a href="ErrorPage.jsp">About</a></li>
			<li class="link"><a href="/">Admission</a></li>
             <li class="link"><a href="TeacherHome.jsp">Media Center</a></li>
              <li class="link"><a href="TeacherHome.jsp">Research</a></li>
<%
        }
        else if (userRole.equalsIgnoreCase("student")) {
        	%>
        	        <li class="link"><a href="/">Home</a></li>
        			<li class="link"><a href="ErrorPage.jsp">About</a></li>
        				<li class="link"><a href="/">Admission</a></li>
        	             <li class="link"><a href="StudentHome.jsp">Academics</a></li>
        	              <li class="link"><a href="StudentRegistration.jsp">Apply</a></li>
        	<%
        	        }
        
    }
%>
 <li class="link"><a href="index.jsp">Logout</a></li>

</ul>
</div>
</nav>
</body>
</html>