<%@page import="com.student.domain.AcademicUnit"%>
<%@page import="com.student.domain.Semester"%>
<%@page import="com.student.domain.Teacher"%>
<%@page import="com.student.service.TeacherImpl"%>
<%@page import="com.student.domain.CourseDefinition"%>
<%@page import="com.student.service.AcademicUnitInterface"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.student.service.CourseInterface" %>
<%@ page import="com.student.service.CourseImpl" %>
<%@ page import="com.student.domain.Course" %>

<%
    try {
        
        Integer selectedValue = Integer.parseInt(request.getParameter("course"));
        CourseDefinition coursedef=new CourseDefinition();
        coursedef.setId(selectedValue);
        Integer selectedVal = Integer.parseInt(request.getParameter("semester"));
        Integer selected=Integer.parseInt(request.getParameter("academic"));
        AcademicUnit unit=new AcademicUnit();
        unit.setId(selected);
        Semester sem=new Semester();
        sem.setSemid(selectedVal);
        Course course=new Course(coursedef,sem,unit);
        CourseInterface crs= new CourseImpl();
        crs.insertCourse(course);

        
            request.setAttribute("message", "Saved successfully!");
            request.getRequestDispatcher("DashBoard.jsp").forward(request, response);
        
        
    } catch (Exception ex) {
        ex.printStackTrace();
        request.setAttribute("message", "Something went wrong!" +ex.getMessage());
        request.getRequestDispatcher("ErrorPage.jsp").forward(request, response);
    }
%>