<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-07-27
  Time: 오후 3:19
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>강좌소개</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <link rel = "stylesheet" href="css/subInfo.css">
</head>
<body>
    <c:import url = "/WEB-INF/views/header.jsp"/>
    <select id="major" onchange="callSub()">
        <option>--학과 선택--</option>
    </select>
    <section id="subject" >
    </section>
    <aside id="aside1"></aside>
    <aside id="aside2"></aside>
    <c:import url = "/WEB-INF/views/footer.jsp"/>
<script src="script/subInfo.js"></script>
</body>
</html>

