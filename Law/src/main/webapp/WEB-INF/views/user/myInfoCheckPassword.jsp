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
<link rel="stylesheet" type="text/css" href="../resources/css/common.css">
<style type="text/css">
body{
	height: 100%;
	width: 100%;
	font-size: 11px;
}

h4{
		clear:both; 
		font-size:14px;
		font-weight:bold;
		letter-spacing:-1px;
		line-height:1.3em;
		padding:0 11px;
		margin:5px 0;
		background:url('../resources/img/Registration/bullet_h4.gif') no-repeat 0 35% ;
}	
	

</style>
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../resources/js/common.js"></script>
<script type="text/javascript">
	var errMsg = '${errorMsg}';
	
	window.addEventListener("DOMContentLoaded", function() {
		// 실행 시 가장 먼저 에러메세지 유무 확인
		showErrMsg(errMsg);
		
	});
	
	function chkPassword() {
		let userPw = document.getElementById('user_pw').value;
		console.log('userPw : ' + userPw);
		
		$.ajax({
			url: './chkPassword?user_pw=' + userPw,
			method: 'get',
			dataType: 'json',
		}).done(function(obj) {
			if(obj.result == 'success') {
				location.href = './myInfo';
			} else if(obj.result == 'fail') {
				
				let failMsg = document.getElementById('failMsg');
				failMsg.innerText = '비밀번호를 정확하게 입력해 주세요.';
			}
			
			
		}).fail(function() {
			
		})
		
		
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
			<jsp:include page="../user/myPageNav.jsp"></jsp:include>
		
			<!-- 본문 -->
			<div class="col m-3">
				<!-- 현재위치 -->
				<div class="row text-end">
					<div class="col" style="font-size: 11px;">
						<span> 홈 > My Page > 내정보 > </span><span style="color: #72a8fe;font-weight: bold;">내정보 관리</span>
					</div>
				</div>
				<!-- 네비바 -->
				<div class="row mb-3">
					<div class="col">
						<div class="row border-bottom border-2 border-secondary py-2">
							<div class="col pt-1 px-0 text-center">
								<span class="fw-bold text-info btn-pointer font-def" onclick="location.href='./identityVerificate';">내정보 관리</span>
							</div>
							<div class="col pt-1">
								<span class="fw-bold text-secondary btn-pointer font-def mx-2" onclick="location.href='./modifyPassword';">비밀번호 변경</span>
							</div>
							<div class="col pt-1">
								<span class="fw-bold  text-secondary btn-pointer font-def mx-2" onclick="location.href='./withdrawal';">회원탈퇴</span>
							</div>
							<div class="col-6"></div>
						</div>
						
						<!-- 내용 -->
						<div class="row">
							<div class="col">
							
								<div class="row py-3">
									<div class="col">
										<div class="row"><div class="col fw-bold mb-2 text-secondary"><h4>비밀번호 재확인</h4></div></div>
										<div class="row">
											<div class="col text-secondary">
												<span style="font-size: 11px;">본인확인을 위해 한번 더 비밀번호를 입력해 주세요.<span class="text-danger text-opacity-75"><br>비밀번호는 타인에게 노출되지 않도록 주의해 주세요.</span><br>
												
											</span>
											
											</div>
										</div>
										
									</div>
								</div>
						
							<div class="row border-top border-secondary border-opacity-25 border-bottom pt-4 pb-3">
								<div class="col">
								
									<div class="row pb-2">
										<div class="col-2 fw-bold pt-1 font-def"><span>아이디</span></div>
										<div class="col-3"><span class="font-def">${user.user_id }</span></div>
									</div>	
									<div class="row pt-2">
										<div class="col-2 fw-bold pt-1 font-def"><span>비밀번호</span></div>
										<div class="col-3" style="width: 31%;">
											<input type="password" placeholder="비밀번호 입력" id="user_pw" style="float:left;">
											<input type="button" class="mx-2" value="확인" onclick="chkPassword();" style="float:left;">
										</div>
										<!-- <div class="col"><input type="button" class="btn btn-primary" value="확인" onclick="chkPassword();"></div> -->
									</div>
								
									<div class="row pb-3">
										<div class="col-2"></div>
										<div class="col my-1"><span class="msg" id="failMsg" style="font-size: 12px;"></span></div>
									</div>
								</div>
							</div>
							
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