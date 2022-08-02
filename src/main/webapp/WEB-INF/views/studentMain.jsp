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
    <title>Title</title>
</head>
<body>
<c:import url = "/WEB-INF/views/header.jsp"/>
학생 마이페이지의 메인 입니다 스껄~
<button onclick = "location.href='/todo'">TODO</button>
<button onclick="location.href='/updateInfo'">정보수정하기</button>
<c:import url = "/WEB-INF/views/footer.jsp"/>
</body>
</html>