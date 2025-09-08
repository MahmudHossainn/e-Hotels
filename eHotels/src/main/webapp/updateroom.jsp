<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Room</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f0f0f0; padding: 50px; text-align: center; }
        form { display: inline-block; background: #fff; padding: 20px; border-radius: 10px; text-align: left; }
        label { display: block; margin: 10px 0; }
        .button { padding: 10px 20px; background: #4CAF50; color: #fff; border: none; border-radius: 5px; cursor: pointer; }
        .button.delete { background: red; }
    </style>
</head>
<body>
<h1>Update Room Details</h1>
<form action="UpdateRoomServlet" method="post">
    <!-- Non-editable fields as hidden inputs -->
    <input type="hidden" name="room_id" value="<%= request.getAttribute("room_id") %>">
    <input type="hidden" name="hotel_id" value="<%= request.getAttribute("hotel_id") %>">

    <label>Price:
        <input type="number" name="price" value="<%= request.getAttribute("price") %>" required>
    </label>
    <label>Capacity:
        <input type="number" name="capacity" value="<%= request.getAttribute("capacity") %>" required>
    </label>
    <label>View:
        <input type="text" name="view" value="<%= request.getAttribute("view") %>" required>
    </label>
    <label>Extendable:
        <input type="checkbox" name="extendable" <%= (Boolean)request.getAttribute("extendable") ? "checked" : "" %>>
    </label>
    <label>Room Number:
        <input type="number" name="room_number" value="<%= request.getAttribute("room_number") %>" required>
    </label>
    <button class="button" type="submit">Update Room</button>
</form>
<br><br>
<form action="DeleteRoomServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this room?');">
    <input type="hidden" name="room_id" value="<%= request.getAttribute("room_id") %>">
    <input type="hidden" name="hotel_id" value="<%= request.getAttribute("hotel_id") %>">
    <button class="button delete" type="submit">Delete Room</button>
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
