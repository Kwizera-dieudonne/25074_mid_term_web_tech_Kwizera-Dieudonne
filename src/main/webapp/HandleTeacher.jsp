<%@page import="com.student.domain.Course"%>
<%@page import="com.student.service.AcademicUnitInterface"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.student.service.TeacherImpl" %>
<%@ page import="com.student.service.TeacherInterface" %>
<%@ page import="com.student.domain.Teacher" %>

<%
    try {
        String code=request.getParameter("code");;
        String Name=request.getParameter("names");
        String selectedValue = request.getParameter("qualification");
        Teacher.Qualification selectedQualification = Teacher.Qualification.valueOf(selectedValue);
        String selectedRole=request.getParameter("role");
        Teacher.Role roles=Teacher.Role.valueOf(selectedRole);
        Integer ids=Integer.parseInt(request.getParameter("course"));
        Course course=new Course();
        course.setCourseid(ids);

      Teacher teacher= new Teacher(code,Name,selectedQualification,roles,course);
        
      TeacherInterface teach= new TeacherImpl();
      teach.insertTeacher(teacher);

        
            request.setAttribute("message", "Saved successfully!");
            request.getRequestDispatcher("DashBoard.jsp").forward(request, response);
        
        
    } catch (Exception ex) {
        ex.printStackTrace();
        request.setAttribute("message", "Something went wrong!" +ex.getMessage());
        request.getRequestDispatcher("ErrorPage.jsp").forward(request, response);
    }
%>