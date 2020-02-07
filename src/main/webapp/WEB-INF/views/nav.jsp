<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
	
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<title>TEAM5. &mdash; ITWSPACE</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Oswald:400,700">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">



<style>
html {
	overflow-x: hidden;
}

.site-wrap {
	position: absolute;
	height: 100%;
	width: 100%;
	z-index: 2;
	overflow: hidden;
	
	line-height: 1.7;
	font-weight: 400;
	font-size: 1rem;
	color: #333;
	font-family: "Nunito Sans", -apple-system, BlinkMacSystemFont,
		"Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif,
		"Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol",
		"Noto Color Emoji",'Noto Sans KR', sans-serif, 'Nanum Gothic', serif;
}
.site-wrap.site-wrap:before {
	-webkit-transition: .3s all ease-in-out;
	-o-transition: .3s all ease-in-out;
	transition: .3s all ease-in-out;
	background: rgba(0, 0, 0, 0.6);
	content: "";
	position: absolute;
	z-index: 2000;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	opacity: 0;
	visibility: hidden;
}
.site-wrap:before {
	opacity: 1;
	visibility: visible;
}
.navigation-wrap{
	position: fixed;
	width: 100%;
	top: 0;
	left: 0;
	z-index: 1000;
	-webkit-transition : all 0.3s ease-out;
	transition : all 0.3s ease-out;
}

.site-navbar {


	position: fixed;
	width: 100%;
	top: 0;
	left: 0;
	z-index: 1000;
	background-color: rgba(27, 57, 99, 0.95);
}

.site-navbar-top .site-logo {
	font-size: 2rem;
}

.site-navbar-wrap {
	position: relative;
	z-index: 1;
	width: 100%;
}

.site-navbar-wrap a {
	color: #000;
}

.site-navbar-wrap .site-navbar-top {
	font-size: 0.8rem;
}

.site-navbar {
	margin-bottom: 0px;
	width: 100%;
	border-bottom: none;
	position: fixed;
	top: 0;
	z-index: 99;
}

/* 추가한 class (index제외한 view에서 사용하기위한)속성*/
.start-header {
	opacity: 1;
	transform: translateY(0);
	padding: 10px 0;
	box-shadow: 0 10px 30px 0 rgba(27, 57, 99, 0.30);
	-webkit-transition: all 0.3s ease-out;
	transition: all 0.3s ease-out;
}

.start-header.scroll-on {
	padding-top: 0;
	background-color: rgba(27, 57, 99, 0.95);
	height: 80px;
	-webkit-transition: all 0.3s ease-out;
	transition: all 0.3s ease-out;
}
/* 추가 끝  */
.site-navbar .site-logo {

	
	font-weight: 200;
}

h1, h2, h3, h4, h5, h6 {
	font-family: 'Oswald', sans-serif !important;
	font-size:32px !important;
}
.container > a:hover {
text-decoration: none !important;
}

.site-navbar .site-logo a {
	font-weight: 200;
	color: #000;
}

.site-navbar .site-navigation .site-menu {
	margin-bottom: 0;
	margin-left: 0;
	padding-left: 0;
}

.site-navbar .site-navigation .site-menu .active>a {
	color: #fff;
}

.site-navbar .site-navigation .site-menu a  .site-menu button{
	text-decoration: none !important;
	display: inline-block;
}

.site-navbar .site-navigation .site-menu>li {
	display: inline-block;
	padding: 10px 5px;
}

.site-navbar .site-navigation .site-menu>li>a{
	padding: 10px 10px;
	letter-spacing: .05em;
	color: rgba(255, 255, 255, 0.6);
	text-decoration: none !important;
}
.site-menu.navBtn {
	background-color:none;
	padding: 10px 10px;
	letter-spacing: .05em;
	color: rgba(255, 255, 255, 0.6);
	text-decoration: none !important;
}

.site-navbar .site-navigation .site-menu>li>a:hover {
	color: #fff;
}

.site-navbar .site-navigation .site-menu>li:last-child {
	padding-right: 0;
}

.site-navbar .site-navigation .site-menu>li:last-child>a {
	padding-right: 0;
}

.site-navbar .site-navigation .site-menu .has-children {
	position: relative;
}

.site-navbar .site-navigation .site-menu .has-children>a {
	position: relative;
	padding-right: 20px;
}

.site-navbar .site-navigation .site-menu .has-children>a:before {
	position: absolute;
	content: "\e313";
	font-size: 16px;
	top: 50%;
	right: 0;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	font-family: 'icomoon';
}

.site-navbar .site-navigation .site-menu .has-children .dropdown {
	visibility: hidden;
	opacity: 0;
	top: 100%;
	position: absolute;
	text-align: left;
	-webkit-box-shadow: 0 2px 10px -2px rgba(0, 0, 0, 0.25);
	box-shadow: 0 2px 10px -2px rgba(0, 0, 0, 0.25);
	border-left: 1px solid #edf0f5;
	border-right: 1px solid #edf0f5;
	border-bottom: 1px solid #edf0f5;
	padding: 10px 0;
	margin-top: 20px;
	margin-left: 0px;
	background: #fff;
	-webkit-transition: 0.2s 0s;
	-o-transition: 0.2s 0s;
	transition: 0.2s 0s;
}

.site-navbar .site-navigation .site-menu .has-children .dropdown.arrow-top
	{
	position: absolute;
}

.site-navbar .site-navigation .site-menu .has-children .dropdown.arrow-top:before
	{
	bottom: 100%;
	left: 20%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
}

.site-navbar .site-navigation .site-menu .has-children .dropdown.arrow-top:before
	{
	border-color: rgba(136, 183, 213, 0);
	border-bottom-color: #fff;
	border-width: 10px;
	margin-left: -10px;
}

.site-navbar .site-navigation .site-menu .has-children .dropdown a {
	text-transform: none;
	letter-spacing: normal;
	-webkit-transition: 0s all;
	-o-transition: 0s all;
	transition: 0s all;
	color: #343a40;
}

.site-navbar .site-navigation .site-menu .has-children .dropdown .active>a
	{
	color: #000 !important;
}

.site-navbar .site-navigation .site-menu .has-children .dropdown>li {
	list-style: none;
	padding: 0;
	margin: 0;
	min-width: 200px;
}

.site-navbar .site-navigation .site-menu .has-children .dropdown>li>a {
	padding: 5px 20px;
	display: block;
}

.site-navbar .site-navigation .site-menu .has-children .dropdown>li>a:hover
	{
	color: rgba(27, 57, 99, 0.95);;
}

.site-navbar .site-navigation .site-menu .has-children .dropdown>li.has-children>a:before
	{
	content: "\e315";
	right: 20px;
}

.site-navbar .site-navigation .site-menu .has-children .dropdown>li.has-children>.dropdown,
	.site-navbar .site-navigation .site-menu .has-children .dropdown>li.has-children>ul
	{
	left: 100%;
	top: 0;
}

.site-navbar .site-navigation .site-menu .has-children .dropdown>li.has-children:hover>a,
	.site-navbar .site-navigation .site-menu .has-children .dropdown>li.has-children:active>a,
	.site-navbar .site-navigation .site-menu .has-children .dropdown>li.has-children:focus>a
	{
	color: rgba(27, 57, 99, 0.95);;
}

.site-navbar .site-navigation .site-menu .has-children:hover>a,
	.site-navbar .site-navigation .site-menu .has-children:focus>a,
	.site-navbar .site-navigation .site-menu .has-children:active>a {
	color: #fff;
}

.site-navbar .site-navigation .site-menu .has-children:hover,
	.site-navbar .site-navigation .site-menu .has-children:focus,
	.site-navbar .site-navigation .site-menu .has-children:active {
	cursor: pointer;
}

.site-navbar .site-navigation .site-menu .has-children:hover>.dropdown,
	.site-navbar .site-navigation .site-menu .has-children:focus>.dropdown,
	.site-navbar .site-navigation .site-menu .has-children:active>.dropdown
	{
	-webkit-transition-delay: 0s;
	-o-transition-delay: 0s;
	transition-delay: 0s;
	margin-top: 0px;
	visibility: visible;
	opacity: 1;
}

.site-mobile-menu {
	width: 300px;
	position: fixed;
	right: 0;
	z-index: 2000;
	padding-top: 20px;
	background: #fff;
	height: calc(100vh);
	-webkit-transform: translateX(110%);
	-ms-transform: translateX(110%);
	transform: translateX(110%);
	-webkit-box-shadow: -10px 0 20px -10px rgba(0, 0, 0, 0.1);
	box-shadow: -10px 0 20px -10px rgba(0, 0, 0, 0.1);
	-webkit-transition: .3s all ease-in-out;
	-o-transition: .3s all ease-in-out;
	transition: .3s all ease-in-out;
}

.offcanvas-menu .site-mobile-menu {
	-webkit-transform: translateX(0%);
	-ms-transform: translateX(0%);
	transform: translateX(0%);
}

.site-mobile-menu .site-mobile-menu-header {
	width: 100%;
	float: left;
	padding-left: 20px;
	padding-right: 20px;
}

.site-mobile-menu .site-mobile-menu-header .site-mobile-menu-close {
	float: right;
	margin-top: 8px;
}

.site-mobile-menu .site-mobile-menu-header .site-mobile-menu-close span
	{
	font-size: 30px;
	display: inline-block;
	padding-left: 10px;
	padding-right: 0px;
	line-height: 1;
	cursor: pointer;
	-webkit-transition: .3s all ease;
	-o-transition: .3s all ease;
	transition: .3s all ease;
}

.site-mobile-menu .site-mobile-menu-header .site-mobile-menu-close span:hover
	{
	color: #25262a;
}

.site-mobile-menu .site-mobile-menu-header .site-mobile-menu-logo {
	float: left;
	margin-top: 10px;
	margin-left: 0px;
}

.site-mobile-menu .site-mobile-menu-header .site-mobile-menu-logo a {
	display: inline-block;
	text-transform: uppercase;
}

.site-mobile-menu .site-mobile-menu-header .site-mobile-menu-logo a img
	{
	max-width: 70px;
}

.site-mobile-menu .site-mobile-menu-header .site-mobile-menu-logo a:hover
	{
	text-decoration: none;
}

.site-mobile-menu .site-mobile-menu-body {
	overflow-y: scroll;
	-webkit-overflow-scrolling: touch;
	position: relative;
	padding: 20px;
	height: calc(100vh - 52px);
	padding-bottom: 150px;
}

.site-mobile-menu .site-nav-wrap {
	padding: 0;
	margin: 0;
	list-style: none;
	position: relative;
}

.site-mobile-menu .site-nav-wrap a {
	padding: 10px 20px;
	display: block;
	position: relative;
	color: #212529;
}

.site-mobile-menu .site-nav-wrap a:hover {
	color: rgba(27, 57, 99, 0.95);
}

.site-mobile-menu .site-nav-wrap li {
	position: relative;
	display: block;
}

.site-mobile-menu .site-nav-wrap li.active>a {
	color: rgba(27, 57, 99, 0.95);;
}

.site-mobile-menu .site-nav-wrap .arrow-collapse {
	position: absolute;
	right: 0px;
	top: 10px;
	z-index: 20;
	width: 36px;
	height: 36px;
	text-align: center;
	cursor: pointer;
	border-radius: 50%;
}

.site-mobile-menu .site-nav-wrap .arrow-collapse:hover {
	background: #f8f9fa;
}

.site-mobile-menu .site-nav-wrap .arrow-collapse:before {
	font-size: 12px;
	z-index: 20;
	font-family: "icomoon";
	content: "\f078";
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%) rotate(-180deg);
	-ms-transform: translate(-50%, -50%) rotate(-180deg);
	transform: translate(-50%, -50%) rotate(-180deg);
	-webkit-transition: .3s all ease;
	-o-transition: .3s all ease;
	transition: .3s all ease;
}

.site-mobile-menu .site-nav-wrap .arrow-collapse.collapsed:before {
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}

.site-mobile-menu .site-nav-wrap>li {
	display: block;
	position: relative;
	float: left;
	width: 100%;
}

.site-mobile-menu .site-nav-wrap>li>a {
	padding-left: 20px;
	font-size: 20px;
}

.site-mobile-menu .site-nav-wrap>li>ul {
	padding: 0;
	margin: 0;
	list-style: none;
}

.site-mobile-menu .site-nav-wrap>li>ul>li {
	display: block;
}

.site-mobile-menu .site-nav-wrap>li>ul>li>a {
	padding-left: 40px;
	font-size: 16px;
}

.site-mobile-menu .site-nav-wrap>li>ul>li>ul {
	padding: 0;
	margin: 0;
}

.site-mobile-menu .site-nav-wrap>li>ul>li>ul>li {
	display: block;
}

.site-mobile-menu .site-nav-wrap>li>ul>li>ul>li>a {
	font-size: 16px;
	padding-left: 60px;
}


</style>

</head>
<body>


<!-- NAVBAR -->
		<div class="site-navbar start-header start-style">
			<div class="container py-1">
				<div class="row align-items-center">
					<div class="col-8 col-md-8 col-lg-4">
						<h1 class="mb-0">
							<a href="/" class="text-white h2 mb-0"><strong>ITW SPACE<span
									class="text-primary">.</span></strong></a>
						</h1>
					</div>
					<div class="col-4 col-md-4 col-lg-8">
						<nav class="site-navigation text-right text-md-right"
							role="navigation">

							<div class="d-inline-block d-lg-none ml-md-0 mr-auto py-3">
								<a href="#" class="site-menu-toggle js-menu-toggle text-white"><span
									class="icon-menu h3"></span></a>
							</div>

							<ul class="site-menu js-clone-nav d-none d-lg-block">
								<li class="active"><a href="/">Home</a></li>
								<li class="has-children"><a href="/space/list">space
										List</a>
									<ul class="dropdown arrow-top">
										<li><a href="#">Party Room</a></li>
										<li><a href="#">Semina Room</a></li>
										<li><a href="#">Pratice Room</a></li>
										<li class="has-children"><a
											href="/space/detail?space_id=1">방 상세정보보기</a>
											<ul class="dropdown">
												<li><a href="/space/write">space 등록</a></li>
												<li><a href="#">Menu Two</a></li>
												<li><a href="#">Menu Three</a></li>
											</ul></li>
									</ul></li>
								<li><a href="/reservation/booking">Reservation</a></li>
								<li><a href="/memberInfo/myPage?num=1">마이페이지</a></li>
								<li><a href="/memberInfo/hostPage">host페이지</a></li>
								
								<li>
								<sec:authorize access="isAnonymous()">
								  <a href="/member/login">로그인</a>
								</sec:authorize>
								<sec:authorize access="isAuthenticated()">
								   	<form action="/logout" method="POST">
								   	
								    	<button class="navBtn" type="submit"
									    	style="background-color: rgba(255, 255, 255, 0); border:0px;
									    	padding: 10px 10px; text-decoration: none !important; color: rgba(255, 255, 255, 0.6);"
									    	>
									    	로그아웃</button>
								    </form>  
								</sec:authorize>
								</li>
								
							</ul>
						</nav >
					</div>


				</div>
			</div>
	</div>
	<!-- end of NAVBAR -->
	<div class="site-mobile-menu">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close mt-3">
				<span class="icon-close2 js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>
	<!-- .site-mobile-menu -->

	<script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
	<script
		src="<c:url value="/resources/js/jquery-migrate-3.0.1.min.js" />"></script>
	<script src="<c:url value="/resources/js/jquery-ui.js" />"></script>
	<script src="<c:url value="/resources/js/popper.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/js/owl.carousel.min.js" />"></script>
	<script
		src="<c:url value="/resources/js/mediaelement-and-player.min.js" />"></script>
	<script src="<c:url value="/resources/js/jquery.stellar.min.js" />"></script>
	<script src="<c:url value="/resources/js/jquery.countdown.min.js" />"></script>
	<script
		src="<c:url value="/resources/js/jquery.magnific-popup.min.js" />"></script>
	<script
		src="<c:url value="/resources/js/bootstrap-datepicker.min.js" />"></script>
	<script src="<c:url value="/resources/js/aos.js" />"></script>
	<script src="<c:url value="/resources/js/circleaudioplayer.js" />"></script>
	<script src="<c:url value="/resources/js/main.js" />"></script>
	
	<script>
	(function($) { 

		// navBar에 있는 로그아웃 버튼 강제로 css주기
	
			var mBtn = $('button.navBtn'); 		
			mBtn.hover(function() {
			  $(this).css("color", "#fff");
			  $(this).css("cursor", "pointer");
			}, function(){
			  $(this).css("color", "rgba(255, 255, 255, 0.6)");
			});


		
		// 스크롤되면 navBar css 변경해주기
		$(function() {
			var header = $(".start-style");
			$(window).scroll(function() {    
				var scroll = $(window).scrollTop();
			
				if (scroll >= 10) {
					header.removeClass('start-style').addClass("scroll-on");
				} else {
					header.removeClass("scroll-on").addClass('start-style');
				}
			});
		});
		})(jQuery);
	</script>	
</body>
</html>