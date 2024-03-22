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

 <div id="studentsperSemester" class="stud">
            <h2>Students Per Semester</h2>
               <form action="studentsBySemester.jsp" method="post">
            <label for="semester">Choose Semester</label>
             <select id="semester" name="sems">
                 <option value="select Semester">Select Your Semester</option>
               <%  
             SemesterInterface smss= new SemesterImpl();
            List<Semester> semss=smss.selectAllSemesters();
            for(Semester sess: semss){
            %>
            	 
                        <option value=<%=sess.getSemid()%>><%=sess.getSemid()%></option>
            
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
                    List<StudentRegistration> sss=(List<StudentRegistration>)session.getAttribute("studts");
                    System.out.println(sss);
                    if(sss !=null){
                    for (StudentRegistration sts: sss) {
                        %>
                        <tr>
                            <td><%=sts.getStudent().getRegNo()%></td>
                            <td><%=sts.getStudent().getFirstName()+" "+sts.getStudent().getLastName()%></td>
                            <td><%=sts.getStudent().getEmail()%></td>
                
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