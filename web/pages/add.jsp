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
    <title>Add new user</title>
</head>
<body>
    <div>
        <%
            if(request.getAttribute("userName") != null){
                out.println("<p>User '" + request.getAttribute("userName") + "' added!</p>");
            }
        %>
        <div>
            <div>
                <h1>Add user</h1>
            </div>

        <form method="post">
            <label>Name:
                 <input type="text" name="name"><br />
            </label>

            <label>Password:
                  <input type="password" name="pass"><br />
            </label>

            <button type="submit">Submit</button>
        </form>
        </div>
    </div>

    <div>
        <button onclick="location.href='/'">Back to main page</button>

        <br />
        <button onclick="location.href='/auth'">Auth</button>

    </div>
</body>
</html>
