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
<link rel="stylesheet"  type="text/css" href="../resources/css/common.css">
<style type="text/css">
body{
	height: 100%;
	width: 100%;
	font-size: 11px;
}
</style>
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

// 중지신청 / 신청철회 클릭 시 호출 함수
function updateActYn(accept_proper_num, accept_act_yn) {
	
	// 확인 클릭 시
	if(confirm("중지신청 하시겠습니까?")) {
			
		var param = {
			'accept_act_yn' : accept_act_yn,
			'accept_proper_num' : accept_proper_num,
		};
		
		// ajax 전송
		$.ajax({
			url: './updateAcceptActYn',
			method: 'post',
			data: param,
			dataType: 'json',
		}).done(function(obj) {
			if(obj.result == 'success') {
				alert(obj.msg);
				location.reload();
				
			} else if(obj.result == 'fail') {
				alert(obj.msg);
				return;
			}		
		});
		
	}
}

	
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
						<span> 홈 > My Page > </span><span style="color: #72a8fe;font-weight: bold;">중지/해제신청 관리</span>
					</div>
				</div>
				
				<div class="row border-bottom border-2 border-secondary py-2">
					<div class="col">
						<span class="fw-bold text-secondary font-def">중지/해제신청 관리</span>
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
									<th>번호</th>
									<th>활동법원</th>
									<th>선발일자</th>
									<th>활동여부</th>
									<th>중지/철회</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${!empty myAcceptList }">
										<c:forEach items="${myAcceptList }" var="list">
											<tr>
												<td>${list.ROWNUM }</td>
												<td>${list.COURT_NAME }</td>
												<td><fmt:formatDate value="${list.ACCEPT_DATE }" pattern="yyyy-MM-dd"/></td>
												<td>
													<c:if test="${list.ACCEPT_ACT_YN == 'y' }">
														<span>활동중</span>
													</c:if>
													<c:if test="${list.ACCEPT_ACT_YN == 'n' }">
														<span>활동중지</span>
													</c:if>
												
												<td>
													<c:if test="${list.ACCEPT_ACT_YN == 'y' }">
														<input type="button" class="" onclick="updateActYn('${list.ACCEPT_PROPER_NUM}','n');" value="중지신청"/>
													</c:if>
													<c:if test="${list.ACCEPT_ACT_YN == 'n' }">
														<input type="button" class="" onclick="updateActYn('${list.ACCEPT_PROPER_NUM}','y');" value="중지철회" />
													</c:if>
												</td>
											</tr>
											<input type="hidden" id="accept_proper_num" value="${list.ACCEPT_PROPER_NUM}">
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5"><span>등재내역이 존재하지 않습니다.</span></td>
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