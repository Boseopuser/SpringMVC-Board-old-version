<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>KBS 게시판</title>

<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="form-group">
	<form role="form" method="post" autocomplete="off">
		<p>
			<label for="userId">아이디</label> <input type="text" id="userId"
				name="userId" />

			<button type="button" class="idCheck">아이디 확인</button>
		</p>
</div>

<div class="form-group">
		<p class="result">
			<span class="msg">아이디를 확인해주십시오.</span>
		</p>
</div>
<div class="form-group">
		<p>
			<label for="userPass">패스워드</label> <input type="password"
				id="userPass" name="userPass" />
		</p>
</div>

<div class="form-group">
		<p>
			<label for="userName">닉네임</label> <input type="text" id="userName"
				name="userName" />
		</p>
</div>
<div class="form-group">
		<p>
			<button type="submit" id="submit" disabled="disabled">가입</button>
		</p>
</div>

<div class="form-group">
		<p>
			<a href="/">처음으로</a>
		</p>
</div>
	</form>

	<script>
		$(".idCheck").click(function() {

			var query = {
				userId : $("#userId").val()
			};

			$.ajax({
				url : "/member/idCheck",
				type : "post",
				data : query,
				success : function(data) {

					if (data == 1) {
						$(".result .msg").text("사용 불가");
						$(".result .msg").attr("style", "color:#f00");
						
						$("#submit").attr("disabled", "disabled");
					} else {
						$(".result .msg").text("사용 가능");
						$(".result .msg").attr("style", "color:#00f");
						
						$("#submit").removeAttr("disabled");
					}
				}
			}); // ajax 끝
		});
		
		$("#userId").keyup(function(){
			   $(".result .msg").text("아이디를 확인해주십시오.");
			   $(".result .msg").attr("style", "color:#000");
			   
			   $("#submit").attr("disabled", "disabled");
			   
			});
	</script>

</body>
</html>