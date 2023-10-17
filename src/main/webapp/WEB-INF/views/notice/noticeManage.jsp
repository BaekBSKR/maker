<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/notice/noticeManage.css?after">
<title>공지사항 목록</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	src = "https://code.jquery.com/jquery-3.4.1.js"
	integrity = "sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin = "anonymous"
</script>
<style>
.next, .prev {
	width: 80px;
}
</style>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>
	<section class="after-head d-flex section-text-white position-relative">
		<div class="d-background bg-black-80"></div>
		<div class="top-block top-inner container">
			<div class="top-block-content">
				<h1 class="section-title">공지사항</h1>
			</div>
		</div>
	</section>
	<div class="notice_content_wrap">
		<div class="notice_table_wrap">
			<c:if test="${listCheck != 'empty'}">
				<table class="notice_table">
					<thead>
						<tr>
							<td class="th_column_1">공지사항 번호</td>
							<td class="th_column_2">제목</td>
							<td class="th_column_3">고객 번호</td>
							<td class="th_column_4">등록 날짜</td>
							<td class="th_column_5">수정 날짜</td>
						</tr>
					</thead>

					<c:forEach items="${list}" var="list">
						<tr>
							<td><c:out value="${list.nno}"></c:out></td>
							<td><a class="move" href='<c:out value="${list.nno}"/>'>
									<c:out value="${list.n_title}"></c:out>
							</a></td>
							<td><c:out value="${list.cno}"></c:out></td>
							<td><fmt:formatDate value="${list.n_reg}"
									pattern="yyyy-MM-dd HH:mm" /></td>
							<td><fmt:formatDate value="${list.n_update}" pattern="yyyy-MM-dd HH:mm"/></td>

						</tr>
					</c:forEach>
				</table>
			</c:if>

			<c:if test="${listCheck == 'empty'}">
				<c:if test="${customer != null}">
					<div class="table_empty">
						등록된 공지사항이 없습니다. 공지사항을 등록해주세요.
						<div>
							<a href="/notice/noticeEnroll">등록</a>
						</div>
					</div>
				</c:if>

				<c:if test="${customer == null}">
					<div class="table_empty">
						등록된 공지사항이 없습니다. 공지사항을 등록하시려면 로그인을 진행해주세요.
						<div>
							<a href="/customer/login">로그인</a>
						</div>
					</div>
				</c:if>
			</c:if>
		</div>

		<!-- 검색 영역 -->
		<c:if test="${listCheck != 'empty'}">
			<div class="search_wrap">
				<form id="searchForm" action="/notice/noticeManage" method="get">
					<div class="search_input">
						<input type="text" name="keyword" placeholder="제목을 입력하세요."
							value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
						<input type="hidden" name="pageNum"
							value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
						<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
						<button class='btn search_btn'>검 색</button>
					</div>
					<c:if test="${customer != null}">
						<button type="button" class="read_btn"
							onclick="location.href='/notice/noticeEnroll'">등 록</button>
					</c:if>
				</form>
			</div>
		</c:if>

		<!-- 페이지 이동 인터페이스 영역 -->
		<c:if test="${listCheck != 'empty'}">
			<div class="pageMaker_wrap">
				<ul class="pageMaker">
					<!-- 이전 버튼 -->
					<c:if test="${pageMaker.prev}">
						<li class="pageMaker_btn prev"><a
							href="${pageMaker.pageStart - 1}">이전</a></li>
					</c:if>

					<!-- 페이지 번호 -->
					<c:forEach begin="${pageMaker.pageStart}"
						end="${pageMaker.pageEnd}" var="num">
						<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}">
							<a href="${num}">${num}</a>
						</li>
					</c:forEach>

					<!-- 다음 버튼 -->
					<c:if test="${pageMaker.next}">
						<li class="pageMaker_btn next"><a
							href="${pageMaker.pageEnd + 1 }">다음</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>

		<form id="moveForm" action="/notice/noticeManage" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		</form>
	</div>
	<%@ include file="../includes/footer.jsp"%>
	<script>
		$(document).ready(function() {
			// 등록 성공
			let result = '<c:out value="${enroll_result}"/>';
			checkResult(result);

			function checkResult(result) {
				if (result === '') {
					return;
				}

				alert("'${enroll_result}'을 등록하였습니다.");

			}

			// 수정 성공
			let modify_result = '<c:out value="${modify_result}"/>';

			if (modify_result == 1) {
				alert("공지사항 수정이 완료되었습니다.");
			}

			// 삭제 성공
			let delete_result = '${delete_result}';

			if (delete_result == 1) {
				alert("선택하신 공지사항이 삭제되었습니다.");
			}

		});

		let moveForm = $('#moveForm');
		let searchForm = $('#searchForm');

		// 페이지 이동 버튼
		$(".pageMaker_btn a").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.submit();
		});

		// 공지사항 검색 버튼 동작 */
		$(".search_btn").on("click", function(e) {
			e.preventDefault();

			// 검색 키워드 유효성 검사
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하십시오.");
				return false;
			}

			searchForm.find("input[name='pageNum']").val("1");
			searchForm.submit();
		});

		// 상품 상세 페이지 이동
		$(".move").on(
				"click",
				function(e) {
					e.preventDefault();

					moveForm.append("<input type='hidden' name='nno' value='"
							+ $(this).attr("href") + "'>");
					moveForm.attr("action", "/notice/noticeDetail");
					moveForm.submit();

				});
	</script>

</body>
</html>