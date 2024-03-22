<%@page import="com.student.service.SemesterInterface"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.student.domain.AcademicUnit"%>
<%@page import="com.student.domain.Semester"%>
<%@page import="com.student.domain.Course"%>
<%@page import="com.student.domain.Student"%>
<%@page import="com.student.domain.StudentRegistration"%>
<%@page import="com.student.service.StudentRegistrationInterface"%>
<%@page import="com.student.service.StudentRegImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.student.service.CourseInterface" %>
<%@ page import="com.student.service.CourseImpl" %>
<%@ page import="com.student.domain.Course" %>

<%
    try {
        
        Integer stu = Integer.parseInt(request.getParameter("student"));
        Student stude=new Student();
        stude.setId(stu);
        Integer aca=Integer.parseInt(request.getParameter("academic"));
        AcademicUnit acad= new AcademicUnit();
        acad.setId(aca);
        Integer sem=Integer.parseInt(request.getParameter("semesters"));
        Semester seme=new Semester();
        seme.setSemid(sem);
        LocalDate dates=LocalDate.parse(request.getParameter("dateofreg"));
        Integer cours=Integer.parseInt(request.getParameter("courses"));
        Course course=new Course();
        course.setCourseid(cours);
        CourseInterface csx= new CourseImpl();
        Course cs=csx.selectCourse(cours);
        List<Course> courses= new ArrayList<Course>();
         StudentRegistration regs=new StudentRegistration();
         regs.setRegid(stu);
         StudentRegistrationInterface regis=new StudentRegImpl();
         StudentRegistration re=regis.selectStudent(stu);
        	/* if(re== null && re.getSem()== null || re!=null && re.getSem().getSemid()== sem) */
        		if(cs !=null && cs.getSems().getSemid() <= sem ){
        		    courses.add(course);
                    StudentRegistration registration= new StudentRegistration();
                    registration.setRegDate(dates);
                    registration.setStudent(stude);
                    registration.setSem(seme);
                    registration.setUnit(acad);
                    registration.setCourses(courses);
                    StudentRegistrationInterface reg=new StudentRegImpl();
                    reg.insertStudent(registration);
                    request.setAttribute("message", "Saved successfully!");
                    request.getRequestDispatcher("DashBoard.jsp").forward(request, response);
        	}
        	      else{
        				request.setAttribute("message", "Sorry, You are not Allowed to take this Course! you will study it in above semesters");
                          request.getRequestDispatcher("ErrorPage.jsp").forward(request, response);
        					}
        		
        	/* 
        	 else{ 
        		request.setAttribute("message", "Sorry, You can't be Registered in Two semesters");
                request.getRequestDispatcher("ErrorPage.jsp").forward(request, response);
        		
        	}  */
        	
    } catch (Exception ex) {
        ex.printStackTrace();
        request.setAttribute("message", "Something went wrong!" +ex.getMessage());
        request.getRequestDispatcher("ErrorPage.jsp").forward(request, response);
    }
%>