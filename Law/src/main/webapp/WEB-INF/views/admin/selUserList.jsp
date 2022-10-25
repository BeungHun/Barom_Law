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
<!-- 외부 js 로드 -->
<script type="text/javascript" src="../resources/js/userDetailList.js"></script>

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
					<span> 홈 > 재판조력자관리 > </span><span style="color: #72a8fe;font-weight: bold;">1차심사 리스트</span>
				</div>
			</div>
			<!-- 타이틀 -->
			<div class="row my-4">
				<div class="col">
					<img src="../resources/img/Admin/head_title_img.gif">
					<span style="font-weight: bold;">1차심사 리스트</span>
				</div>
			</div>
			
			<!-- 안내 -->
			<div class="contentsinbox">
				<div class="row">
					<div class="col">
					
						<form action="excel" method="post">
							<table class="table">
								  <thead>
								    <tr>
								      <th scope="col">번호</th>
								      <th scope="col">이름</th>
								      <th scope="col">법원이름</th>
								      <th scope="col">이메일</th>
								      <th scope="col">신청일</th>
								      <th scope="col">조력자분류</th>
								      <th scope="col">신청현황</th>
								    </tr>
								  </thead>
								  <tbody>
								  <c:forEach items="${list}" var="data">
									    <tr onclick="location.href='../admin/selUserListDetail?aplcn_dtls_proper_num=${data.APLCN_DTLS_PROPER_NUM }'">
								     	  <td> ${data.APLCN_DTLS_PROPER_NUM }</td>
									      <td>${data.USER_NAME}</td>
									      <td>${data.COURT_NAME}</td>
									      <td>${data.USER_EMAIL}</td>
									      <td><fmt:formatDate value="${data.APLCN_DTLS_DATE }" pattern="yy.MM.dd"/></td>				      
									      <td>${data.TRIAL_FCLTT_SBCLS_CODE }</td>
									      <td>${data.APLCN_DTLS_STS }</td>
									      </tr>
				    			</c:forEach>
								  </tbody>
								</table>
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>

<!-- User Detail Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</html>