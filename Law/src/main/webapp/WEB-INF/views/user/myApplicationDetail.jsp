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
<script src="../resources/js/common.js"></script>
<script type="text/javascript" src="../resources/js/userDetailList.js"></script>
<script type="text/javascript">
	var errMsg = '${errorMsg}';
	var userNo = '${aplcn_dtls_proper_num}';
	
	window.addEventListener("DOMContentLoaded", function() {
		// 실행 시 가장 먼저 에러메세지 유무 확인
		showErrMsg(errMsg);
		
		tableOneInfo();
		
		// 버튼 클릭시 렌더링
		var navClassName ='nav-btn';
		var navBtn = document.getElementsByClassName(navClassName);
		for(btn of navBtn){
			btn.addEventListener('click', function(e){
				var addId = this.id;
				
				changeBtn(addId, navClassName);
				
				switch(addId){
					case 'oneTab' : 
						tableOneInfo();
						break;
					case 'fiveTab' : 
						tableFiveInfo();
						break;
					case 'sixTab' : 
						tableSixInfo();
						break;
					case 'sevenTab' : 
						tableSevenInfo();
						break;
					case 'eightTab' : 
						tableEightInfo();
						break;
					case 'nineTab' :
						tableNineInfo();
						break;
				}
			});
		}	
	});
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
			<jsp:include page="../user/myPageNav.jsp"></jsp:include>
			
			<!-- 본문 -->
			<div class="col m-3">
				<!-- 현재위치 -->
				<div class="row text-end">
					<div class="col" style="font-size: 11px;">
						<span> 홈 > My Page > 나의 등재신청 내역 > </span><span style="color: #72a8fe;font-weight: bold;">나의 등재신청 상세</span>
					</div>
				</div>
				
				<div class="row mb-3">
					<div class="col">
					
						<div class="row border-bottom border-2 border-secondary py-2">
							<div class="col">
								<span class="fw-bold fs-4 text-secondary">나의 등재신청 상세</span>
							</div>	
						</div>
						
						<!-- 내용 -->
						<div class="row text-center mt-5 mx-0 mb-4">      
				            <div class="col-2 py-3 nav-btn border border-bottom-0 text-primary text-opacity-50 fw-bold" id="oneTab"><span>기본정보</span></div>
				            <div class="col-2 py-3 nav-btn border bg-secondary bg-opacity-10" id="fiveTab"><span>신청정보</span></div>
				            <div class="col-2 py-3 nav-btn border bg-secondary bg-opacity-10" id="sixTab"><span>학력정보</span></div>
				            <div class="col-2 py-3 nav-btn border bg-secondary bg-opacity-10" id="sevenTab"><span>경력정보</span></div>
				            <div class="col-2 py-3 nav-btn border bg-secondary bg-opacity-10" id="eightTab"><span>자격증정보</span></div>
				            <div class="col-2 py-3 nav-btn border bg-secondary bg-opacity-10" id="nineTab"><span>첨부파일 정보</span></div>
	        			</div>
	        			<div class="row mx-0">
							<div id="nav-info" class="col"></div>
						</div> 
	        			
						<div class="row">
							<div class="col text-end">
								<button class="btn btn-primary btn-sm" onclick="location.href='./myApplication'">목록</button>
							</div>
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