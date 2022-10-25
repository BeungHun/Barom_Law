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
<title>등재공고 작성페이지</title>
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
						<span> 홈 > 공지사항 > </span><span style="color: #72a8fe;font-weight: bold;">감정인등재공고</span>
					</div>
				</div>
				<!-- 타이틀 -->
				<div class="row mb-3">
					<div class="col">
						<img src="../resources/img/Notice/h3_ogi410.gif">
					</div>
				</div>
				
				<form action="./trialAssistantRegisterWriteProcess" method="post">
					<!-- 테이블 -->
					<div class="row m-3" style="font-size: 12px;">
						<div class="col border-top border-2 border-secondary">
							<table class="table">
								<colgroup>
							        <col width="17%">
							        <col width="">
							    </colgroup>
							  	<tbody>
								    <tr>
								        <th scope="row">제목</th>
								        <td class="d-grid">
								        	<input type="text" name="announce_title" placeholder="제목">
								        </td>
								    </tr>
								    <tr>
								        <th scope="row">모집기간</th>
								        <td>
								        	<input name="announce_start_date" type="date" pattern="yyyy-MM-dd"/> ~
											<input name="announce_end_date" type="date" pattern="yyyy-MM-dd"/>
										</td>
								    </tr>
								    <tr>
								        <th scope="row">모집대상</th>
								        <td>
								        	<select name="trial_fcltt_proper_num">
											    <c:forEach items="${trialFcltt}" var="trialFcltt">
										  			<option value="${trialFcltt.trial_fcltt_proper_num}" >
									  					${trialFcltt.trial_fcltt_description }
									  				</option>
												</c:forEach>
											</select>
								        </td>
								    </tr>
								    <tr>
								        <th scope="row" class="totalth text-center" colspan="4">내용</th>
								    </tr>
								    <tr>
								        <td colspan="4">
									        <div class="contentsview">
									            <textarea rows="12" style="width: 100%; border: none; overflow: auto; font-size: 75%/1.4em; color: #747474" name="announce_content" placeholder="최소 10글자이상 입력 바랍니다."></textarea>
									        </div>
								        </td>
								    </tr>
							   	</tbody>
							</table>
						</div>
					</div>
					<div class="row mt-3 justify-content-end">
						<div class="col-2 d-grid">
							<button type="submit" class="btn btn-primary">작성</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</html>