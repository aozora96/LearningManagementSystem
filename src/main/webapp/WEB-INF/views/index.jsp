<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-07-27
  Time: 오전 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
홈페이지의 메인 화면


※ Header 의 menu list

1. 로그인 (login.jsp -> 로그인 완료 후 로그아웃으로 변경)
2. 회원가입 (join.jsp / 회원탈퇴는 myPage 에서 구현 -> leave.jsp)
3. 마이페이지(마이페이지는 로그인 완료 후 보여주기 / 미로그인 시 숨김 처리)
ㄴ> 3-1. 마이페이지(학생 / studentMain.jsp)
ㄴ> 3-2. 마이페이지(교직원 / professorMain.jsp) 으로 나누어 구현 예정



※ 대표 카테고리 메뉴 (해당 부분은 반응형으로 구현 예정 : 클릭이나 마우스 오버 시 상세메뉴가 주르륵 출력)

1. 학교소개(collegeInfo.jsp)
2. 학과 별 강의정보(subInfo.jsp)
3. 수강신청(addLecture.jsp)
4. 공지사항(board.jsp -> 공지게시판 메인 / boardUpdate.jsp -> 공지게시판 수정 및 삭제)



※ mainSection -> header 밑에 들어갈 '본문'(좌우에 화살표가 있어서, 클릭하면 좌우 이동 + 5초 간격으로 우측 이동)

1) 사진
1-1. 대학교 전경 사진 : 클릭 시 collegeInfo.jsp 이동
1-2. 컴공과 학생들 '이건어때?' 라는 서비스 개발! : 클릭 시 이건어때? url 이동 (이건어때 배포 후 적용)
1-3. 국문학과 백일장 수상작 '이인성 학생의 윤슬' : 클릭 시 게시판 board.jsp 으로 이동 (-> 대충 게시판에 인성이 시 하나 올려두고 여기로 이동)

2) 시간표
2-1. 로그아웃 상태일 때에는, 시간표 공란
2-2. 로그인 시, 해당 유저 계정에 맞는 시간표 출력
2-3. 로그인 시, 해당 유저가 신청한 강의가 없을 경우 시간표 공란 + 시간표 위에 '수강신청하러 가기' 등의 문구 삽입해주기

3) TODO LIST
3-1. 좌측 aside 에 해당 유저가 작성한 TODO LIST 출력
3-2. 해당 유저가 작성한 TODO LIST 가 없는 경우, 공란

</body>
</html>
