<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Room</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f0f0f0; padding: 50px; text-align: center; }
        form { display: inline-block; background: #fff; padding: 20px; border-radius: 10px; }
        label { display: block; margin: 10px 0; }
        .button { padding: 10px; background: #4CAF50; color: white; border: none; border-radius: 5px; cursor: pointer; }
    </style>
</head>
<body>
<h1>Create a New Room</h1>
<form action="CreateRoomServlet" method="post">
    <label>Hotel ID: <input type="number" name="hotel_id" required></label>
    <label>Price: <input type="number" name="price" required></label>
    <label>Capacity: <input type="number" name="capacity" required></label>
    <label>View: <input type="text" name="view" required></label>
    <label>Extendable: <input type="checkbox" name="extendable"></label>
    <label>Room Number: <input type="number" name="room_number" required></label>
    <button class="button" type="submit">Create Room</button>
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
