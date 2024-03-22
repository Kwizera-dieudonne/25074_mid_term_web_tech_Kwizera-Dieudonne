 <%@page import="com.student.domain.Users"%>
<%@page import="com.student.service.UsersImplementation"%>
<%@page import="com.student.service.UsersService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.student.service.StudentInterface" %>
<%@ page import="com.student.service.StudentImpl" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.student.domain.Student" %>


<jsp:useBean id="student" class="com.student.domain.Users" scope="session" />
<%
    try {

    	String email=request.getParameter("email");
    	String password=request.getParameter("password");
    	UsersService users=new UsersImplementation();
    	Users user=users.authenticate(email, password);
    	if(user !=null){
            session.setAttribute("userRole", user.getRoles());

    		if(user.getRoles().equalsIgnoreCase("admin")){
          request.setAttribute("message", "Saved successfully!");
            request.getRequestDispatcher("home.jsp").forward(request, response);
    		}
    		if(user.getRoles().equalsIgnoreCase("teacher")){
    	     request.getRequestDispatcher("home.jsp").forward(request, response);
    			
    		}
    		if(user.getRoles().equalsIgnoreCase("student")){
       	     request.getRequestDispatcher("home.jsp").forward(request, response);
       			
       		}
    	}
    	else{
    		request.setAttribute("message", "Invalid Credentials");
            request.getRequestDispatcher("index.jsp").forward(request, response);
    	}
    } catch (Exception ex) {
        ex.printStackTrace();
        request.setAttribute("message", "Something went wrong!" +ex.getMessage());
        request.getRequestDispatcher("Signup.jsp").forward(request, response);
    }
%>
