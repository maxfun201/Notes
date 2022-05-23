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

<div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">〈</a>
    <a href="#">Notes</a>
    <a href="#">Tasks</a>
    <a href="#">Archive</a>
</div>

<h1>Notes</h1>
<!-- Sidenav menu -->

    <img class="menu-but" src="/pages/assets/Menu.svg" onclick="openNav()" alt="Menu">


<!-- All page content here -->
<div id="main">


    <img class="add" src="/pages/assets/Plus.svg" alt="New note">
    <img class="right-bottom" src="/pages/assets/NotesPlant.png" alt="">


</div>

<script>
    /* Set the width of the side navigation to 250px */
    function openNav() {
        document.getElementById("mySidenav").style.width = "400px";
    }

    /* Set the width of the side navigation to 0 */
    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
    }
</script>

<!--
<button onclick="location.href='/EditNote'">Edit Note</button>
    <button onclick="location.href='/Login'">Exit</button>
 -->

</body>
</html>

