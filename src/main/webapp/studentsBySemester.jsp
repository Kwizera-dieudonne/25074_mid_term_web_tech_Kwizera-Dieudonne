 <%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.student.service.StudentRegistrationInterface" %>
<%@ page import="com.student.service.StudentRegImpl" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.student.domain.StudentRegistration" %>


<%
Integer semid=Integer.parseInt(request.getParameter("sems"));
System.out.println(semid);
 StudentRegistrationInterface reg=new StudentRegImpl();
 List<StudentRegistration> students=reg.studentsperSem(semid);
 session.setAttribute("studts", students);
 response.sendRedirect("studentsperSemester.jsp");
 
   
%>
