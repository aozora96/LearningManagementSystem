<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-08-05
  Time: 오후 5:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel = "stylesheet" href = "css/board.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>Title</title>
</head>
<body>
<%
Object log = session.getAttribute("log");
session.setAttribute("");
%>
<c:import url = "/WEB-INF/views/header.jsp"/>
<form id = "writeForm">
    <input type = "text" id = "title" name = "title" placeholder="제목을 입력하세요." required><br>
    <textarea name = "content" id = "content" placeholder="내용을 입력하세요." required></textarea><br>
    <input type ="button" value = "수정하기" id = "submit" onclick="boardW()">
    <input type = "button" value = "삭제하기" id = "back" onclick="location.href = '/board'">
    <input type = "hidden" id = "usercode" value ="<%=log%>">
</form>
<c:import url = "/WEB-INF/views/footer.jsp"/>
</body>
</html>
