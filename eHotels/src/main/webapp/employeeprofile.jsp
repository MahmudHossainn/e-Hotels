<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ page import="servlets.Employee" %>
<%@ page import="servlets.EmployeeService" %>
<%
    Integer employee_id = Integer.valueOf(request.getParameter("employee_id"));

    EmployeeService es = new EmployeeService();
    Employee employee = null;
    try {
        employee = es.getEmployee(employee_id);
    } catch (Exception ex) {
        System.out.println("<p>Error retrieving employee details: " + ex.getMessage() + "</p>");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Profile</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f0f0f0; margin: 0; padding: 20px; }
        .container { width: 60%; margin: auto; background: #fff; padding: 20px; border-radius: 5px; }
        label { display: inline-block; width: 150px; margin-bottom: 10px; }
        input[type="text"] { width: 300px; padding: 5px; margin-bottom: 10px; }
        .button { padding: 10px 20px; margin: 10px; font-size: 16px; }
    </style>
</head>
<body>
<div class="container">
    <h1>Your Profile</h1>
    <%
        if (employee == null) {
    %>
    <p>Employee not found.</p>
    <%
    } else {
    %>
    <!-- Form to update employee details -->
    <form action="updateemployeecontroller.jsp" method="post">
        <input type="hidden" name="employee_id" value="<%= employee.getEmployee_id() %>">

        <label for="hotel_id">Hotel ID:</label>
        <input type="text" id="hotel_id" name="hotel_id" value="<%= employee.getHotel_id() %>" required><br>

        <label for="first_name">First Name:</label>
        <input type="text" id="first_name" name="first_name" value="<%= employee.getFirst_name() %>" required><br>

        <label for="last_name">Last Name:</label>
        <input type="text" id="last_name" name="last_name" value="<%= employee.getLast_name() %>" required><br>

        <label for="street_number">Street Number:</label>
        <input type="text" id="street_number" name="street_number" value="<%= employee.getStreet_number() %>" required><br>

        <label for="street_name">Street Name:</label>
        <input type="text" id="street_name" name="street_name" value="<%= employee.getStreet_name() %>" required><br>

        <label for="zip">ZIP:</label>
        <input type="text" id="zip" name="zip" value="<%= employee.getZip() %>" required><br>

        <label for="city">City:</label>
        <input type="text" id="city" name="city" value="<%= employee.getCity() %>" required><br>

        <label for="province_state">Province/State:</label>
        <input type="text" id="province_state" name="province_state" value="<%= employee.getProvince_state() %>" required><br>

        <label for="country">Country:</label>
        <input type="text" id="country" name="country" value="<%= employee.getCountry() %>" required><br>

        <button class="button" type="submit">Update Profile</button>
    </form>

    <!-- Form to delete the employee profile -->
    <form action="deleteemployeecontroller.jsp" method="post" onsubmit="return confirm('Are you sure you want to delete your profile?');">
        <input type="hidden" name="employee_id" value="<%= employee.getEmployee_id() %>">
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
