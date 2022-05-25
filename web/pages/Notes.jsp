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
        <p>${uName}</p>

    </div>
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">〈</a>
    <div class="links-box">
        <a class="active-page">Notes</a>
        <a href="/pages/Tasks.jsp">Tasks</a>
        <a href="/pages/Archive.jsp">Archive</a>
    </div>
</div>

<h1>Notes</h1>
<!-- Sidenav menu -->

    <img class="menu-button" src="/pages/assets/Menu.svg" onclick="openNav()" alt="Menu">


<!-- All page content here -->
<div id="main">


    <img class="add" src="/pages/assets/Plus.svg" onclick="location.href='/EditNote'" alt="New note">
    <img class="right-bottom" src="/pages/assets/NotesPlant.png" alt="">

    <div class="stickers-box" id="stickerBox">
        <%-- placeholder stickers  --%>
        <script>

            var count = 0;
            class Note {
                constructor(name, text, color) {
                    this.id = count;
                    this.name = name;
                    this.text = text;
                    this.color = color;
                    count ++;
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
                return color;
            }

            function createNote(note) {
                const stick = document.createElement("article");
                stick.id = note.id;
                const color = toColor(note.color);
                stick.style.backgroundColor = color;
                const element = document.getElementById("stickerBox");
                element.appendChild(stick);

                //<img class="dots" src="/pages/assets/Dots.svg" alt="***">

                const dots = document.createElement("img");
                dots.className = 'dots';
                dots.id = 'd' + note.id;
                dots.src = '/pages/assets/Dots.svg';
                const elementName = document.getElementById(stick.id);
                elementName.appendChild(dots);

                stick.addEventListener("mouseover", function( event ) {
                    dots.style.visibility = 'visible';
                }, false);

                stick.addEventListener("mouseout", function( event ) {
                    dots.style.visibility = 'hidden';
                }, false);

                // const block = document.createElement("div");
                // block.className = 'dots-block';
                // block.id = 'b' + note.id;
                // elementName.appendChild(block);

                const head = document.createElement("h2");
                const name = document.createTextNode(note.name);
                head.appendChild(name);
                elementName.appendChild(head);

                const content = document.createElement("h3");
                const text = document.createTextNode(note.text);
                content.appendChild(text);
                elementName.appendChild(content);
            }

            let note1 = new Note ('Shopping', 'apple, orange, grape, potato, cheese', 'pink');
            let note2 = new Note ('Walking','go to park and have some chocolate ice cream','green');
            let note3 = new Note ('','','aqua');
            let note4 = new Note ('','','violet');
            let note5 = new Note ('','','yellow');
            let note6 = new Note ('','','blue');
            let note7 = new Note ('','','white');
            let note8 = new Note ('','','orange');

            createNote(note1);
            createNote(note2);
            createNote(note3);
            createNote(note4);
            createNote(note5);
            createNote(note6);
            createNote(note7);
            createNote(note8);
        </script>
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

