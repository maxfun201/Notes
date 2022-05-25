<%@ page import="java.io.IOException" %><%--

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

<div class="login">
  
    <img class="left-top" src="/pages/assets/LogInFlowerYellow.png" alt="">
    <img class="right-bottom" src="/pages/assets/LogInAloe.png" alt="">
    <div class="form">
        <h1> Log In <img class="home" src="/pages/assets/Home-icon.svg" onclick="location.href='/'" alt="home"> </h1>

         <form method="post">
          <p >Login</p>
          <input class="input-box" type="text" placeholder="username" name="log_name"/>
          <p >Password</p>
          <input class="input-box" type="password" placeholder="******" name="log_pass"/>
          <button type="submit">Log In</button>
             <%
                 if(request.getAttribute("name_error") != null){
                     out.println("Wrong name");
                 }
                 else out.println("");
                 if(request.getAttribute("pass_error") != null){
                     out.println("Wrong password");
                 }
                 else out.println("");
             %>
         </form>
         <p class="message">Not registered? <a onclick="location.href='/add'">Create an account</a></p>


    </div>
</div>

</body>
</html>