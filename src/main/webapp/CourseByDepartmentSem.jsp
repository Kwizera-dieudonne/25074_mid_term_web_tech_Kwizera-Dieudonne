 <%@page import="com.student.domain.Course"%>
<%@page import="com.student.service.CourseImpl"%>
<%@page import="com.student.service.CourseInterface"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%
Integer semid=Integer.parseInt(request.getParameter("sems"));
Integer acaid=Integer.parseInt(request.getParameter("acads"));
System.out.println(semid);
System.out.println(acaid);
CourseInterface courses=new CourseImpl();
 List<Course>courseAca=courses.getCourseByDepAndSemester(acaid, semid);
 session.setAttribute("coursesAca", courseAca);
 response.sendRedirect("CourseperDepSem.jsp");  
%>
