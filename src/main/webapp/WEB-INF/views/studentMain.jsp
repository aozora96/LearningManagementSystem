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
    어사이드에 성적조회 / 시간표조회 / 투두리스트조회 이동
    <button onclick = "location.href='/todo'">TODO 리스트</button>
</aside>
<section>
    <form>
        <input type ="hidden" id = "stLog" value="<%=logId%>">
    </form>
     <div id = "id">id: &nbsp;</div>
     <div id = "name">이름: &nbsp;</div>
     <div id = "birth">생년월일: &nbsp;</div>
     <div id = "major">전공: &nbsp;</div>
     <div id = "address">주소: &nbsp;</div>
     <div id = "mobile">연락처: &nbsp;</div>
    <button onclick="location.href='/updateInfo'">정보수정하기</button>
</section>
<c:import url = "/WEB-INF/views/footer.jsp"/>
<script src="script/stuMypage.js"></script>
</body>
</html>