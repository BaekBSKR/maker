<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/resources/css/customer/join.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
}

/*아이디 중복 영역*/
#id_confirm {
	border-radius: 5px;
	width: 120px;
	height: 30px;
	font-size: 15px;
}

/* 닉네임 영역 */
.nick_wrap {
	width: 100%;
	margin-top: 20px;
}

.nick_name {
	font-size: 25px;
	font-weight: bold;
}


.nick_input {
	width: 100%;
	height: 100%;
	border: none;
	font-size: 28px;
}

/* 생년월일 영역 */
.birth_wrap {
	width: 100%;
	margin-top: 20px;
}

.birth_name {
	font-size: 25px;
	font-weight: bold;
}

.birth_input {
	width: 100%;
	height: 100%;
	border: none;
	font-size: 28px;
}

/* 버튼 영역 */
.join_button {
	background: #FF8C00;
	border-radius: 10px;
}

.id_input, .nick_input, .pw_input, .pwck_input, .birth_input,
	.mail_input {
	font-size: 25px;
	border: 1px solid black;
	height: 35px;
	padding: 10px 14px;
	border-radius: 10px;
}
</style>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>
	<div class="wrapper">
		<div class="input-form col-md-12 mx-auto">
			<form id="join_form" method="post">
				<div class="wrap">
					<h2 class="mb-3">회원가입</h2>
					<hr>
					<div class="id_wrap">
						<div class="id_name">
							아이디 <input type="button" id="id_confirm" value="아이디 중복확인">
						</div>
						<input type="text" class="id_input" name="c_id">
					</div>

					<div class="pw_wrap">
						<div class="pw_name">비밀번호</div>
						<input type="password" class="pw_input" name="c_pwd">
					</div>

					<div class="pwck_wrap">
						<div class="pwck_name">비밀번호 확인</div>
						<input type="password" class="pwck_input" name="c_pwdCk">
					</div>

					<div class="nick_wrap">
						<div class="nick_name">닉네임</div>
						<input type="text" class="nick_input" name="c_nick">
					</div>

					<div class="mail_wrap">
						<div class="mail_name">이메일</div>
						<input type="text" class="mail_input" name="c_mail">
					</div>

					<div class="birth_wrap">
						<div class="birth_name">생년월일</div>
						<input type="text" class="birth_input" name="c_birth">
					</div>
					<div class="join_button_wrap">
						<input type="button" class="join_button" value="가입하기">
					</div>
				</div>
			</form>
		</div>
	</div>

	<script>
		$(document).ready(
				function() {
					//유효성 검사 통과유무 변수 
					var idCheck = false; // 아이디
					var idckCheck = false; // 아이디 중복 검사
					var pwdCheck = false; // 비밀번호
					var pwdckCheck = false; // 비밀번호 확인
					var pwdckCorCheck = false; // 비밀번호 확인 일치 확인
					var nickCheck = false; // 닉네임
					var mailCheck = false; // 이메일
					var birthCheck = false; // 생년월일

					$(function() {
						//회원가입 버튼(회원가입 기능 작동)
						$(".join_button").click(
								function() {
									var id = $('.id_input').val(); // 아이디 입력란
									var pwd = $('.pw_input').val(); // 비밀번호 입력란
									var pwdConfirm = $('.pwck_input').val(); // 비밀번호 확인 입력란
									var nick = $('.nick_input').val(); // 닉네임 확인 입력란
									var mail = $('.mail_input').val(); // 이메일 확인 입력란
									var birth = $('.birth_input').val(); // 생년월일 확인 입력란

									// 아이디 유효성검사 
									if (id == "") {
										alert("아이디를 입력해주세요.");
										idCheck = false;
									} else {
										idCheck = true;
									}

									// 아이디 중복체크 유효성검사 
									if (idckCheck == false) {
										alert("아이디 중복확인을 진행해주세요.");
									} else {
										idchCheck = true;
									}

									// 비밀번호 유효성검사 
									if (pwd == "") {
										alert("비밀번호를 입력해주세요.");
										pwdCheck = false;
									} else {
										pwdCheck = true;
									}

									// 비밀번호 확인 유효성검사 
									if (pwdConfirm == "") {
										alert("비밀번호 확인을 입력해주세요.");
										pwdckCheck = false;
									} else {
										pwdckCheck = true;
									}

									// 비밀번호 확인 유효성검사 
									if (pwd != pwdConfirm) {
										alert("비밀번호를 동일하게 입력하세요.");
										pwdckCorCheck = false;
									} else {
										pwdckCorCheck = true;
									}

									// 닉네임 유효성검사 
									if (nick == "") {
										alert("닉네임을 입력해주세요.");
										nickCheck = false;
									} else {
										nickCheck = true;
									}

									// 이메일 유효성검사 
									if (mail == "") {
										alert("이메일을 입력해주세요.");
										mailCheck = false;
									} else {
										mailCheck = true;
									}

									// 생년월일 유효성검사 
									if (birth == "") {
										alert("생년월일을 입력해주세요.");
										birthCheck = false;
									} else {
										birthCheck = true;
									}

									// 최종 유효성 검사
									if (idCheck && idckCheck && pwdCheck
											&& pwdckCheck && pwdckCorCheck
											&& nickCheck && mailCheck
											&& birthCheck) {
										$("#join_form").attr("action",
												"/customer/join");
										$("#join_form").submit();
									}

									return false;

								});
					});

					// 아이디 중복검사
					$("#id_confirm").on("click", function() {
						var customerId = $(".id_input").val(); // 아이디 입력칸에 입력되는 값
						var data = {
							customerId : customerId
						};

						$.ajax({
							type : 'POST',
							url : "/customer/customerIdChk",
							data : data,
							success : function(result) {
								console.log("성공 여부: " + result);
								if (customerId != "") {
									if (result != 'fail') {
										alert("사용 가능한 아이디입니다.");
										idckCheck = true;
									} else if (result == 'fail') {
										alert("이미 존재하는 아이디입니다.");
										idckCheck = false;
									}
								} else {
									alert("아이디를 입력해주세요.");
									idckCheck = false;
								}
							}
						});
					});
				});
	</script>
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>