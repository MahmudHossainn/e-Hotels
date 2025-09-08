<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Integer customer_id = Integer.valueOf(request.getParameter("customer_id"));
    String id_type = request.getParameter("id_type");
    Integer employee_id = Integer.valueOf(request.getParameter("employee_id"));
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Direct Renting Room Search</title>
</head>
<body>
<h1>Room Search</h1>
<form action="employeeRoomSearch" method="get">
    <label for="start_date">Start Date:</label>
    <input type="date" name="start_date" id="start_date" required><br><br>

    <label for="end_date">End Date:</label>
    <input type="date" name="end_date" id="end_date" required><br><br>

    <label for="room_capacity">Capacity ≥:</label>
    <input type="text" name="room_capacity" id="room_capacity"><br><br>

    <label for="city">City:</label>
    <input type="text" name="city" id="city"><br><br>

    <label for="province_state">Province/State:</label>
    <input type="text" name="province_state" id="province_state"><br><br>

    <label for="country">Country:</label>
    <input type="text" name="country" id="country"><br><br>

    <label for="hotel_chain">Hotel Chain:</label>
    <input type="text" name="hotel_chain" id="hotel_chain"><br><br>

    <label for="hotel_rating">Hotel Rating:</label>
    <input type="text" name="hotel_rating" id="hotel_rating"><br><br>

    <label for="total_rooms">Total Rooms in Hotel:</label>
    <input type="number" name="total_rooms" id="total_rooms"><br><br>

    <label for="room_price">Room Price ≤:</label>
    <input type="text" name="room_price" id="room_price"><br><br>

    <input type="hidden" name="customer_id" value="<%= customer_id %>">
    <input type="hidden" name="id_type" value="<%= id_type %>">
    <input type="hidden" name="employee_id" value="<%= employee_id %>">

    <input type="submit" value="Search">
</form>
<br>
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
