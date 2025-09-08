<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Customer Portal</title>
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
  <h1>Login or Register</h1>
  <a class="button" href="customerlogin.jsp">Login</a>
  <a class="button" href="customerregister.jsp">Register</a>
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
