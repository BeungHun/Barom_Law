<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
	<form action="../user/loginProcess" method="post"><br>
		<div class="row"><div class="col"><input type="text" name="user_id" placeholder="아이디"></div></div>
		<div class="row"><div class="col"><input type="password" name="user_pw" placeholder="비밀번호"></div></div>
		<div class="row"><div class="col d-grid"><button class="btn ">로그인</button></div></div>
	</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</html>