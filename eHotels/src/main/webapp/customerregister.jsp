<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Register</title>
</head>
<body>
<h1>Register</h1>
<form action="customerregistercontroller.jsp">
    <label for="customer_id">Enter ID</label>
    <input type="text" name="customer_id" id="customer_id" required><br><br>

    <label for="id_type">ID Type</label>
    <input type="text" name="id_type" id="id_type" required><br><br>

    <label for="first_name">First Name</label>
    <input type="text" name="first_name" id="first_name" required><br><br>

    <label for="last_name">Last Name</label>
    <input type="text" name="last_name" id="last_name" required><br><br>

    <label for="street_number">Street Number</label>
    <input type="text" name="street_number" id="street_number" required><br><br>

    <label for="street_name">Street Name</label>
    <input type="text" name="street_name" id="street_name" required><br><br>

    <label for="zip">Zip</label>
    <input type="text" name="zip" id="zip" required><br><br>

    <label for="city">City</label>
    <input type="text" name="city" id="city" required><br><br>

    <label for="province_state">Province/State</label>
    <input type="text" name="province_state" id="province_state" required><br><br>

    <label for="country">Country</label>
    <input type="text" name="country" id="country" required><br><br>

    <label for="date_of_registration">Registration Date</label>
    <input type="date" name="date_of_registration" id="date_of_registration" required><br><br>

    <input type="submit" value="Submit"><br><br>
</form>
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
