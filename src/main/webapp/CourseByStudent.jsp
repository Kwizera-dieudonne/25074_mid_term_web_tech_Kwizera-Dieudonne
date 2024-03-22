 <%@page import="com.student.domain.Course"%>
<%@page import="com.student.service.CourseImpl"%>
<%@page import="com.student.service.CourseInterface"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%
Integer stuid=Integer.parseInt(request.getParameter("students"));
System.out.println(stuid);
CourseInterface courses=new CourseImpl();
 List<Course>stuCourse=courses.getCourseperStudent(stuid);
 session.setAttribute("stuCourse", stuCourse);
 response.sendRedirect("CourseperStudent.jsp");  
%>
