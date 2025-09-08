<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="servlets.Employee" %>
<%@ page import="servlets.EmployeeService" %>
<%
    // Retrieve parameters from the update form
    Integer employee_id = Integer.valueOf(request.getParameter("employee_id"));
    Integer hotel_id = Integer.valueOf(request.getParameter("hotel_id"));
    String first_name = request.getParameter("first_name");
    String last_name = request.getParameter("last_name");
    String street_number = request.getParameter("street_number");
    String street_name = request.getParameter("street_name");
    String zip = request.getParameter("zip");
    String city = request.getParameter("city");
    String province_state = request.getParameter("province_state");
    String country = request.getParameter("country");

    // Create an Employee object with the updated details
    Employee updatedEmployee = new Employee(employee_id, hotel_id, first_name, last_name,
            street_number, street_name, zip, city,
            province_state, country);

    EmployeeService es = new EmployeeService();
    String message = "";
    try {
        es.updateEmployee(updatedEmployee);
        message = "Profile updated successfully.";
    } catch(Exception e) {
        message = "Error updating profile: " + e.getMessage();
    }

    session.setAttribute("profileMessage", message);
    // Redirect back to employeeprofile.jsp to display updated details
    response.sendRedirect("employeeprofile.jsp?employee_id=" + employee_id);
%>