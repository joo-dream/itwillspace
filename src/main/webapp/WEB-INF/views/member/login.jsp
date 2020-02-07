<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Login</title>

  <!-- Custom fonts for this template-->
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body style="background-image: url('/resources/image/hero_bg_2.jpg'); 
  		background-repeat: no-repeat; background-position: center center; background-size:cover;">

  <div class="container-fluid" >

    <!-- Outer Row -->
    <div class="row justify-content-center">
      <div class="col-xl-6 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-12">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">${msg}</h1>                  
                  </div>
                  
                  <form  class="user" method='post' action="/login">
                    <div class="form-group">
                      <input type="text" name='userId' class="form-control form-control-user" placeholder="아이디">	
                    </div>
                    <div class="form-group">
                      <input type="password" name='userPw' class="form-control form-control-user"  placeholder="비밀번호">
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" name='remember-me' class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">로그인 유지</label>
                      </div>
                    </div>
                    <div>
    					<input type='submit' class="btn btn-primary btn-user btn-block" value="로그인">
  					</div>
  					<hr>
                    <div><a href="/member/register" class="btn btn-danger btn-user btn-block">회원 가입</a></div>
  		
                  </form>
                  <hr>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>


	</div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/resources/js/sb-admin-2.min.js"></script>

</body>

</html>