<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<style type="text/css">
body{
	height: 100%;
	width: 100%;
	font-size: 11px;
}
</style>
<title>마이페이지</title>
<script src="../resources/js/common.js"></script>
<script type="text/javascript">

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
			<jsp:include page="./myPageNav.jsp"></jsp:include>
			
			<!-- 본문 -->
			<div class="col m-3">
				<!-- 현재위치 -->
				<div class="row text-end">
					<div class="col" style="font-size: 11px;">
						<span> 홈 > My Page > </span><span style="color: #72a8fe;font-weight: bold;">나의 활동 내역</span>
					</div>
				</div>
				
				<div class="row border-bottom border-2 border-secondary py-2">
					<div class="col">
						<span class="fw-bold text-secondary font-def">나의 활동 내역</span>
					</div>	
				</div>
				
				<!-- 내용 -->
				<div class="row">
					<div class="col">
						<table class="table text-center">
							<colgroup>
								<col width="10%">
								<col width="30%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">활동법원</th>
									<th scope="col">선정일</th>
									<th scope="col">출석일자</th>
									<th scope="col">재판완료여부</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${!empty activeList }">
										<c:forEach items="${activeList }" var="list">
											<tr>
												<td>${list.ROWNUM }</td>								
												<td>${list.COURT_NAME }</td>								
												<td><fmt:formatDate value="${list.CHOSEN_DATE }" pattern="yyyy-MM-dd"/></td>								
												<td><fmt:formatDate value="${list.ATTENDANCE_DATE }" pattern="yyyy-MM-dd"/></td>								
												<td>
													<c:if test="${list.ACT_COMPLETE_YN == 'y'}">
														완료
													</c:if>
													<c:if test="${list.ACT_COMPLETE_YN == 'n'}">
														미완료
													</c:if>
												</td>								
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5"><span>활동내역이 존재하지 않습니다.</span></td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
				
			</div>
			
		<jsp:include page="../common/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</html>