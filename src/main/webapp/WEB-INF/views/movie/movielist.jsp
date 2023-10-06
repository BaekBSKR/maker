<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<a class="content-link" href="/movielist">영화 리스트</a>
				</div>
			</div>
		</div>
	</section>
	<section class="section-long">
		<div class="container">
			<article class="movie-line-entity">
				<div class="entity-poster" data-role="hover-wrap">
					<div class="embed-responsive embed-responsive-poster">
						<img class="embed-responsive-item"
							src="http://via.placeholder.com/340x510" alt="" />
					</div>
				</div>
				<div class="entity-content">
					<h4 class="entity-title">
						<a class="content-link" href="/movieinfo">Blick</a>
					</h4>
					<div class="entity-info">
						<div class="info-lines">
							<div class="info info-short">
								<span class="text-theme info-icon"><i class="fas fa-star"></i></span>
								<span class="info-text">8,7</span> <span class="info-rest">/10</span>
							</div>
							<div class="info info-short">
								<span class="text-theme info-icon"><i
									class="fas fa-clock"></i></span> <span class="info-text">130</span> <span
									class="info-rest">&nbsp;min</span>
							</div>
						</div>
					</div>
					<p class="text-short entity-text">Lorem ipsum dolor sit amet,
						consectetur adipiscing elit. Sed consectetur ultrices justo a
						pellentesque. Praesent venenatis dolor nec tempus lacinia. Donec
						ac condimentum dolor. Nullam sit amet nisl hendrerit, pharetra
						nulla convallis, malesuada diam. Donec ornare nisl eu lectus
						rhoncus, at malesuada metus rutrum. Aliquam a nisl vulputate,
						sodales ipsum aliquam, tempus purus. Suspendisse convallis, lectus
						nec vehicula sollicitudin, lorem sapien rhoncus dolor, vel lacinia
						urna velit ullamcorper nisi. Phasellus pellentesque, magna nec
						gravida feugiat, est magna suscipit ligula, vel porttitor nunc
						enim at nibh. Sed varius sit amet leo vitae consequat.</p>
				</div>
			</article>
			<article class="movie-line-entity">
				<div class="entity-poster" data-role="hover-wrap">
					<div class="embed-responsive embed-responsive-poster">
						<img class="embed-responsive-item"
							src="http://via.placeholder.com/340x510" alt="" />
					</div>
				</div>
				<div class="entity-content">
					<h4 class="entity-title">
						<a class="content-link" href="movie-info-sidebar-right.html">The
							match</a>
					</h4>
					<div class="entity-category">
						<a class="content-link" href="movies-blocks.html">romance</a>, <a
							class="content-link" href="movies-blocks.html">historical</a>
					</div>
					<div class="entity-info">
						<div class="info-lines">
							<div class="info info-short">
								<span class="text-theme info-icon"><i class="fas fa-star"></i></span>
								<span class="info-text">8,1</span> <span class="info-rest">/10</span>
							</div>
							<div class="info info-short">
								<span class="text-theme info-icon"><i
									class="fas fa-clock"></i></span> <span class="info-text">90</span> <span
									class="info-rest">&nbsp;min</span>
							</div>
						</div>
					</div>
					<p class="text-short entity-text">Aenean molestie turpis eu
						aliquam bibendum. Nulla facilisi. Vestibulum quis risus in lorem
						suscipit tempor. Morbi consectetur enim vitae justo finibus
						consectetur. Mauris volutpat nunc dui, quis condimentum dolor
						efficitur et. Phasellus rhoncus porta nunc eu fermentum. Nullam
						vitae erat hendrerit, tempor arcu eget, eleifend tortor.</p>
				</div>
			</article>
			<article class="movie-line-entity">
				<div class="entity-poster" data-role="hover-wrap">
					<div class="embed-responsive embed-responsive-poster">
						<img class="embed-responsive-item"
							src="http://via.placeholder.com/340x510" alt="" />
					</div>
				</div>
				<div class="entity-content">
					<h4 class="entity-title">
						<a class="content-link" href="movie-info-sidebar-right.html">Watchers</a>
					</h4>
					<div class="entity-category">
						<a class="content-link" href="movies-blocks.html">fantasy</a>, <a
							class="content-link" href="movies-blocks.html">historical</a>
					</div>
					<div class="entity-info">
						<div class="info-lines">
							<div class="info info-short">
								<span class="text-theme info-icon"><i
									class="fas fa-calendar-alt"></i></span> <span class="info-text">29
									mar 2018</span>
							</div>
							<div class="info info-short">
								<span class="text-theme info-icon"><i
									class="fas fa-clock"></i></span> <span class="info-text">110</span> <span
									class="info-rest">&nbsp;min</span>
							</div>
						</div>
					</div>
					<p class="text-short entity-text">Lorem ipsum dolor sit amet,
						consectetur adipiscing elit. Sed consectetur ultrices justo a
						pellentesque. Praesent venenatis dolor nec tempus lacinia. Donec
						ac condimentum dolor. Nullam sit amet nisl hendrerit, pharetra
						nulla convallis, malesuada diam. Donec ornare nisl eu lectus
						rhoncus, at malesuada metus rutrum. Aliquam a nisl vulputate,
						sodales ipsum aliquam, tempus purus. Suspendisse convallis, lectus
						nec vehicula sollicitudin, lorem sapien rhoncus dolor, vel lacinia
						urna velit ullamcorper nisi. Phasellus pellentesque, magna nec
						gravida feugiat, est magna suscipit ligula, vel porttitor nunc
						enim at nibh. Sed varius sit amet leo vitae consequat.</p>
				</div>
			</article>
			<article class="movie-line-entity">
				<div class="entity-poster" data-role="hover-wrap">
					<div class="embed-responsive embed-responsive-poster">
						<img class="embed-responsive-item"
							src="http://via.placeholder.com/340x510" alt="" />
					</div>
					<div class="d-over bg-theme-lighted collapse animated faster"
						data-show-class="fadeIn show" data-hide-class="fadeOut show">
						<div class="entity-play">
							<a class="action-icon-theme action-icon-bordered rounded-circle"
								href="https://www.youtube.com/watch?v=d96cjJhvlMA"
								data-magnific-popup="iframe"> <span class="icon-content"><i
									class="fas fa-play"></i></span>
							</a>
						</div>
					</div>
				</div>
				<div class="entity-content">
					<h4 class="entity-title">
						<a class="content-link" href="movie-info-sidebar-right.html">In
							to the deep</a>
					</h4>
					<div class="entity-info">
						<div class="info-lines">
							<div class="info info-short">
								<span class="text-theme info-icon"><i class="fas fa-star"></i></span>
								<span class="info-text">9,8</span> <span class="info-rest">/10</span>
							</div>
							<div class="info info-short">
								<span class="text-theme info-icon"><i
									class="fas fa-clock"></i></span> <span class="info-text">169</span> <span
									class="info-rest">&nbsp;min</span>
							</div>
						</div>
					</div>
					<p class="text-short entity-text">Lorem ipsum dolor sit amet,
						consectetur adipiscing elit. Sed consectetur ultrices justo a
						pellentesque. Praesent venenatis dolor nec tempus lacinia. Donec
						ac condimentum dolor. Nullam sit amet nisl hendrerit, pharetra
						nulla convallis, malesuada diam. Donec ornare nisl eu lectus
						rhoncus, at malesuada metus rutrum. Aliquam a nisl vulputate,
						sodales ipsum aliquam, tempus purus. Suspendisse convallis, lectus
						nec vehicula sollicitudin, lorem sapien rhoncus dolor, vel lacinia
						urna velit ullamcorper nisi. Phasellus pellentesque, magna nec
						gravida feugiat, est magna suscipit ligula, vel porttitor nunc
						enim at nibh. Sed varius sit amet leo vitae consequat.</p>
				</div>
			</article>
			<article class="movie-line-entity">
				<div class="entity-poster" data-role="hover-wrap">
					<div class="embed-responsive embed-responsive-poster">
						<img class="embed-responsive-item"
							src="http://via.placeholder.com/340x510" alt="" />
					</div>
				</div>
				<div class="entity-content">
					<h4 class="entity-title">
						<a class="content-link" href="movie-info-sidebar-right.html">Iron
							planet</a>
					</h4>
					<div class="entity-info">
						<div class="info-lines">
							<div class="info info-short">
								<span class="text-theme info-icon"><i class="fas fa-star"></i></span>
								<span class="info-text">7,8</span> <span class="info-rest">/10</span>
							</div>
							<div class="info info-short">
								<span class="text-theme info-icon"><i
									class="fas fa-clock"></i></span> <span class="info-text">96</span> <span
									class="info-rest">&nbsp;min</span>
							</div>
						</div>
					</div>
					<p class="text-short entity-text">Vivamus dolor ex, viverra ut
						facilisis et, euismod et quam. Aliquam sit amet mattis velit,
						ullamcorper venenatis magna. Aenean ac maximus magna. Proin
						pharetra venenatis tortor, ac suscipit est ultrices vitae. Mauris
						vulputate, nisl in lacinia dignissim, libero justo vehicula arcu,
						a porttitor quam erat ac dui. Suspendisse potenti. Maecenas sit
						amet interdum sem. Vestibulum sit amet volutpat mauris, ut gravida
						velit. Donec ultricies, eros ut finibus volutpat, enim ligula
						tempus enim, non bibendum libero tellus at velit. Aenean placerat
						egestas ullamcorper.</p>
				</div>
			</article>
			<article class="movie-line-entity">
				<div class="entity-poster" data-role="hover-wrap">
					<div class="embed-responsive embed-responsive-poster">
						<img class="embed-responsive-item"
							src="http://via.placeholder.com/340x510" alt="" />
					</div>
				</div>
				<div class="entity-content">
					<h4 class="entity-title">
						<a class="content-link" href="movie-info-sidebar-right.html">Monday
							invasion</a>
					</h4>
					<div class="entity-info">
						<div class="info-lines">
							<div class="info info-short">
								<span class="text-theme info-icon"><i
									class="fas fa-calendar-alt"></i></span> <span class="info-text">25
									jul 2017</span>
							</div>
							<div class="info info-short">
								<span class="text-theme info-icon"><i
									class="fas fa-clock"></i></span> <span class="info-text">130</span> <span
									class="info-rest">&nbsp;min</span>
							</div>
						</div>
					</div>
					<p class="text-short entity-text">Aenean molestie turpis eu
						aliquam bibendum. Nulla facilisi. Vestibulum quis risus in lorem
						suscipit tempor. Morbi consectetur enim vitae justo finibus
						consectetur. Mauris volutpat nunc dui, quis condimentum dolor
						efficitur et. Phasellus rhoncus porta nunc eu fermentum. Nullam
						vitae erat hendrerit, tempor arcu eget, eleifend tortor.</p>
				</div>
			</article>
			<article class="movie-line-entity">
				<div class="entity-poster" data-role="hover-wrap">
					<div class="embed-responsive embed-responsive-poster">
						<img class="embed-responsive-item"
							src="http://via.placeholder.com/340x510" alt="" />
					</div>
				</div>
				<div class="entity-content">
					<h4 class="entity-title">
						<a class="content-link" href="movie-info-sidebar-right.html">Cloud
							10</a>
					</h4>
					<div class="entity-info">
						<div class="info-lines">
							<div class="info info-short">
								<span class="text-theme info-icon"><i class="fas fa-star"></i></span>
								<span class="info-text">7,1</span> <span class="info-rest">/10</span>
							</div>
							<div class="info info-short">
								<span class="text-theme info-icon"><i
									class="fas fa-clock"></i></span> <span class="info-text">110</span> <span
									class="info-rest">&nbsp;min</span>
							</div>
						</div>
					</div>
					<p class="text-short entity-text">Vivamus dolor ex, viverra ut
						facilisis et, euismod et quam. Aliquam sit amet mattis velit,
						ullamcorper venenatis magna. Aenean ac maximus magna. Proin
						pharetra venenatis tortor, ac suscipit est ultrices vitae. Mauris
						vulputate, nisl in lacinia dignissim, libero justo vehicula arcu,
						a porttitor quam erat ac dui. Suspendisse potenti. Maecenas sit
						amet interdum sem. Vestibulum sit amet volutpat mauris, ut gravida
						velit. Donec ultricies, eros ut finibus volutpat, enim ligula
						tempus enim, non bibendum libero tellus at velit. Aenean placerat
						egestas ullamcorper.</p>
				</div>
			</article>
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
