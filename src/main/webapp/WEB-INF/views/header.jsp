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
        <a style ="padding-right: 15px; color: navy;"  href="/login">로그인</a>
        <a style ="padding-right: 15px; color: navy;" href="/join">회원가입</a>
        <%}else {
            log= String.valueOf(logObj);

            if(log.length() == 1){%>
        <span>admin</span>
        <%} else if(log.length() == 2){%>
        <a style ="padding-right: 15px; color: navy;" href="/professorMain">마이페이지</a>
        <%} else if(log.length() == 4){%>
        <a style ="padding-right: 15px; color: navy;" href="/studentMain">마이페이지</a>
        <%}%>
        <a style ="padding-right: 15px; color: navy;" href="/logout" >로그아웃</a>
        <%}
        System.out.println("헤더 세션 로그: "+ logObj);
    %>
    </div>
    <div id = "collegeName">
        <a href="/" style="padding-top: 0; color: navy;">GREEN UNIVERSITY</a>
    </div>
</header>
</body>
</html>


