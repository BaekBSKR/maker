<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	src = "https://code.jquery.com/jquery-3.4.1.js"
	integrity = "sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin = "anonymous"
</script>
<style>
.btn-theme:hover {
	color: #000;
	font-weight: bold;
}
#logout_btn{
	color : white;
}
#logout_btn:hover{
	color : #000;
}
</style>
</head>
<body>
	<header class="header header-horizontal header-view-pannel">
		<div class="container">
			<nav class="navbar">
				<a class="navbar-brand" href="/"> <span class="logo-element">
						<span class="logo-tape"> <span
							class="svg-content svg-fill-theme"
							data-svg="/resources/images/svg/logo-part.svg"></span>
					</span> <span class="logo-text text-uppercase"> <span>M</span>akers
					</span>
				</span>
				</a>
				<div class="navbar-collapse">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link"
							href="/movie/movielist">영화 리스트</a></li>
						<c:if test="${customer == null}">
						</c:if>
						<c:if test="${customer != null}">
							<li class="nav-item nav-item-arrow-down nav-hover-show-sub"><a
								class="nav-link" href="/ticket/ticketBooking">예매 페이지 <span
									class="text-theme info-icon"><i
										class="fas fa-caret-down"></i></span></a>
								<div class="nav-arrow">
									<i class="fas fa-chevron-down"></i>
								</div>
								<ul class="collapse nav">
									<li class="nav-item"><a class="nav-link"
										href="/ticket/ticketBooking">예매하기</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/ticket/ticketList">예매 이력</a></li>
								</ul></li>
						</c:if>
						<li class="nav-item"><a class="nav-link"
							href="/notice/noticeManage">공지사항</a></li>
					</ul>
					<!-- 로그인 하지 않은 상태 -->
					<c:if test="${customer == null}">
						<div class="navbar-extra">
							<a class="btn-theme btn" href="/customer/join">회원가입</a> <a
								class="btn-theme btn" href="/customer/login">로그인</a>
						</div>
					</c:if>
					<!-- 로그인한 상태 -->
					<c:if test="${customer != null}">
						<div class="navbar-extra">
							<div>${customer.c_nick}님 환영합니다!</div>
							<a class="btn-theme btn" id="logout_btn">로그아웃</a>
						</div>
					</c:if>
				</div>
			</nav>
		</div>
	</header>
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
	<script>
		// 로그아웃 버튼 클릭
		$("#logout_btn").click(function() {
			//alert("버튼 작동");
			$.ajax({
				type : "POST",
				url : "/customer/logout.do",
				success : function(data) {
					alert("로그아웃 되었습니다.");
					document.location.reload();
				}
			});
		});
	</script>
</body>
</html>
