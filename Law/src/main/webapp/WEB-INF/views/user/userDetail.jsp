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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<!-- 외부 css 로드  -->
<link rel="stylesheet" type="text/css" href="../resources/css/common.css">
<title>감정인 등재 신청</title>
<style>
body{
	height: 100%;
	width: 100%;
	font-size: 11px;
}

.imm{
	width: auto;
}
.us-text{
	position: absolute;
	top:15%;
	left:3%;
	font-size: 12px;
}
.us-image{
	position: relative;
	width: 100%;
	margin: 10px auto;
}
.text{
	font-size: 14px;
}
.notice .cont li{
	margin:2px 4px 2px 4px;
	padding:2px 0 0 0;
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
.mid{
	vertical-align: middle;
	text-align: -webkit-center;
}

</style>


<script type="text/javascript">
window.addEventListener("DOMContentLoaded", function() {
	// 실행 시 가장 먼저 에러메세지 유무 확인
	/* loginCheck(); */
	callFcltt()
	
});

var isLogined = true;

/* 아니오 누를경우 경력내용 비활성화 */
function cutOff(elementId){
	var el =  document.getElementById(elementId);
	el.readOnly= true;
}

/* 예 누를경우 경력내용 활성화 */
function cutOn(elementId){
	var el =  document.getElementById(elementId);
	el.readOnly= false;
}

/* 아무것도 안누를시 경고창 */
function didUseBoard(eleId1, eleId2, eleId3){
		var yes = document.getElementById(eleId1).checked;
		var no = document.getElementById(eleId2).checked;
		var area = document.getElementById(eleId3);
		
		if(yes == false && no == false){
			alert("예, 아니오를 입력해 주세요");
			area.value = null;
		}
}

//현재 모집 중인 감정분야만 선택가능하게 (중분류 표기)
function callFcltt(){
    	
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
    		const selectBox1 = document.getElementById("s1");
    		selectBox1.innerHTML = "";
    		
    		var optionBox1 = document.createElement('option');
    		optionBox1.innerText = '선택';
            selectBox1.appendChild(optionBox1);
    		
    		for(level of jsonObj.mLevel){
	    		var optionBox = document.createElement('option');
	            optionBox.setAttribute('value', level);
	            optionBox.innerText = level;
	            selectBox1.appendChild(optionBox);
    		}
        }
    }
    
    xhr.open("get" , "../user/chkFcltt"); //리퀘스트 세팅..
    //xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
    xhr.send(); //AJAX로 리퀘스트함..
}

//중분류에 따른 모집중인 소분류 표기
function callSmallLevel(selectBox1){
	
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
            console.log(jsonObj);
            
            const selectBox2 = document.getElementById("s1_detail");
            selectBox2.innerHTML = "";
    		
    		var optionBox1 = document.createElement('option');
    		optionBox1.innerText = '선택';
    		selectBox2.appendChild(optionBox1);
    		
    		for(level of jsonObj.sLevel){
	    		var optionBox = document.createElement('option');
	            optionBox.setAttribute('value', level);
	            optionBox.innerText = level;
	            selectBox2.appendChild(optionBox);
    		}
            
        }
    }
    
    xhr.open("get" , "../user/callSmallLevel?mLevel=" + selectBox1.value); //리퀘스트 세팅..
    //xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
    xhr.send(); //AJAX로 리퀘스트함..
}

//임시저장 Ajax
function chkTempData(selectBox2){
	const selectBox1 = document.getElementById("s1");
    
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
            
            console.log(jsonObj);
            console.log(jsonObj.result);
            if(jsonObj.result == 'fail'){
            	alert('이미 지원한 신청입니다.');
            	location.href = "../user/main";
            	
            }else{
	            var userDetailButtonBox = document.getElementById("userDetailButtonBox");
	            userDetailButtonBox.innerHTML = "";
	            
	            if(jsonObj.alpa){
		            if (confirm("임시저장된 정보들이 있습니다. 불러오시겠습니까 ? ")) {
			            /* 임시저장 */
			            jsonObj.tb_005.court_proper_num
			           	document.getElementById("s2").value= jsonObj.tb_005.court_proper_num; 
			           	document.getElementById("s4").value= jsonObj.tb_005.ligtn_case_carer_etc; 
			           	document.getElementById("s6").value= jsonObj.tb_005.insrn_indst_carer_etc; 
			           	document.getElementById("s8").value= jsonObj.tb_005.criminal_penalty_carer_etc; 
			           	
			           	if(jsonObj.tb_005.ligtn_case_carer_yn == 'y'){
			           		document.getElementById("s31").checked = true;
			           		document.getElementById("s4").readOnly = false;
			           	}else{
			           		document.getElementById("s32").checked = true;
			           		document.getElementById("s4").readOnly = true;
			           	}
			           	if(jsonObj.tb_005.insrn_indst_carer_yn == 'y'){
			           		document.getElementById("s51").checked = true;
			           		document.getElementById("s6").readOnly = false;
			           	}else{
			           		document.getElementById("s52").checked = true;
			           		document.getElementById("s6").readOnly = true;
			           	}
			           	if(jsonObj.tb_005.criminal_penalty_carer_yn == 'y'){
			           		document.getElementById("s71").checked = true;
			           		document.getElementById("s8").readOnly = false;
			           	}else{
			           		document.getElementById("s72").checked = true;
			           		document.getElementById("s8").readOnly = true;
			           	}
		            }
		            
		            var hiddenInputBox = document.createElement('input');
		            hiddenInputBox.setAttribute("type", "hidden");
		            hiddenInputBox.setAttribute('name', "announce_proper_num");
		            hiddenInputBox.setAttribute('value', jsonObj.tb_005.announce_proper_num);
		            userDetailButtonBox.appendChild(hiddenInputBox);
		            
		            var hiddenInputBox2 = document.createElement('input');
		            hiddenInputBox2.setAttribute("type", "hidden");
		            hiddenInputBox2.setAttribute('name', "trial_fcltt_proper_num");
		            hiddenInputBox2.setAttribute('value', jsonObj.tb_005.trial_fcltt_proper_num);
		            userDetailButtonBox.appendChild(hiddenInputBox2);
		            
		            var buttonBox = document.createElement('button');
		            buttonBox.setAttribute('type', "submit");
		            buttonBox.setAttribute('formaction', "userDetailUpProcess");
		            buttonBox.setAttribute('formmethod', "get");
		            buttonBox.classList.add("btn");
		            buttonBox.classList.add("btn-primary");
		            buttonBox.classList.add("btn-sm");
		            buttonBox.innerText = '다움';
		            userDetailButtonBox.appendChild(buttonBox);
		            
	            }else{
	            	
	            	var buttonBox = document.createElement('button');
	 	            buttonBox.setAttribute('type', "submit");
	 	            buttonBox.setAttribute('formaction', "userDetailInsProcess");
	 	            buttonBox.setAttribute('formmethod', "get");
	 	            buttonBox.innerText = '다음';
	 	            buttonBox.classList.add("btn");
	 	           	buttonBox.classList.add("btn-primary");
	 	         	buttonBox.classList.add("btn-sm");
	 	            userDetailButtonBox.appendChild(buttonBox);
	            }
            }
            
            
        }
    }
    
    xhr.open("get" , "../user/chkTempData?mLevel=" + selectBox1.value + "&sLevel=" + selectBox2.value); //리퀘스트 세팅..
    //xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
    xhr.send(); //AJAX로 리퀘스트함..
    
}

function checkList(){
	
	let result = true;
	
	let check = document.getElementsByTagName("ch");
	
	let ss = document.getElementById("ss");
	
	// 공백검사
	for(let i=0; i<check.length; i++) {
		let box = check[i].parentNode.parentNode.parentNode;
		
		if(check[i].value == '') {
				result = false;
		}
	}
	if(result){
		ss.submit();
		alert("저장되었습니다");
	}else{
		alert("빈칸을 입력해주세요");
	}
}

</script>
<title>등재신청 기본정보</title>
</head>
<body>
	<div class="container-fluid" style="width: 960px;">
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<!-- 구분 이미지 -->
		<img src="../resources/img/sub_topimg.gif">
		
		<!-- 페이지 내용 -->
		<div class="row mt-2">
			<!-- 사이드 네비바 -->
			<!-- <div class="col-3 text-center" style="border-right: solid 1px #ccc;">
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
						<span> 홈 > 감정인등재신청 > </span><span style="color: #72a8fe;font-weight: bold;">개인정보 수집 동의</span>
					</div>
				</div>
				
				<!-- 감정인 등재신청 그림 -->
				<div class="row my-4">
					<div class="col">
						<img src="../resources/img/applicationRegistration/h3_ogi210 (1).gif">
					</div>
				</div>
				
				<div class="row" style="margin-right: 15px; margin-left: 12px;">
					<div class="col notice px-0">
						<div class="cont">
							<ul class="ps-0">
								<li style=" font-size: 11px"class="form-control py-2 ps-2"> 
								<img src="../resources/img/applicationRegistration/icon_notice.gif">
								<span class="point">현재 지원한 등재공고</span>를 다시 한 번 확인 하신 후 아래 정보를 순서대로 입력하여 주십시오.</li>
							</ul>
						</div>
					</div>
				</div>
				
							
				<!-- 현재 지원한 등재공고 그림 -->
				<div class="row mb-4">
					<div class="col us-image">
							<img style="width: 660px;" src="../resources/img/applicationRegistration/bg_gamjung.gif" alt="" />
						<div class="us-text">
							<p><span style="color: #72a8fe;">현재 지원한 등재공고 : </span> <span style="color: white">2023년도 감정인 명단 등재 희망자 모집</span></p>
						</div>
					</div>
				</div>
					<div class="row" style=" background-image : url(../resources/img/applicationRegistration/bg_stepgamjung.gif); width: inherit;margin-right: 0px;margin-left: 0px;height: 66px;">
					<div class="col" style="background-image : url(../resources/img/applicationRegistration/stepgamjung_01.gif); background-repeat:no-repeat;background-position: -202px 13px;padding-right: 14px;"></div>
					<div class="col" style="padding-right: 15px;"></div>
					<div class="col" style="padding-right: 11px;"></div>
					<div class="col" style="padding-right: 14px;"></div>
					<div class="col" style="padding-right: 1px;"></div>
				</div>
				
	
			<form name="form1">
				
				<div class="contentsinbox">
				
		        <div class="row border-bottom mt-5 mx-0">
		        	<div class="col">
			        	<h4>감정분야 및 세부구분선택</h4>  
		        	</div>
		        </div>
		        
		        <div class="row">
		        	<div class="col container">
			            <table class="table">
			            	<colgroup>
			            		<col width="25%">
			            		<col width="20%">
			            		<col width="55%">
			            	</colgroup>
			                <tbody>
			                	<tr>
		                    		<th scope="row" class="table-active "><span style="color : red;"> * </span> 감정분야 선택</th>
				                    <td>
				                        <div class="col">
					                        <select id="s1" name="trial_fcltt_clasifi_code" onchange="callSmallLevel(this)">
					                        </select>
				                        </div>
									</td>
									<td>
				                        <div class="col">
					                        <select id="s1_detail" name="trial_fcltt_sbcls_code" onchange="chkTempData(this)">
					                        </select>
				                        </div>
				                    </td>
			                	</tr>
			                </tbody>
			            </table>
					</div> 
		        </div>
		        
		        
		        
		        <div class="row border-bottom mt-3 mx-0">
		            <div class="col"><h4>희망법원선택</h4></div>
		            <div class="col">* 한곳의 법원에서 부적격 판정 시 다른 법원에서도 부적격이 될 수 있습니다.</div>
		        </div>
		        
		        <div class="row">
		        	<div class="col container">
			            <table class="table">
			            	<colgroup>
			            		<col width="25%">
			            		<col width="75%">
			            	</colgroup>
			                <tbody>
			                <tr>
			                    <th scope="row" class="table-active"><span style="color : red;"> * </span> 희망법원 선택</th>
			                    <td>
			                        <div class="col">
			                        <select id="s2" name="court_proper_num">
			                                <option value="1">서울북부지방법원</option>
			                                <option value="2">서울가정법원</option>
			                                <option value="3">서울행정법원</option>
			                                <option value="4">서울회생법원</option>
			                                <option value="5">서울동부지방법원</option>
			                                <option value="6">서울남부지방법원</option>
			                        </select>
			                        </div>
			                    </td>
			                </tr>
			                </tbody>
			            </table>
					</div> 
		        </div>
		        <div class="row">
		        	<div class="col">
			            만일 감정인이 원거리에 있는 여러 법원을 선택하여 감정서를 늦게 제출하거나 정당한 이유 없이 감정인이 되기를 거부하는 등의 사유<br>
			            가 발생할 경우에 감정인 등록이 삭제되거나 재등록 심사 시 부적격자로 감정인 선정에서 탈락할 수 있으니 여러개의 법원을 신청 시 이<br>
			            점 유념하시기 바랍니다
		            </div>
		        </div>
		        <div class="row border-bottom mt-5">
		            <div class="col ms-0 mb-2"><h4>활동경력</h4></div>
		        </div>
		        <div class="row">
		            <div class="col container">
			            <table class="table">
			                <tbody>
			                <tr class="table-active text-center">
			                    <th colspan="4" scope="col">경력명</th>
			                    <th scope="col">경력유무</th>
			                    <th scope="col"></th>
			                    <th scope="col">경력내용</th>
			                </tr>
			                <tr>
			                    <th colspan="4" scope="col" class="">소송사건 당사자 경력</th>
			                    <td scope="col">
			                    <input type="radio" id="s31" onclick="cutOn('s4');" class="mid" name="ligtn_case_carer_yn" value='y'> 예 
			                    <input type="radio" id="s32" onclick="cutOff('s4');" class="mid" name="ligtn_case_carer_yn" value='n'> 아니오 
			                    </td>
			                    <td scope="col"></td>
			                    <td scope="col"><textarea class="form-control" id="s4" onkeyup="didUseBoard('s31', 's32', 's4');" name="ligtn_case_carer_etc"></textarea></td>
			                </tr>
			                <tr>
			                    <th colspan="4" scope="col" class="" >보험업계 자문 경력</th>
			                    <td scope="col"><input type="radio" id="s51" onclick="cutOn('s6');"  name="insrn_indst_carer_yn" value='y'> 예 
			                    	<input type="radio" onclick="cutOff('s6');" id="s52" name="insrn_indst_carer_yn" value='n'> 아니오 </td>
			                    <td scope="col"></td>
			                    <td scope="col"><textarea class="form-control" id="s6" onkeyup="didUseBoard('s51', 's52', 's6')" name="insrn_indst_carer_etc"></textarea></td>
			                </tr>
			                <tr>
			                    <th colspan="4" scope="col" class="">형사처벌 받은 경력</th>
			                    <td scope="col"><input type="radio" id="s71" onclick="cutOn('s8');" name="criminal_penalty_carer_yn" value='y'> 예
			                     <input type="radio" id="s72" onclick="cutOff('s8');" name="criminal_penalty_carer_yn" value='n'> 아니오 </td>
			                    <td scope="col"></td>
			                    <td scope="col"><textarea class="form-control" id="s8" onkeyup="didUseBoard('s71', 's72', 's8')" name="criminal_penalty_carer_etc"></textarea></td>
			                </tr>
			                </tbody>
			            </table>
			            <div class="row justify-content-end">
			            	<div id="userDetailButtonBox" class="col">
	            				<button type="submit" class="btn btn-primary btn-sm" formaction="userDetailInsProcess" formmethod="get">다음</button>
			            	</div>
			            </div>
		            </div>
				</div>
				</div>
	        </form>
			</div>
		</div>
	</div>
   
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</html>