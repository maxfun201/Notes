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
    <link rel="stylesheet" href="/styles/notes.css">
    <title>Notes</title>
</head>
<body>


<input class = "add" type="image" src="/pages/assets/Plus.svg" alt="">

<img class="right-bottom" src="/pages/assets/NotesPlant.png" alt="">

<h1 class="head-text">Notes</h1>
<input type="checkbox" id="nav-toggle" hidden >

<nav class="nav">
    <label for="nav-toggle" class="nav-toggle" onclick></label>
    <ul>
        <li><a href="#1">Notes</a>
        <li><a href="#2">Tasks</a>
        <li><a href="#3">Archive</a>
    </ul>
</nav>






<button onclick="location.href='/EditNote'">Edit Note</button>
    <button onclick="location.href='/LogIn'">Exit</button>

</body>
</html>

