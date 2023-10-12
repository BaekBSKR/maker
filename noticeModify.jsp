<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/notice/noticeModify.css">
<title>공지사항 수정</title>
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
        <div class="notice_content_subject"><span>공지사항 수정</span></div>
        	<div class="notice_content_main">
        		<form id="modifyForm" action="/notice/noticeModify" method="post">
	            	<div class="form_section">
	                	<div class="form_section_title">
	                    	<label>제목</label>
	                   	</div>
	                   	
	                   	<div class="form_section_content">
	                   		<input type="text" class="input_block" name="n_title" id="n_title" value="${noticeInfo.n_title}">
	                   	</div>
	               	</div> 
	               	                   
	                <div class="form_section">
	                	<div class="form_section_title">
	                   		<label>내용</label>
	                   	</div>
	                   	
	                   	<div class="form_section_content">
	                   		<textarea class="input_block" name="n_comment" id="n_comment">${noticeInfo.n_comment}</textarea>
	                   	</div>
	                </div>
	                
	                <div class="form_section_title">
	                	<label>고객번호</label>
	                </div>
	                
	                <div class="form_section_content">
	                	<input class="input_block" name="cno" readonly="readonly" value="<c:out value='${noticeInfo.cno}'></c:out>">	
	                </div>
	                
	                <div class="form_section">
	                	<div class="form_section_title">
	                   		<label>등록 날짜</label>
	                   	</div>
	                   	
	                   	<div class="form_section_content">
	                   		<input class="input_block" type="text" readonly="readonly" value="<fmt:formatDate value="${noticeInfo.n_reg}" pattern="yyyy-MM-dd"/>">
	                   	</div>
	               </div>
	               
	               <input type="hidden" name='nno' value="${noticeInfo.nno}">
	               
	              	<div class="btn_section">
	              		<button id="cancelBtn" class="btn">취 소</button>
		                <button id="modifyBtn" class="btn modify_btn">수 정</button>
		    		</div> 
	    		</form>
			</div>                    
	</div>
                
	<form id="moveForm" method="get">
        <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
        <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>' >
        <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
        <input type="hidden" name="nno" value='<c:out value="${noticeInfo.nno}"/>'>
	</form>
        
	<%@ include file="../includes/footer.jsp"%>
	
<script>
	let moveForm = $("#moveForm");
	let modifyForm = $("#modifyForm");

	// 수정 버튼
	$("#modifyBtn").on("click", function(e){
		let title = $(".form_section_content input[name='n_title']").val();
		let comment = $(".form_section_content textarea").val();
		
		let titleCheck = false;
		let commentCheck = false;
		
		e.preventDefault();
		
	    // 제목 유효성 검사
	    if (!title) {
	    	titleCheck = false;
	    }else {
	    	titleCheck = true;
	    }
	    
	 	// 내용 유효성 검사
	    if (!comment) {
	    	commentCheck = false;
	    }else {
	    	commentCheck = true;
	    }
		
		// 최종 유효성 검사
		if (titleCheck && commentCheck) {
			modifyForm.submit();
		}else {
			return false;
		}
	    
	});
	
	// 취소
	$("#cancelBtn").on("click", function(e){
		e.preventDefault();	
		moveForm.attr("action", "/notice/noticeDetail")
		moveForm.submit();
		
	});
	
</script>
</body>
</html>