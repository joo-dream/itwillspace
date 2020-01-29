<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
<h2> 메인 화면</h2>
<br>

<sec:authorize access="isAnonymous()">
  <a href="/member/login">로그인</a>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
	<!-- <a href="/member/logout">로그아웃</a> -->  
    <form action="/logout" method="POST">
        <button type="submit">로그아웃</button>
    </form>  
</sec:authorize>

<br><br>


<div><a href="/memberInfo/myPage">마이페이지</a></div>
<div><a href="/memberInfo/hostPage">host페이지</a></div>
<div><a href="/space/write">space 등록</a></div>
<div><a href="/space/list">space List</a></div>
<div><a href="/space/detail?space_id=1">방 상세정보보기</a></div>
<div><a href="/reservation/book">예약하기</a></div>
<div><a href="/reservation/bookingConfirm">예약 체크</a></div>
</body>
</html>