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
    <title>TODO</title>
</head>
<body>
<c:import url = "/WEB-INF/views/header.jsp"/>
<%
//    session.setAttribute("log",7770);
//    int log = (int)session.getAttribute("log");
    Object log = session.getAttribute("log");
%>
<div id = "list">
    <form id = "todoList">
        <input type ="hidden" id ="code" value ="<%=log%>">
        <input type="button" value="TODO 리스트 보기" onclick="todoList()"><br>
    </form>
</div>
<c:import url = "/WEB-INF/views/footer.jsp"/>
<script type="text/javascript" src="/script/validation.js?ver=123"></script>
</body>
</html>
