<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-07-27
  Time: 오후 2:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel = "stylesheet" href="css/board.css">
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>Title</title>
</head>
<body>
<%
    Object log = session.getAttribute("log");
    Object logId = session.getAttribute("logId");
%>
<c:import url = "/WEB-INF/views/header.jsp"/>
<div id = "content">
    <h1 style ="text-align: center;">게시판</h1>
    <input type = "hidden" id = "userId" value = <%=logId%> >
    <section id = "boardList">
<%--        해당 섹션에 게시글 태그 추가--%>
        <table border="1px"; style ="text-align: center">
            <thead>
            <tr><td>no</td><td>제목</td><td>작성자</td><td>게시일</td><td>수정일</td></tr>
            </thead>
            <tbody id ="here">
<%--            <tr><td>1</td><td>제목입니다</td><td>내용이에요</td><td>2022-08-05</td><td>2022-08-05</td></tr>--%>
           <%

           %>
            </tbody>
        </table>
    </section>
    <%
    if(log != null){
    %>
    <button onclick="location.href='/boardWrite'">게시글 작성</button>
    <%}%>
</div>

<c:import url = "/WEB-INF/views/footer.jsp"/>
<script src="script/board.js?ver=123"></script>
</body>
</html>
