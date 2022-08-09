<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-07-27
  Time: 오후 3:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<html>
<head>
    <link rel = "stylesheet" href = "css/professorMain.css">
    <title>Professer Mypage</title>
</head>
<body>
<c:import url = "/WEB-INF/views/header.jsp"/>
<%
    String log = String.valueOf(session.getAttribute("log"));
    //String logId = String.valueOf(session.getAttribute("logId"));
    System.out.println("stringlog: "+log);
%>
<aside>
    <%--    어사이드에 강의정보(성적입력) / 투두리스트조회 이동--%>

    <a style = "color:black;" href = "/todo">&nbsp;· TODO LIST</a><br>
    <a style = "color:black;" onclick="getClassInfo()">&nbsp;· 강의정보</a><br>

</aside>
<section id="pagedefault">
    <img src="image/Untitled.png">
</section>
<section id="classinfo" style="display: none">
    <span>과목명 : <p id="title"></p></span>
    <form>
        <table>
            <input type ="hidden" id = "stLog" value="<%=log%>">
            <thead>
            <tr><td id="stucode">학생코드</td><td id="name">이름</td><td id="level">학년</td><td id="score">성적</td><td id="s_grade">학점</td></tr>
            </thead>
            <tbody>

            </tbody>
        </table>
        <input type="button" value="저장하기" onclick="setScore()">
    </form>
</section>
<c:import url = "/WEB-INF/views/footer.jsp"/>
<script src="script/proMypage.js"></script>
</body>
</html>