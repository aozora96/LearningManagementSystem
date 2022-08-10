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

    String pageTemp = (String)request.getParameter("page");
    System.out.println("pageTemp");
%>
<input type="hidden" id="hide" value="<%=pageTemp%>">
<c:import url = "/WEB-INF/views/header.jsp"/>
<div id = "content">
    <h1 style ="text-align: center;">게시판</h1>
    <%
        if(log != null){
    %>
    <button onclick="location.href='/boardWrite'">게시글 작성</button>
    <%}%>
    <input type = "hidden" id = "userId" value = <%=logId%> >
    <section id = "boardList" style="color: black">
        <%--        해당 섹션에 게시글 태그 추가--%>
        <table border="1px">
            <thead>
            <tr><td>no</td><td>제목</td><td>작성자</td><td>조회수</td><td>게시일</td><td>수정일</td></tr>
            <tr style="background-color: lightskyblue">
                <td>공지</td>
                <td><a id="head_title"></a></td>
                <td id="head_name"> </td>
                <td id="head_view"> </td>
                <td id="head_date"> </td>
                <td id="head_modified"> </td>
            </tr>
            </thead>
            <tbody id ="here">
            </tbody>
        </table>
        <div id="btHere"></div>
    </section>

</div>

<c:import url = "/WEB-INF/views/footer.jsp"/>
<script src="script/board.js?ver=1"></script>
</body>
</html>