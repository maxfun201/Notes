<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Maxim
  Date: 26.04.2022
  Time: 0:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="styles/w3.css">
    <title>Users</title>
</head>
<body>
    <div>
        <div>
            <div>
                <h2>Users</h2>
            </div>
            <%
                List<String> names = (List<String>) request.getAttribute("userNames");

                if(names != null && !names.isEmpty()){
                    out.println("<ui>");
                    for(String s : names) {
                        out.println("<li>" + s + "</li>");
                    }
                    out.println("</ui>");
                }
                else out.println("<p>There are no users yet.</p>");
            %>
        </div>
    </div>

    <div>
        <button onclick="location.href='/'">Back to main page</button>
    </div>
</body>
</html>
