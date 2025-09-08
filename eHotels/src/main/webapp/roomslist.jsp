<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ResultSet rs = (ResultSet) request.getAttribute("roomsList");
    Integer customer_id = (Integer) request.getAttribute("customer_id");
    String id_type = (String) request.getAttribute("id_type");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Rooms</title>
    <style>
        table { border-collapse: collapse; width: 90%; margin: auto; }
        th, td { border: 1px solid #333; padding: 8px; text-align: center; }
        .button { padding: 8px 12px; background-color: #4CAF50; color: white; border: none; border-radius: 5px; cursor: pointer; }
        .button:hover { background-color: #45a049; }
    </style>
</head>
<body>
<h1 style="text-align: center;">Available Rooms</h1>
<table>
    <tr>
        <th>Room ID</th>
        <th>Hotel ID</th>
        <th>Hotel Name</th>
        <th>Rating</th>
        <th>Capacity</th>
        <th>Price</th>
        <th>Extendable</th>
        <th>City</th>
        <th>Province/State</th>
        <th>Country</th>
        <th>Action</th>
    </tr>
    <%
        try {
            while(rs != null && rs.next()){
                int room_id = rs.getInt("room_id");
                int hotel_id = rs.getInt("hotel_id");
                String hotel_name = rs.getString("hotel_name");
                int hotel_rating = rs.getInt("rating");
                int room_capacity = rs.getInt("capacity");
                double room_price = rs.getDouble("price");
                boolean extendable = rs.getBoolean("extendable");
                String city = rs.getString("city");
                String provinceState = rs.getString("province/state");
                String country = rs.getString("country");
    %>
    <tr>
        <td><%= room_id %></td>
        <td><%= hotel_id %></td>
        <td><%= hotel_name %></td>
        <td><%= hotel_rating %></td>
        <td><%= room_capacity %></td>
        <td><%= room_price %></td>
        <td><%= extendable %></td>
        <td><%= city %></td>
        <td><%= provinceState %></td>
        <td><%= country %></td>
        <td>
            <!-- Form to book this room -->
            <form action="bookRoom" method="post">
                <input type="hidden" name="room_id" value="<%= room_id %>">
                <input type="hidden" name="hotel_id" value="<%= hotel_id %>">
                <input type="hidden" name="start_date" value="<%= request.getParameter("start_date") %>">
                <input type="hidden" name="end_date" value="<%= request.getParameter("end_date") %>">
                <input type="hidden" name="customer_id" value="<%= customer_id %>">
                <input type="hidden" name="id_type" value="<%= id_type %>">
                <button class="button" type="submit">Book Room</button>
            </form>
        </td>
    </tr>
    <%
            }
        } catch(SQLException e) {
            System.out.println("<tr><td colspan='11'>Error reading data: " + e.getMessage() + "</td></tr>");
        }
    %>
</table>
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

