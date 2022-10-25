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
<title>평정 기준표 관리</title>
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
					<span> 홈 > 재판조력자관리 > </span><span style="color: #72a8fe;font-weight: bold;">신청자 심사</span>
				</div>
			</div>
			<!-- 타이틀 -->
			<div class="row my-4">
				<div class="col">
					<img src="../resources/img/Admin/head_title_img.gif">
					<span style="font-weight: bold;">신청자 심사</span>
				</div>
			</div>
			
			<!-- 안내 -->
			<div class="contentsinbox">
				<div class="row mx-0 px-0">
						<table class="text-center table table-bordered">
							  <colgroup>
							  <col width="7%"></col>
							  <col width="10%"></col>
							  <col width="40%"></col>
							  <col width="18%"></col>
							  <col width="15%"></col>
							  <col width="10%"></col>
							  </colgroup>
							  <thead>
							    <tr>
							      <th scope="col" class="table-light px-0">번호</th>
							      <th scope="col" class="table-light">이름</th>
							      <th scope="col" class="table-light">신청공고</th>
							      <th scope="col" class="table-light">조력자 분류</th>	
							      <th scope="col" class="table-light">신청일</th>
							      <th scope="col" class="table-light">신청현황</th>
							    </tr>
							  </thead>
							  <tbody>
							  <c:forEach items="${applicantManagementList}" var="applicantManagementList">
							  <c:if test="${applicantManagementList.aplcn_dtls_sts == '심사완료'}">
							    <tr onclick="location.href='evaluationApplicants?aplcn_dtls_proper_num=${applicantManagementList.aplcn_dtls_proper_num}'">
							      <td>${applicantManagementList.aplcn_dtls_proper_num}</td>
							      <td>${applicantManagementList.user_name }</td>
							       <td>${applicantManagementList.announce_title}</td>
							       <td>${applicantManagementList.trial_fcltt_description}</td>
							      <td><fmt:formatDate value="${applicantManagementList.aplcn_dtls_date }" pattern="yy.MM.dd"/></td>				      
							      <td>${applicantManagementList.aplcn_dtls_sts}</td>
							    </tr>
							    </c:if>
							   </c:forEach>
							</tbody>
						</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>
	
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</html>