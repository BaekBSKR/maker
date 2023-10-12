<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
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
	<%@ include file="./includes/header.jsp"%>
	<section class="section-text-white position-relative">
		<div class="d-background bg-theme-blacked"></div>
		<div class="mt-auto container position-relative">
			<div class="top-block-head text-uppercase">
				<h2 class="display-4">
					현재 <span class="text-theme">상영작</span>
				</h2>
			</div>
			<div class="top-block-footer">
				<div class="slick-spaced slick-carousel"
					data-slick-view="navigation responsive-4">
					<div class="slick-slides">
						<c:forEach var="movie" items="${movies}">
							<div class="slick-slide">
								<article class="poster-entity" data-role="hover-wrap">
									<div class="embed-responsive embed-responsive-poster">
										<img class="embed-responsive-item" src="${movie.m_img}" alt="" />
									</div>
									<div class="d-over bg-highlight-bottom">
										
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
									</div>
								</article>
							</div>
						</c:forEach>
					</div>
					<div class="slick-arrows">
						<div class="slick-arrow-prev">
							<span class="th-dots th-arrow-left th-dots-animated"> <span></span>
								<span></span> <span></span>
							</span>
						</div>
						<div class="slick-arrow-next">
							<span class="th-dots th-arrow-right th-dots-animated"> <span></span>
								<span></span> <span></span>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="section-long">
		<div class="container">
			<div class="section-head">
				<h2 class="section-title">현재 상영작</h2>
			</div>
			<c:forEach var="movie" items="${movies}">
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
		</div>
	</section>
	<section
		class="section-solid-long section-text-white position-relative">
		<div class="d-background bg-gradient-black"></div>
		<div class="container position-relative">
			<div class="section-head">
				<h2 class="section-title">상영 예정작</h2>
			</div>
			<div class="slick-spaced slick-carousel"
				data-slick-view="navigation single">
				<div class="slick-slides">
					<c:forEach var="movie" items="${trailer}">
						<div class="slick-slide">
							<article class="movie-line-entity">
								<div class="entity-preview">
									<div>
										<img class="embed-responsive-item" src="${movie.m_img}"
											width="370" height="510">
									</div>
								</div>
								<div class="entity-content">
									<h4 class="entity-title">${movie.m_title}</h4>
									<div class="entity-info">
										<div class="info-lines">
											<div class="info info-short">
												<span class="text-theme info-icon"><i
													class="fas fa-calendar-alt"></i></span> <span class="info-text">${movie.m_open}</span>
											</div>
											<div class="info info-short">
												<span class="text-theme info-icon"><i
													class="fas fa-clock"></i></span> <span class="info-text">${movie.m_time}</span>
												<span class="info-rest">&nbsp;min</span>
											</div>
										</div>
									</div>
									<p class="section-description">${movie.m_comment}</p>
								</div>
							</article>
						</div>
					</c:forEach>
				</div>
				<div class="slick-arrows">
					<div class="slick-arrow-prev">
						<span class="th-dots th-arrow-left th-dots-animated"> <span></span>
							<span></span> <span></span>
						</span>
					</div>
					<div class="slick-arrow-next">
						<span class="th-dots th-arrow-right th-dots-animated"> <span></span>
							<span></span> <span></span>
						</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<a class="scroll-top disabled" href="#"><i class="fas fa-angle-up"
		aria-hidden="true"></i></a>
	<%@ include file="./includes/footer.jsp"%>
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