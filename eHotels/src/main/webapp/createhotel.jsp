<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Hotel</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f0f0f0; padding: 50px; text-align: center; }
        form { display: inline-block; background: #fff; padding: 20px; border-radius: 10px; }
        label { display: block; margin: 10px 0; }
        .button { padding: 10px; background: #4CAF50; color: white; border: none; border-radius: 5px; cursor: pointer; }
    </style>
</head>
<body>
<h1>Create a New Hotel</h1>
<form action="CreateHotelServlet" method="post">
    <label>Hotel Name: <input type="text" name="hotel_name" required></label>
    <label>Rating: <input type="number" name="rating" required></label>
    <label>Street Number: <input type="text" name="street_number" required></label>
    <label>Street Name: <input type="text" name="street_name" required></label>
    <label>City: <input type="text" name="city" required></label>
    <label>Province/State: <input type="text" name="province_state" required></label>
    <label>Country: <input type="text" name="country" required></label>
    <label>ZIP Code: <input type="text" name="ZIP" required></label>
    <label>Manager ID: <input type="number" name="manager_id" required></label>
    <label>Chain Name: <input type="text" name="chain_name" required></label>
    <button class="button" type="submit">Create Hotel</button>
</form>
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
