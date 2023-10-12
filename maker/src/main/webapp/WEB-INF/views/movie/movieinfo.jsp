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
							<h2 class="section-title text-uppercase">평점</h2>
						</div>
						<div class="comment-entity">
							<div class="entity-inner">
								<div class="entity-content">
									<h4 class="entity-title">Lie Stone</h4>
									<p class="entity-subtext">07.08.2018, 14:33</p>
									<p class="entity-text">Comment example here. Nulla risus
										lacus, vehicula id mi vitae, auctor accumsan nulla. Sed a mi
										quam. In euismod urna ac massa adipiscing interdum.</p>
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
					</div>
					<div class="section-line">
						<div class="section-head">
							<h2 class="section-title text-uppercase">댓글 추가</h2>
						</div>
						<form autocomplete="off">
							<div class="row form-grid">
								<div class="col-12">
									<div class="input-view-flat input-group">
										<textarea class="form-control" name="review"
											placeholder="감상평을 적어주세요"></textarea>
									</div>
								</div>
								<div class="col-12">
									<div class="rating-line">
										<label>Rating:</label>
										<div class="form-rating" name="rating">
											<input type="radio" id="rating-10" name="rating" value="10" />
											<label for="rating-10"> <span
												class="rating-active-icon"><i class="fas fa-star"></i></span>
												<span class="rating-icon"><i class="far fa-star"></i></span>
											</label> <input type="radio" id="rating-9" name="rating" value="9" />
											<label for="rating-9"> <span
												class="rating-active-icon"><i class="fas fa-star"></i></span>
												<span class="rating-icon"><i class="far fa-star"></i></span>
											</label> <input type="radio" id="rating-8" name="rating" value="8" />
											<label for="rating-8"> <span
												class="rating-active-icon"><i class="fas fa-star"></i></span>
												<span class="rating-icon"><i class="far fa-star"></i></span>
											</label> <input type="radio" id="rating-7" name="rating" value="7" />
											<label for="rating-7"> <span
												class="rating-active-icon"><i class="fas fa-star"></i></span>
												<span class="rating-icon"><i class="far fa-star"></i></span>
											</label> <input type="radio" id="rating-6" name="rating" value="6" />
											<label for="rating-6"> <span
												class="rating-active-icon"><i class="fas fa-star"></i></span>
												<span class="rating-icon"><i class="far fa-star"></i></span>
											</label> <input type="radio" id="rating-5" name="rating" value="5" />
											<label for="rating-5"> <span
												class="rating-active-icon"><i class="fas fa-star"></i></span>
												<span class="rating-icon"><i class="far fa-star"></i></span>
											</label> <input type="radio" id="rating-4" name="rating" value="4" />
											<label for="rating-4"> <span
												class="rating-active-icon"><i class="fas fa-star"></i></span>
												<span class="rating-icon"><i class="far fa-star"></i></span>
											</label> <input type="radio" id="rating-3" name="rating" value="3" />
											<label for="rating-3"> <span
												class="rating-active-icon"><i class="fas fa-star"></i></span>
												<span class="rating-icon"><i class="far fa-star"></i></span>
											</label> <input type="radio" id="rating-2" name="rating" value="2" />
											<label for="rating-2"> <span
												class="rating-active-icon"><i class="fas fa-star"></i></span>
												<span class="rating-icon"><i class="far fa-star"></i></span>
											</label> <input type="radio" id="rating-1" name="rating" value="1" />
											<label for="rating-1"> <span
												class="rating-active-icon"><i class="fas fa-star"></i></span>
												<span class="rating-icon"><i class="far fa-star"></i></span>
											</label>
										</div>
									</div>
								</div>
								<div class="col-12">
									<button class="px-5 btn btn-theme" type="submit">등록</button>
								</div>
							</div>
						</form>
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