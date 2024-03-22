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

<div id="studentsperSemesterDepartment" class="stud">
 <h2>Students Per Semester and Department</h2>
               <form action="studentsBySemesterDep.jsp" method="post">
            <label for="semester">Choose Semester</label>
             <select id="semester" name="sems">
                 <option value="select Semester">Select Your Semester</option>
               <%  
             SemesterInterface smssm= new SemesterImpl();
            List<Semester> semDep=smssm.selectAllSemesters();
            for(Semester seDp: semDep){
            %>
            	 
                        <option value=<%=seDp.getSemid()%>><%=seDp.getSemid()%></option>
            
            	<%
            }
           
              %>
             
                </select><br>
                <label for="academic">Choose Academic</label>
             <select id="academic" name="acs">
                 <option value="select Academic">Select Your academic</option>
               <%  
             AcademicUnitInterface acaDep=new AcademicUnitImpl();
             List<AcademicUnit> acaDeps=acaDep.selectAllAcademicUnit();
            for(AcademicUnit acd:acaDeps){
            %>
            	 
                        <option value=<%=acd.getId()%>><%=acd.getName()%></option>
            
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
                    List<StudentRegistration> stuRegs=(List<StudentRegistration>)session.getAttribute("studs");
                    if(stuRegs !=null){
                    for (StudentRegistration stss: stuRegs) {
                        %>
                        <tr>
                            <td><%=stss.getStudent().getRegNo()%></td>
                            <td><%=stss.getStudent().getFirstName()+" "+stss.getStudent().getLastName()%></td>
                            <td><%=stss.getStudent().getEmail()%></td>
                
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