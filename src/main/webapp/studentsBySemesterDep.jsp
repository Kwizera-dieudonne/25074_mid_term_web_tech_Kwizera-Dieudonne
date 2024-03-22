 <%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.student.service.StudentRegistrationInterface" %>
<%@ page import="com.student.service.StudentRegImpl" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.student.domain.StudentRegistration" %>


<%
Integer semid=Integer.parseInt(request.getParameter("sems"));
Integer acaid=Integer.parseInt(request.getParameter("acs"));
System.out.println(semid);
System.out.println(acaid);
 StudentRegistrationInterface reg=new StudentRegImpl();
 List<StudentRegistration> students=reg.studperSemAndDep(acaid, semid);
 session.setAttribute("studs", students);
 response.sendRedirect("studentByDep.jsp");
 
   
%>
