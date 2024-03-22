<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.student.domain.CourseDefinition" %>
<%@ page import="com.student.service.CourseDefinitionInterface" %>
<%@ page import="com.student.service.CourseDefinitionImpl" %>
<%@ page import="java.time.LocalDate" %>


<jsp:useBean id="def" class="com.student.domain.CourseDefinition"/>
<%
  try {

    def.setCode(request.getParameter("code"));
    def.setName(request.getParameter("name"));
    def.setDescriptions(request.getParameter("description"));
   CourseDefinitionInterface ints=new CourseDefinitionImpl();
   ints.insertCourseDefinition(def);
   
    
      request.setAttribute("message", "Saved successfully!");
      request.getRequestDispatcher("DashBoard.jsp").forward(request, response);
  } catch (Exception ex) {
    ex.printStackTrace();
    request.setAttribute("message", "Something went wrong!" +ex.getMessage());
    request.getRequestDispatcher("ErrorPage.jsp").forward(request, response);
  }
%>