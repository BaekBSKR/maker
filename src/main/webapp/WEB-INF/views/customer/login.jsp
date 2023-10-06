<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/resources/css/customer/login.css">
</head>
<body>
<%@ include file="../includes/header.jsp"%>
	<div class="wrapper">
	
	<div class="wrap">
		<div class="logo_wrap">
			<span>로그인</span>
		</div>
		<div class="login_wrap"> 
			<div class="id_wrap">
					<div class="id_input_box">
					<input class="id_input">
				</div>
			</div>
			<div class="pw_wrap">
				<div class="pw_input_box">
					<input class="pw_iput">
				</div>
			</div>
			<div class="login_button_wrap">
				<input type="button" class="login_button" value="로그인">
			</div>			
		</div>
		
		
	</div>

</div>
<%@ include file="../includes/footer.jsp"%>
</body>
</html>