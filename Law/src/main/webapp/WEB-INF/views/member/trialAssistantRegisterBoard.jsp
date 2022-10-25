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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<title>공지사항</title>
</head>
<body>
	<div class="container-fluid" style="width: 960px;">
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<!-- 구분 이미지 -->
		<img src="../resources/img/sub_topimg.gif">
		
		<!-- 페이지 내용 -->
		<div class="row mt-2">
			<!-- 사이드 네비바 -->
			<jsp:include page="../common/localNav.jsp"></jsp:include>
			
			<!-- 본문 -->
			<div class="col m-3">
				<!-- 현재위치 -->
				<div class="row text-end">
					<div class="col" style="font-size: 11px;">
						<span> 홈 > </span><span style="color: #72a8fe;font-weight: bold;">감정인등재공고</span>
					</div>
				</div>
				<!-- 타이틀 -->
				<div class="row mb-3">
					<div class="col">
						<img src="../resources/img/Notice/h3_ogi410.gif">
					</div>
				</div>
				<!-- 주의사항 -->
				<div class="row m-3">
					<div class="col card" style="font-size: 11px;">
						<div><span style="color: #f36109;"> 모집기간 </span><span>을 꼭 확인해 주십시오.</span></div>
					</div>
				</div>
				<!-- 테이블 -->
				<div class="row m-3" style="font-size: 12px;">
					<div class="col border-top border-2 border-secondary">
						<table class="table">
							<colgroup>
								<col>
								<col width="15%">
								<col width="12%">
							</colgroup>
						  <thead class="text-center">
						    <tr>
						      <th scope="col">제목</th>
						      <th scope="col">모집기간</th>
						      <th scope="col">진행여부</th>
						    </tr>
						  </thead>
						  <tbody>
						  	<c:forEach items="${trialAssistantDataList}" var="trialAssistantDataList" >
						  		<tr>
						  			<td><a style="text-decoration: none" href="./trialAssistantRegisterReadBoard?announce_proper_num=${trialAssistantDataList.tb_002.announce_proper_num}">${trialAssistantDataList.tb_002.announce_title }</a></td>
						  			<td class="text-center"><fmt:formatDate value="${trialAssistantDataList.tb_002.announce_start_date}" pattern="yyyy.MM.dd"/>~<fmt:formatDate value="${trialAssistantDataList.tb_002.announce_end_date}" pattern="yyyy.MM.dd"/></td>
						  			<td class="text-center">
						  				<c:set var="now" value="<%=new java.util.Date()%>" />
										<c:set var="nowDate"><fmt:formatDate value="${now}" pattern="yyMMdd" /></c:set>
										<c:set var="endDate"><fmt:formatDate value="${trialAssistantDataList.tb_002.announce_end_date}" pattern="yyMMdd" /></c:set>
										<c:choose>
											<c:when test="${endDate >= nowDate}">
												진행
											</c:when>
											<c:otherwise>
												기간만료							
											</c:otherwise>
										</c:choose>
						  			</td>
						  		</tr>	
						  	</c:forEach>
						  </tbody>
						</table>
					</div>
				</div>
				<c:if test="${!empty admin}">
					<div class="row m-3" style="font-size: 12px;">
						<div class="col text-end">	
							<a class="btn btn-primary btn-sm" href="../member/trialAssistantRegisterWriteBoard"> 글쓰기 </a>
						</div>
					</div>
				</c:if>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</html>