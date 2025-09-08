<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Details for Check-in</title>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 8px;
            text-align: center;
        }
    </style>
</head>
<body>
<h1>Booking Details</h1>
<table>
    <tr>
        <th>Room ID</th>
        <th>Hotel ID</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Customer ID</th>
    </tr>
    <tr>
        <td><%= request.getAttribute("booking_room_id") %></td>
        <td><%= request.getAttribute("booking_hotel_id") %></td>
        <td><%= request.getAttribute("booking_start_date") %></td>
        <td><%= request.getAttribute("booking_end_date") %></td>
        <td><%= request.getAttribute("customer_id") %></td>
    </tr>
</table>
<br>
<!-- Form to input payment info and complete check-in -->
<form action="createRenting" method="post">
    <label for="payment_info">Enter Payment Info:</label>
    <input type="text" name="payment_info" id="payment_info" required><br><br>
    <!-- Hidden fields to pass booking and employee details -->
    <input type="hidden" name="room_id" value="<%= request.getAttribute("booking_room_id") %>">
    <input type="hidden" name="hotel_id" value="<%= request.getAttribute("booking_hotel_id") %>">
    <input type="hidden" name="start_date" value="<%= request.getAttribute("booking_start_date") %>">
    <input type="hidden" name="end_date" value="<%= request.getAttribute("booking_end_date") %>">
    <input type="hidden" name="customer_id" value="<%= request.getAttribute("customer_id") %>">
    <input type="hidden" name="employee_id" value="<%= request.getAttribute("employee_id") %>">
    <button type="submit">Check-in</button>
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
