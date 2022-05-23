<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2022-05-07
  Time: 3:02 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../styles/editor.css">
    <title>Edit note</title>
</head>
<body>


<img class="icon" src="/pages/assets/Menu.svg" alt="MENU" >
<h1 class="head-text">Edit note</h1>
<img class="cross" src="/pages/assets/Plus.svg" onclick="location.href='/Notes'" alt="CLOSE">

<div class="edit-window">
    <input type="text" class="element-name" id="elementName" placeholder="Note name">
    <br/>
    <textarea class="element-text" id="elementText" cols="40" rows="12" placeholder="Note text"></textarea>
    <br/>
    <div class="bottom-buttons">
        <div class="color-choose">
            <div class="circle" id="changeColor"></div>
            <div class="color-content">
                <p>options</p>
            </div>
        </div>
        <button type="button">
            SAVE
        </button>
    </div>
</div>

<%-- temporary solution. Should be implemented as a drop-down menu from color-choose circle --%>
<button id="toPink">Pink</button>
<button id="toGreen">Green</button>
<button id="toBlue">Blue</button>
<button id="toOrange">Orange</button>

<script>

    document.getElementById("toPink").onclick = function () {
        document.getElementById("changeColor").style.backgroundColor = 'FFA3B9';
        document.getElementById("elementName").style.backgroundColor = 'FFA3B9';
        document.getElementById("elementText").style.backgroundColor = 'FFA3B9';
    }

    document.getElementById("toGreen").onclick = function () {
        document.getElementById("changeColor").style.backgroundColor = '9FEEB5';
        document.getElementById("elementName").style.backgroundColor = '9FEEB5';
        document.getElementById("elementText").style.backgroundColor = '9FEEB5';
    }

    document.getElementById("toBlue").onclick = function () {
        document.getElementById("changeColor").style.backgroundColor = 'BAEDF0';
        document.getElementById("elementName").style.backgroundColor = 'BAEDF0';
        document.getElementById("elementText").style.backgroundColor = 'BAEDF0';
    }

    document.getElementById("toOrange").onclick = function () {
        document.getElementById("changeColor").style.backgroundColor = 'FFD18C';
        document.getElementById("elementName").style.backgroundColor = 'FFD18C';
        document.getElementById("elementText").style.backgroundColor = 'FFD18C';
    }
</script>

<%-- color should be stored with names and text, change accordingly on other pages --%>

</body>
</html>
