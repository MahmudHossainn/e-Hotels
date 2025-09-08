<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="servlets.Customer" %>
<%@ page import="servlets.CustomerService" %>
<%@ page import="java.sql.Date" %>
<%
    // Retrieve parameters from the update form
    Integer customer_id = Integer.valueOf(request.getParameter("customer_id"));
    String id_type = request.getParameter("id_type");
    String first_name = request.getParameter("first_name");
    String last_name = request.getParameter("last_name");
    String street_number = request.getParameter("street_number");
    String street_name = request.getParameter("street_name");
    String ZIP = request.getParameter("ZIP");
    String city = request.getParameter("city");
    String province_state = request.getParameter("province_state");
    String country = request.getParameter("country");
    String dateStr = request.getParameter("date_of_registration");
    java.sql.Date date_of_registration = java.sql.Date.valueOf(dateStr);

    // Create a Customer object with updated details
    Customer updatedCustomer = new Customer(customer_id, id_type, first_name, last_name,
            street_number, street_name, ZIP, city, province_state, country, date_of_registration);

    CustomerService cs = new CustomerService();
    String message = "";
    try {
        // Call the update method
        cs.updateCustomer(updatedCustomer);
        message = "Profile updated successfully.";
    } catch(Exception e) {
        message = "Error updating profile: " + e.getMessage();
    }
    session.setAttribute("profileMessage", message);

    // Redirect back to customerprofile.jsp
    response.sendRedirect("customerprofile.jsp?customer_id=" + customer_id + "&id_type=" + id_type);
%>