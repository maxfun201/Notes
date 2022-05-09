<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2022-05-07
  Time: 2:58 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../styles/login.css">
    <title>Log in</title>
</head>
<body>

<div class="login-page">
   <%
        if(request.getAttribute("error") != null){
            out.println("Error");
        }
        if(request.getAttribute("login") != null){
            out.println("Welcome");
        }
    %>
  
    <img class="left-top" src="/pages/assets/LogInFlowerYellow.png" alt=""></img>
    <img class="right-bottom" src="/pages/assets/LogInAloe.png" alt=""></img>
    <div class="form">
        <h1>Log In</h1>

   <form class="input-box" method="post">
        <p >Email Address</p>
        <input  type="text" placeholder="example@site.dom" name="log_name"/>
        <p >Password</p>
        <input type="password" placeholder="******" name="log_pass"/>
        <button type+"submit">Login</button>
        <p class="message">Not registered? <a onclick="location.href='/SignUp'">Create an account</a></p>
    </form>

</div>

</body>
</html>
