<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="servlets.EmployeeService" %>
<%
    // Retrieve the employee_id from the form
    Integer employee_id = Integer.valueOf(request.getParameter("employee_id"));

    EmployeeService es = new EmployeeService();
    String message = "";
    try {
        es.deleteEmployee(employee_id);
        message = "Profile deleted successfully.";
    } catch(Exception e) {
        message = "Error deleting profile: " + e.getMessage();
    }

    session.setAttribute("profileMessage", message);
    // After deletion, redirect to index.jsp
    response.sendRedirect("index.jsp");
%>