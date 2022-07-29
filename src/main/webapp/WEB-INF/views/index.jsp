<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-07-27
  Time: 오전 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <link rel ="stylesheet" href ="css/index.css">
    <title>MAIN</title>
</head>
<body>
<c:import url = "/WEB-INF/views/header.jsp"/>
<div id = "main">
    <sapn id = "menuList">
       <p>학교소개</p>
        <p>학과 별 강의소개</p>
        <p>수강신청</p>
           <p>공지사항</p>
    </sapn>
    <div id ="images"></div>
    <div id ="miniHome">
        <span><div id ="todo">여기에 TODO LIST</div>
            <div id ="schedule">여기는 시간표가 들어갈 거야</div></span>
    </div>
</div>
<c:import url = "/WEB-INF/views/footer.jsp"/>
</body>
</html>
