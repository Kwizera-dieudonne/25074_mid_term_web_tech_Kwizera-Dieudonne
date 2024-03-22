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
    <title>Title</title>
    <link href="DashBoard.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.19.0/feather.min.js"></script>

</head>
<body>
<body>
<div class="page">
    <div class="sidebar">
        <h3>Admin Dashbord</h3>
        <a href="home.jsp">Back</a>
        <div class="links" onclick="">
            <ul>
             <li><a href="#home" class="toggle-section"><i class="fa fa-list-ol" aria-hidden="true"></i>Home</a></li>
                 <li><a href="#studentReg"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Register Student</a></li>
                <li><a href="#Regstudent" class="toggle-section" data-section="student-details"><i class="fa fa-list-ol" aria-hidden="true"></i> Registered Students</a></li>
                <li><a href="#form-wrapper"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Save Academic</a></li>
                <li><a href="#list-Academic"><i class="fa fa-list-ol" aria-hidden="true"></i> List Academics</a></li>
                <li><a href="#saveSemester"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Save Semester</a></li>
                <li><a href="#Display-Semester"><i class="fa fa-list-ol" aria-hidden="true"></i> Display Semester</a></li>
                <li><a href="#Course"><i class="fa fa-list-ol" aria-hidden="true"></i> Course</a></li>
                <li><a href="#List-Course"><i class="fa fa-list-ol" aria-hidden="true"></i> List Course</a></li>
                <li><a href="#Course-Definition"><i class="fa fa-list-ol" aria-hidden="true"></i> Course Definition</a></li>
                <li><a href="#List-Course-Definition"><i class="fa fa-list-ol" aria-hidden="true"></i> List Course Definition</a></li>
                <li><a href="#Save-Teacher"><i class="fa fa-list-ol" aria-hidden="true"></i> Save Teacher</a></li>
                <li><a href="#List-Teacher"><i class="fa fa-list-ol" aria-hidden="true"></i> List Teachers</a></li>
                 <li><a href="#student-details" class="toggle-section" data-section="student-details"><i class="fa fa-list-ol" aria-hidden="true"></i>Students Details</a></li>
                  
            </ul>
        </div>
    </div>
    <div class="content-area">
        <div class="content">
        <div id="home" class="homes">
        <h1>Registration DashBoard</h1>
        </div>

           
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
            </div>
                   
             <div id="Regstudent">
                <table class="table">
                    <thead>
                    <tr class="header blue">
                       <th>student ID</th>
                         <th>student Names</th>
                        <th>Academic Unit</th>
                        <th>Semester</th>
                        <th>Courses</th>
                    </tr>
                    </thead>
                   <tbody>
                    <%
                      StudentRegistrationInterface regss= new StudentRegImpl();
            		List<StudentRegistration> registrations=regss.selectAllStudents();

                        for (StudentRegistration regist: registrations) {
                    %>
                    <tr>
                        <td><%= regist.getStudent().getRegNo()%></td>
                        <td><%= regist.getStudent().getFirstName()+" "+regist.getStudent().getLastName()%></td>
                        <td><%= regist.getUnit().getName() %></td>
                        <td><%= regist.getSem().getSemid()%></td>
                        <%
                        List<Course> regCourses=regist.getCourses();
                        for (Course rc:regCourses){
                        	%>
                        	
                        	<td><%=rc.getCoursd().getCode() %></td>
                        	<td><%=rc.getCoursd().getName() %></td>
                        	
                        	<%
                        }
                        %>
                    </tr>
                    <%
                        }
                    %> 
                    </tbody>
                </table>
            </div>

            <div id="form-wrapper">
                <form action="handleAcademic.jsp" method="post">
                    <label for="Codes">Code:</label>
                    <input type="text" id="RegNo" name="code">
                    <br>
                    <label for="name"> Name:</label>
                    <input type="text" id="name" name="name">
                    <br>
                    <label for="academicUnity">Academic Unit:</label>
                    <select id="academicUnity" name="academicUnity">
                        <option value="PROGRAMME">PROGRAMME</option>
                        <option value="FACULTY">FACULTY</option>
                        <option value="DEPARTMENT">DEPARTMENT</option>
                    </select>
                    <br>
                    <label for="ParentId"> Parent ID:</label>
                    <select id="parentid" name="parentid">
                <option value="">Parent unit</option>
               <%  
             AcademicUnitInterface aca= new AcademicUnitImpl();
            List<AcademicUnit> acas=aca.selectAllAcademicUnit();
            for(AcademicUnit s: acas){
            %>
            	 
                        <option value=<%=s.getId()%>><%=s.getName()%></option>
            
            	<%
            }
           
              %>
                </select>
                    <button class="btn" type="submit" value="Save">Save</button>
                </form>
            </div>

            <div id="list-Academic">
                <table class="table">
                    <thead>
                    <tr class="header blue">
                       <th>ID</th>
                        <th>Code</th>
                        <th>Name</th>
                        <th>Unit Type</th>
                        <th>Parent Unit</th>
                    </tr>
                    </thead>
                   <tbody>
                    <%
                       AcademicUnitInterface academic= new AcademicUnitImpl();
                        List<AcademicUnit> academicList = academic.selectAllAcademicUnit();

                        for (AcademicUnit academics : academicList) {
                    %>
                    <tr>
                        <td><%= academics.getId() %></td>
                        <td><%= academics.getCode() %></td>
                        <td><%= academics.getName() %></td>
                        <td><%= academics.getUnityType() %></td>
                     <td><%= (academics.getParentUnit() != null) ? academics.getParentUnit().getId() : "N/A" %></td>

         
                    </tr>
                    <%
                        }
                    %> 
                    </tbody>
                </table>
            </div>

            <div id="saveSemester">
                <form action="handleSemester.jsp" method="post">
                    <label for="name"> Name:</label>
                    <input type="text" id="name" name="name">
                    <br>
                     <br>
                    <label for="startdate"> Start Date:</label>
                    <input type="date" id="startdate" name="startDate">
                    <br>
                    <label >EndDate:</label>
                    <input type="date" id="endDate" name="endDate">
                    <br>
                    <br>
                    <button class="btn" type="submit" Value="Save Semester">Save Semester</button>
                </form>
            </div>

            <div id="Display-Semester">
                <table class="table">
                    <thead>
                    <tr class="header blue">
                        <th>Code</th>
                        <th>Name</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        SemesterInterface semesterService = new SemesterImpl();
                       List <Semester> semesters=semesterService.selectAllSemesters();

                        for (Semester sem: semesters) {
                    %>
                    <tr>
                        <td><%=sem.getSemid()%></td>
                        <td><%=sem.getName()%></td>
                        <td><%=sem.getStartdate()%></td>
                        <td><%=sem.getEnddate()%></td>
                        <td>
                            
                        </td>
                    </tr>
                    <%
                        }
                    %> 
                    </tbody>
                </table>
            </div>
            <div id="Course-Definition">
               <form action="handleDefinition.jsp" method="post">
            <label for="code">Code</label>
            <input type="text" id="code" name="code">
            <br>
            <label for="name">Name</label>
            <input type="text" id="name" name="name">
            <br>
            <label for="desc">Description</label>
            <input type="text" id="description" name="description">
            <br>
            <button class="btn" type="submit" value="Save">Save</button>
            </form>
            </div> 
             <div id="List-Course-Definition">
                <table class="table">
                    <thead>
                    <tr class="header blue">
                        <th>Code</th>
                        <th>Name</th>
                        <th>Description</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        CourseDefinitionInterface def=new CourseDefinitionImpl();
                       List <CourseDefinition> courses=def.selectAllCourseDefinitions();

                        for (CourseDefinition course: courses) {
                    %>
                    <tr>
                        <td><%=course.getCode()%></td>
                        <td><%=course.getName()%></td>
                        <td><%=course.getDescriptions()%></td>
                        <td>
                            
                        </td>
                    </tr>
                    <%
                        }
                    %> 
                    </tbody>
                </table>
            </div>
            <div id="Save-Teacher">
               <form action="HandleTeacher.jsp" method="post">
            <label for="code">codes</label>
            <input type="text" id="code" name="code" placeholder="Teacher Codes">
            <br>
            <label for="names">Name:</label>
            <input type="text" id="names" name="names" placeholder="teacher Name">
            <br>
            <label for="Qualification">Qualification:</label>
             <select id="qualification" name="qualification">
                       <option value="Qualifications">Qualification</option>
                        <option value="Masters">Masters</option>
                        <option value="PHD">PHD</option>
                        <option value="PROFESSOR">PROFESSOR</option>
              </select>
              <label for="Role">Role:</label>
             <select id="Role" name="role">
                        <option value="Lecturer">Lecturer</option>
                        <option value="Assistant">Assistant</option>
              </select>
            <br>
            <label for="Course">Course</label>
              <select id="course" name="course">
                <option value="Course">Course</option>
               <%  
             CourseInterface corse=new CourseImpl();
            List<Course> corses=corse.selectAllCourses();
            for(Course c: corses){
            %>
            	 
                        <option value=<%=c.getCourseid()%>><%=c.getCoursd().getCode()%></option>
            
            	<%
            }
           
              %>
                </select>
                <br>
            <button class="btn" type="submit" value="Save"> Save</button>
        </form>
            </div>
            <div id="List-Teacher">
                <table class="table">
                    <thead>
                    <tr class="header blue">
                        <th>ID</th>
                        <th>Teacher ID</th>
                        <th>Name</th>
                        <th>Qualification</th>
                         <th>Role</th>
                         <th>Course</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        TeacherInterface teach=new TeacherImpl();
                       List <Teacher> teachers=teach.selectAllTeachers();

                        for (Teacher teacher: teachers) {
                    %>
                    <tr>
                        <td><%=teacher.getId()%></td>
                        <td><%=teacher.getCodes()%></td>
                        <td><%=teacher.getNames()%></td>
                        <td><%=teacher.getQualification()%></td>
                        <td><%=teacher.getRole()%></td>
                        <td><%=teacher.getCourses().getCoursd().getName()%></td>
                        <td>
                            
                        </td>
                    </tr>
                    <%
                        }
                    %> 
                    </tbody>
                </table>
            </div>
             <div id="Course">
               <form action="HandleCourse.jsp" method="post">
            <label for="code">Course Code</label>
             <select id="course" name="course">
              <option value="select CourseCode">Select CourseCode</option>
            <%  
            CourseDefinitionInterface course= new CourseDefinitionImpl();
            List<CourseDefinition> cs=course.selectAllCourseDefinitions();
           
            for(CourseDefinition crse: cs){
            %>
            	
                      <option value=<%=crse.getId()%>><%=crse.getCode()%></option>
            
            	<%
            	
            }
            
              %>
              </select>
              
              <br>
               <label for="semester">Semester</label>
               <select id="semester" name="semester">
                <option value="select semester">Select Semester</option>
               <%  
             SemesterInterface sem=new SemesterImpl();
            List<Semester> semsss=sem.selectAllSemesters();
            for(Semester s: semsss){
            %>
            	 
                        <option value=<%=s.getSemid()%>><%=s.getSemid()%></option>
            
            	<%
            }
           
              %>
                </select>
              <br>
              <label for="academic">Academic Unit</label>
               <select id="academic" name="academic">
                 <option value="select Academic">Select Academic units</option>
               <%  
             AcademicUnitInterface acass=new AcademicUnitImpl();
            List<AcademicUnit> acs=acass.selectAllAcademicUnit();
            for(AcademicUnit ac: acs){
            %>
            	 
                        <option value=<%=ac.getId()%>><%=ac.getName()%></option>
            
            	<%
            }
           
              %>
             
                </select>
              <br>
            <button class="btn" type="submit" value="Save">Save</button>
            </form>
            </div> 
            <div id="List-Course">
                <table class="table">
                    <thead>
                    <tr class="header blue">
                       <th>course ID</th>
                        <th>Course Code</th>
                        <th>Semester</th>
                        <th>Academic</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                       CourseInterface cr=new CourseImpl();
                       List <Course> ccss =cr.selectAllCourses();

                        for (Course cors: ccss) {
                    %>
                    <tr>
                        <td><%=cors.getCourseid()%></td>
                        <td><%=cors.getCoursd().getCode()%></td>
                        <td><%=cors.getSems().getSemid()%></td>
                        <td><%=cors.getAcademic().getName()%></td>
                        <td>
                            
                        </td>
                    </tr>
                    <%
                        }
                    %> 
                    </tbody>
                </table>
            </div> 
             <div id="student-details">
                <div class="table-container">
                    <table>
                        <thead>
                        <tr>
                            <th>Student ID</th>
                            <th>Registration Number</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>phone</th>
                            <th>Date of Birth</th>
                        </tr>
                        </thead>
                        <tbody>
                      <%
                       StudentInterface stu=new StudentImpl();
                        List<Student> students=stu.selectAllStudents();

                        for (Student student : students) {
                    %>
                    <tr>
                        <td><%= student.getId() %></td>
                        <td><%= student.getRegNo() %></td>
                        <td><%= student.getFirstName() %></td>
                        <td><%= student.getLastName() %></td>
                        <td><%= student.getEmail()%></td>
                       <td><%= student.getPhone()%></td>
                        <td><%= student.getDob()%></td>
                    </tr>
                    <%
                        }
                    %> 
                       
                        </tbody>
                    </table>
                </div>
            </div>
            

        </div>
       
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const toggleLinks = document.querySelectorAll(".links a");

        toggleLinks.forEach(function (link) {
            link.addEventListener("click", function (event) {
                event.preventDefault();

                const sectionId = link.getAttribute("href");
                const sections = document.querySelectorAll(".content > div");

                sections.forEach(function (section) {
                    if ("#" + section.id === sectionId) {
                        section.style.display = "block";
                    } else {
                        section.style.display = "none";
                    }
                });
            });
        });
    });
</script>
</body>
</body>
</html>