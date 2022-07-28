<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-07-27
  Time: 오후 2:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>JOIN</title>
</head>
<body>
<c:import url = "/WEB-INF/views/header.jsp"/>
<form>
    이름
<input type = "text" name = "name" id ="name" required placeholder="name"><br>
    아이디
<input type = "text" name = "id" id = "id" required placeholder="id"><br>

    비밀번호
<input type = "password" name = "pw" id = "pw" required placeholder="pw"><br>
    주소
<input type = "text" name = "address" id = "address" required placeholder="address"><br>
    성별
    <select id = "gender">
        <option name = "none" value ="성별">성별</option>
        <option name = "Female" value ="F">F</option>
        <option name = "Male" value ="M">M</option>
    </select><br>
    전공
<select id = "major">
    <option name = "none" value ="none">전공선택</option>
    <option name = "business" value = "경영학">경영학과</option>
    <option name = "computer" value = "컴퓨터공학">컴퓨터공학과</option>
    <option name = "music" value = "실용음악">실용음악과</option>
    <option name = "korean" value = "국어국문학">국어국문학과</option>
</select><br>
    휴대전화
<input type = "text" name ="mobile" id = "mobile" required placeholder="010-0000-0000"><br>
<input type = "date" name ="birth" id = "birth" required><br>
<input type = "button" value ="회원가입" onclick = "join()"><br>
<input type = "hidden" name ="grade" id = "grade" value ="S">
</form>
<c:import url = "/WEB-INF/views/footer.jsp"/>
</body>
<script type="text/javascript" src="/script/validation.js?ver=123"></script>
</html>
