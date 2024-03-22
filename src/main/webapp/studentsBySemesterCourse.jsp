 <%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.student.service.StudentRegistrationInterface" %>
<%@ page import="com.student.service.StudentRegImpl" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.student.domain.StudentRegistration" %>


<%
Integer semid=Integer.parseInt(request.getParameter("sems"));
Integer courseid=Integer.parseInt(request.getParameter("cours"));
System.out.println(semid);
System.out.println(courseid);
 StudentRegistrationInterface reg=new StudentRegImpl();
 List<StudentRegistration> students=reg.studperSemCourse(courseid, semid);
 session.setAttribute("studeCourses", students);
 response.sendRedirect("studentsperSemesterCourse.jsp");
 
   
%>
