 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.student.service.StudentInterface" %>
<%@ page import="com.student.service.StudentImpl" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.student.domain.Student" %>


<jsp:useBean id="students" class="com.student.domain.Student" scope="session" />
<%
    try {
    	String studentid=request.getParameter("regNo");
    	String fname=request.getParameter("firstName");
    	String lname=request.getParameter("lastName");
    	String email=request.getParameter("email");
    	String phone=request.getParameter("phone");
    	String date=request.getParameter("dateOfBirth");
    	if(!studentid.isEmpty() && studentid !=null || !fname.isEmpty() && fname !=null || !lname.isEmpty() && lname !=null || !email.isEmpty() && email !=null
    			|| !phone.isEmpty() && phone !=null || !date.isEmpty() && date !=null){
        students.setRegNo(studentid);
        students.setFirstName(fname);
        students.setLastName(lname);
        students.setEmail(email);
        students.setPhone(phone);
        students.setDob(date);
        

        
        StudentInterface studentInt = new StudentImpl();
        studentInt.insertStudent(students);
       
          request.setAttribute("message", "Saved successfully!");
            request.getRequestDispatcher("home.jsp").forward(request, response);
    	}
    	else{
    		request.setAttribute("message", "Provide All! Info");
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
    	}
    } catch (Exception ex) {
        ex.printStackTrace();
        request.setAttribute("message", "Something went wrong!" +ex.getMessage());
        request.getRequestDispatcher("Signup.jsp").forward(request, response);
    }
%>
