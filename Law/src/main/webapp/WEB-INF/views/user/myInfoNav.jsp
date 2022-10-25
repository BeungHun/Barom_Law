<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	   <div class="row border-bottom border-2 border-secondary py-2">
			<div class="col">
				<span class="fw-bold fs-3 ">내정보</span>
			</div>	
			<div class="col text-center pt-2">
				<span class="fw-bold fs-5 text-info btn-pointer" onclick="location.href='./identityVerificate';">내정보 관리</span>
			</div>
			<div class="col text-center pt-2">
				<span class="fw-bold fs-5 text-secondary btn-pointer" onclick="location.href='./modifyPassword';">비밀번호 변경</span>
			</div>
			<div class="col text-center pt-2">
				<span class="fw-bold fs-5 text-secondary btn-pointer" onclick="location.href='./withdrawal';">회원탈퇴</span>
			</div>
			<div class="col-6"></div>
		</div>
</body>
</html>