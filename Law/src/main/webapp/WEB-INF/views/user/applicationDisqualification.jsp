<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>감정인 등재 신청</title>
<style>
	div .scrollconbox380{
		height:380px;
		padding:7px;
		border:1px solid #ddd;
		overflow-y:scroll;
		margin:0 0 5px 0;
	}
	
	.contentsinbox h4{
		clear:both; 
		font-size:12px;
		font-weight:bold;
		letter-spacing:-1px;
		line-height:1.3em;
		padding:0 11px;
		margin:5px 0;
		background:url('../resources/img/Registration/bullet_h4.gif') no-repeat 0 35% ;
	}
	
	.contentsinbox .noImg{
		padding:0px;
		background:none;
	}

</style>
<script>
	function chkAgree() {
		var cbAllBox = document.getElementById("cb_conform");
		
		if(cbAllBox.checked) location.href="../user/userDetail";
		else alert('감정인 신청 결격사유에 해당하는 경우 신청이 불가합니다.');
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
			<<!-- div class="col-3 text-center" style="border-right: solid 1px #ccc;">
				<div class="list-group list-group-flush">
					<a href="#" class="list-group-item list-group-item-action">감정인 등재신청</a>
				</div>
			</div> -->
			<div class="col-3 text-end border-end" style="padding-right: 0px;">
				<jsp:include page="../common/applicationRegistrationLocalNav.jsp"></jsp:include>
			</div>
			
			<!-- 본문 -->
			<div class="col m-3">
				<!-- 현재위치 -->
				<div class="row text-end loc">
					<div class="col" style="font-size: 11px;">
						<span> 홈 > 감정인등재신청 > </span><span style="color: #72a8fe;font-weight: bold;">감정인 신청 결격사유</span>
					</div>
				</div>
				<!-- 타이틀 -->
				<div class="row mb-3">
					<div class="col">
						<img src="../resources/img/Registration/h3_ogi214.gif">
					</div>
				</div>
				<!-- 동의서 -->
				<div class="row m-3" style="font-size: 12px;">
					<div class="col">
						<div class="contentsinbox">
							<!-- 결격사유 확인 -->
							<h4>감정인등 선정과 감정료 산정기준 등에 관한 예규 제 4조의2 제1항 해당사항</h4>
							<div style="clear:both" class="scrollconbox380">
								<p>1. 피성년후견인 또는 피한정후견인</p>
								<p>2. 파산선고를 받고 복권되지 아니한 사람</p>
								<p>3. 금고 이상의 형을 받고 그 집행이 종료되거나 집행을 받지 아니하기로 확정된 후 5년을 경과하지 아니한 사람</p>
								<p>4. 금고 이상의 형을 받고 그 집행유예의 기간이 완료된 날로부터 2년을 경과하지 아니한 사람</p>
								<p>5. 금고 이상의 형의 선고유예를 받은 경우에 그 선고유예 기간 중에 있는 사람</p>
								<p>6. 법원의 판결 또는 다른 법률에 의하여 자격이 상실 또는 정지된 사람</p>
								<p>7. 공무원으로서 파면의 징계처분을 받은 때로부터 5년을 경과하지 아니한 사람</p>
								<p>8. 공무원으로서 해임의 징계처분을 받은 때로부터 3년을 경과하지 아니한 사람</p>
								<p>9. 감정업무와 관련하여 형사처벌 또는 징계처분을 받은 전력이 있는 사람</p>
								<p>10. 『감정인 명단』에서 삭제된 날로부터 2년이 경과되지 아니한 사람</p>
							</div>
							<div class="text-center" style="clear:both; font-size:12px; font-weight:bold; letter-spacing:-1px; line-height:1.3em;">
								<input id="cb_conform" style="vertical-align:bottom" type="checkbox" onclick="conformChked();">
								<label>상기 결격사유에 해당 사항이 없는 것을 확인함</label>
							</div>
							<br>
								
							<div class="text-center">
								<a href="javascript:chkAgree();"><span class="btn btn-primary btn-sm">다음</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</html>