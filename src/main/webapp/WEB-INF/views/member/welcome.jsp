<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<%@include file="../includes/header.jsp"%>  
</head>  

<body class="bg-gradient-primary">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-6 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <div class="row p-5">
              <div class="col-lg-12 text-center">
                   <h1 class="h4 text-gray-900 mb-4"><span>${result}</span>님</h1>
                   <h1 class="h4 text-gray-900 mb-4">가입을 축하합니다.</h1>
              </div>
              <div class="col-lg-12"><a href="/" class="btn btn-primary btn-user btn-block">메인화면으로 가기</a></div>
              <div class="col-lg-12 mt-3"><a href="/member/login" class="btn btn-secondary btn-user btn-block">로그인하기</a></div>
            </div>
          </div>
        </div>

      </div>


	</div>
  </div>


</body>

</html>