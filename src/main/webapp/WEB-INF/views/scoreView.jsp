<%--
  Created by IntelliJ IDEA.
  User: iinseong
  Date: 2022/08/05
  Time: 9:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <link rel = "stylesheet" href="css/scoreView.css">
    <title>Title</title>
</head>
<body>
<c:import url = "/WEB-INF/views/header.jsp"/>
<%
    Object log = session.getAttribute("log");
    Object logId = session.getAttribute("logId");
%>
<div id = "scoreList">
    <h2>< <%=logId%> 님의 성적입니다. ></h2>
    <form>
        <input type ="hidden" id ="code" value ="<%=log%>">
    </form>
    <a href="/studentMain">뒤로가기</a>
</div>
<aside id="aside1"></aside>
<aside id="aside2"></aside>
<c:import url = "/WEB-INF/views/footer.jsp"/>
<script src="script/scoreView.js"></script>
</body>
</html>