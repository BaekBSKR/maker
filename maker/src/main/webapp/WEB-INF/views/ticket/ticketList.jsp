<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓 페이지</title>
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
<!-- Slick carousel -->
<link href="/resources/slick/slick.css" rel="stylesheet" type="text/css" />
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
<link href="/resources/css/theme.css?after" rel="stylesheet"
	type="text/css">
<style>
.paging {
	display: block;
	padding-left: 40%;
}

.paging a {
	font-weight: bold;
	font-size: 20px;
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}

.movie-line-entity {
	border-radius: 10px;
}

.embed-responsive-item {
	border-radius: 10px;
}

.info-short {
	font-size: 20px;
}

.badge {
	top: 0.5rem;
	left: 0.5rem;
	position: absolute;
	background-color: orange;
	color: white;
}
</style>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>
	<section class="after-head d-flex section-text-white position-relative">
		<div class="d-background bg-black-80"></div>
		<div class="top-block top-inner container">
			<div class="top-block-content">
				<h1 class="section-title">예매 페이지</h1>
				<div class="page-breadcrumbs">
					<a class="content-link" href="/">홈</a> <span
						class="text-theme mx-2"><i class="fas fa-chevron-right"></i></span>
					<a class="content-link" href="ticketList">예매 이력</a>
				</div>
			</div>
		</div>
	</section>
	<section class="section-long">
		<div class="container">
			<c:forEach var="ticket" items="${viewAll}">
				<article class="movie-line-entity">
					<div class="entity-poster">
						<div class="embed-responsive embed-responsive-poster">
							<img class="embed-responsive-item" src="${ticket.m_img}" />
							<div class="badge">ticket</div>
						</div>
					</div>
					<div class="entity-content">
						<h2 class="entity-title">
							<a class="content-link"
								href="/movie/movieinfo?m_title=${ticket.m_title}">${ticket.m_title}</a>
						</h2>
						<br>
						<div class="entity-info">
							<div class="info-lines">
								<div class="info info-short">
									<span class="text-theme info-icon"><i
										class="fas fa-clock"></i></span> <span class="info-text">${ticket.t_time}</span>
								</div>
							</div>
						</div>
						<div class="entity-info">
							<div class="info-lines">
								<div class="info info-short">
									<span class="text-theme info-icon"><i
										class='fas fa-user'></i></span><span class="info-text">${ticket.sno}
										좌석</span>
								</div>
							</div>
						</div>
						<div class="entity-info">
							<div class="info-lines">
								<div class="info info-short">
									<span class="text-theme info-icon"><i
										class='fas fa-money-bill-alt'></i></span> <span class="info-text">${ticket.t_price}
										원</span>
								</div>
							</div>
						</div>
					</div>
				</article>
			</c:forEach>
			<div class="paging">
				<c:if test="${paging.startPage != 1}">
					<a
						href="/ticket/ticketList?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage}">
							<b><a>${p}</a></b>
						</c:when>
						<c:when test="${p != paging.nowPage}">
							<a
								href="/ticket/ticketList?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a
						href="/ticket/ticketList?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
				</c:if>
			</div>
		</div>
	</section>
	<a class="scroll-top disabled" href="#"><i class="fas fa-angle-up"
		aria-hidden="true"></i></a>
	<%@ include file="../includes/footer.jsp"%>
	<!-- jQuery library -->
	<script src="/resources/js/jquery-3.3.1.js"></script>
	<!-- Bootstrap -->
	<script src="/resources/bootstrap/js/bootstrap.js"></script>
	<!-- Waypoints -->
	<script src="/resources/waypoints/jquery.waypoints.min.js"></script>
	<!-- Slick carousel -->
	<script src="/resources/slick/slick.min.js"></script>
	<!-- Magnific Popup -->
	<script src="/resources/magnific-popup/jquery.magnific-popup.min.js"></script>
	<!-- Inits product scripts -->
	<script src="/resources/js/script.js"></script>
	<script async defer
		src="https://ia.media-imdb.com/images/G/01/imdb/plugins/rating/js/rating.js"></script>
</body>
</html>