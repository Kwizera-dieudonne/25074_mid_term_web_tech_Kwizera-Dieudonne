<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<!DOCTYPE html>
<html>
<head>
<title>Student Per Semester</title>
<link href="formst.css" rel="stylesheet">
</head>
<body>

<div id="CourseDepartment" class="stud">
 <h2>Courses per Department and Semester</h2>
              <form action="CourseByDepartmentSem.jsp" method="post">
            <label for="semester">Choose Semester</label>
             <select id="semester" name="sems">
                 <option value="select Semester">Select Your Semester</option>
               <%  
             SemesterInterface semCourses= new SemesterImpl();
            List<Semester> semCours=semCourses.selectAllSemesters();
            for(Semester semc: semCours){
            %>
            	 
                        <option value=<%=semc.getSemid()%>><%=semc.getSemid()%></option>
            
            	<%
            }
           
              %>
             
                </select><br>
                <label for="Academic">Choose Academic</label>
             <select id="academic" name="acads">
                 <option value="select Academic">Select Acamedic</option>
               <%  
               AcademicUnitInterface acades=new AcademicUnitImpl();
             List<AcademicUnit> courAcads=acades.selectAllAcademicUnit(); 
            for(AcademicUnit acade: courAcads){
            %>
            	 
                        <option value=<%=acade.getId()%>><%=acade.getName()%></option>
            
            	<%
            }
           
              %>
             
                </select><br>
                
                <button type="submit" value="Search">Search</button>
            
             </form>
             
              <table class="table">
                    <thead>
                    <tr class="header blue">
                       <th>Course Code</th>
                         <th>Course</th>
                    </tr>
                    </thead>
                   <tbody>
                    <%
                    List<Course> courseAcad=(List<Course>)session.getAttribute("coursesAca");
                    if( courseAcad !=null){
                    for (Course caca: courseAcad) {
                        %>
                        <tr>
                            <td><%=caca.getCoursd().getCode()%></td>
                            <td><%=caca.getCoursd().getName()%></td>
                
                            <td>
                                
                            </td>
                        </tr>
                        <%
                            }
                    }
                        %> 
                        </tbody>
                </table> 
             <a href="DashBoard.jsp">Return to DashBoard</a>
             
             
             </div>
            
</body>
</html>