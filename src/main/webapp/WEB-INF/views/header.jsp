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
    <link rel="stylesheet" href="css/header.css?">
    <link rel="shortcut icon" href="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcTi11g%2FbtrJlWnwj4L%2FHUb97JSsNhmfZ3BoloK4PK%2Fimg.png">

    <meta property="og:title" content="Green University">
    <meta property="og:description" content="Green-Unversity만이 가지고있는 학사 정보 관리 시스템의 특별한 아이디어를 직접 확인해보세요!">
    <meta property="og:image" content="https://blog.kakaocdn.net/dn/7jVxp/btrJmv4kTY7/atXkXNoBn3KR3ZKNSagXQk/img.png">
</head>
<body>
<header id="top">
    <div id = "logMenu">
        <%
            // 교수 : log 두 자리수, 학생 : log 네 자리수
            Object logObj = session.getAttribute("log");
            String log = null;

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

    <div id = nav>
        <img style ="float: left;" src ="image/Untitled.png" width="70">
        <a  href="/collegeInfo">학교소개</a>
        <a  href="/subInfo">학과 별 강의소개</a>
        <a  href="/addLecture">수강신청</a>
        <a  href="/board">게시판</a>
    </div>
</header>
</body>
</html>