<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<title>1차 신청 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/userDetailList.js"></script>
<script type="text/javascript">
var userNo = ${map.APLCN_DTLS_PROPER_NUM};

/* function fileDownLoadProcess(userNo, fileNo){
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
			tableNineInfo();
		}
	}
	
	xhr.open("get" , "fileDownLoadProcess?aplcn_dtls_proper_num=" + userNo + "&aplcn_atch_file_proper_num=" + fileNo); //리퀘스트 세팅..
	//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
	xhr.send(); //AJAX로 리퀘스트함..		
} */

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
</script>
</head>
<body>

<h2>시작</h2>
<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="col container-fluid" style="width : 850px;">
 		<!-- 실험용 -->
 		<div class="row text-center mt-5 mx-0 mb-4"><!-- 네비바 -->            
            <div class="col-2 py-3 nav-btn border border-bottom-0 text-primary text-opacity-50 fw-bold" id="oneTab"><span>기본정보</span></div>
            <div class="col-2 py-3 nav-btn border bg-secondary bg-opacity-10" id="fiveTab"><span>신청정보</span></div>
            <div class="col-2 py-3 nav-btn border bg-secondary bg-opacity-10" id="sixTab"><span>학력정보</span></div>
            <div class="col-2 py-3 nav-btn border bg-secondary bg-opacity-10" id="sevenTab"><span>경력정보</span></div>
            <div class="col-2 py-3 nav-btn border bg-secondary bg-opacity-10" id="eightTab"><span>자격증정보</span></div>
            <div class="col-2 py-3 nav-btn border bg-secondary bg-opacity-10" id="nineTab"><span>첨부파일 정보</span></div>
        </div>
 		<div class="row mx-0">
			<div id="nav-info" class="col">왜안됨</div>
		</div> 
 		<!-- 실험끝 -->
		<div class="row text-center">
			<div class="col">
				<a href="../admin/evaluationProcess?aplcn_dtls_proper_num=${map.APLCN_DTLS_PROPER_NUM}" class="btn btn-primary">1차 서류 접수</a>
			</div>
			<div class="col">
				<a href="../admin/companionProcess?aplcn_dtls_proper_num=${map.APLCN_DTLS_PROPER_NUM}" class="btn btn-primary">1차 서류 반려</a>
			</div>
		</div>
	</div>
	
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>