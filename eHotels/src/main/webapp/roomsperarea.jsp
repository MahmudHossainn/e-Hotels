<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Room Search Results</title>
</head>
<body>
<h1>Search Results</h1>
<table border="1">
    <tr>
        <th>City</th>
        <th>Province/State</th>
        <th>Country</th>
        <th>Available Rooms</th>
    </tr>
    <%
        ResultSet rs = (ResultSet) request.getAttribute("roomsPerArea");
        while(rs != null && rs.next()){
    %>
    <tr>
        <td><%= rs.getString("city") %></td>
        <td><%= rs.getString("province/state") %></td>
        <td><%= rs.getString("country") %></td>
        <td><%= rs.getString("available_rooms") %></td>
    </tr>
    <%
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
