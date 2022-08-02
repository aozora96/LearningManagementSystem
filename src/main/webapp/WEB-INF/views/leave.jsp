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
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
<c:import url = "/WEB-INF/views/header.jsp"/>
<%
    Object logObj = session.getAttribute("log");
%>

회원탈퇴
<form>
    <input type ="hidden" id ="code" value ="<%=logObj%>">
    UserCode : <input type="text" placeholder="<%=logObj%>" readonly style="border: none"><br>
    비밀번호 : <input type="text" id="pw" placeholder="비밀번호 입력">
    <input type="button" value="탈퇴하기" onclick="leaveAction()">
</form>
<c:import url = "/WEB-INF/views/footer.jsp"/>
<script src="/script/validation.js?ver=123"></script>
</body>
</html>