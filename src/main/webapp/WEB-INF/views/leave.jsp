<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-07-27
  Time: 오후 3:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <link rel="shortcut icon" href="https://bit.ly/3P7ihIk">
    <title>Title</title>
    <link rel = "stylesheet" href = "css/leave.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
<c:import url = "/WEB-INF/views/header.jsp"/>
<%
    Object logObj = session.getAttribute("log");
%>
<form>
    <div style="font-size:35px;">회원탈퇴</div><br><br>
    <input type ="hidden" id ="code" value ="<%=logObj%>">
    UserCode : <input type="text" id="usercode" placeholder="<%=logObj%>" readonly style="border: none"><br><br>
    비밀번호 : <input type="text" id="pw" placeholder="비밀번호 입력"><br>
    <input type="button" value="탈퇴하기" id="delbtn" onclick="leaveAction()">
    <input type="button" value="뒤로가기" id="back" onclick="location.href='/studentMain'">
</form>
<c:import url = "/WEB-INF/views/footer.jsp"/>
<script src="/script/validation.js?ver=123"></script>
</body>
</html>