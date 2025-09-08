<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Hotel</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f0f0f0; padding: 50px; text-align: center; }
        form { display: inline-block; background: #fff; padding: 20px; border-radius: 10px; text-align: left; }
        label { display: block; margin: 10px 0; }
        .button { padding: 10px 20px; background: #4CAF50; color: #fff; border: none; border-radius: 5px; cursor: pointer; }
        .button.delete { background: red; }
    </style>
</head>
<body>
<h1>Update Hotel Details</h1>
<form action="UpdateHotelServlet" method="post">
    <!-- Non-editable fields as hidden inputs -->
    <input type="hidden" name="hotel_id" value="<%= request.getAttribute("hotel_id") %>">
    <input type="hidden" name="number_of_rooms" value="<%= request.getAttribute("number_of_rooms") %>">

    <label>Hotel Name:
        <input type="text" name="hotel_name" value="<%= request.getAttribute("hotel_name") %>" required>
    </label>
    <label>Rating:
        <input type="number" name="rating" value="<%= request.getAttribute("rating") %>" required>
    </label>
    <label>Street Number:
        <input type="text" name="street_number" value="<%= request.getAttribute("street_number") %>" required>
    </label>
    <label>Street Name:
        <input type="text" name="street_name" value="<%= request.getAttribute("street_name") %>" required>
    </label>
    <label>City:
        <input type="text" name="city" value="<%= request.getAttribute("city") %>" required>
    </label>
    <label>Province/State:
        <input type="text" name="province_state" value="<%= request.getAttribute("province_state") %>" required>
    </label>
    <label>Country:
        <input type="text" name="country" value="<%= request.getAttribute("country") %>" required>
    </label>
    <label>ZIP Code:
        <input type="text" name="ZIP" value="<%= request.getAttribute("ZIP") %>" required>
    </label>
    <label>Manager ID:
        <input type="number" name="manager_id" value="<%= request.getAttribute("manager_id") %>" required>
    </label>
    <label>Chain Name:
        <input type="text" name="chain_name" value="<%= request.getAttribute("chain_name") %>" required>
    </label>
    <button class="button" type="submit">Update Hotel</button>
</form>
<br><br>
<!-- Delete hotel form -->
<form action="DeleteHotelServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this hotel?');">
    <input type="hidden" name="hotel_id" value="<%= request.getAttribute("hotel_id") %>">
    <button class="button delete" type="submit">Delete Hotel</button>
</form>
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
