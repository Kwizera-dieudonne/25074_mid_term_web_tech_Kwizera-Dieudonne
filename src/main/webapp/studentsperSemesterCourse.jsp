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

<div id="studentsperSemesterCourse" class="stud">
 <h2>Students Per Semester and Course</h2>
              <form action="studentsBySemesterCourse.jsp" method="post">
            <label for="semester">Choose Semester</label>
             <select id="semester" name="sems">
                 <option value="select Semester">Select Your Semester</option>
               <%  
             SemesterInterface smssms= new SemesterImpl();
            List<Semester> semCourse=smssms.selectAllSemesters();
            for(Semester secr: semCourse){
            %>
            	 
                        <option value=<%=secr.getSemid()%>><%=secr.getSemid()%></option>
            
            	<%
            }
           
              %>
             
                </select><br>
                <label for="Course">Choose Course</label>
             <select id="course" name="cours">
                 <option value="select Course">Select Your course</option>
               <%  
             CourseInterface courrses=new CourseImpl();
             List<Course> courseSems=courrses.selectAllCourses(); 
            for(Course crss: courseSems){
            %>
            	 
                        <option value=<%=crss.getCourseid()%>><%=crss.getCoursd().getCode()%></option>
            
            	<%
            }
           
              %>
             
                </select><br>
                
                 <button type="submit" value="Search">Search</button>
            
             </form>
             
              <table class="table">
                    <thead>
                    <tr class="header blue">
                       <th>student ID</th>
                         <th>student Names</th>
                        <th>Email</th>
                    </tr>
                    </thead>
                   <tbody>
                    <%
                    List<StudentRegistration> stuCourses=(List<StudentRegistration>)session.getAttribute("studeCourses");
                    System.out.println(stuCourses);
                    if(stuCourses !=null){
                    for (StudentRegistration stuC: stuCourses) {
                        %>
                        <tr>
                            <td><%=stuC.getStudent().getRegNo()%></td>
                            <td><%=stuC.getStudent().getFirstName()+" "+stuC.getStudent().getLastName()%></td>
                            <td><%=stuC.getStudent().getEmail()%></td>
                
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