<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/resources/css/customer/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"
</script>
</head>
<body>
<%@ include file="../includes/header.jsp"%>
	<div class="wrapper">
		<div class="wrap">
			<form id="login_form" method="post">
				<div class="logo_wrap">
					<span>로그인</span>
				</div>
			
				<div class="login_wrap"> 
					<div class="id_wrap">
						<div class="id_input_box">
							<input type="text" class="id_input" name="c_id">
						</div>
					</div>
				
					<div class="pw_wrap">
						<div class="pw_input_box">
							<input type="password" class="pw_iput" name="c_pwd">
						</div>
					</div>
					
					<c:if test="${result == 0}">
                		<script type="text/javascript">
                			alert("아이디와 비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
                		</script>
            		</c:if>
					
					<div class="login_button_wrap">
						<input type="button" class="login_button" value="로그인">
					</div>			
				</div>
			</form>
		</div>
	</div>

<script>

	//유효성 검사 통과유무 변수 
	var idCheck = false;                  // 아이디
	var pwdCheck = false;                 // 비밀번호
	var result = "<c:out value='${result}' />"
	
	// 로그인 버튼 클릭
	$(".login_button").click(function(){
		//alert("로그인 버튼 작동");
		
	    var id = $('.id_input').val();                 		   // 아이디 입력란
		var pwd = $('.pw_iput').val();                        // 비밀번호 입력란
		
		// 아이디 유효성검사 
        if (id == "") {
        	alert("아이디를 입력해주세요.");
        	idCheck = false;
        }else {
        	idCheck = true;
        }
		
     	// 비밀번호 유효성검사 
        if (pwd == "") {
        	alert("비밀번호를 입력해주세요.");
        	pwdCheck = false;
        }else {
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