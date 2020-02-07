<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 


<!-- 부트스트랩 -->

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
                        <li class="active"><a href="/">Home</a></li>
                        <li class="has-children"><a href="/space/listPage?page=1">space
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


   <div class="site-blocks-cover overlay"
      style="background-image: url('${pageContext.request.contextPath}/resources/image/hero_bg_2.jpg');"
      data-aos="fade" data-stellar-background-ratio="0.5" data-aos="fade">
      <div class="container mainContainer">
         <div class="row align-items-center justify-content-center">
            <div class="col-md-8 text-center" data-aos="fade-up"
               data-aos-delay="400">
               <h1 class="mb-4">가나다라마바사</h1>
               <p class="mb-5">Choose Your Space! Party!! Semina!! fjrigje</p>
               
            </div>
         </div>
      </div>
   </div>


   <!-- 방 리스트로 쭉~ 보여주기 => 클릭시, 방 상세 페이지로 이동 -->
   <div class="site-section roomList-container">
      <div class="container">
         <div class="row">
            <div
               class="site-section-heading text-center mb-5 w-border col-md-6 mx-auto">
               <h2 class="MainRoomList"><span>ITWill Space</span>가 <br>추천하는 공간!</h2>
               <br><br><p>머물고 싶은 공간! &nbsp; ITWill Space가 엄선한 공간을 만나보세요!</p><br>
            </div>
         </div>

         <div class="row">
            <c:forEach items="${spaceVO}" var="spaceVO" begin="0" end="8">
               <div class="col-lg-4" data-aos="fade-up"
                  data-aos-delay="100" >
                  <a href="/space/detail?space_id=1" class="unit-9" style="border-radius:5px; margin-bottom:10%;">
                     <div class="image"
                      style="background-image: url('<spring:url value='/img/img_1.jpg' />');border-radius:5px; ">
                      </div>
                     <div class="unit-9-content">
                        <h2>${spaceVO.space_title}</h2>
                        <span> ${spaceVO.space_price} </span>
                     </div>
                  </a>
               </div>
            </c:forEach>
            
            <!-- space List로 이동 버튼  -->
            <div class="col-md-12 text-center mt-5" data-aos="fade-up">
               <a href="/space/listPage?page=1" class="btn btn-primary">Space 더 둘러보기</a>
            </div>

         </div>
      </div>
   </div>

   <!-- 팀원소개 container -->
   <div class="container">
      <div class="row">
         <div class="col-lg-8">
            <div class="mb-5">
               <h3 class="footer-heading mb-4">About Us</h3>
               <p>ITWILL TEAM5 프로젝트 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ITWILL TEAM5 프로젝트 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ITWILL TEAM5 프로젝트 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ITWILL TEAM5 프로젝트 <br>
               ITWILL TEAM5 프로젝트 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ITWILL TEAM5 프로젝트 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ITWILL TEAM5 프로젝트 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ITWILL TEAM5 프로젝트 <br>
               ITWILL TEAM5 프로젝트 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ITWILL TEAM5 프로젝트 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ITWILL TEAM5 프로젝트 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ITWILL TEAM5 프로젝트 <br>
               ITWILL TEAM5 프로젝트 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ITWILL TEAM5 프로젝트 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ITWILL TEAM5 프로젝트 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ITWILL TEAM5 프로젝트 <br>
               </p>
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
   </div>
   
   <!-- footer -->
   <footer class="site-footer">
      <div class="container">
         <div class="row pt-5 mt-5 text-center">
            <div class="col-md-12">
               <p></p>
               <p>
                  Copyright &copy;
                  <script>
                     document.write(new Date().getFullYear());
                  </script>
                  All rights reserved &nbsp;&nbsp;|&nbsp;&nbsp; Itwill Academy Team Project by <a
                     href="#">TEAM5</a>
               </p>
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

      // mouseover event function
      function dd(e){
         console.log('dddd');
      };
      
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
