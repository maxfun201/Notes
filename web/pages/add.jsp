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
    <title>Add new user</title>
</head>
<body>
    <div class="login">
        <%
            if(request.getAttribute("userName") != null){
                out.println("<p>User '" + request.getAttribute("userName") + "' added!</p>");
            }
        %>
        <div>
            <h1>Sign Up</h1>
            <form class="input-box" method="post">
                <p>User name </p>
                <input type="text"  name="name" class="input-box" placeholder="admin"/>
                <p>Password </p>
                <input type="password" class="input-box" name="pass" placeholder="******"/>
                <p>Repeat password</p>
                <input type="password" class="input-box" name="pass"placeholder="******"/>
                <br/>
                <%--            just a checkbox for now--%>
                <input type="checkbox">
                <p>I'm not a robot</p>

                <br>
                <button  type="submit" class="button1">
                    Create Account
                </button>


        </form>
        </div>
    </div>

    <div>
        <button onclick="location.href='/'">Back to main page</button>
        <br />
        <button onclick="location.href='/auth'">Authorization</button>
    </div>
</body>
</html>
