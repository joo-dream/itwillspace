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
	href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/mediaelementplayer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/fl-bigmug-line.css">


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/aos.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">

</head>
<body>




	<div class="site-wrap">

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
								<li class="active"><a href="index.html">Home</a></li>
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
												<li><a href="/space/room_detail_all">상세방정보 예시</a></li>
												<li><a href="#">Menu Three</a></li>
											</ul></li>
									</ul></li>
								<li><a href="/reservation/booking">Reservation</a></li>
								<li><a href="/memberInfo/myPage">마이페이지</a></li>
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

	<div class="site-blocks-cover overlay"
		style="background-image: url('${pageContext.request.contextPath}/resources/image/hero_bg_2.jpg');"
		data-aos="fade" data-stellar-background-ratio="0.5" data-aos="fade">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-md-8 text-center" data-aos="fade-up"
					data-aos-delay="400">

					

					<h1 class="mb-4">Excellent Space For Your Time~~!!</h1>
					<p class="mb-5">Choose Your Space! Party!! Semina!! fjrigje</p>
					<p>
						<a href="#" class="btn btn-primary px-5 py-3">Host 등록하기</a>
					</p>
				</div>
			</div>
		</div>
	</div>


	<!--  <div class="container">
      <div class="featured-property-half d-flex">
        <div class="image" style="background-image: url('${pageContext.request.contextPath}/resources/image/hero_bg_1.jpg')"></div>
        <div class="text">
          <h2>Property Information</h2>
          <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis quae obcaecati doloribus distinctio, aliquam vero? Molestias, amet, eveniet.</p>
          <ul class="property-list-details mb-5">
            <li class="text-black">Property Name: <strong class="text-black">Marga Luxury Suite</strong></li>
            <li>Room: <strong>2</strong></li>
            <li>Total Area: <strong>482 Square Feets</strong></li>
            <li>Category: <strong>Modern House</strong></li>
            <li>Lunch Date: Jan 20, 2019<strong></strong></li>
          </ul>
          <p><a href="#" class="btn btn-primary px-4 py-3">Get Details</a></p>
        </div>
      </div>
    </div>-->


	<div class="site-section">

		<div class="container">

			<div class="row">
				<div
					class="site-section-heading text-center mb-5 w-border col-md-6 mx-auto"
					data-aos="fade-up">
					<h2 class="mb-5">Featured Spaces</h2>
					<p>Party Room, Semina, Practice Room...<br>
					Party Room, Semina, Practice Room...Party Room, Semina, Practice Room...<br>
					Party Room, Semina, Practice Room...Party Room, Semina, Practice Room...</p>
				</div>
			</div>

			<div class="site-block-retro d-block d-md-flex">

				<a href="#" class="col1 unit-9 no-height" data-aos="fade-up"
					data-aos-delay="100">
					<div class="image"
						style="background-image: url('${pageContext.request.contextPath}/resources/image/img_2.jpg');"></div>
					<div class="unit-9-content">
						<h2>PARTY ROOM</h2>
						<span>CLick ME!</span>
					</div>
				</a>

				<div class="col2 ml-auto">

					<a href="#" class="col2-row1 unit-9 no-height" data-aos="fade-up"
						data-aos-delay="200">
						<div class="image"
							style="background-image: url('${pageContext.request.contextPath}/resources/image/img_3.jpg');"></div>
						<div class="unit-9-content">
							<h2>SEMINA</h2>
							<span>CLick ME!</span>
						</div>
					</a> <a href="#" class="col2-row2 unit-9 no-height" data-aos="fade-up"
						data-aos-delay="300">
						<div class="image"
							style="background-image: url('${pageContext.request.contextPath}/resources/image/img_1.jpg');"></div>
						<div class="unit-9-content">
							<h2>PRACTICE ROOM</h2>
							<span>CLick ME!</span>
						</div>
					</a>

				</div>

			</div>

		</div>
	</div>

	<!-- 방 리스트로 쭉~ 보여주기 => 클릭시, 방 상세 페이지로 이동 -->
	<div class="site-section">
		<div class="container">
			<div class="row">
				<div
					class="site-section-heading text-center mb-5 w-border col-md-6 mx-auto">
					<h2 class="mb-5">ITWill Space에서 추천하는 방! </h2>
					<p>추천하지롱</p>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6 col-lg-3" data-aos="fade-up"
					data-aos-delay="100">
					<a href="/space/detail?space_id=1" class="unit-9">
						<div class="image"
							style="background-image: url('${pageContext.request.contextPath}/resources/image/img_1.jpg');"></div>
						<div class="unit-9-content">
							<h2>가게 상호명 (Party Room)</h2>
							<span>50,000원</span>
							<!-- <span>with Wendy Matos</span> -->
						</div>
					</a>
				</div>

				<div class="col-md-6 col-lg-3" data-aos="fade-up"
					data-aos-delay="100">
					<a href="/space/detail?space_id=2" class="unit-9">
						<div class="image"
							style="background-image: url('${pageContext.request.contextPath}/resources/image/img_1.jpg');"></div>
						<div class="unit-9-content">
							<h2>가게 상호명 (Party Room)</h2>
							<span>50,000원</span>
							<!-- <span>with Wendy Matos</span> -->
						</div>
					</a>
				</div>

				<div class="col-md-6 col-lg-3" data-aos="fade-up"
					data-aos-delay="100">
					<a href="/space/detail?space_id=3" class="unit-9">
						<div class="image"
							style="background-image: url('${pageContext.request.contextPath}/resources/image/img_1.jpg');"></div>
						<div class="unit-9-content">
							<h2>가게 상호명 (Party Room)</h2>
							<span>50,000원</span>
							<!-- <span>with Wendy Matos</span> -->
						</div>
					</a>
				</div>


				<div class="col-md-6 col-lg-3" data-aos="fade-up"
					data-aos-delay="100">
					<a href="/space/detail?space_id=1" class="unit-9">
						<div class="image"
							style="background-image: url('${pageContext.request.contextPath}/resources/image/img_1.jpg');"></div>
						<div class="unit-9-content">
							<h2>가게 상호명 (Party Room)</h2>
							<span>50,000원</span>
							<!-- <span>with Wendy Matos</span> -->
						</div>
					</a>
				</div>
			</div>

			<!-- 공백용 div -->
			<div class="col-md-12 text-center mt-5"></div>

			<!--2번쨰줄 -->
			<div class="row">
				<div class="col-md-6 col-lg-3" data-aos="fade-up"
					data-aos-delay="100">
					<a href="/space/detail?space_id=1" class="unit-9">
						<div class="image"
							style="background-image: url('${pageContext.request.contextPath}/resources/image/img_1.jpg');"></div>
						<div class="unit-9-content">
							<h2>가게 상호명 (Party Room)</h2>
							<span>50,000원</span>
							<!-- <span>with Wendy Matos</span> -->
						</div>
					</a>
				</div>

				<div class="col-md-6 col-lg-3" data-aos="fade-up"
					data-aos-delay="100">
					<a href="/space/detail?space_id=2" class="unit-9">
						<div class="image"
							style="background-image: url('${pageContext.request.contextPath}/resources/image/img_1.jpg');"></div>
						<div class="unit-9-content">
							<h2>가게 상호명 (Party Room)</h2>
							<span>50,000원</span>
							<!-- <span>with Wendy Matos</span> -->
						</div>
					</a>
				</div>

				<div class="col-md-6 col-lg-3" data-aos="fade-up"
					data-aos-delay="100">
					<a href="/space/detail?space_id=3" class="unit-9">
						<div class="image"
							style="background-image: url('${pageContext.request.contextPath}/resources/image/img_1.jpg');"></div>
						<div class="unit-9-content">
							<h2>가게 상호명 (Party Room)</h2>
							<span>50,000원</span>
							<!-- <span>with Wendy Matos</span> -->
						</div>
					</a>
				</div>


				<div class="col-md-6 col-lg-3" data-aos="fade-up"
					data-aos-delay="100">
					<a href="/space/detail?space_id=1" class="unit-9">
						<div class="image"
							style="background-image: url('${pageContext.request.contextPath}/resources/image/img_1.jpg');"></div>
						<div class="unit-9-content">
							<h2>가게 상호명 (Party Room)</h2>
							<span>50,000원</span>
							<!-- <span>with Wendy Matos</span> -->
						</div>
					</a>
				</div>
			</div>

			<!-- 공백용 div -->
			<div class="col-md-12 text-center mt-5"></div>

			<!--3번쨰줄 -->
			<div class="row">
				<div class="col-md-6 col-lg-3" data-aos="fade-up"
					data-aos-delay="100">
					<a href="/space/detail?space_id=1" class="unit-9">
						<div class="image"
							style="background-image: url('${pageContext.request.contextPath}/resources/image/img_1.jpg');"></div>
						<div class="unit-9-content">
							<h2>가게 상호명 (Party Room)</h2>
							<span>50,000원</span>
							<!-- <span>with Wendy Matos</span> -->
						</div>
					</a>
				</div>

				<div class="col-md-6 col-lg-3" data-aos="fade-up"
					data-aos-delay="100">
					<a href="/space/detail?space_id=2" class="unit-9">
						<div class="image"
							style="background-image: url('${pageContext.request.contextPath}/resources/image/img_1.jpg');"></div>
						<div class="unit-9-content">
							<h2>가게 상호명 (Party Room)</h2>
							<span>50,000원</span>
							<!-- <span>with Wendy Matos</span> -->
						</div>
					</a>
				</div>

				<div class="col-md-6 col-lg-3" data-aos="fade-up"
					data-aos-delay="100">
					<a href="/space/detail?space_id=3" class="unit-9">
						<div class="image"
							style="background-image: url('${pageContext.request.contextPath}/resources/image/img_1.jpg');"></div>
						<div class="unit-9-content">
							<h2>가게 상호명 (Party Room)</h2>
							<span>50,000원</span>
							<!-- <span>with Wendy Matos</span> -->
						</div>
					</a>
				</div>


				<div class="col-md-6 col-lg-3" data-aos="fade-up"
					data-aos-delay="100">
					<a href="/space/detail?space_id=1" class="unit-9">
						<div class="image"
							style="background-image: url('${pageContext.request.contextPath}/resources/image/img_1.jpg');"></div>
						<div class="unit-9-content">
							<h2>가게 상호명 (Party Room)</h2>
							<span>50,000원</span>
							<!-- <span>with Wendy Matos</span> -->
						</div>
					</a>
				</div>

				<!-- space List로 이동 버튼  -->
				<div class="col-md-12 text-center mt-5" data-aos="fade-up">
					<a href="/space/list" class="btn btn-primary">Show More...</a>
				</div>

			</div>
		</div>
	</div>






	<!-- <div class="site-section block-13">
		<div class="container" data-aos="fade-up">
			<div class="row">
				<div
					class="site-section-heading text-center mb-5 w-border col-md-6 mx-auto">
					<h2 class="mb-5">Love By Our Customers</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Eveniet, fugit nam obcaecati fuga itaque deserunt officia, error
						reiciendis ab quod?</p>
				</div>
			</div>
			<div class="nonloop-block-13 owl-carousel">

				<div class="text-center p-3 p-md-5 bg-white">
					<div class="mb-4">
						<img src="images/person_1.jpg" alt="Image"
							class="w-50 mx-auto img-fluid rounded-circle">
					</div>
					<div class="text-black">
						<h3 class="font-weight-light h5">Megan Smith</h3>
						<p class="font-italic">&ldquo;Lorem ipsum dolor sit amet,
							consectetur adipisicing elit. Et, iusto. Aliquam illo, cum sed
							ea? Ducimus quos, ea?&rdquo;</p>
					</div>
				</div>

				<div class="text-center p-3 p-md-5 bg-white">
					<div class="mb-4">
						<img src="images/person_2.jpg" alt="Image"
							class="w-50 mx-auto img-fluid rounded-circle">
					</div>
					<div class="text-black">
						<h3 class="font-weight-light h5">Brooke Cagle</h3>
						<p class="font-italic">&ldquo;Lorem ipsum dolor sit amet,
							consectetur adipisicing elit. Et, iusto. Aliquam illo, cum sed
							ea? Ducimus quos, ea?&rdquo;</p>
					</div>
				</div>

				<div class="text-center p-3 p-md-5 bg-white">
					<div class="mb-4">
						<img src="images/person_3.jpg" alt="Image"
							class="w-50 mx-auto img-fluid rounded-circle">
					</div>
					<div class="text-black">
						<h3 class="font-weight-light h5">Philip Martin</h3>
						<p class="font-italic">&ldquo;Lorem ipsum dolor sit amet,
							consectetur adipisicing elit. Et, iusto. Aliquam illo, cum sed
							ea? Ducimus quos, ea?&rdquo;</p>
					</div>
				</div>

				<div class="text-center p-3 p-md-5 bg-white">
					<div class="mb-4">
						<img src="images/person_1.jpg" alt="Image"
							class="w-50 mx-auto img-fluid rounded-circle">
					</div>
					<div class="text-black">
						<h3 class="font-weight-light h5">Steven Ericson</h3>
						<p class="font-italic">&ldquo;Lorem ipsum dolor sit amet,
							consectetur adipisicing elit. Et, iusto. Aliquam illo, cum sed
							ea? Ducimus quos, ea?&rdquo;</p>
					</div>
				</div>

				<div class="text-center p-3 p-md-5 bg-white">
					<div class="mb-4">
						<img src="images/person_2.jpg" alt="Image"
							class="w-50 mx-auto img-fluid rounded-circle">
					</div>
					<div class="text-black">
						<h3 class="font-weight-light h5">Nathan Dumlao</h3>
						<p class="font-italic">&ldquo;Lorem ipsum dolor sit amet,
							consectetur adipisicing elit. Et, iusto. Aliquam illo, cum sed
							ea? Ducimus quos, ea?&rdquo;</p>
					</div>
				</div>

				<div class="text-center p-3 p-md-5 bg-white">
					<div class="mb-4">
						<img src="images/person_4.jpg" alt="Image"
							class="w-50 mx-auto img-fluid rounded-circle">
					</div>
					<div class="text-black">
						<h3 class="font-weight-light h5">Brook Smith</h3>
						<p class="font-italic">&ldquo;Lorem ipsum dolor sit amet,
							consectetur adipisicing elit. Et, iusto. Aliquam illo, cum sed
							ea? Ducimus quos, ea?&rdquo;</p>
					</div>
				</div>

			</div>
		</div>
	</div>
	 -->





	<!-- <div class="site-section bg-light">
		<div class="container">
			<div class="row">
				<div
					class="site-section-heading text-center mb-5 w-border col-md-6 mx-auto"
					data-aos="fade-up">
					<h2 class="mb-5">News &amp; Events</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Eveniet, fugit nam obcaecati fuga itaque deserunt officia, error
						reiciendis ab quod?</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-lg-4 mb-4 mb-lg-0" data-aos="fade-up"
					data-aos-delay="100">
					<a href="single.html"><img src="images/img_4.jpg" alt="Image"
						class="img-fluid"></a>
					<div class="p-4 bg-white">
						<span class="d-block text-secondary small text-uppercase">Jan
							20th, 2019</span>
						<h2 class="h5 text-black mb-3">
							<a href="single.html">Fugit nam obcaecati fuga itaque</a>
						</h2>

					</div>
				</div>
				<div class="col-md-6 col-lg-4 mb-4 mb-lg-0" data-aos="fade-up"
					data-aos-delay="200">
					<a href="single.html"><img src="images/img_2.jpg" alt="Image"
						class="img-fluid"></a>
					<div class="p-4 bg-white">
						<span class="d-block text-secondary small text-uppercase">Jan
							20th, 2019</span>
						<h2 class="h5 text-black mb-3">
							<a href="single.html">Fugit nam obcaecati fuga itaque</a>
						</h2>

					</div>
				</div>
				<div class="col-md-6 col-lg-4 mb-4 mb-lg-0" data-aos="fade-up"
					data-aos-delay="300">
					<a href="single.html"><img src="images/img_3.jpg" alt="Image"
						class="img-fluid"></a>
					<div class="p-4 bg-white">
						<span class="d-block text-secondary small text-uppercase">Jan
							20th, 2019</span>
						<h2 class="h5 text-black mb-3">
							<a href="single.html">Fugit nam obcaecati fuga itaque</a>
						</h2>

					</div>
				</div>
			</div>
		</div>
	</div>-->

	<div class="bg-primary" data-aos="fade">
		<div class="container">
			<div class="row">
				<a href="#" class="col-2 text-center py-4 social-icon d-block"><span
					class="icon-facebook text-white"></span></a> <a href="#"
					class="col-2 text-center py-4 social-icon d-block"><span
					class="icon-twitter text-white"></span></a> <a href="#"
					class="col-2 text-center py-4 social-icon d-block"><span
					class="icon-instagram text-white"></span></a> <a href="#"
					class="col-2 text-center py-4 social-icon d-block"><span
					class="icon-linkedin text-white"></span></a> <a href="#"
					class="col-2 text-center py-4 social-icon d-block"><span
					class="icon-pinterest text-white"></span></a> <a href="#"
					class="col-2 text-center py-4 social-icon d-block"><span
					class="icon-youtube text-white"></span></a>
			</div>
		</div>
	</div>

	<footer class="site-footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="mb-5">
						<h3 class="footer-heading mb-4">About Us</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Saepe pariatur reprehenderit vero atque, consequatur id ratione,
							et non dignissimos culpa? Ut veritatis, quos illum totam quis
							blanditiis, minima minus odio!</p>
					</div>
					<div class="mb-5">
						<h3 class="footer-heading mb-4">Subscribe</h3>
						<form action="#" method="post" class="site-block-subscribe">
							<div class="input-group mb-3">
								<input type="text"
									class="form-control border-secondary bg-transparent"
									placeholder="Enter your email" aria-label="Enter Email"
									aria-describedby="button-addon2">
								<div class="input-group-append">
									<button class="btn btn-primary rounded-top-right-0"
										type="button" id="button-addon2">Subscribe</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="col-lg-4 mb-5 mb-lg-0">
					<div class="row mb-5">
						<div class="col-md-12">
							<h3 class="footer-heading mb-4">Navigations</h3>
						</div>
						<div class="col-md-6 col-lg-6">
							<ul class="list-unstyled">
								<li><a href="#">Home</a></li>
								<li><a href="#">Apartments</a></li>
								<li><a href="#">News</a></li>
								<li><a href="#">Featured Apartment</a></li>
							</ul>
						</div>
						<div class="col-md-6 col-lg-6">
							<ul class="list-unstyled">
								<li><a href="#">About Us</a></li>
								<li><a href="#">Privacy Policy</a></li>
								<li><a href="#">Contact Us</a></li>
								<li><a href="#">Membership</a></li>
							</ul>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<h3 class="footer-heading mb-4">Follow Us</h3>

							<div>
								<a href="#" class="pl-0 pr-3"><span class="icon-facebook"></span></a>
								<a href="#" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
								<a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
								<a href="#" class="pl-3 pr-3"><span class="icon-linkedin"></span></a>
							</div>
						</div>
					</div>

				</div>

				<div class="col-lg-4 mb-5 mb-lg-0">
					<div class="mb-5">
						<h3 class="footer-heading mb-4">Watch Live Streaming</h3>

						<div class="block-16">
							<figure>
								<img src="images/img_1.jpg" alt="Image placeholder"
									class="img-fluid rounded">
								<a href="https://vimeo.com/channels/staffpicks/93951774"
									class="play-button popup-vimeo"><span class="icon-play"></span></a>
							</figure>
						</div>

					</div>



				</div>

			</div>
			<div class="row pt-5 mt-5 text-center">
				<div class="col-md-12">
					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script data-cfasync="false"
							src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart text-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>

			</div>
		</div>
	</footer>

	</div>

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
	<script>
		$(document).ready(function(){
			var formObj = $("form[role='form']");
			$("#logout").click(function(){
				formObj.attr("action", "/logout");
				formObj.attr("method","post");
				formObj.submit();
			});
		});
	</script>


</body>
</html>

