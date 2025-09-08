<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Customer Login</title>
</head>
<body>
<h1>Login</h1>
<form action="customerhomepage.jsp">
  <label for="customer_id">Enter ID</label>
  <input type="text" name="customer_id" id="customer_id" required><br><br>
  <label for="id_type">ID Type</label>
  <input type="text" name="id_type" id="id_type" required><br><br>
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
