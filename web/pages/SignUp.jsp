<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10.05.2022
  Time: 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../styles/login.css">
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <title>Auth</title>
</head>
<body>

<div class="login-page">
    <img class="left-bottom" src="/pages/assets/SignUpCactus.png" alt=""></img>
    <img class="right-top" src="/pages/assets/SignUpFlowerOrange.png" alt=""></img>
    <div class="form">
        <h1>Sign Up</h1>

        <p class="label">Email Address</p>
        <input type="text" placeholder="example@site.dom"/>
        <p class="label">Password</p>
        <input type="password" placeholder="******"/>
        <p class="label">Repeat Password</p>
        <input type="password" placeholder="******"/>
        <div class="g-recaptcha" data-sitekey="keygoeshere"></div>
        <button onclick="location.href='/LogIn'">Create Account</button>
        <p class="message">Already registered? <a onclick="location.href='/LogIn'">Log in instead</a></p>

    </div>
</div>

</body>
</html>
