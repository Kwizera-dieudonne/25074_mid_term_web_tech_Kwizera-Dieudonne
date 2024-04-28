<%@page import="org.hibernate.Hibernate"%>
<%@page import="com.student.domain.StudentRegistration"%>
<%@page import="com.student.service.StudentRegImpl"%>
<%@page import="com.student.service.StudentRegistrationInterface"%>
<%@page import="com.student.domain.Teacher"%>
<%@page import="com.student.service.TeacherImpl"%>
<%@page import="com.student.service.TeacherInterface"%>
<%@page import="com.student.domain.CourseDefinition"%>
<%@page import="com.student.service.CourseDefinitionImpl"%>
<%@page import="com.student.service.CourseDefinitionInterface"%>
<%@page import="com.student.domain.Student"%>
<%@page import="com.student.service.StudentImpl"%>
<%@page import="com.student.service.StudentInterface"%>
<%@ page import="com.student.service.AcademicUnitInterface" %>
<%@ page import="com.student.service.AcademicUnitImpl" %>
<%@ page import="com.student.domain.AcademicUnit" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.List" %>
<%@ page import="com.student.domain.Semester" %>
<%@ page import="com.student.service.SemesterImpl" %>
<%@ page import="com.student.service.SemesterInterface" %>
<%@ page import="com.student.domain.Course" %>
<%@ page import="com.student.service.CourseImpl" %>
<%@ page import="com.student.service.CourseInterface" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="DashBoard.css" rel="stylesheet">
    <title>Search Student</title>
</head>
<body>

     <div id="studentReg">
               <form action="HandleRegistration.jsp" method="post">
            <label for="student">Student ID</label>
              <select id="student" name="student">
                 <option value="student">Student ID</option>
               <%  
             StudentInterface stus=new StudentImpl();
            List<Student> stds=stus.selectAllStudents();
            for(Student sc: stds){
            %>
            	 
                        <option value=<%=sc.getId()%>><%=sc.getRegNo()%></option>
            
            	<%
            }
           
              %>
             
                </select>
            <br>
            <label for="academic">Academic Unit:</label>
              <select id="academic" name="academic">
                 <option value="select Academic">Select Academic units</option>
               <%  
             AcademicUnitInterface acadu=new AcademicUnitImpl();
            List<AcademicUnit> acu=acadu.selectAllAcademicUnit();
            for(AcademicUnit a: acu){
            %>
            	 
                        <option value=<%=a.getId()%>><%=a.getName()%></option>
            
            	<%
            }
           
              %>
             
                </select>
            <br>
            <label for="lastName">Semester</label>
             <select id="semester" name="semesters">
                 <option value="select Semester">Select Your Semester</option>
               <%  
             SemesterInterface sms= new SemesterImpl();
            List<Semester> sems=sms.selectAllSemesters();
            for(Semester se: sems){
            %>
            	 
                        <option value=<%=se.getSemid()%>><%=se.getSemid()%></option>
            
            	<%
            }
           
              %>
             
                </select>
            <label for="course">Courses</label>
              <select id="courses" name="courses">
                 <option value="select Course">Select Courses</option>
               <%  
             CourseInterface csc=new CourseImpl();
            List<Course> ccs= csc.selectAllCourses();
            for(Course cs: ccs){
            %>
            	 
                        <option value=<%=cs.getCourseid()%>><%=cs.getCoursd().getCode()%></option>
            
            	<%
            }
           
              %>
             
                </select>
            <br>
            <label for="regdate">Registration Date</label>
            <input type="date" id="regdate" name="dateofreg">
            <br>
            <button class="btn" type="submit" value="Register">Register</button>
        </form>
</body>
</html>
