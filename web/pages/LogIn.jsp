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

<div class="login">

    <%
        if(request.getAttribute("error") != null){
            out.println("Error");
        }
        if(request.getAttribute("login") != null){
            out.println("Welcome");
        }

    %>


    <h1>Log In</h1>
    <form class="input-box" method="post">
        <p>Email Address </p>
        <input type="text" class="input-box" placeholder="example@site.com" name="log_name"/>
        <p>Password </p>
        <input type="password" class="input-box" placeholder="******" name="log_pass"/>
        <br />

        <button type="submit" >Login</button>


    </form>

    <div>
<%--        <button onclick="location.href='/Notes'">Login</button>--%>


    </div>
</div>

</body>
</html>
