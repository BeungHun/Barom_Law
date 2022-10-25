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
<title>FAQ 상세보기 페이지</title>
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
				<div class="row mb-3">
					<div class="col">
						<div class="row text-end">
							<div class="col" style="font-size: 11px;">
								<span> 홈 > 공지사항 > </span><span style="color: #72a8fe; font-weight: bold">공지사항</span>
							</div>
						</div>
						<!-- 상세보기 내용 -->
						<div class="row m-3" style="font-size: 12px;">
							<div class="col border-top border-2 border-secondary">
								<table class="table">
									<colgroup>
										<col width="17%">
										<col width="">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">질문</th>
											<td>${data.tb_004.faq_ask_content }</td>
										</tr>
										<tr>
											<th scope="row" class="totalth text-center" colspan="4">답변</th>
										</tr>
										<tr>
											<th scope="row" colspan="4">${data.tb_004.faq_ask_comment }</th>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
						<!-- 수정 및 삭제 버튼 -->
						<div class="row justify-content-end mt-3" style="font-size: 12px;">
							<div class="col d-grid text-end">
								<form action="./updateFaqPage?faq_proper_num=${data.tb_004.faq_proper_num }" method="post">
									<c:if test="${!empty admin }">
										<input class="btn btn-primary" type="submit" value="수정">
									</c:if>
								</form>
							</div>
							<div class="col-1 d-grid text-end" style="margin-right: 37px;">
								<form action="./deleteFaqProcess?faq_proper_num=${data.tb_004.faq_proper_num }" method="post">
									<c:if test="${!empty admin }">
										<input class="btn btn-primary" type="submit" value="삭제">
									</c:if>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>