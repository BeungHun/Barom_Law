<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<title>마이페이지</title>
</head>
<body>
	<div class="col container-fluid" style="width : 1600px;">
	<div class="row">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<div class="col">
			<jsp:include page="../common/localNav.jsp"></jsp:include>
		</div>
		<div class="col">
			여기는 마이페이지 입니다. 알아서 작성
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</html>