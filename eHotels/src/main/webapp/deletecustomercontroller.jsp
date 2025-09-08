<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="servlets.CustomerService" %>
<%
    // Retrieve the customer keys from the delete form
    Integer customer_id = Integer.valueOf(request.getParameter("customer_id"));
    String id_type = request.getParameter("id_type");

    CustomerService cs = new CustomerService();
    String message = "";
    try {
        // Call the delete method
        cs.deleteCustomer(customer_id, id_type);
        message = "Profile deleted successfully.";
    } catch(Exception e) {
        message = "Error deleting profile: " + e.getMessage();
    }

    // set a session message to show on the homepage
    session.setAttribute("profileMessage", message);

    // After deletion, redirect the user to the index
    response.sendRedirect("index.jsp");
%>
