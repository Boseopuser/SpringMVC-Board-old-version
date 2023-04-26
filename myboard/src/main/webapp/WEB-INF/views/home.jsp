<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>KBS 게시판</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>


<h1>
	Spring MVC 게시판   
</h1>

		
	<p><a href="/board/write">글 작성</a></p>
	<br />
	<p><a href="/board/list">글 목록</a></p>
	<br />
	<p><a href="/board/listPage">글 목록 + 페이지</a></p>
	<br />
	<p><a href="/board/listSearch">글 목록 + 페이지 + 목록</a></p>
	
	
	
	<!-- 내용 추가 -->

	<c:if test="${member == null}">
		<form role="form" method="post" autocomplete="off"
			action="/member/login">
			<p>
				<label for="userId">아이디</label> <input type="text" id="userId"
					name="userId" />
			</p>
			<p>
				<label for="userPass">패스워드</label> <input type="password"
					id="userPass" name="userPass" />
			</p>
			<p>
				<button type="submit">로그인</button>
			</p>
			<p>
				<a href="/member/register">회원가입</a>
			</p>
		</form>
	</c:if>

	<c:if test="${msg == false}">
		<p style="color: #f00;">로그인에 실패했습니다. 아이디 또는 패스워드를 다시 입력해주십시오.</p>
	</c:if>

	<c:if test="${member != null}">
		<p>${member.userName}님환영합니다.</p>

		<a href="member/modify">회원정보 수정</a>, <a href="member/withdrawal">회원탈퇴</a>
		<br />
		<a href="member/logout">로그아웃</a>

	</c:if>

<P>  접속시간 : ${serverTime}. </P>

</body>
</html>