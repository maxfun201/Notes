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
    <title>Tasks</title>
</head>
<body id="page">



    <img class="menu-button" src="/pages/assets/Menu.svg" onclick="openNav()" alt="Menu">
    <img class="add" src="/pages/assets/Plus.svg" onclick="location.href='/EditTask'" alt="New task">

<h1>Tasks</h1>

<img class="cacti" src="/pages/assets/TasksCactus.png" alt="">

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



<div id="main">

        <div class="stickers-box" id="taskBox">
            <%-- placeholder stickers  --%>

            <script>

                const page = document.getElementById('page');

                var count_ = 0;
                class Task {
                    constructor(name, text, color) {
                        this.id = count_;
                        this.name = name;
                        this.text = text;
                        this.color = color;
                        count_ ++;
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

                function createTask(task) {
                    const taskk = document.createElement("figure");
                    taskk.id = task.id;
                    const element = document.getElementById("taskBox");
                    element.appendChild(taskk);

                    const head_ = document.createElement("h4");
                    const name_ = document.createTextNode(' ' + task.name + ' ');
                    const color_ = toColor(task.color);
                    head_.style.backgroundColor = color_;
                    head_.appendChild(name_);
                    const elementName_ = document.getElementById(taskk.id);
                    elementName_.appendChild(head_);

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

                    const edit = document.createElement("p");
                    tooltip.id = 'edit' + task.id;
                    const editContent = document.createTextNode("edit");
                    edit.appendChild(editContent);
                    tooltip.appendChild(edit);

                    edit.addEventListener("click", function () {
                        location.replace("/EditTask");
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
                let task3 = new Task ('ooooooooooooooooooooooooooooo','oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo','aqua');
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

        function deleteTask (id) {
            var task = document.getElementById(id);
            task.remove();
        }

        document.getElementById("page").addEventListener("click", function (){
            closeNav();
        })

    </script>

</body>
</html>