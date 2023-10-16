<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/notice/noticeEnroll.css">
<title>공지사항 등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"
</script>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>
	
	<div class="notice_content_wrap">
    	<div class="notice_content_subject"><span>공지사항 등록</span></div>
			<div class="notice_comment_main">
    			<form action="/notice/noticeEnroll.do" method="post" id="enrollForm">
		        	<div class="form_section">
		            	<div class="form_section_title">
		                	<label>제목</label>
		                </div>
		                
		                <div class="form_section_content">
		                	<input name="n_title">
		               	</div>
		            </div>
		           
		            <div class="form_section">
		           		<div class="form_section_title">
		                	<label>내용</label>
		                </div>
		                
		                <div class="form_section_content">
		                	<textarea id="n_comment" name="n_comment"></textarea>
		               	</div>
		           </div>
		          
		          
		           <div class="form_section">
		          		<div class="form_section_title">
		                	<label>고객번호</label>
		                </div>
		                
		                <div class="form_section_content">
		                	<input id="cno" name="maker_cno" readonly="readonly">
		                	<input id="cno_input" name="cno" type="hidden">
							<button class="btn btn-primary" id="cno_btn">선택하기</button>
		               	</div>
		          </div>
			</form>
			
	        <div class="btn_section">
	        	<button id="cancelBtn" class="btn cancle_btn">취 소</button>
					<button id="enrollBtn" class="btn enroll_btn">등 록</button>
			</div> 
		   
		</div>
	</div>
	
	<%@ include file="../includes/footer.jsp"%>
<script>
	let enrollForm = $("#enrollForm");

	// 등록 버튼
	$("#enrollBtn").on("click", function(e){
		e.preventDefault();
		
		// 검사 통과 유무 변수
		let titleCheck = false;
		let commentCheck = false;
		let cIdCheck = false;
		
		// 입력값 변수
		let title = $("input[name='n_title']").val();
		let comment = $("textarea[name='n_comment']").val();
		let cId = $("input[name='cno']").val();
	    
	    // 제목 유효성 검사
	    if (title) {
	    	titleCheck = true;
	    }else {
	    	alert("제목을 입력해주세요.");
	    	titleCheck = false;
	    }
	    
	 	// 내용 유효성 검사
	    if (comment) {
	    	commentCheck = true;
	    }else {
	    	alert("내용을 입력해주세요.");
	    	commentCheck = false;
	    }
	 	
		// 고객번호 유효성 검사
	    if (cId) {
	    	cIdCheck = true;
	    }else {
	    	alert("고객번호를 선택해주세요.");
	    	cIdCheck = false;
	    }
		
		// 최종 유효성 검사
		if (titleCheck && commentCheck && cIdCheck) {
			enrollForm.submit();
		}else {
			return false;
		}
	    
	});
	 
	// 취소 버튼 
	$("#cancelBtn").click(function(){
	    location.href="/notice/noticeManage"
	});
	
	// 선택하기 버튼 
	$('#cno_btn').on("click",function(e){
		e.preventDefault();
		let popUrl = "/customer/customerPop";
		let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
		
		window.open(popUrl,"고객 찾기",popOption);
	});
 
</script>
</body>
</html>