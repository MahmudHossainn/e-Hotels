<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modify Room</title>
</head>
<body>
<h1>Modify Existing Room</h1>
<form action="GetRoomDetailsServlet" method="get">
    <label>Enter Room ID: <input type="number" name="room_id" required></label>
    <button type="submit">Proceed</button>
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
