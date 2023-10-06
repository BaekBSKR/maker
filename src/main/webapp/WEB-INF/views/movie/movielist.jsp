<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리스트</title>
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
<link href="/resources/css/theme.css" rel="stylesheet" type="text/css">
</head>
<body class="body">
	<%@ include file="../includes/header.jsp"%>
	<section class="after-head d-flex section-text-white position-relative">
		<div class="d-background bg-black-80"></div>
		<div class="top-block top-inner container">
			<div class="top-block-content">
				<h1 class="section-title">영화 리스트</h1>
				<div class="page-breadcrumbs">
					<a class="content-link" href="/">홈</a> <span
						class="text-theme mx-2"><i class="fas fa-chevron-right"></i></span>
					<a class="content-link" href="movielist">영화 리스트</a>
				</div>
			</div>
		</div>
	</section>
	<section class="section-long">
		<div class="container">
			<c:forEach var="movie" items="${viewAll}">
				<article class="movie-line-entity">
					<div class="entity-poster" data-role="hover-wrap">
						<div class="embed-responsive embed-responsive-poster">
							<img class="embed-responsive-item" src="${movie.m_img}" alt="" />
						</div>
					</div>
					<div class="entity-content">
						<h4 class="entity-title">
							<a class="content-link"
								href="/movie/movieinfo?m_title=${movie.m_title}">${movie.m_title}</a>
						</h4>
						<div class="entity-info">
							<div class="info-lines">
								<div class="info info-short">
									<span class="text-theme info-icon"><i
										class="fas fa-star"></i></span> <span class="info-text">${movie.m_star}</span>
									<span class="info-rest">/10</span>
								</div>
								<div class="info info-short">
									<span class="text-theme info-icon"><i
										class="fas fa-clock"></i></span> <span class="info-text">${movie.m_time}</span>
									<span class="info-rest">&nbsp;min</span>
								</div>
							</div>
						</div>
						<p class="text-short entity-text">${movie.m_comment}</p>
					</div>
				</article>
			</c:forEach>
			<div style="display: block; text-align: center;">
				<c:if test="${paging.startPage != 1}">
					<a
						href="/movie/movielist?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage}">
							<b>${p}</b>
						</c:when>
						<c:when test="${p != paging.nowPage}">
							<a
								href="/movie/movielist?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a
						href="/movie/movielist?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
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