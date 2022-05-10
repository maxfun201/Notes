<%--
  Created by IntelliJ IDEA.
  User: Maxim
  Date: 26.04.2022
  Time: 0:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <link rel="stylesheet" href="styles/login.css">
    <title>Notes service</title>
  </head>
  <body>

  <div class="login">
    <img class="left-bottom" src="/pages/assets/SignUpCactus.png" alt="">
    <img class="right-top" src="/pages/assets/SignUpFlowerOrange.png" alt="">
    <div class="form">
      <h2>Welcome!</h2>

      <p class="desc">NOTE is a simple online service you can use to keep organised.</p>
      <p class="desc">Add stickers to your board to save your ideas and add tasks to keep track of what you need to do.</p>

      <button onclick="location.href='/add'">Sign Up</button>
      <p class="message">Already registered? <a onclick="location.href='/LogIn'">Log in instead</a></p>

    </div>
  </div>

  </body>
</html>
