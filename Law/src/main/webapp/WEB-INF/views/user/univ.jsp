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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 외부 css 로드  -->
<link rel="stylesheet" type="text/css" href="../resources/css/common.css">
<title>학력정보</title>
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
var count = "";
function changeForDate(date){
	var changeDate;
	 var changeYear = date.substring(date.length -4);
	 var changeMonth = '';
	 var changeDay = date.substring(8, 10);
	 console.log(changeYear);
	 console.log(changeMonth);
	 var arrayMonth = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
	 
	for(i in arrayMonth){
		if(date.includes(arrayMonth[i])){
			var sum = parseInt(i)+1;
			
			if(sum/10 < 1){
				changeMonth = '0'+ sum;
			}else{
		  		changeMonth = sum;
			}
		}
	}
	return changeDate = changeYear + "-" + changeMonth  + "-" + changeDay; 
}

function checkList(){
	
	let result = true;
	
	let check = document.getElementsByClassName("ch");
	
	let ss = document.getElementById("ss");
	
	// 공백검사
	for(let i=0; i<check.length; i++) {
		let box = check[i].parentNode.parentNode.parentNode;
		
		if(check[i].value == '') {
			console.log(check[i]);
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

function chkTempData(){
  count = "${count}";
      if(count){
           if (confirm("임시저장된 정보들이 있습니다. 불러오시겠습니까 ? ")) {
            /* 임시저장 */
	            document.getElementById("s1").value='${six.edctn_school_name}';
	        	document.getElementById("s2").value='${six.edctn_major}'; 
	        	document.getElementById("s3").value='${six.edctn_degree}'; 
	        	document.getElementById("s4").value= changeForDate('${six.edctn_admsn_date}'); 
	        	document.getElementById("s5").value= changeForDate('${six.edctn_grdtn_date}');
           	
	        	if('${six.edctn_final_yn}' == 'y'){
	        		document.getElementById("s61").checked = true;
	        	}else{
	        		document.getElementById("s62").checked = true;
	        	}
			}
       	 }
}
window.addEventListener("DOMContentLoaded", function() {
	// 실행 시 가장 먼저 에러메세지 유무 확인
// 	getUserDetail(); 
	chkTempData();
	
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
			<div class="col-3 text-end border-end" style="padding-right: 0px;">
				<jsp:include page="../common/applicationRegistrationLocalNav.jsp"></jsp:include>
			</div>
			
			<!-- 본문 -->
			<div class="col m-3">
				<!-- 현재위치 -->
				<div class="row text-end loc">
					<div class="col" style="font-size: 11px;">
						<span> 홈 > </span><span style="color: #72a8fe;font-weight: bold;">감정인등재신청</span>
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
					<div class="col" style="background-image : url(../resources/img/applicationRegistration/stepgamjung_02.gif); background-repeat:no-repeat;background-position: -200px 13px;padding-right: 15px;"></div>
					<div class="col" style="padding-right: 11px;"></div>
					<div class="col" style="padding-right: 14px;"></div>
					<div class="col" style="padding-right: 1px;"></div>
				</div>
		        
               <!-- 고정 -->
               


                
                <c:choose>
            		<c:when test="${!empty count}">
	            		<form id="ss" action="./univUpProcess">
	            	</c:when>
	            	<c:otherwise>
	            		<form id="ss" action="./univInsProcess">
	            	</c:otherwise>
       			</c:choose>		
				<div class="contentsinbox">
				<div class="col border-bottom mt-5">
                    <div class="row ms-0 mb-2"><h4>학력사항</h4></div>
                </div>
               
                
                <div class="row">
                	<div class="col">
                    <table class="table "><!-- w-auto --> 
                        <tbody>
                          <tr>
                            <th class="table-active mid">학교명</th>
                            <td><input class="ch" type="text" id="s1" name="edctn_school_name"></td>
                            <th class="table-active mid">최종학력</th>
                            <td><input class="ch" type="radio" id="s61" name="edctn_final_yn" value='y' >맞음 
                            	<input class="ch" type="radio" id="s62" name="edctn_final_yn" value='n' >아님
                            </td>
                          </tr>
                          <tr>
                            <th class="table-active mid">학과(전공)</th>
                            <td><input class="ch" type="text" id="s2"  name="edctn_major" ></td>
                            <th class="table-active mid">학위</th>
                            <td>
                                	<select id="s3" name="edctn_degree"> 
                                        <option value="graduation">졸업</option>
                                        <option value="Attending">재학</option>
                                        <option value="absence">휴학</option>
                                        <option value="dropout">중퇴</option>
                                        <option value="expel">퇴학</option>
                                	</select>
                            </td>
                          </tr>
                          <tr>
                            <th class="table-active mid">입학 년월</th>
                            <td><input class="ch" type="date" id="s4" name="edctn_admsn_date">
                            </td>
                            <th class="table-active mid">졸업 년월</th>
                            <td><input class="ch" type="date" id="s5" name="edctn_grdtn_date">
                            </td>
                          </tr>
                        </tbody>
                     </table>
                    </div>
                   </div>
                      
                      <div class="row">
                      	<div class="col">
	                      	<c:choose>
				            	<c:when test="${!empty count}">
				            		<a type="button" class="btn btn-primary btn-sm" onclick="checkList();">다음</a>
				            	</c:when>
				            	<c:otherwise>
				            		<a type="button" class="btn btn-primary btn-sm" onclick="checkList();">다음</a>
				            	</c:otherwise>
	            			</c:choose>
            			</div>
                      </div>
                </div>
                </form>
                </div>
           </div>     
           <jsp:include page="../common/footer.jsp"></jsp:include>
           </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>