<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2022-05-07
  Time: 3:01 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/styles/tasks.css">
    <title>Tasks</title>
</head>
<body>
<h1>Tasks</h1>

<div id="mySidenav" class="sidenav">
    <div class="user-box">
        <img class="user-icon" src="/pages/assets/Profile.svg" alt="Usr">
        <img class="user-exit" src="/pages/assets/Exit.svg" onclick="location.href='/LogIn'" alt="Exit">
        <p>username</p>

    </div>
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">〈</a>
    <div class="links-box">
        <a href="/pages/Notes.jsp">Notes</a>
        <a class="active-page"> Tasks</a>
        <a href="/pages/Archive.jsp">Archive</a>
    </div>
</div>

<img class="menu-button" src="/pages/assets/Menu.svg" onclick="openNav()" alt="Menu">

<div id="main">


    <img class="add" src="/pages/assets/Plus.svg" onclick="location.href='/EditNote'" alt="New note">
    <img class="right-bottom" src="/pages/assets/TasksCactus.png" alt="">

</div>

<script>
    function openNav() {
        document.getElementById("mySidenav").style.width = "350px";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
    }

</script>


</body>
</html>
