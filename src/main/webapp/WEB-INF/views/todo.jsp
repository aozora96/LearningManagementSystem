<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-07-27
  Time: 오후 2:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <link rel = "stylesheet" href="css/todo.css">
    <title>TODO</title>
</head>
<body>
<c:import url = "/WEB-INF/views/header.jsp"/>
<%
    Object log = session.getAttribute("log");
    Object logId = session.getAttribute("logId");
%>
<h2 id = "userName">< <%=logId%> 님의 TODO LIST ></h2>
<div id = "list">
    <div id= "todoList">
    </div>
    <form id ="addTodoList">
        <input type ="hidden" id ="code" value ="<%=log%>">
        <input type="text" id="contents" name="contents" onkeyup="checkEnter()"/>
        <button onclick="addTodo()" style="height:35px; width:35px;">+</button>
    </form>
</div>
<c:import url = "/WEB-INF/views/footer.jsp"/>
<script src="script/todo.js"></script>
</body>
</html>