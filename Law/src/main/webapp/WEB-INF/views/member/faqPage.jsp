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
<title>FAQ 메인 페이지</title>

</head>
<body>
	<div class="col container-fluid" style="width: 960px;">
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<img src="../resources/img/sub_topimg.gif">

		<div class="row mt-2">
			<!-- 사이드 네비바 -->
			<jsp:include page="../common/localNav.jsp"></jsp:include>
			
			<!-- FAQ 게시판 내용 -->
			<div class="col m-3">
				<div class="row text-end">
					<div class="col" style="font-size : 11px;">
						<span> 홈 > 공지사항 > </span><span style="color: #72a8fe; font-weight: hold;">FAQ</span>
					</div>
				</div>		
				<!-- FAQ 제목 -->
				<div class="row mb-3">
					<div class="col">
						<img src="../resources/img/Faq/h3_ogi430.gif">
					</div>
							
					<!-- FAQ 리스트 -->
					<div class="row mt-3" style="font-size: 12px;">
						<div class="col border-top border-2 border-secondary">
							<table class="table">
								<colgroup>
									<col width="100%">
									<col width="">
								</colgroup>
								<thead class="text-center">
									<tr>
										<th scope="col">질문</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${dataList }" var="data">
										<tr>
											<td><a style="text-decoration: none" href="./faqDetailPage?faq_proper_num=${data.faq_proper_num}">${data.faq_ask_content }</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					
					
					<form action="./writeFaqPage" method="post">
						<div class="row m-3" style="font-size: 12px;">
							<div class="col text-end">
								<c:if test="${!empty admin }">
									<input class="btn btn-primary" type="submit" value="글쓰기">
								</c:if>
							</div>
						</div>
					</form>
				</div>
			</div>
			<jsp:include page="../common/footer.jsp"></jsp:include>
		</div>
	</div>
				


</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</html>