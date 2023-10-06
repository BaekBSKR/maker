<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<h1 class="section-title">영화</h1>
				<div class="page-breadcrumbs">
					<a class="content-link" href="/">홈</a> <span
						class="text-theme mx-2"><i class="fas fa-chevron-right"></i></span>
					<a class="content-link" href="/movielist">영화 리스트</a> <span
						class="text-theme mx-2"><i class="fas fa-chevron-right"></i></span>
					<a class="content-link" href="/movie">영화</a>
				</div>
			</div>
		</div>
	</section>
	<div class="container">
		<div class="sidebar-container">
			<div class="content">
				<section class="section-long">
					<div class="section-line">
						<div class="movie-info-entity">
							<div class="entity-poster" data-role="hover-wrap">
								<div class="embed-responsive embed-responsive-poster">
									<img class="embed-responsive-item"
										src="http://via.placeholder.com/340x510" alt="" />
								</div>
							</div>
							<div class="entity-content">
								<h2 class="entity-title">Blick</h2>
								<div class="entity-info">
									<div class="info-lines">
										<div class="info info-short">
											<span class="text-theme info-icon"><i
												class="fas fa-star"></i></span> <span class="info-text">8,7</span>
											<span class="info-rest">/10</span>
										</div>
										<div class="info info-short">
											<span class="text-theme info-icon"><i
												class="fas fa-clock"></i></span> <span class="info-text">130</span>
											<span class="info-rest">&nbsp;min</span>
										</div>
									</div>
								</div>
								<ul class="entity-list">
									<li><span class="entity-list-title">개봉일:</span>July 21,
										2014 (Dolby Theatre), August 1, 2014 (United States)</li>
									<li><span class="entity-list-title">감독:</span> <a
										class="content-link" href="#">Lindson Wardens</a>, <a
										class="content-link" href="#">Anabelle One</a></li>
									<li><span class="entity-list-title">주연:</span> <a
										class="content-link" href="#">Octopus Wardens</a>, <a
										class="content-link" href="#">Quanta Wardens</a>, <a
										class="content-link" href="#">Anabelle Two</a>, <a
										class="content-link" href="#">Anabelle Three</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="section-line">
						<div class="section-head">
							<h2 class="section-title text-uppercase">개요</h2>
						</div>
						<div class="section-description">
							<p class="lead">Lead text. Lorem Ipsum is simply dummy text
								of the printing and typesetting industry. Lorem Ipsum has been
								the industry's standard dummy text ever since the 1500s, when an
								unknown printer took a galley of type and scrambled it to make a
								type specimen book.</p>
							<h6 class="text-dark">Why do we use it?</h6>
							<p>It is a long established fact that a reader will be
								distracted by the readable content of a page when looking at its
								layout. The point of using Lorem Ipsum is that it has a
								more-or-less normal distribution of letters, as opposed to using
								'Content here, content here', making it look like readable
								English. Many desktop publishing packages and web page editors
								now use Lorem Ipsum as their default model text, and a search
								for 'lorem ipsum' will uncover many web sites still in their
								infancy. Various versions have evolved over the years, sometimes
								by accident, sometimes on purpose (injected humour and the
								like).</p>
							<h6 class="text-dark">Where does it come from?</h6>
							<p>Contrary to popular belief, Lorem Ipsum is not simply
								random text. It has roots in a piece of classical Latin
								literature from 45 BC, making it over 2000 years old. Richard
								McClintock, a Latin professor at Hampden-Sydney College in
								Virginia, looked up one of the more obscure Latin words,
								consectetur, from a Lorem Ipsum passage, and going through the
								cites of the word in classical literature, discovered the
								undoubtable source. Lorem Ipsum comes from sections 1.10.32 and
								1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good
								and Evil) by Cicero, written in 45 BC. This book is a treatise
								on the theory of ethics, very popular during the Renaissance.
								The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..",
								comes from a line in section 1.10.32.</p>
							<p>The standard chunk of Lorem Ipsum used since the 1500s is
								reproduced below for those interested. Sections 1.10.32 and
								1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also
								reproduced in their exact original form, accompanied by English
								versions from the 1914 translation by H. Rackham.</p>
						</div>
					</div>
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
								<div class="col-12 col-sm-6">
									<div class="input-view-flat input-group">
										<input class="form-control" name="name" type="text"
											placeholder="닉네임" />
									</div>
								</div>
								<div class="col-12 col-sm-6">
									<div class="input-view-flat input-group">
										<input class="form-control" name="email" type="email"
											placeholder="이메일" />
									</div>
								</div>
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
									<button class="px-5 btn btn-theme" type="submit">Send</button>
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