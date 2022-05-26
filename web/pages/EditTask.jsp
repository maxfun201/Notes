<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2022-05-07
  Time: 3:03 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit task</title>
    <link rel="stylesheet" href="../styles/editor.css">
</head>
<body>

<div id="mySidenav" class="sidenav">
    <div class="user-box">
        <img class="user-icon" src="/pages/assets/Profile.svg" alt="Usr">
        <img class="user-exit" src="/pages/assets/Exit.svg" onclick="location.href='/LogIn'" alt="Exit">
        <p>username</p>

    </div>
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">〈</a>
    <div class="links-box">
        <a href="/pages/Notes.jsp">Notes</a>
        <a href="/pages/Tasks.jsp">Tasks</a>
        <a href="/pages/Archive.jsp">Archive</a>
    </div>
</div>

<img class="menu-button" src="/pages/assets/Menu.svg" onclick="openNav()" alt="Menu">
<h1>Edit task</h1>
<img class="cross" src="/pages/assets/Plus.svg" onclick="location.href='/pages/Tasks.jsp'" alt="CLOSE">
<img class="left-bottom" src="/pages/assets/EditTasksPlant.png" alt="">

<div class="edit-window">
    <input type="text" class="element-name" id="elementName" placeholder="Date" maxlength="15">
    <br/>
    <textarea class="element-text" id="elementText" cols="26" rows="5" maxlength="130" placeholder="Task text"></textarea>
    <br/>
    <div class="bottom-buttons">
        <span>
            <button class="save-button" type="button" onclick="location.href='/pages/Tasks.jsp'">
                <div class="text">SAVE</div>
            </button>
            <div class="color-choose">
                <div class="circle" id="changeColor" onclick="showChoose()"></div>
                <div class="color-content" id="colorContent">
                    <span class="white-choose" onclick="toColor('white')"></span>
                    <span class="pink-choose" onclick="toColor('pink')"></span>
                    <span class="orange-choose" onclick="toColor('orange')"></span>
                    <span class="aqua-choose" onclick="toColor('aqua')"></span>
                    <span class="yellow-choose" onclick="toColor('yellow')"></span>
                    <span class="green-choose" onclick="toColor('green')"></span>
                    <span class="blue-choose" onclick="toColor('blue')"></span>
                    <span class="violet-choose" onclick="toColor('violet')"></span>
                </div>
            </div>
        </span>
    </div>
</div>

<script>
    var show = false;

    function showChoose(){
        if (!show) {
            document.getElementById("colorContent").style.visibility = "visible";
            show = true;
        } else {
            document.getElementById("colorContent").style.visibility = "hidden";
            show = false;
        }

    }

    function toColor(color) {
        switch (color) {
            case 'white':
                break;
            case 'pink':
                color = '#FFA3B9';
                break;
            case 'yellow':
                color = '#F0FF95';
                break;
            case 'aqua':
                color = '#BAEDF0';
                break;
            case 'orange':
                color = '#FFD18C';
                break;
            case 'green':
                color = '#9FEEB5';
                break;
            case 'blue':
                color = '#9D96E9';
                break;
            case 'violet':
                color = '#E7C0FF';
                break;
            default:
                break;
        }
        document.getElementById("changeColor").style.backgroundColor = color;
        document.getElementById("elementName").style.backgroundColor = color;
        document.getElementById("elementText").style.backgroundColor = color;
        document.getElementById("colorContent").style.visibility = "hidden";
        show = false;
    }

    function openNav() {
        document.getElementById("mySidenav").style.width = "350px";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
    }

</script>

</body>
</html>
