<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-07-27
  Time: 오후 2:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%String logId = String.valueOf(session.getAttribute("logId"));
    System.out.println("이게뭐람 "+logId);
%>
회원정보수정
<%--전화번호, 주소 , 비밀번호 --%>
<form id="userInfo">
    이름
    <input type = "text" name = "name" id ="name" required  readonly><br>
    생년월일
    <input type = "text" name = "birth" id ="birth" required readonly><br>
    학과
    <input type = "text" name = "major" id ="major" required readonly><br>
    아이디
    <input type = "text" name = "id" id = "id" required value="<%=logId%>" readonly><br>
    비밀번호
    <input type = "password" name = "pw" id = "pw" required><br>
    비밀번호 재확인
    <input type = "password" name = "repw" id = "repw" required><br>
    주소
    <input type="text" id="address" placeholder="주소"><br>
    휴대전화
    <input type = "text" name ="mobile" id = "mobile" required placeholder="010-0000-0000" ><br>
    <%-- 성별--%>
    <input type="hidden" name="gender" id="gender" >
    <%--   userCode--%>
    <input type="hidden" name="userCode" id="userCode" >

    <input type="button" value="수정하기" onclick="updateUserInfo()">

</form>

<script src="script/updateInfo.js"></script>

</body>
</html>