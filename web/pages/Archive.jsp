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
    <link rel="stylesheet" href="/styles/notes.css">
    <title>Archive</title>
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
        <a href="/pages/Notes.jsp">Notes</a>
        <a href="/pages/Tasks.jsp">Tasks</a>
        <a class="active-page" href="">Archive</a>
    </div>
</div>

<img class="menu-button" src="/pages/assets/Menu.svg" onclick="openNav()" alt="Menu">
<img class="add" src="/pages/assets/Trash.svg" onclick="deleteAll()" alt="New note">
<h1>Archive</h1>
<img class="right-bottom" src="/pages/assets/ArchiveCactus.png" alt="">

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

                const move = document.createElement("p");
                tooltip.id = 'move' + note.id;
                const moveContent = document.createTextNode("return to notes");
                move.appendChild(moveContent);
                tooltip.appendChild(move);

                move.addEventListener("click", function () {
                    deleteNote(note.id);
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

                dots.addEventListener("click", function () {
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
            let note3 = new Note ('wwwwwwww wwwwwwww','wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww','aqua');
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

    <div class="stickers-box" id="taskBox">
        <script>
            var count1 = count;
            class Task {
                constructor(name, text, color) {
                    this.id = count1;
                    this.name = name;
                    this.text = text;
                    this.color = color;
                    count1 ++;
                }
            }

            function createTask(task) {
                const taskk = document.createElement("figure");
                taskk.id = task.id;
                const element = document.getElementById("taskBox");
                element.appendChild(taskk);

                const head1 = document.createElement("h4");
                const name1 = document.createTextNode(' ' + task.name + ' ');
                const color_ = toColor(task.color);
                head1.style.backgroundColor = color_;
                head1.appendChild(name1);
                const elementName_ = document.getElementById(taskk.id);
                elementName_.appendChild(head1);

                const content_ = document.createElement("h5");
                content_.style.backgroundColor = color_;
                elementName_.appendChild(content_);

                const text_ = document.createElement("div");
                const textCont_ = document.createTextNode(' ' + task.text + ' ')
                text_.appendChild(textCont_)
                content_.appendChild(text_);

                const dots_ = document.createElement("img");
                dots_.className = 'dots-task';
                dots_.id = 'd' + task.id;
                dots_.src = '/pages/assets/Dots.svg';
                content_.appendChild(dots_);

                taskk.addEventListener("mouseover", function() {
                    dots_.style.visibility = 'visible';
                }, false);

                taskk.addEventListener("mouseout", function() {
                    dots_.style.visibility = 'hidden';
                }, false);

                const tooltip = document.createElement("div");
                tooltip.className = 'tooltip-task';
                tooltip.id = 't' + task.id;
                elementName_.appendChild(tooltip);

                const move = document.createElement("p");
                move.id = 'move' + task.id;
                const moveContent = document.createTextNode("return to notes");
                move.appendChild(moveContent);
                tooltip.appendChild(move);

                move.addEventListener("click", function () {
                    deleteNote(task.id);
                })

                const del = document.createElement("p");
                tooltip.id = 'del' + task.id;
                const delContent = document.createTextNode("delete");
                del.appendChild(delContent);
                tooltip.appendChild(del);

                del.addEventListener("click", function (){
                    deleteTask(task.id);
                })

                dots_.addEventListener("click", function () {
                    setTimeout(function() {
                        tooltip.style.display = 'inline';
                    }, 2)
                }, false);

                page.addEventListener("click", function () {
                    tooltip.style.display = 'none';
                })

            }

            let task1 = new Task ('11/01/22', 'birthday','pink');
            let task2 = new Task ('sat','meeting','green');
            let task3 = new Task ('','','aqua');
            let task4 = new Task ('','','violet');
            let task5 = new Task ('','','yellow');
            let task6 = new Task ('','','blue');
            let task7 = new Task ('','','white');
            let task8 = new Task ('','','orange');

            createTask(task1);
            createTask(task2);
            createTask(task3);
            createTask(task4);
            createTask(task5);
            createTask(task6);
            createTask(task7);
            createTask(task8);

            const countStickers = count;
        </script>

    </div>

</div>

<script>

    document.getElementById("taskBox").style.marginTop = '10px'

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

    function deleteTask (id) {
        var task = document.getElementById(id);
        task.remove();
    }

    function deleteAll() {
        const sticks = document.getElementById("stickerBox");
        sticks.innerHTML = '';
        const tasks = document.getElementById("taskBox");
        tasks.innerHTML = '';
    }

    document.getElementById("page").addEventListener("click", function (){
        closeNav();
    })

</script>

</body>
</html>


