<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<title>관리자 로그인</title>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
	<form action="../admin/loginProcess" method="post"><br>
		<div class="row"><div class="col"><input type="text" name="admin_id" placeholder="아이디"></div></div>
		<div class="row"><div class="col"><input type="password" name="admin_pw" placeholder="비밀번호"></div></div>
		<div class="row"><div class="col d-grid"><button class="btn ">로그인</button></div></div>
	</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</html>