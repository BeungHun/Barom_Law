<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/common.css">
<title>1차 신청자 평가</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/applicantDetail.js"></script>

<script type="text/javascript">

var userNo = ${map.aplcn_dtls_proper_num}

window.addEventListener("DOMContentLoaded" , function (){
	tableOneInfo();
	
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



function tableOneInfo(){
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)

				var commentListBox = document.getElementById("nav-info");
				commentListBox.innerHTML = "";

                var rowBox = document.createElement("div");
                rowBox.classList.add("row");
                
                var tableRowBox = document.createElement("div");
                tableRowBox.classList.add("row");
                tableRowBox.classList.add("px-0");
                tableRowBox.classList.add("mx-0");
                rowBox.appendChild(tableRowBox);

                var tableBox = document.createElement("table");
                tableBox.classList.add("table");
                tableBox.classList.add("table-bordered");
                tableRowBox.appendChild(tableBox);

                var colgp = document.createElement("colgroup");
                tableBox.appendChild(colgp);

                //스코프
                var tableColGroup1 = document.createElement("col");
                tableColGroup1.setAttribute("width", "15%");
                colgp.appendChild(tableColGroup1);
                
                var tableColGroup2 = document.createElement("col");
                tableColGroup2.setAttribute("width", "35%");
                colgp.appendChild(tableColGroup2);

                var tableColGroup3 = document.createElement("col");
                tableColGroup3.setAttribute("width", "15%");
                colgp.appendChild(tableColGroup3);

                var tableColGroup4 = document.createElement("col");
                tableColGroup4.setAttribute("width", "35%");
                colgp.appendChild(tableColGroup4);

                var tableThead = document.createElement("thead");
                tableBox.appendChild(tableThead);

                var threadTr = document.createElement("tr");
                tableThead.appendChild(threadTr);

                var trTh1 = document.createElement("th");
                trTh1.classList.add("table-light");
                trTh1.classList.add("text-center");
                trTh1.innerText="이름";
                threadTr.appendChild(trTh1);

                var trTd1 = document.createElement("td");
                trTd1.innerText= jsonObj.userInfo.applicantInfo.USER_NAME;
                threadTr.appendChild(trTd1);

                var trTh2 = document.createElement("th");
                trTh2.classList.add("table-light");
                trTh2.classList.add("text-center");
                trTh2.innerText="나이";
                threadTr.appendChild(trTh2);

                var trTd2 = document.createElement("td");
                trTd2.innerText= jsonObj.userInfo.applicantInfo.USER_AGE + "세";
                threadTr.appendChild(trTd2);


                var tableBody = document.createElement("tbody");
                tableBox.appendChild(tableBody);

                var bodyTr1 = document.createElement("tr");
                tableBody.appendChild(bodyTr1);

                var bodyTh1 = document.createElement("th");
                bodyTh1.classList.add("text-center");
                bodyTh1.classList.add("table-light");
                bodyTh1.innerText="이메일";
                bodyTr1.appendChild(bodyTh1);

                var bodyTd1 = document.createElement("td");
                bodyTd1.innerText= jsonObj.userInfo.applicantInfo.USER_EMAIL;
                bodyTr1.appendChild(bodyTd1);

                var bodyTh2 = document.createElement("th");
                bodyTh2.classList.add("text-center");
                bodyTh2.classList.add("table-light");
                bodyTh2.innerText="연락처";
                bodyTr1.appendChild(bodyTh2);

                var bodyTd2 = document.createElement("td");
                bodyTd2.innerText=jsonObj.userInfo.applicantInfo.USER_PHONE;
                bodyTr1.appendChild(bodyTd2);
                
                var bodyTr2 = document.createElement("tr");
                tableBody.appendChild(bodyTr2);

                var bodyTh3 = document.createElement("th");
                bodyTh3.classList.add("text-center");
                bodyTh3.classList.add("table-light");
                bodyTh3.innerText="직업";
                bodyTr2.appendChild(bodyTh3);

                var bodyTd3 = document.createElement("td");
                bodyTd3.innerText=jsonObj.userInfo.applicantInfo.USER_JOB ;
                bodyTr2.appendChild(bodyTd3);

                var bodyTh4 = document.createElement("th");
                bodyTh4.classList.add("text-center");
                bodyTh4.classList.add("table-light");
                bodyTh4.innerText="기본주소";
                bodyTr2.appendChild(bodyTh4);

                var bodyTd4 = document.createElement("td");
                bodyTd4.innerText=jsonObj.userInfo.applicantInfo.USER_AR ;
                bodyTr2 .appendChild(bodyTd4);

                var bodyTr3 = document.createElement("tr");
                tableBody.appendChild(bodyTr3);
                
                var bodyTh5 = document.createElement("th");
                bodyTh5.setAttribute("rowspan", "3");
                bodyTh5.setAttribute("scope", "row");
                bodyTh5.classList.add("text-center");
                bodyTh5.classList.add("table-light");
                bodyTh5.setAttribute("style", "line-height:100px");
                // style="line-height:100px" 안됨
                bodyTh5.innerText="주소";
                bodyTr3.appendChild(bodyTh5);

                var bodyTd5 = document.createElement("td");
                bodyTd5.setAttribute("colspan", "3");
                bodyTd5.innerText="우편번호 : " + jsonObj.userInfo.applicantInfo.USER_AR_ZONECODE;
                bodyTr3 .appendChild(bodyTd5);



                var bodyTr4 = document.createElement("tr");
                tableBody.appendChild(bodyTr4);

                var bodyTd6 = document.createElement("td");
                bodyTd6.setAttribute("colspan", "3");
                bodyTd6.innerText="지번주소 : " + jsonObj.userInfo.applicantInfo.USER_AR_JIBUN;
                bodyTr4 .appendChild(bodyTd6);// 지번주소



                var bodyTr5 = document.createElement("tr");
                tableBody.appendChild(bodyTr5);

                var bodyTd7 = document.createElement("td");
                bodyTd7.setAttribute("colspan", "3");
                bodyTd7.innerText="상세주소 : " + jsonObj.userInfo.applicantInfo.USER_AR_DETAIL
                bodyTr5 .appendChild(bodyTd7);// 상세주소



                var bodyTr6 = document.createElement("tr");
                tableBody.appendChild(bodyTr6);

                var bodyTh8 = document.createElement("th");
                bodyTh8.setAttribute("rowspan", "3");
                bodyTh8.setAttribute("scope", "row");
                bodyTh8.classList.add("text-center");
                bodyTh8.classList.add("table-light");
                bodyTh8.setAttribute("style", "line-height:100px");
                bodyTh8.innerText="계좌정보";
                // style="line-height:100px";
                bodyTr6.appendChild(bodyTh8);

                var bodyTd8 = document.createElement("td");
                bodyTd8.setAttribute("colspan", "3");
                bodyTd8.innerText="계좌명 : " + jsonObj.userInfo.applicantInfo.USER_BANK_HOLDER;
                bodyTr6 .appendChild(bodyTd8);



                var bodyTr7 = document.createElement("tr");
                tableBody.appendChild(bodyTr7);
                
                var bodyTd9 = document.createElement("td");
                bodyTd9.setAttribute("colspan", "3");
                bodyTd9.innerText="계좌은행 : " + jsonObj.userInfo.applicantInfo.USER_BANK;
                bodyTr7 .appendChild(bodyTd9);
                
                var bodyTr8 = document.createElement("tr");
                tableBody.appendChild(bodyTr8);

                var bodyTd10 = document.createElement("td");
                bodyTd10.setAttribute("colspan", "3");
                bodyTd10.innerText="계좌번호 : " + jsonObj.userInfo.applicantInfo.USER_BANK_ACCOUNT;
                bodyTr8 .appendChild(bodyTd10);

                commentListBox.appendChild(rowBox);
                
            }
    }
        xhr.open("get" , "userInfoTable?aplcn_dtls_proper_num=" + userNo); //리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..		
}

function inputLimit(e){
	console.log(e);
	console.log(e.value);
	console.log(e.name);
	
	
	if(isNaN(e.value)) alert("숫자만 입력해주세요.");
	e.value = e.value.replace(/\D/g,'');
	
	if(e.name == 'certificate_score' || e.name == 'evaluate_score'){
		if(e.value > 10){
			e.value = 10;
		}
	}else if (e.name == 'judge_recom_score'){
		if(e.value > 7){
			e.value = 7;
		}
	}else {
		if(e.value > 5){
			e.value = 5;
		}
	}
	calculationtest();
}

function calculationtest(){
	all_carrer_score = parseInt(score.all_carrer_score.value);
 	jrsdc_carrer_score = parseInt(score.jrsdc_carrer_score.value);
	office_score = parseInt(score.office_score.value);
 	personality_score = parseInt(score.personality_score.value);
	interview_score = parseInt(score.interview_score.value);
	certificate_score = parseInt(score.certificate_score.value);
	evaluate_score = parseInt(score.evaluate_score.value);
	judge_recom_score =  parseInt(score.judge_recom_score.value);			
	
	if(score.all_carrer_score.value == "" || score.jrsdc_carrer_score.value == "" || score.office_score.value == "" || score.personality_score.value == "" || score.interview_score.value == "" || score.certificate_score.value == ""){
		score.total1.value = "";
	}else{
		score.total1.value = all_carrer_score+jrsdc_carrer_score+office_score+personality_score+interview_score + certificate_score;
	}
	
	if(score.total1.value == "" || score.evaluate_score.value == "" || score.judge_recom_score.value == ""){
		score.total2.value = "";
	}else{
		score.total2.value = all_carrer_score+jrsdc_carrer_score+office_score+personality_score+interview_score + certificate_score+evaluate_score + judge_recom_score;
	}

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
		<div class="col-3 text-center" style="border-right: solid 1px #ccc;">
			<jsp:include page="../common/assistantAdminNav.jsp"></jsp:include>
		</div>
		
		<!-- 본문 -->
		<div class="col mx-3">
			<!-- 현재위치 -->
			<div class="row text-end loc">
				<div class="col" style="font-size: 11px;">
					<span> 홈 > 재판조력자관리 > </span><span style="color: #72a8fe;font-weight: bold;">최종 심사</span>
				</div>
			</div>
			<!-- 타이틀 -->
			<div class="row my-4">
				<div class="col">
					<img src="../resources/img/Admin/head_title_img.gif">
					<span style="font-weight: bold;">최종 심사</span>
				</div>
			</div>
			
			<!-- 안내 -->
			<div class="contentsinbox">
				<div class="row">
					<div class="col">
					
					<!-- 신청자 정보 nav -->
					<div class="row text-center mt-2 mx-0"><!-- 네비바 -->            
			            <div class="col-2 py-3 nav-btn border border-bottom-0 text-primary text-opacity-50 fw-bold" id="oneTab"><span>기본정보</span></div>
			            <div class="col-2 py-3 nav-btn border bg-secondary bg-opacity-10" id="fiveTab"><span>신청정보</span></div>
			            <div class="col-2 py-3 nav-btn border bg-secondary bg-opacity-10" id="sixTab"><span>학력정보</span></div>
			            <div class="col-2 py-3 nav-btn border bg-secondary bg-opacity-10" id="sevenTab"><span>경력정보</span></div>
			            <div class="col-2 py-3 nav-btn border bg-secondary bg-opacity-10" id="eightTab"><span>자격증정보</span></div>
			            <div class="col-2 py-3 nav-btn border bg-secondary bg-opacity-10" id="nineTab"><span>첨부파일 정보</span></div>
			      	</div>
			      	<!-- 신청자 정보 -->
					<div class="row text-center mt-2 mx-0"  >
						<div id="nav-info" class="col" style="text-align : center; font-size:12px;">
					</div>
					
					<!-- 심사표 -->
					<div class="row" style="margin:0px;padding:0px;">
					<form action="evaluationApplicantsProcess?aplcn_dtls_proper_num=${userInfo.applicantInfo.APLCN_DTLS_PROPER_NUM}" method="post" name="score" style="margin:0px;padding:0px;">
					<table class="table table-bordered " >
						  <thead style=" text-align: center; vertical-align: middle;">
						    <tr>
						      <th rowspan="2">평정항목</th>		     
						      <th rowspan="2">세부항목</th>
						      <th rowspan="2">배점</th>
						      <th colspan="3">내용</th>		  
						    </tr>
						    <tr>
						      <th scope="col">구분</th>
						      <th scope="col">기준</th>
						      <th scope="col">배점</th>		  
						    </tr>
						  </thead>
						  <tbody style=" text-align: center; vertical-align: middle;">
						    <tr>
						      <td rowspan="8" >기본평정</td>
						      <td rowspan="6">경력점수</td>
						      <td rowspan="3"><input type="text" class="input" name="all_carrer_score" onKeyUp="inputLimit(this)"></td>  
						      <td rowspan="3">통산경력</td>
						      <td colspan="1">10년이상</td>
						      <td colspan="1">5</td>		     		      
						    </tr>
						    <tr>
						    	<td scope="col">5~10년</td>
						      	<td scope="col">4</td>
						    </tr>
						    <tr>
						    	<td scope="col">5년 미만</td>
						      	<td scope="col">3</td>
						    </tr>
						    <tr>
						    	<td rowspan="3"><input type="text" class="input" name="jrsdc_carrer_score" onKeyUp="inputLimit(this)"></td> 
						    	<td rowspan="3">관내경력</td>
						    	<td scope="col">10년이상</td>
						      	<td scope="col">5</td>
						    </tr>
						    <tr>
						    	<td scope="col">5~10년</td>
						      	<td scope="col">4</td>
						    </tr>
						    <tr>
						    	<td scope="col">5년 미만</td>
						      	<td scope="col">3</td>
						    </tr>
						    <tr>
						    	<td rowspan="2">사무소 소재지</td>
						    	<td rowspan="2"><input type="text" name="office_score" onKeyUp="inputLimit(this)"></td>
						    	<td colspan="2">관내 사무소</td>
						    	<td scope="col">5</td>
						    </tr>
						    <tr>
						    	<td colspan="2">관외 사무소</td>
						    	<td scope="col">3</td>
						    </tr>
						    
						   	<tr>
						   		<td rowspan="3">인성평가</td>
						   		<td rowspan="3"></td>
						   		<td rowspan="3"><input type="text" name="personality_score" onKeyUp="inputLimit(this)"></td>
						   		<td colspan="2">우수</td>
						   		<td scope="col">5</td>
						   	</tr>
						   	<tr>
						   		<td colspan="2">평균</td>
						   		<td scope="col">4</td>
						   	</tr>
						   	<tr>
						   		<td colspan="2">미흡</td>
						   		<td scope="col">3</td>
						   	</tr>
						   	<tr>
						   		<td rowspan="2">면접</td>
						   		<td rowspan="2"></td>
						   		<td rowspan="2"><input type="text"  name="interview_score" onKeyUp="inputLimit(this)"></td>
						   		<td colspan="2">우수</td>
						   		<td scope="col">5</td>
						   	</tr>
						   	<tr>
						   		<td colspan="2">미흡</td>
						   		<td scope="col">3</td>
						   	</tr>
						   	<tr>
						   		<td rowspan="4">자격증 점수</td>
						   		<td rowspan="4"></td>
						   		<td rowspan="4"><input type="text" name="certificate_score" onKeyUp="inputLimit(this)"></td>
						   		<td colspan="2"></td>
						   		<td scope="col">2.5</td>
						   	</tr>
						   	<tr>
						   		<td colspan="2"></td>
						   		<td scope="col">2.5</td>
						   	</tr>
						   	<tr>
						   		<td colspan="2"></td>
						   		<td scope="col">2.5</td>
						   	</tr>
						   	<tr>
						   		<td colspan="2"></td>
						   		<td scope="col">2.5</td>
						   	</tr>
						   	<tr>
						   		<td colspan="2">합계</td>
						   		<td scope="col"><input type='text' name='total1' disabled ></td>
						   		<td colspan="3"></td>
						   	</tr>
						   	<tr>
						   		<td colspan="2">감정인 평정표</td>
						   		<td scope="col"><input type="text" name="evaluate_score" onKeyUp="inputLimit(this)"></td>
						   		<td colspan="3"></td>
						   	</tr>
						   	<tr>
						   		<td scope="col">조정평점</td>
						   		<td scope="col">심사위원 추천</td>
						   		<td scope="col"><input type="text" name="judge_recom_score" onKeyUp="inputLimit(this)"></td>
						   		<td colspan="3">최대 7점</td>
						   	</tr>
						   	<tr>
						   		<td colspan="2">최종점수(종합)</td>
						   		<td scope="col"><input type='text' name='total2' disabled></td>
						   		<td colspan="3">--점/총점</td>
						   	</tr>
					   		<tr>
						   		<td colspan="2">검토의견</td>
						   		<td colspan="5">
						   			<textarea name="review_etc" style="width: 314px;"></textarea>
						   		</td>
						   	</tr>
						  </tbody>
						</table>
						
						<div style="text-align: right;">
							<button type="submit" type="button" class="btn btn-primary">작성하기</button>
						</div>		
						
						
						</form>
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