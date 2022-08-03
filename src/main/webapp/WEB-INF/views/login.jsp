<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-07-27
  Time: 오후 2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>Title</title>
    <link rel="stylesheet" href="css/login.css"></link>
</head>
<body>
<c:import url = "/WEB-INF/views/header.jsp"/>
<h1>LOGIN</h1>
<form >
아이디<input type = "text" name = "id" id = "id"><br>
비밀번호<input type = "password" name = "pw" id = "pw"><br>
<input type ="button" value ="로그인" onclick="login()">
<input type = "button" value ="뒤로가기" onclick="location.href='/'">
</form>
<aside id="aside1"></aside>
<aside id="aside2"></aside>
<c:import url = "/WEB-INF/views/footer.jsp"/>
</body>
<script type="text/javascript" src="/script/validation.js?ver=123"></script>
</html>
