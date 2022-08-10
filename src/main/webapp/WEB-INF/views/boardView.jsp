<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-08-05
  Time: 오후 5:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <link rel = "stylesheet" href = "css/write.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>Title</title>
</head>
<body>
<%
    Object log = session.getAttribute("log");
    String boardcode = request.getParameter("boardcode");
    String view_cnt = request.getParameter("view_cnt");
%>
<c:import url = "/WEB-INF/views/header.jsp"/>
<form id = "viewForm" method="get" action = "/boardUpdate">

    <input type = "hidden" name ="view_cnt" id = "view_cnt" value = <%=view_cnt%>>
    <input type = "hidden" name = "boardcode" id = "boardcode" value ="<%=boardcode%>">
    <input type = "text" id = "title2" readonly placeholder="제목을 입력하세요." required><br>
    <textarea id = "content2" readonly placeholder="내용을 입력하세요." required></textarea><br>
    <div id = "buttons">

            <input type ="button" value = "뒤로가기" id = "back2" onclick = "location.href ='/board'">

        <%-- 작성자 코드와 로그값 일치 시에만 삭제/수정 버튼 띄우기--%>
    </div>
    <input type = "hidden" id = "usercode2" value ="<%=log%>">

</form>
<c:import url = "/WEB-INF/views/footer.jsp"/>
<script src="script/loadBoard.js?ver=123"></script>
</body>
</html>