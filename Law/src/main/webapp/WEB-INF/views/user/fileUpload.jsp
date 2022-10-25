<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
<script type="text/javascript">
function uploadFile(){
	var formData = new FormData(document.getElementById("test"));
	console.log(formData);
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
			var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
			
			console.log(result);
			
		}
	}
	
		xhr.open("post" , "../user/multiFileUpload"); //리퀘스트 세팅..
	    //xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); // 콘텐츠 타입을 json으로
	   	xhr.send(formData); //AJAX로 리퀘스트함..
	
}

</script>
<title>Insert title here</title>
</head>
<body>
	 <div class="container-fluid" style="width: 960px;">
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<!-- 구분 이미지 -->
		<img src="../resources/img/sub_topimg.gif">
		
		<!-- 페이지 내용 -->
		<div class="row mt-2">
			<div class="col-3 text-end border-end" style="padding-right: 0px;"> <!-- style="border-right: solid 1px #ccc;" -->
				<!-- <div class="list-group list-group-flush">
					<a href="#" class="list-group-item list-group-item-action">감정인 등재신청</a>
				</div> -->
				<jsp:include page="../common/applicationRegistrationLocalNav.jsp"></jsp:include>
			</div>
			
			<!-- 본문 -->
			<div class="col m-3">
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
						<div class="col" style="background-image : url(../resources/img/applicationRegistration/stepgamjung_03.gif); background-repeat:no-repeat;background-position: -89px 13px;padding-right: 11px;"></div>
						<div class="col" style="background-image : url(../resources/img/applicationRegistration/stepgamjung_04.gif); background-repeat:no-repeat;background-position: 1px 13px;padding-right: 14px;"></div>
						<div class="col" style="background-image : url(../resources/img/applicationRegistration/stepgamjung_05.gif); background-repeat:no-repeat;background-position: -11px 13px;padding-right: 1px;"></div>
					</div>
               <!-- 고정 -->

        <form id="test" enctype="multipart/form-data">
        <div class="contentsinbox">
        
        <div class="row">
            <div class="row mt-5 mx-0">
                <h4>공통 증빙서류</h4>
            </div>
            <table class="table table-bordered">
                <thead>
                <tr class="text-center">
                    <th scope="col" class="table-active">구분</th>
                    <th colspan="3" class="table-active">제출서류명</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th rowspan="3" scope="row" class="text-center" style="vertical-align: middle;">공통서류</th>
                    <td colspan="2">사업자등록증</td>
                    <td>
                        <input type="file" name ="file">
                        <input type="hidden" name="file_code" value="co">
                        <input type="hidden" name="file_type" value="businesslicense">
                    </td>
                </tr>
                <tr>
                   
                    <td colspan="2">업무관련등록신고현황</td>
                    <td>
                        <input type="file" name ="file">
                        <input type="hidden" name="file_code" value="co">
                        <input type="hidden" name="file_type" value="businessreport">
                    </td>
                </tr>
                <tr>
                   
                    <td colspan="2">납세증명확인서</td>
                    <td>
                        <input type="file" name ="file">
                        <input type="hidden" name="file_code" value="co">
                        <input type="hidden" name="file_type" value="taxconfirm">
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="row">
            <div class="row border-bottom mt-5 mx-0">
                <h4>개인 증빙서류</h4>
            </div>
            <table class="table table-bordered">
                <thead>
                <tr class="text-center">
                    <th scope="col" class="table-active">구분</th>
                    <th colspan="3" class="table-active" >제출서류명</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th rowspan="4" scope="row" style="text-align: center; vertical-align: middle;">개인서류</th>
                    <td colspan="2">이력서</td>
                    <td>
                        <input type="file" name ="file">
                        <input type="hidden" name="file_code" value="pe">
                        <input type="hidden" name="file_type" value="resume">
                    </td>
                </tr>
                <tr>
                   
                    <td colspan="2">학력정보</td>
                    <td>
                        <input type="file" name ="file">
                        <input type="hidden" name="file_code" value="pe">
                        <input type="hidden" name="file_type" value="educationlevel">
                    </td>
                </tr>
                <tr>
                    
                    <td colspan="2">경력정보</td>
                    <td>
                        <input type="file" name ="file">
                        <input type="hidden" name="file_code" value="pe">
                        <input type="hidden" name="file_type" value="carrer">
                    </td>
                </tr>
                <tr>
                    
                    <td colspan="2">자격증정보</td>
                    <td>
                        <input type="file" name ="file">
                        <input type="hidden" name="file_code" value="pe">
                        <input type="hidden" name="file_type" value="certificate">
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="row">
        		<div class="col d-grid">
        			<a href="#" class="btn btn-primary" role="button" onclick="uploadFile();" data-bs-toggle="modal" data-bs-target="#exampleModal">입력완료</a>
       			</div>
        		<div class="col"></div>
        		<div class="col"></div>
        		<div class="col"></div>
       	</div>
       	</div>
        </form>
    </div>
    </div>
		<div class="row">
			<div class="col"></div>
			<div class="col">
				<!-- Button trigger modal --

				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header border-bottom-0">
								<h5 class="modal-title" id="exampleModalLabel"></h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col mb-4 " style="text-align : center;">
										<img src="../resources/img/logo_ogi.gif">
									</div>
								</div>
								<div class="row">
									<div class="col text-center my-2" style="font-weight: bold;">신청 완료 되었습니다.</div>
								</div>
								
							</div>
							<div class="modal-footer border-top-0">
								<button type="button" class="btn btn-primary"  onclick="location.href='../user/main'">메인페이지로 이동</button>
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