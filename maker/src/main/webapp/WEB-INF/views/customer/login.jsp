<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/resources/css/customer/login.css">
<script>
	src = "https://code.jquery.com/jquery-3.4.1.js"
	integrity = "sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin = "anonymous"
</script>
<style>
.input-form {
	max-width: 680px;
	margin-top: 80px;
	margin-bottom: 200px;
	padding: 32px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}

.id_name, .pw_name {
	font-size: 25px;
	font-weight: bold;
}

.id_input, .pw_input {
	width: 100%;
	height: 100%;
	font-size: 28px;
	border: 1px solid black;
	border-radius: 10px;
}

/* 버튼 영역 */
.login_button {
	background: #FF8C00;
	border-radius: 10px;
}
</style>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>
	<div class="container">
		<div class="input-form col-md-6 mx-auto">
			<h2 class="mb-3">로그인</h2>
			<hr>
			<form id="login_form" method="post">
				<div class="mb-3">
					<div class="login_wrap">
						<div class="id_wrap">
							<div class="id_name">아이디</div>
							<input type="text" class="id_input" name="c_id">
						</div>
					</div>
				</div>
				<div class="mb-3">
					<div class="pw_wrap">
						<div class="pw_name">비밀번호</div>
						<input type="password" class="pw_input" name="c_pwd">
					</div>
					<c:if test="${result == 0}">
						<script type="text/javascript">
							alert("아이디와 비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
						</script>
					</c:if>
				</div>
				<div class="login_button_wrap">
					<input type="button" class="login_button" value="로그인">
				</div>
			</form>
		</div>
	</div>
	<script>
		//유효성 검사 통과유무 변수 
		var idCheck = false; // 아이디
		var pwdCheck = false; // 비밀번호
		var result = "<c:out value='${result}' />"

		// 로그인 버튼 클릭
		$(".login_button").click(function() {
			//alert("로그인 버튼 작동");

			var id = $('.id_input').val(); // 아이디 입력란
			var pwd = $('.pw_iput').val(); // 비밀번호 입력란

			// 아이디 유효성검사 
			if (id == "") {
				alert("아이디를 입력해주세요.");
				idCheck = false;
			} else {
				idCheck = true;
			}

			// 비밀번호 유효성검사 
			if (pwd == "") {
				alert("비밀번호를 입력해주세요.");
				pwdCheck = false;
			} else {
				pwdCheck = true;
			}

			// 최종 유효성 검사
			if (idCheck && pwdCheck) {
				$("#login_form").attr("action", "/customer/login");
				$("#login_form").submit();
			}

			return false;

		});
	</script>
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>