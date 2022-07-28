<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-07-27
  Time: 오후 2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>Title</title>
</head>
<body style="text-align: center">
<h1>LOGIN</h1>
<form method ="post" action ="/">
아이디<input type = "text" name = "id" id = "id"><br>
비밀번호<input type = "password" name = "pw" id = "pw"><br>
<input type ="button" value ="로그인" onclick="login()">
<input type = "button" value ="뒤로가기" onclick="location.href='/'">
</form>
</body>
<script type="text/javascript" src="/script/validation.js?ver=123"></script>
</html>
