<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-07-27
  Time: 오전 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<html>
<head>
    <link rel = "stylesheet" href = "css/studentMain.css">
    <title>학생 마이페이지</title>
</head>
<body>
<c:import url = "/WEB-INF/views/header.jsp"/>
<%
    String logId = String.valueOf(session.getAttribute("logId"));
    System.out.println("stringlog: "+logId);
%>
<aside>
    <%--    어사이드에 성적조회 / 시간표조회 / 투두리스트조회 이동--%>
    <%--    <button onclick = "location.href='/todo'">TODO 리스트</button>--%>

    <a style = "color:black;" href = "/todo">&nbsp;· TODO LIST</a><br>
        <a style = "color:black;" href = "/scoreView">&nbsp;· 성적 조회 </a><br>
    <a style = "color:black;" href = "/todo">&nbsp;· 시간표 조회</a><br>

</aside>
<section>
    <form>
        <input type ="hidden" id = "stLog" value="<%=logId%>">
    </form>
    <div id = "id">ID : &nbsp;</div>
    <div id = "name">NAME : &nbsp;</div>
    <div id = "birth">BIRTH : &nbsp;</div>
    <div id = "major">MAJOR : &nbsp;</div>
    <div id = "address">ADDRESS : &nbsp;</div>
    <div id = "mobile">MOBILE : &nbsp;</div>
    <button onclick="location.href='/updateInfo'">UPDATE</button>
</section>
<c:import url = "/WEB-INF/views/footer.jsp"/>
<script src="script/stuMypage.js"></script>
</body>
</html>