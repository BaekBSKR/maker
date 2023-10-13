<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 페이지</title>
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
</head>
<body class="body">
	<%@ include file="../includes/header.jsp"%>
	<section class="after-head d-flex section-text-white position-relative">
		<div class="d-background bg-black-80"></div>
		<div class="top-block top-inner container">
			<div class="top-block-content">
				<c:forEach var="movie" items="${movies}">
					<h1 class="section-title">영화</h1>
					<div class="page-breadcrumbs">
						<a class="content-link" href="/">홈</a> <span
							class="text-theme mx-2"><i class="fas fa-chevron-right"></i></span>
						<a class="content-link" href="movielist">영화 리스트</a> <span
							class="text-theme mx-2"><i class="fas fa-chevron-right"></i></span>
						<a class="content-link"
							href="/movie/movieinfo?m_title=${movie.m_title}">영화</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<div class="container">
		<div class="sidebar-container">
			<div class="content">
				<section class="section-long">
					<c:forEach var="movie" items="${movies}">
						<div class="section-line">
							<div class="movie-info-entity">
								<div class="entity-poster" data-role="hover-wrap">
									<div class="embed-responsive embed-responsive-poster">
										<img class="embed-responsive-item" src="${movie.m_img}" alt="" />
									</div>
								</div>
								<div class="entity-content">
									<h1 class="entity-title">${movie.m_title}</h1>
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
												<span class="info-rest">min</span>
											</div>
										</div>
									</div>
									<ul class="entity-list">
										<li><span class="entity-list-title">개봉년도:</span>${movie.m_open}</li>
										<li><span class="entity-list-title">감독:</span>${movie.m_direct}</li>
										<li><span class="entity-list-title">주연:</span>${movie.m_char}</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="section-line">
							<div class="section-head">
								<h2 class="section-title text-uppercase">개요</h2>
							</div>
							<div class="section-description">${movie.m_comment}</div>
						</div>
					</c:forEach>
					<div class="section-line">
						<div class="section-head">
							<h2 class="section-title text-uppercase">리뷰 목록</h2>
						</div>
						<c:forEach var="review" items="${viewReviewAll}">
							<div class="comment-entity">
							<div class="entity-inner">
								<div class="entity-content">
										<div class="entity-content">
											<h4 class="entity-title">${review.c_nick}</h4>
											<p class="entity-subtext">${review.r_reg}</p>
											<p class="entity-subtext">${review.r_star}</p>
											<p class="entity-text">${review.r_comment}</p>
										</div>
									
								</div>
								<div class="entity-extra">
									<div class="grid-md row">
										<div class="col-12 col-sm-auto">
											<div class="entity-rating">
												<span class="entity-rating-icon text-theme"><i
													class="fas fa-star"></i></span> <span
													class="entity-rating-icon text-theme"><i
													class="fas fa-star"></i></span> <span
													class="entity-rating-icon text-theme"><i
													class="fas fa-star"></i></span> <span
													class="entity-rating-icon text-theme"><i
													class="fas fa-star"></i></span> <span
													class="entity-rating-icon text-theme"><i
													class="fas fa-star"></i></span> <span
													class="entity-rating-icon text-theme"><i
													class="fas fa-star"></i></span> <span
													class="entity-rating-icon text-theme"><i
													class="fas fa-star"></i></span> <span class="entity-rating-icon"><i
													class="fas fa-star"></i></span> <span class="entity-rating-icon"><i
													class="fas fa-star"></i></span> <span class="entity-rating-icon"><i
													class="fas fa-star"></i></span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
						
					</div>
						
					<div style="display: block; text-align: center;">
						<c:if test="${paging.startPage != 1}">
							<a
								href="/movie/movieinfo?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage}">
									<b>${p}</b>
								</c:when>
								<c:when test="${p != paging.nowPage}">
									<a
										href="/movie/movieinfo?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="/movie/movieinfo?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
						</c:if>
					</div>
					<a class="scroll-top disabled" href="#"><i class="fas fa-angle-up"
				aria-hidden="true"></i></a>
					<div class="section-line">
						<div class="section-head">
							<h2 class="section-title text-uppercase">리뷰 작성</h2>
						</div>
						
						<c:if test="${customer != null}">
						<form action="/movie/reviewReg" method="post">
							<div class="row form-grid">
								<div class="col-12 col-sm-6">
									<div class="input-view-flat input-group">
										<input class="form-control" name="c_nick" type="text"
											value="${customer.c_nick}" readonly />
									</div>
								</div>
								<div class="col-12">
									<div class="input-view-flat input-group">
										<textarea class="form-control" name="r_comment"
											placeholder="감상평을 적어주세요"></textarea>
									</div>
								</div>
								<div class="col-12">
									<div class="rating-line">
										<label>Rating:</label>
										<input class="form-control" name="r_star" type="number"
											value=10 />
									</div>
								</div>
								<input class="form-control" name="mno" type="number"
											value="${movies[0].mno}" hidden="hidden"/>
								<input class="form-control" name="m_title" type="text"
											value="${movies[0].m_title}" hidden="hidden"/>
								<input class="form-control" name="cno" type="number"
											value="${customer.cno}" hidden="hidden" />
								<div class="col-12">
									<button class="px-5 btn btn-theme" type="submit">Send</button>
								</div>
							</div>
						</form>
						</c:if>
					</div>
				</section>
			</div>
		</div>
	</div>
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