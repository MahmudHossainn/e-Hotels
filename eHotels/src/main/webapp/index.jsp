<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>e‑Hotels Home</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f0f0f0; margin: 0; padding: 20px; }
        .container { width: 80%; margin: auto; text-align: center; }
        .button {
            display: inline-block;
            padding: 15px 25px;
            font-size: 18px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            outline: none;
            color: #fff;
            background-color: #4CAF50;
            border: none;
            border-radius: 15px;
            box-shadow: 0 9px #999;
            margin: 20px;
        }
        .button:hover {background-color: #45a049}
        .button:active {
            background-color: #45a049;
            box-shadow: 0 5px #666;
            transform: translateY(4px);
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Welcome to e‑Hotels</h1>
    <p>Please choose your interface:</p>
    <a class="button" href="customer.jsp">Customer</a>
    <a class="button" href="employee.jsp">Employee</a>
    <form action="roomsPerArea" method="get">
        <button class="button" type="submit">Available Rooms</button>
    </form>
    <form action="roomsCapacityHotel" method="get">
        <button class="button" type="submit">Hotel Capacity</button>
    </form>
</div>
</body>
</html>