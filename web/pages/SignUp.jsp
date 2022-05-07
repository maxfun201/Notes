<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2022-05-07
  Time: 2:56 p.m.
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../styles/login.css">
    <title>Auth</title>
</head>
<body>

<div class="login">
    <h1>Sign Up</h1>
        <form class="input-box">
            <p>Email Address </p>
            <input type="email" class="input-box" placeholder="example@site.com"/>
            <p>Password </p>
            <input type="password" class="input-box" placeholder="******"/>
            <p>Repeat password</p>
            <input type="password" class="input-box" placeholder="******"/>
            <br/>
            <%--            just a checkbox for now--%>
            <input type="checkbox">
            <p>I'm not a robot</p>

            <br>
            <button type="button" class="button1">
                Create Account
            </button>

        </form>
</div>

</body>
</html>

