<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<title>FAQ 글쓰기 페이지</title>
</head>
<body>
	<div class="col container-fluid" style="width: 960px;">
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<!-- 구분 이미지 -->
		<img src="../resources/img/sub_topimg.gif">
		
		<!-- 내용 -->
		<div class="row mt-2">
			<!-- 사이드 네비바 -->
			<jsp:include page="../common/localNav.jsp"></jsp:include>
				
				<!-- 본문 -->
				<div class="col m-3">
					<div class="row mb-3">
						<div class="col">
							<div class="row text-end">
								<div class="col" style="font-size: 12px;">
									<span> 홈 > 공지사항 > </span><span style="color: #72a8fe; font-weight: bold">FAQ</span>
								</div>
							</div>	
						
						<!-- 글쓰기 화면 -->
						<div class="row m-3" style="font-size: 12px;">
								<div class="col  border-top border-2 border-secondary">
									<form action="./writeFaqProcess" method="post" enctype="multipart/form-data">
										<table class="table">
											<colgroup>
												<col width="17%">
												<col width="">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">질문</th>
													<td class="d-grid">
														<input type="text" name="faq_ask_content" placeholder="질문을 작성하시오.">
													</td>
												</tr>
												<tr>
													<th scope="row" class="totalth text-center" colspan="4">답변</th>
												</tr>
												<tr>
													<td colspan="4">
														<textarea placeholder="답변을 입력해주시오." rows="12" name="faq_ask_comment" style="width: 100%; border: none; overflow: auto; font-size: 75%/1.4em;"></textarea>
													</td>
												</tr>
											</tbody>
										</table>
										<!-- 글쓰기 버튼 -->
										<div class="row mt-3 justify-content-end">
											<div class="col-2 d-grid">
												<input class="btn btn-primary" type="submit" value="글쓰기">
											</div>
										</div>
									</form>
								</div>		
								<!-- 목록가기 버튼 -->
								<form action="./faqPage" method="post">
									<input class="btn btn-primary" type="submit" value="목록으로">
								</form>
							</div>
					</div>
				</div>
			</div>
			<jsp:include page="../common/footer.jsp"></jsp:include>	
		</div>
	</div>
	
		
	</body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</html>