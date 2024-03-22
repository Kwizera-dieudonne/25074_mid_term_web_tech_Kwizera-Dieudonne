<%@page import="com.student.service.AcademicUnitInterface"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.student.service.AcademicUnitImpl" %>
<%@ page import="com.student.service.StudentInterface" %>
<%@ page import="com.student.domain.AcademicUnit" %>

<%
    try {
        String code=request.getParameter("code");;
        String Name=request.getParameter("name");
        String selectedValue = request.getParameter("academicUnity");
        AcademicUnit.UnityType selectedAcademic = AcademicUnit.UnityType.valueOf(selectedValue);
        Integer parentId=null;
       String parentIdString=request.getParameter("parentid");
       if (parentIdString != null && !parentIdString.isEmpty()) {
           parentId = Integer.parseInt(parentIdString);
       }
       
       AcademicUnit parentUnit = null;
       if (parentId != null) {
           parentUnit = new AcademicUnit();
           parentUnit.setId(parentId);
       }

       AcademicUnit academic=new AcademicUnit(code,Name,selectedAcademic,parentUnit);
        
        AcademicUnitInterface acad=new AcademicUnitImpl();
        acad.insertAcademicUnit(academic);

        
            request.setAttribute("message", "Saved successfully!");
            request.getRequestDispatcher("DashBoard.jsp").forward(request, response);
        
        
    } catch (Exception ex) {
        ex.printStackTrace();
        request.setAttribute("message", "Something went wrong!" +ex.getMessage());
        request.getRequestDispatcher("ErrorPage.jsp").forward(request, response);
    }
%>