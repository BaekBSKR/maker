<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery library -->
<script src="/resources/js/jquery-3.3.1.js"></script>
<!-- jQuery UI의 스타일과 스크립트를 추가합니다. -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link href="/resources/css/ticketAllChk.css" rel="stylesheet" type="text/css">
<!-- Bootstrap -->
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<!-- Animate.css -->
<link href="/resources/animate.css/animate.css" rel="stylesheet"
	type="text/css" />
<!-- Font Awesome iconic font -->
<link href="/resources/fontawesome/css/fontawesome-all.css"
	rel="stylesheet" type="text/css" />
<!-- Magnific Popup -->
<link href="/resources/magnific-popup/magnific-popup.css"
	rel="stylesheet" type="text/css" />
<!-- Fonts -->
<link
	href='https://fonts.googleapis.com/css?family=Oswald:300,400,500,700'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'
	rel='stylesheet' type='text/css'>
<!-- Theme styles -->
<link href="/resources/css/dot-icons.css" rel="stylesheet"
	type="text/css">
<link href="/resources/css/theme.css" rel="stylesheet" type="text/css">
<title>영화 예매</title>

</head>
<body>
<!-- jQuery library -->
<script src="/resources/js/ticketAllChk.js"></script>
<%@ include file="../includes/header.jsp"%>
<section class="after-head d-flex section-text-white position-relative">
		<div class="d-background bg-black-80"></div>
		<div class="top-block top-inner container">
			<div class="top-block-content">
				<h1 class="section-title">예매 페이지</h1>
			</div>
		</div>
</section>
<div id="wrapper">
	<div id="ticketCenter">
	    <form action="./ticketSave" method="post">
	        <label for="dateTime">날짜</label>
	        <!-- 달력 형식의 날짜 선택을 위한 입력 필드 -->
	        <input type="text" id="dateTime" name="dateTime" required readonly><br>
	        <label for="movieName">영화</label>
	        <select id="m_title" name="m_title">
	        	<option value="null">--영화를 선택해 주세요.--</option>
		        	<c:forEach var="movie" items="${movies}">
	        			<option value="${movie.m_title}">${movie.m_title}</option>
	        		</c:forEach>
	        </select><br>
	        <label for="m_time">시간</label>
	        <input type="text" id="m_time" name="m_time" readonly><br>
	        <label for="sno">좌석번호</label>
	        <input type="text" id="sno" name="sno" readonly><br>
	        <input type="text" id="cno" name="cno" value=${customer.cno} hidden="hidden">
	        <input type="text" id="t_time" name="t_time" hidden="hidden">
	        <div id="seats">
		        <%-- 좌석을 나타내는 엘리먼트를 생성합니다. --%>
		        <c:forEach var="row" begin="1" end="5">
		        	<ul>
		            <c:forEach var="col" begin="1" end="10">
		            	<c:set var="sno" value="${10*(row-1)+col}" />
		            	<li><div class="seat" id="seat<c:out value='${sno}' />">${sno}</div></li>
		            </c:forEach>
		            </ul>
		        </c:forEach>
		    </div>
	        <button type="submit" id="sbmBtn">예매</button>
	        <button type="reset" id="resetBtn">초기화</button>
	    </form>
	</div>
</div>
<%@ include file="../includes/footer.jsp"%>
</body>
</html>