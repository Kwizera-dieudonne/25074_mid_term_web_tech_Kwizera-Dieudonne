<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.student.domain.Semester" %>
<%@ page import="com.student.service.SemesterInterface" %>
<%@ page import="com.student.service.SemesterImpl" %>
<%@ page import="java.time.LocalDate" %>


<jsp:useBean id="semester" class="com.student.domain.Semester"/>
<%
  try {


    semester.setName(request.getParameter("name"));
    semester.setStartdate(LocalDate.parse(request.getParameter("startDate")));
    semester.setEnddate(LocalDate.parse(request.getParameter("endDate")));
    SemesterInterface sem=new SemesterImpl();
    sem.insertSemester(semester);
      request.setAttribute("message", "Saved successfully!");
      request.getRequestDispatcher("DashBoard.jsp").forward(request, response);
  } catch (Exception ex) {
    ex.printStackTrace();
    request.setAttribute("message", "Something went wrong!" +ex.getMessage());
    request.getRequestDispatcher("ErrorPage.jsp").forward(request, response);
  }
%>