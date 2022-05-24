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
    <div class="user-box">
        <img class="user-icon" src="/pages/assets/Profile.svg" alt="Usr">
        <img class="user-exit" src="/pages/assets/Exit.svg" onclick="location.href='/logout'" alt="Exit">
        <p>username</p>

    </div>
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">〈</a>
    <div class="links-box">
        <a class="active-page">Notes</a>
        <a href="#">Tasks</a>
        <a href="#">Archive</a>
    </div>
</div>

<h1>Notes</h1>
<!-- Sidenav menu -->

    <img class="menu-but" src="/pages/assets/Menu.svg" onclick="openNav()" alt="Menu">


<!-- All page content here -->
<div id="main">


    <img class="add" src="/pages/assets/Plus.svg" onclick="location.href='/EditNote'" alt="New note">
    <img class="right-bottom" src="/pages/assets/NotesPlant.png" alt="">

    <div class="stickers-box">
        <%-- placeholder stickers  --%>
        <div class="sticker">
            <img class="dots" src="/pages/assets/Dots.svg" alt="***">
            <h1>Name</h1>
            <p>Sample text sample text sample text sample text</p>
        </div>
            <div class="sticker">
                <img class="dots" src="/pages/assets/Dots.svg" alt="***">
                <h1>Name</h1>
                <p>Sample text sample text sample text sample text</p>
            </div>
            <div class="sticker">
                <img class="dots" src="/pages/assets/Dots.svg" alt="***">
                <h1>Name</h1>
                <p>Sample text sample text sample text sample text</p>
            </div>
            <div class="sticker">
                <img class="dots" src="/pages/assets/Dots.svg" alt="***">
                <h1>Name</h1>
                <p>Sample text sample text sample text sample text</p>
            </div>
            <div class="sticker">
                <img class="dots" src="/pages/assets/Dots.svg" alt="***">
                <h1>Name</h1>
                <p>Sample text sample text sample text sample text</p>
            </div>

    </div>

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

