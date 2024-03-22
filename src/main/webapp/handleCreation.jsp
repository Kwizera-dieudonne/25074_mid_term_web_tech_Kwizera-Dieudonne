<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.student.service.*" %>
    <%@ page import="com.student.domain.Users" %>
<jsp:useBean id="users" class="com.student.domain.Users" scope="session"/>
<%
 try{
	String fname=request.getParameter("firstName");
 	String lname=request.getParameter("lastName");
 	String email=request.getParameter("email");
 	String role=request.getParameter("role");
 	String password=request.getParameter("password");
 	if(!fname.isEmpty() && fname !=null || !lname.isEmpty() && lname !=null || !email.isEmpty() && email !=null
			|| !role.isEmpty() && role !=null || !password.isEmpty() && password !=null){
 		users.setFirstName(fname);
 		users.setLastName(lname);
 		users.setEmail(email);
 		users.setPassword(password);
 		users.setRoles(role);
 		UsersService user=new UsersImplementation();
 		user.insertUsers(users);
      request.setAttribute("message", "Saved successfully!");
        request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
	else{
		request.setAttribute("message", "Provide All! Info");
        request.getRequestDispatcher("SignUp.jsp").forward(request, response);
	}
	 
 }
catch(Exception ex){
	
}





%>