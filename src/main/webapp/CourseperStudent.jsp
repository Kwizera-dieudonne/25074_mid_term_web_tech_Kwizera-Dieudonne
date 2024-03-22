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
 <h2>Courses Per Student</h2>
               <form action="CourseByStudent.jsp" method="post">
            <label for="student">Choose Student</label>
             <select id="student" name="students">
                 <option value="select Student">Select Your ID</option>
               <%  
             StudentRegistrationInterface stuCourse=new StudentRegImpl();
            List<StudentRegistration> stCours=stuCourse.selectAllStudents();
            for(StudentRegistration stc: stCours){
            %>
            	 
                        <option value=<%=stc.getStudent().getId()%>><%=stc.getStudent().getRegNo()%></option>
            
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
                         <th>Course Name</th>
                    </tr>
                    </thead>
                   <tbody>
                    <%
                    List<Course> stuCoursess=(List<Course>)session.getAttribute("stuCourse");
                    if( stuCoursess !=null){
                    for (Course stuca: stuCoursess) {
                        %>
                        <tr>
                            <td><%=stuca.getCoursd().getCode()%></td>
                            <td><%=stuca.getCoursd().getName()%></td>
                
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