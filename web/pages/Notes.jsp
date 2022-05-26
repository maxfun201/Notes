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
<body id="page">

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

<img class="menu-button" src="/pages/assets/Menu.svg" onclick="openNav()" alt="Menu">
<img class="add" src="/pages/assets/Plus.svg" onclick="location.href='/EditNote'" alt="New note">
<h1>Notes</h1>
<img class="right-bottom" src="/pages/assets/NotesPlant.png" alt="">
<!-- Sidenav menu -->



<!-- All page content here -->
<div id="main">

    <div class="stickers-box" id="stickerBox">
        <%-- placeholder stickers  --%>
        <script>

            const page = document.getElementById('page');

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
                stick.style.backgroundColor = toColor(note.color);
                const element = document.getElementById("stickerBox");
                element.appendChild(stick);

                //<img class="dots" src="/pages/assets/Dots.svg" alt="***">

                const dots = document.createElement("img");
                dots.className = 'dots';
                dots.id = 'd' + note.id;
                dots.src = '/pages/assets/Dots.svg';
                const elementName = document.getElementById(stick.id);
                elementName.appendChild(dots);

                stick.addEventListener("mouseover", function() {
                    dots.style.visibility = 'visible';
                }, false);

                stick.addEventListener("mouseout", function() {
                    dots.style.visibility = 'hidden';
                }, false);

                const tooltip = document.createElement("div");
                tooltip.className = 'tooltip';
                tooltip.id = 't' + note.id;
                elementName.appendChild(tooltip);

                const edit = document.createElement("p");
                tooltip.id = 'edit' + note.id;
                const editContent = document.createTextNode("edit");
                edit.appendChild(editContent);
                tooltip.appendChild(edit);

                edit.addEventListener("click", function () {
                    location.replace("/EditNote");
                })

                const del = document.createElement("p");
                tooltip.id = 'del' + note.id;
                const delContent = document.createTextNode("delete");
                del.appendChild(delContent);
                tooltip.appendChild(del);

                del.addEventListener("click", function (){
                    deleteNote(note.id);
                })

                var isOpen = false;

                dots.addEventListener("click", function ( event ) {
                    setTimeout(function() {
                        if (!isOpen) {tooltip.style.display = 'inline'; isOpen = true;}
                        else setTimeout(function () {tooltip.style.display = 'none'; isOpen = false}, 2)
                    }, 2);
                }, false);

                page.addEventListener("click", function () {
                    setTimeout(function () {
                        if (isOpen) {tooltip.style.display = 'none'; isOpen = false}
                    })
                })

                // dots.addEventListener("mouseout", function ( event ) {
                //     onTooltip = false;
                //     if (!onTooltip)tooltip.style.display = 'none';
                // }, false);

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
            let note3 = new Note ('wwwwwwwwwwwwwwwww','wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww','aqua');
            let note4 = new Note ('','wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww','violet');
            let note5 = new Note ('Title','','yellow');
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
        setTimeout(function (){
            document.getElementById("mySidenav").style.width = "350px";
        },4)
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
    }

    function deleteNote (id) {
        var sticker = document.getElementById(id);
        sticker.remove();
    }

    document.getElementById("page").addEventListener("click", function (){
        closeNav();
    })

</script>

</body>
</html>

