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
        <div class="color-choose" >
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
        <button type="button">
            SAVE
        </button>
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

</script>

<%-- color should be stored with names and text, change accordingly on other pages --%>

</body>
</html>
