<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  Integer employee_id = Integer.valueOf(request.getParameter("employee_id"));
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Check-in Booking</title>
</head>
<body>
<h1>Check-in Booking</h1>
<form action="checkInBooking" method="get">
  <label for="hotel_id">Enter Hotel ID</label>
  <input type="text" name="hotel_id" id="hotel_id" required><br><br>

  <label for="room_id">Enter Room ID</label>
  <input type="text" name="room_id" id="room_id" required><br><br>

  <label for="start_date">Enter Start Date</label>
  <input type="date" name="start_date" id="start_date" required><br><br>

  <input type="hidden" name="employee_id" value="<%= employee_id %>">

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