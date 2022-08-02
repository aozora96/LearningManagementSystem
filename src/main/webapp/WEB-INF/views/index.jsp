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
<div class ="main">
    <c:import url = "/WEB-INF/views/header.jsp"/>
    <section id = first>
        <img style ="float: left;" src ="https://bit.ly/3zLwXbr" width="70">
   <a href="/collegeInfo">학교소개</a>
       <a href="/subInfo">학과 별 강의소개</a>
        <a href="/addLecture">수강신청</a>
        <a href="/board">공지사항</a>
</section>
    <div class="slide">

        <div class="slides">
            <input type="radio" id="ra01" name="ra" value="" checked>
            <input type="radio" id="ra02" name="ra" value="">
            <input type="radio" id="ra03" name="ra" value="">

            <div class="sl"  style="text-align: center; ">
                <img src="image/002.png" alt="">
            </div>

            <div class="sl" style="text-align: center; ">
                <img src="image/testInfo.png" alt="">
            </div>

            <div class="sl"  style="text-align: center; ">
                <img src="image/003.png" alt="">
            </div>

        </div>

        <div class="page">
            <label for="ra01">●</label>
            <label for="ra02">●</label>
            <label for="ra03">●</label>
        </div>

<section id = "last">
   <div id = "todo">투두리스트</div>
       <div id = "schedule">시간표</div>
</section>
    </div>
<c:import url = "/WEB-INF/views/footer.jsp"/>
</body>
</html>
