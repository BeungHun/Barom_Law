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

#myInfoFrm span {
	font-size: 12.5px;
}
</style>
<title>마이페이지</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../resources/js/common.js"></script>
<script type="text/javascript">
var errMsg = '${errorMsg}';

window.addEventListener("DOMContentLoaded", function() {
	// 실행 시 가장 먼저 에러메세지 유무 확인
	showErrMsg(errMsg);
	
});
	

function modifyMyInfo() {
	
	let zonecode = document.getElementById('user_ar_zonecode').disabled = false;
	let frmData = $('form[name=myInfoFrm]').serialize();
	
	$.ajax({
		url: './modifyMyInfo',
		method: 'post',
		data: frmData,
		dataType : 'json'
		
	}).done(function(obj) {
		//console.log('result : ' + obj.result)
		
		if(obj.result == 'success') {
			alert('수정 완료 되었습니다.');
			location.href = './myInfo';
		} else if(obj.result == 'error') {
			alert('수정 실패하였습니다.')
		}
	}).fail(function(e) {
		
	})
}

// 다음 주소 API
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('user_ar_zonecode').value = data.zonecode;
            document.getElementById("user_ar").value = roadAddr;
            document.getElementById("user_ar_jibun").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            /*
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }
            */

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
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
						<form id="myInfoFrm" name="myInfoFrm">
						<div class="row">
							<div class="col">
								<div class="row border-bottom border-secondary border-opacity-25 py-3">
									<div class="col-2 fw-bold"><span>아이디</span></div>
									<div class="col"><span>${user.user_id }</span></div>
								</div>
								<div class="row border-bottom border-secondary border-opacity-25 py-3">
									<div class="col-2 fw-bold"><span>이름</span></div>
									<div class="col"><span>${user.user_name }</span></div>
								</div>	
								<div class="row border-bottom border-secondary border-opacity-25 py-3">
									<div class="col-2 fw-bold"><span>이메일</span></div>
									<div class="col-3"><input class="" type="text" name="user_email" id="user_email" value="${user.user_email }"></div>
								</div>
								<div class="row border-bottom border-secondary border-opacity-25 py-3">
									<div class="col-2 fw-bold"><span>연락처</span></div>
									<div class="col-2"><input class="" type="text" name="user_phone" id="user_phone" value="${user.user_phone}"></div>
								</div>
								<div class="row border-bottom border-secondary border-opacity-25 py-3">
									<div class="col-2 fw-bol"><span>직업</span></div>
									<div class="col-2"><input class="" type="text" name="user_job" id="user_job" value="${user.user_job }"></div>
								</div>
								<div class="row border-bottom border-secondary border-opacity-25 py-3">
									<div class="col-2 fw-bold pt-4"><span>주소</span></div>
									<div class="col">
										<div class="row pb-2 input-group">
											<div class="col"><input class="" type="text" value="${user.user_ar_zonecode}" name="user_ar_zonecode" id="user_ar_zonecode" disabled></div>
											<div class="col"><input class="" type="text" value="${user.user_ar}" name="user_ar" id="user_ar"></div>
											<input class="" type="hidden" value="" name="user_ar_jibun" id="user_ar_jibun">
											<div class="col"><input class="" type="button" value="검색" onclick="sample4_execDaumPostcode();"></div>
											<div class="col"></div>
										</div>
										 <div class="row pb-2">
											<div class="col-5"><input class="" type="text" value="${user.user_ar_detail}" name="user_ar_detail" id="user_ar_detail" style="width:284px;"></div>
										</div>
									</div>
								</div>		
								<div class="row border-bottom border-secondary border-opacity-25 py-3">
									<div class="col-2 fw-bold"><span>계좌은행</span></div>
									<div class="col-2">
										<select class="" id="user_bank" name="user_bank">
											<option value="woorie">우리은행</option>
											<option value="shinhan">신한은행</option>
											<option value="kuckmin">국민은행</option>
											<option value="kiup">기업은행</option>
										</select>
									</div>
									
								</div>	
								<div class="row border-bottom border-secondary border-opacity-25 py-3">
									<div class="col-2 fw-bold "><span>계좌번호</span></div>
									<div class="col-2"><input class="" type="text" value="${user.user_bank_account}" id="user_bank_account" name="user_bank_account"></div>
								</div>	
								<div class="row border-bottom border-secondary border-opacity-25 py-3">
									<div class="col-2 fw-bold"><span>예금주</span></div>
									<div class="col-2"><input class="" type="text" value="${user.user_bank_holder}" id="user_bank_holder" name="user_bank_holder">
									</div>
								</div>	
								<div class="row border-bottom border-secondary border-opacity-25 py-3">
									<div class="col-2 fw-bold "><span>가입일자</span></div>
									<div class="col"><span><fmt:formatDate pattern="yyyy-MM-dd" value="${user.user_joindate }" /></span>
									</div>
								</div>
							</div>
							<input type="hidden" value="${user.user_proper_num}" name="user_proper_num">
						</form>
						<div class="row mt-3 float-end">
							<div class="col-10"></div>
							<div class="col-2 d-grid"><input type="button" onclick="modifyMyInfo();" class="btn btn-primary btn-sm" value="수정"></div>
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