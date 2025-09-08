<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ page import="servlets.Customer" %>
<%@ page import="servlets.CustomerService" %>
<%@ page import="java.sql.Date" %>
<%
    // Retrieve the primary keys from the request parameters
    Integer customer_id = Integer.valueOf(request.getParameter("customer_id"));
    String id_type = request.getParameter("id_type");

    // Instantiate the CustomerService and get the customer details
    CustomerService cs = new CustomerService();
    Customer customer = null;
    try {
        customer = cs.getCustomer(customer_id, id_type);
    } catch (Exception ex) {
        System.out.println("<p>Error retrieving customer details: " + ex.getMessage() + "</p>");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Profile</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f0f0f0; margin: 0; padding: 20px; }
        .container { width: 60%; margin: auto; background: #fff; padding: 20px; border-radius: 5px; }
        label { display: inline-block; width: 150px; margin-bottom: 10px; }
        input[type="text"], input[type="date"] { width: 300px; padding: 5px; margin-bottom: 10px; }
        .button { padding: 10px 20px; margin: 10px; font-size: 16px; }
    </style>
</head>
<body>
<div class="container">
    <h1>Your Profile</h1>
    <%
        if (customer == null) {
    %>
    <p>Customer not found.</p>
    <%
    } else {
    %>
    <!-- Form to update customer details -->
    <form action="updatecustomercontroller.jsp" method="post">
        <input type="hidden" name="customer_id" value="<%= customer.getCustomer_id() %>">
        <input type="hidden" name="id_type" value="<%= customer.getId_type() %>">

        <label for="first_name">First Name:</label>
        <input type="text" id="first_name" name="first_name" value="<%= customer.getFirst_name() %>" required><br>

        <label for="last_name">Last Name:</label>
        <input type="text" id="last_name" name="last_name" value="<%= customer.getLast_name() %>" required><br>

        <label for="street_number">Street Number:</label>
        <input type="text" id="street_number" name="street_number" value="<%= customer.getStreet_number() %>" required><br>

        <label for="street_name">Street Name:</label>
        <input type="text" id="street_name" name="street_name" value="<%= customer.getStreet_name() %>" required><br>

        <label for="ZIP">ZIP:</label>
        <input type="text" id="ZIP" name="ZIP" value="<%= customer.getZip() %>" required><br>

        <label for="city">City:</label>
        <input type="text" id="city" name="city" value="<%= customer.getCity() %>" required><br>

        <label for="province_state">Province/State:</label>
        <input type="text" id="province_state" name="province_state" value="<%= customer.getProvince_state() %>" required><br>

        <label for="country">Country:</label>
        <input type="text" id="country" name="country" value="<%= customer.getCountry() %>" required><br>

        <label for="date_of_registration">Date of Registration:</label>
        <input type="date" id="date_of_registration" name="date_of_registration" value="<%= customer.getDate_of_registration() %>" required><br>

        <button class="button" type="submit">Update Profile</button>
    </form>

    <!-- Form to delete the customer profile -->
    <form action="deletecustomercontroller.jsp" method="post" onsubmit="return confirm('Are you sure you want to delete your profile?');">
        <input type="hidden" name="customer_id" value="<%= customer.getCustomer_id() %>">
        <input type="hidden" name="id_type" value="<%= customer.getId_type() %>">
        <button class="button" type="submit">Delete Profile</button>
    </form>
    <%
        }
    %>
    <br>
</div>
<div style="
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    text-align: center;
    padding: 10px 0;
    background: white;
">
    <a href="index.jsp">Back to Home Page</a>
</div>
</body>
</html>
