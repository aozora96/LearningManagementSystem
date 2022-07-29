<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-07-27
  Time: 오후 3:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/header.css">
</head>
<body>
<header>
    <div id = "logMenu">
        <%
            // admin : log = 1, 교수 : log 두 자리수, 학생 : log 네 자리수
            //  session.setAttribute("log","10");
            Object logObj = session.getAttribute("log");
            String log = null;

            // String log = String.valueOf(session.getAttribute("log"));
            if(logObj == null){
        %>
        <a href="/login">login</a>
        <a href="/join">join</a>
        <%}else {
            log= String.valueOf(logObj);

            if(log.length() == 1){%>
        <span>admin</span>
        <%} else if(log.length() == 2){%>
        <a href="/professorMain">mypage</a>
        <%} else if(log.length() == 4){%>
        <a href="/studentMain">mypage</a>
        <%}%>
        <a href="/logout" > logout </a>
        <%}
        %>
    </div>
    <div id = "collegeName">
        OO대학교
    </div>
</header>

