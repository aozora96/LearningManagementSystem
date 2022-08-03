<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-07-27
  Time: 오전 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<html>
<head>
    <%
        Object log = session.getAttribute("log");
    %>
    <link rel ="stylesheet" href ="css/index.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>MAIN</title>
</head>
<body>
    <c:import url = "/WEB-INF/views/header.jsp"/>
    <section id = nav>
        <img style ="float: left;" src ="https://bit.ly/3zLwXbr" width="70">
        <a  href="/collegeInfo">학교소개</a>
        <a  href="/subInfo">학과 별 강의소개</a>
        <a  href="/addLecture">수강신청</a>
        <a  href="/board">공지사항</a>
    </section>
    <input type="hidden" id="hide" value="<%=log%>">
    <div class="slide">
        <div class="slides">
            <input type="radio" id="ra01" name="ra" value="" checked>
            <input type="radio" id="ra02" name="ra" value="">
            <input type="radio" id="ra03" name="ra" value="">

            <div class="sl"  style="text-align: center; opacity: 100%;">
                <img src="image/002.png" alt="" height="550px">
            </div>

            <div class="sl" style="text-align: center; opacity: 100%;">
                <img src="image/testInfo.png" alt="" height="550px">
            </div>

            <div class="sl"  style="text-align: center; opacity: 100%;">
                <img src="image/003.png" alt="" height="550px">
            </div>

        </div>

        <div class="page">
            <label for="ra01">●</label>
            <label for="ra02">●</label>
            <label for="ra03">●</label>
        </div>
    </div>

        <section id = "last">
            <div id = "todo">투두리스트
                <div id = "list">
                    <form id = "todoList">
                        <input type ="hidden" id ="code" value ="<%=log%>">
                    </form>
                </div>

            </div>

            <div id = "schedule">
                <div class = "gray">  </div><div id="MO" class = "gray">월</div><div class = "gray"id="TU">화</div><div class = "gray" id="WE">수</div><div class = "gray" id="TH">목</div><div class = "gray" id="FR">금</div>
                <div class = "gray">9</div><div id="MO09"></div><div id="TU09"></div><div id="WE09"></div><div id="TH09"></div><div id="FR09"></div>
                <div class = "gray">10</div><div id="MO10"></div><div id="TU10"></div><div id="WE10"></div><div id="TH10"></div><div id="FR10"></div>
                <div class = "gray">11</div><div id="MO11"></div><div id="TU11"></div><div id="WE11"></div><div id="TH11"></div><div id="FR11"></div>
                <div class = "gray">12</div><div id="MO12"></div><div id="TU12"></div><div id="WE12"></div><div id="TH12"></div><div id="FR12"></div>
                <div class = "gray">13</div><div id="MO13"></div><div id="TU13"></div><div id="WE13"></div><div id="TH13"></div><div id="FR13"></div>
                <div class = "gray">14</div><div id="MO14"></div><div id="TU14"></div><div id="WE14"></div><div id="TH14"></div><div id="FR14"></div>
                <div class = "gray">15</div><div id="MO15"></div><div id="TU15"></div><div id="WE15"></div><div id="TH15"></div><div id="FR15"></div>
                <div class = "gray">16</div><div id="MO16"></div><div id="TU16"></div><div id="WE16"></div><div id="TH16"></div><div id="FR16"></div>
                <div class = "gray">17</div><div id="MO17"></div><div id="TU17"></div><div id="WE17"></div><div id="TH17"></div><div id="FR17"></div>
                <div class = "gray">18</div><div id="MO18"></div><div id="TU18"></div><div id="WE18"></div><div id="TH18"></div><div id="FR18"></div>
            </div>
        </section>
    <c:import url = "/WEB-INF/views/footer.jsp"/>
</body>
<script src="script/index.js"></script>
</html>