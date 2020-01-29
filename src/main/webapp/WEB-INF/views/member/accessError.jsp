<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="java.util.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
                   <h1 class="h2 text-gray-900 mb-4">접근 불가</h1>
                   <h1 class="h4 text-gray-900 mb-4">사업자 회원만 이용할 수 있습니다.</h1>
                   <h1 class="h4 text-gray-900 mb-4">회원 정보를 수정하세요.</h1>
              </div>
              <sec:authentication property="principal.username" var="userId"/>
              <div class="col-lg-12"><a href="/member/modify?userId=${userId}" class="btn btn-primary btn-user btn-block">회원 정보 변경하기</a></div>              
            </div>
          </div>
        </div>

      </div>


	</div>
  </div>


</body>

</html>
