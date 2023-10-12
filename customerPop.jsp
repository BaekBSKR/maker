<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/customer/customerPop.css">
<title>고객번호 검색 팝업창</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"
</script>
</head>
<body>
	<div class="subject_name_warp">
		<span>고객 선택</span>
	</div>
	
	<div class="content_wrap">
    	<!-- 게시물 표 영역 -->
		<div class="customer_table_wrap">
	        	<!-- 게시물 O -->
	            <c:if test="${listCheck != 'empty'}">
	            	<div class="table_exist">
		            	<table class="customer_table">
		                	<thead>
		                    	<tr>
		                    		<td class="th_column_1">고객 번호</td>
		                    		<td class="th_column_2">고객 아이디</td>
		                    		<td class="th_column_3">고객 닉네임</td>
		                    	</tr>
		                    </thead>
		                    
		                    <c:forEach items="${list}" var="list">
		                    	<tr>
		                    		<td><c:out value="${list.cno}"></c:out> </td>
		                    		<td>
		                    			<a class="move" href='<c:out value="${list.cno}"/>' data-name='<c:out value="${list.cno}"/>'>
											<c:out value="${list.c_id}"/>
										</a>
		                    		</td>
		                    		<td><c:out value="${list.c_nick}"></c:out></td>
		                    	</tr>
		                    </c:forEach>
		               </table>
	               </div>                			
	           </c:if>
	           
	           <!-- 게시물 x -->
	           <c:if test="${listCheck == 'empty'}">
	               	<div class="table_empty">
	               		등록된 고객이 없습니다. 회원가입을 진행해주세요.
	               		<div><a href="/customer/join">회원가입</a></div>
	               	</div>
	           </c:if>
	               		
	           <!-- 검색 영역 -->
	           <c:if test="${listCheck != 'empty'}">
	           		<div class="search_wrap">
	                	<form id="searchForm" action="/customer/customerPop" method="get">
	                    	<div class="search_input">
	                    		<input type="text" name="keyword" placeholder="아이디를 입력하세요." value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
	                    		<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"></c:out>'>
	                    		<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
	                    		<button class='btn search_btn'>검 색</button>
	                    	</div>
	                    </form>
	               </div>
	          </c:if>
	                    
	          <!-- 페이지 이동 인터페이스 영역 -->
	          <c:if test="${listCheck != 'empty'}">
					<div class="pageMaker_wrap" >
	                	<ul class="pageMaker">
		                    <!-- 이전 버튼 -->
		                    <c:if test="${pageMaker.prev}">
		                    	<li class="pageMaker_btn prev">
		                    		<a href="${pageMaker.pageStart - 1}">이전</a>
		                    	</li>
		                    </c:if>
		                    	
		                    <!-- 페이지 번호 -->
		                    <c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}" var="num">
		                    	<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}">
		                    		<a href="${num}">${num}</a>
		                    	</li>
		                    </c:forEach>
		                    	
		                    <!-- 다음 버튼 -->
		                    <c:if test="${pageMaker.next}">
		                    	<li class="pageMaker_btn next">
		                    		<a href="${pageMaker.pageEnd + 1 }">다음</a>
		                    	</li>
		                    </c:if>
		                </ul>
		     		</div>      
		     </c:if>         		
	               		
			<form id="moveForm" action="/customer/customerPop" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			</form>               		      		
		</div>
	</div>
	
<script>
		let searchForm = $('#searchForm');
		let moveForm = $('#moveForm');
		const openerWindow = window.opener;
		 
		// 페이지 이동 버튼
		$(".pageMaker_btn a").on("click", function(e){
		    e.preventDefault();
		    moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		    moveForm.submit();
		});
		
		// 선택하기 버튼 동작 */
		$("#searchForm button").on("click", function(e){
			e.preventDefault();
	
			// 검색 키워드 유효성 검사
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하십시오.");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			searchForm.submit();
		});
		
		// 고객 선택 및 팝업창 닫기
		$(".move").on("click", function(e){
			e.preventDefault();
			let customerId = $(this).attr("href");
			let customerNick = $(this).data("name");
			
			$(opener.document).find("#cno_input").val(customerId);
			$(opener.document).find("#cno").val(customerNick);
			
			window.close();
		});	
</script>
</body>
</html>