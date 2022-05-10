<%--
  Created by IntelliJ IDEA.
  User: Maxim
  Date: 26.04.2022
  Time: 0:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../styles/login.css">
<%--    <script src='https://www.google.com/recaptcha/api.js'></script>--%>
    <title>Sign In</title>
</head>
<body>

<div class="login">



    <img class="left-bottom" src="/pages/assets/SignUpCactus.png" alt="">
    <img class="right-top" src="/pages/assets/SignUpFlowerOrange.png" alt="">
    <div class="form">
        <h1>Sign Up <img class="home" src="/pages/assets/Home-icon.svg" onclick="location.href='/'" alt="home"> </h1>
        <form  method="post">
            <p class="label">Login</p>
            <input type="text"  name="name" class="input-box" placeholder="username"/>
            <p class="label">Password</p>
            <input type="password" class="input-box" name="pass" placeholder="******"/>
            <p class="label">Repeat Password</p>
            <input type="password" class="input-box" name="reppass" placeholder="******"/>
<%--            <div class="g-recaptcha" data-sitekey="keygoeshere"></div>--%>
            <button onclick="location.href='/LogIn'">Create Account</button>
        </form>
        <%
            if(request.getAttribute("userName") != null){
                out.println("<h5>Successfully created account '" + request.getAttribute("userName") + "' </h5>");
            }
            if(request.getAttribute("error") != null) {
                out.println("<h6>Passwords don't match. Please try again.<h6>");
            }
        %>
        <p class="message">Already registered? <a onclick="location.href='/LogIn'">Log in instead</a></p>

    </div>
</div>

</body>
</html>
