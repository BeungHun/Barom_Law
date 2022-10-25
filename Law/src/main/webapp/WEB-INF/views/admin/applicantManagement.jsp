<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
	
<!-- 외부 css 로드  -->
<link rel="stylesheet" type="text/css" href="../resources/css/common.css">
<title>신청자 조회</title>
<style>
	
</style>
<script>

</script>
</head>
<body>
<div class="container-fluid" style="width: 960px;">
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<!-- 구분 이미지 -->
	<img src="../resources/img/sub_topimg.gif">
	
	<!-- 페이지 내용 -->
	<div class="row mt-2">
		<!-- 사이드 네비바 -->
		<div class="col-3 text-center" style="border-right: solid 1px #ccc;">
			<jsp:include page="../common/assistantAdminNav.jsp"></jsp:include>
		</div>
		
		<!-- 본문 -->
		<div class="col m-3">
			<!-- 현재위치 -->
			<div class="row text-end loc">
				<div class="col" style="font-size: 11px;">
					<span> 홈 > 재판조력자관리 > </span><span style="color: #72a8fe;font-weight: bold;">신청자 조회</span>
				</div>
			</div>
			<!-- 타이틀 -->
			<div class="row my-4">
				<div class="col">
					<img src="../resources/img/Admin/head_title_img.gif">
					<span style="font-weight: bold;">신청자 조회</span>
				</div>
			</div>
			
			<!-- 안내 -->
			<div class="contentsinbox">
				<div class="row">
					<div class="col">
						<form action="excel" method="post">
							<table class="table text-center">
								  <thead>
								    <tr>
								      <th scope="col">번호</th>
								      <th scope="col">이름</th>
								      <th scope="col">연락처</th>
								      <th scope="col">이메일</th>
								      <th scope="col">신청일</th>
								      <th scope="col">신청공고</th>
								      <th scope="col">신청현황</th>
								    </tr>
								  </thead>
								  <tbody>
								  <c:forEach items="${applicantManagementList}" var="applicantManagementList">
								    <tr>
								      <th scope="row">${applicantManagementList.APLCN_DTLS_PROPER_NUM}</th>
								      <td><a href="applicantManagementDetail?aplcn_dtls_proper_num=${applicantManagementList.APLCN_DTLS_PROPER_NUM}">${applicantManagementList.USER_NAME }</a></td>
								      <td>${applicantManagementList.USER_PHONE}</td>
								      <td>${applicantManagementList.USER_EMAIL}</td>
								      <td><fmt:formatDate value="${applicantManagementList.APLCN_DTLS_DATE }" pattern="yy.MM.dd"/></td>				      
								      <td>${applicantManagementList.ANNOUNCE_TITLE}</td>
								      <td>${applicantManagementList.APLCN_DTLS_STS}</td>
								    </tr>
								    </c:forEach>
								  </tbody>
								</table>
							<button type="submit" type="button" class="btn btn-primary">다운로드</button>		
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>	
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</html>