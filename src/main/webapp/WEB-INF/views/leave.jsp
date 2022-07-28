<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-07-27
  Time: 오후 3:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
<%
    String log = (String) session.getAttribute("log");
    log = "1004";
    System.out.println(log);
%>

회원탈퇴
<form method="GET" action="/">
    아이디 : <input type="text" id="id" placeholder="<%=log%>" readonly style="border: none"><br>
    비밀번호 : <input type="text" id="pw" placeholder="비밀번호 입력">
    <input type="button" value="탈퇴하기" onclick="leaveAction()">
</form>
<script src="/script/validation.js?ver=123"></script>
</body>
</html>