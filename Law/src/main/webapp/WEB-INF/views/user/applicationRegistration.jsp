<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<title>회원가입</title>
<!-- 외부 css 로드  -->
<link rel="stylesheet" type="text/css" href="../resources/css/common.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>

.ms{
	text-align-last: right;
	font-weight:bold;
	padding-right: 16px;
	font-size: 12.5px;
}
.contentsinbox input{
	width: auto;
	float: left;
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

.contentsinbox h5{
	clear:both; 
	font-size:12px;
	font-weight:bold;
	letter-spacing:-1px;
	line-height:1.3em;
	margin:3px 0;
	padding:0 0 0 10px;
	background:url('../resources/img/Registration/bullet_h4.gif') no-repeat 0 25%;
}
select.box {
  width: 100%;
  height: 50px;
  box-sizing: border-box;
  margin-left: 5px;
  padding: 5px 0 5px 10px;
  border-radius: 4px;
  border: 1px solid #d9d6d6;
  color: #383838;
  background-color: #ffffff;
  font-family: 'Montserrat', 'Pretendard', sans-serif;
}

option {
  font-size: 16px;
}

.info .box#domain-list option {
  font-size: 14px;
  background-color: #ffffff;
}
	
</style>
<script src="../resources/js/common.js"></script>






<script type="text/javascript">
window.addEventListener("DOMContentLoaded", function() {
	// 실행 시 가장 먼저 에러메세지 유무 확인
	
});

function helloWorld(){
	var first = document.getElementById("firstEmail").value;
	var middle = document.getElementById("middle").value;
	var last = document.getElementById("lastEmail").value;
	
	var lastest = first + middle + last;
	console.log(first);
	console.log(middle);
	console.log(last);
	console.log(lastest);
	document.getElementById("totalEmail").value= lastest; 
}



function checkListId(){
	var check = document.getElementById("checkId").value;
	console.log(check);
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
			var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				var checkList = document.getElementById("alreadyCheckId").value;
				
			
				alreadyCheckId.innerHTML = "";
				
				if(result.count == true){
					isChecked = false;
					var checkList = document.createElement("div");
					checkList.innerText="해당 아이디가 존재합니다.";
					checkList.classList.remove("text-success");
					checkList.classList.add("text-danger");
					checkList.setAttribute("style", "font-size: 18px");
					checkList.setAttribute("style", "padding-left: 235px");
					checkList.setAttribute("style", "padding-top: 4px");
					alreadyCheckId.appendChild(checkList);
					
				}else{
					isChecked = true;
					var checkList = document.createElement("div");
					checkList.innerText="사용 가능한 아이디입니다.";
					checkList.classList.add("text-success");
					checkList.classList.remove("text-danger");
					checkList.setAttribute("style", "font-size: 18px");
					checkList.setAttribute("style", "padding-left: 235px");
					checkList.setAttribute("style", "padding-top: 4px");
					alreadyCheckId.appendChild(checkList);
				}
	    }
	}
    xhr.open("get" , "./registerOverLabCheck?user_id=" + check); //리퀘스트 세팅..
	//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
	xhr.send(); //AJAX로 리퀘스트함..		
} 
var isChecked = false;

function insertUser(){

			document.getElementsByName("user_ar_zonecode")[0].disabled = false;
			
			const id = document.getElementById("checkId");
			
			if(isChecked == false){
				alert("아이디 중복확인을 해주세요.");
				id.focus();
				return;
			}
			const insertUser = document.getElementById("insertUser");
	
			insertUser.submit();
			alert("회원가입이 완료되었습니다.");
}



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
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

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
	<!-- 여기부터 다시 시작임 -->
	<div class="container-fluid" style="width: 960px;">
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<!-- 구분 이미지 -->
		<img src="../resources/img/sub_topimg.gif">
		
		<!-- 페이지 내용 -->
		<div class="row mt-2">

			<!-- 사이드 네비바 -->
			<div class="col-3 text-end">
                <jsp:include page="../common/applicationRegistrationLocalNav.jsp"></jsp:include>
            </div>
			
			<!-- 본문 -->
			<div class="col m-3">
				<!-- 현재위치 -->
				<div class="row text-end loc">
					<div class="col" style="font-size: 11px;">
						<span> 홈 > </span><span style="color: #72a8fe;font-weight: bold;">회원가입</span>
					</div>
				</div>
				<!-- 타이틀 -->
				<div class="row my-4">
					<div class="col">
						<img src="../resources/img/Guide/h3_ogi110.gif">
					</div>
				</div>
				
				
				<!-- 안내 -->
				<div class="contentsinbox">
					<h4 class="mar">회원가입</h4>
					<!--table start-->
					<div class="tabletop">
					<form action="../user/applicationRegistrationProcess" id="insertUser">
						<table class="list vline" summary="감정인의 종류 및 신청 방식" border="1">
							<colgroup>
							<col width="15%;">
							<col width="15%;">
							<col width="70%;">
                            </colgroup>
							<tbody>
								<tr>
									<th class="ms">아이디<span style="color:red"> *</span></td>
									<td colspan="2">
										<input type="text" class="my-1" id="checkId" onblur="checkListId()" name="user_id" placeholder="아이디 입력">
										<span id="alreadyCheckId" class="msg"></span>
									</td>
								</tr>
								<tr>
									<th class="ms">비밀번호<span style="color:red"> *</span></td>
									<td colspan="2"><input type="password" class="my-1" name="user_pw" placeholder="비밀번호 입력"></td>
								</tr>
								<tr>
									<th class="ms">이름<span style="color:red"> *</span></th>
									<td colspan="2"><input type="text" class="my-1" name="user_name" placeholder="이름 입력"></td>
								</tr>
								<tr>
									<th class="ms">나이<span style="color:red"> *</span></th>
									<td colspan="2"><input type="number" class="my-1" name="user_age" placeholder="나이 입력" style="width:77px;"></td>
								</tr>
								<tr>
									<th class="ms">직업<span style="color:red"> *</span></th>
									<td colspan="2"><input type="text" class="my-1" name="user_job" placeholder="직업 입력"></td>
								</tr>
								<tr>
									<th class="ms">연락처<span style="color:red"> *</span></th>
									<td colspan="2"><input type="text" class="my-1" name="user_phone" placeholder="연락처 입력"></td>
								</tr>
								<tr>
									<th class="ms">이메일<span style="color:red"> *</span></th>
									<td colspan="2">
										<input type="text" id="firstEmail" class="my-1" id="emailNum" placeholder="이메일 입력" style="width:116px;">
										<span class="my-1" style="float: left; font-size: 13px"><input id="middle" type="hidden" value="@">&nbsp;@&nbsp; </span><input type="text" onblur="helloWorld();" class="my-1" id="lastEmail" list="user_email_address" placeholder="이메일주소 입력">
										
										<datalist id="user_email_address">
											<option value="type">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="daum.com">daum.com</option>
											<option value="google.com">google.com</option>
										</datalist>
										<input type="hidden" id="totalEmail" name="user_email" value="">
									</td>
								</tr>
							
							
							
								<tr>
									<th class="ms">주소<span style="color:red"> *</span></th>
									<td colspan="2">
										<div style="float: left;">
											<input type="text" id="sample4_postcode" class="my-1" name="user_ar_zonecode" style="float:left; width: 60px;" placeholder="우편번호" disabled>
											<input type="text" id="sample4_roadAddress" class="mx-1 my-1" name="user_ar" style="float:left;" placeholder="도로명 주소">
											<input type="button" class="mx-1 my-1" onclick="sample4_execDaumPostcode()" value="검색">
										</div>
										<div style="float: left; width: 100%;">
											<input type="text" id="sample4_detailAddress" class="my-1 my-1" name="user_ar_detail" style="width: 260px;" placeholder="상세주소 입력">
										</div>
										<input type="hidden" id="sample4_jibunAddress" class="" name="user_ar_jibun" >
										<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
										
									</td>
								</tr>
								<tr>
									<th rowspan="3" scope="row" class="">은행<span style="color:red"> *</span></th>
									<td class="title">계좌 예금주</td>
									<td><input type="text" class="my-1" name="user_bank_holder" placeholder="예금주 입력"></td>
								</tr>
								<tr>
									<td class="title">계좌은행</td>
									<td><input type="text" class="my-1" name="user_bank" placeholder="은행 입력"></td>			
								</tr>
								<tr>
									<td class="title">계좌 번호</td>
									<td><input type="text" class="my-1" name="user_bank_account" placeholder="계좌번호 입력"></td>
								</tr>
								
							</tbody>
						</table>
						<div class="row">
							<div class="col">
								<input type="button" class="btn btn-primary btn-sm my-2" onclick="insertUser()" value="회원가입" style="float: right;">	
							</div>
						</div>
						</form>
					</div>
                </div>
            </div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
	
       
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</html>