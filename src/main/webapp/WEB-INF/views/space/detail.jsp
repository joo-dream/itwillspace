<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    
<!DOCTYPE html>
<html>
<head>
	<%@include file="../includes/header.jsp"%> 
</head>
<body class = "container-fluid">
	<h2> space detail Page</h2>
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<span class="m-0 font-weight-bold">이용 후기</span>
			<button id="addReplyBtn" type="button" class="btn btn-primary btn-sm float-right">후기 작성</button>
		</div>
		<div class="chat"></div>		   
	<div class="card-footer"></div>
	      
</div>	
</body>
</html>