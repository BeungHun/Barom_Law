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
	
<!-- 외부 css 로드  -->
<link rel="stylesheet" type="text/css" href="../resources/css/common.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script type="text/javascript" src="../resources/js/userDetailList2.js"></script>
<title>등재명단 조회</title>
<style>

.nav a{
	background:url('../resources/img/applicationRegistration/bg_submenu_on.gif') no-repeat 0 0; 
	background-position: right top;
}
.submenu a{
	display:
	inline-block;
	width:200px;
	font-size:14px;
	font-weight:
	bold;
	text-align:
	right;
	letter-spacing:-1px;
	padding:8px 25px 1px 0;
	border-bottom:1px solid #ddd;
	color : white;
	margin-left: 16px;
}
</style>
<script>

	function searchList(page) {
		var formData = new FormData();
		formData.append('trial_fcltt_proper_num', document.getElementById("selectT10").value);
		formData.append('court_proper_num', document.getElementById("selectT11").value);
		formData.append('searchType', document.getElementById("selectSearchType").value);
		formData.append('searchWord', document.getElementById("selectSearchWord").value);
		
		if(page == null){
			formData.append('pageNum', 1);
		}else{
			formData.append('pageNum', page);
		}
		
		let entries = formData.entries();
		for (const pair of entries) {
		    console.log(pair[0]+ ', ' + pair[1]); 
		}
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
        xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				var ListBox = document.getElementById("list-info");
				ListBox.innerHTML = "";
	            
	            var rowBox = document.createElement("div");
	            rowBox.classList.add("row");
	            
	            var tableRow = document.createElement("div");
	            tableRow.classList.add("row");
	            tableRow.classList.add("mx-0");
	            tableRow.classList.add("px-0");
	            rowBox.appendChild(tableRow);
	               
	            var table = document.createElement("table");
	            table.classList.add("table");
	            table.classList.add("table-bordered");
	            tableRow.appendChild(table);
	               
	            var colGroup = document.createElement("colgroup");
	            table.appendChild(colGroup);

	            var colGroupA = document.createElement("col");
	            colGroup.appendChild(colGroupA);
	            var colGroupB = document.createElement("col");
	            colGroup.appendChild(colGroupB);
	            var colGroupC = document.createElement("col");
	            colGroup.appendChild(colGroupC);
	            var colGroupD = document.createElement("col");
	            colGroup.appendChild(colGroupD);
	            var colGroupE = document.createElement("col");
	            colGroup.appendChild(colGroupE);
	            var colGroupF = document.createElement("col");
	            colGroup.appendChild(colGroupF);
	            var colGroupG = document.createElement("col");
	            colGroup.appendChild(colGroupG);
	               
	            var thead = document.createElement("thead");
	            table.appendChild(thead);
	               
	            var theadTr = document.createElement("tr");
	            theadTr.classList.add("text-center");
	            thead.appendChild(theadTr);
	               
	            var theadTrTh1 = document.createElement("th");
	            theadTrTh1.setAttribute("scope", "col");
	            theadTrTh1.classList.add("table-light");
	            theadTrTh1.innerText="번호";
	            theadTr.appendChild(theadTrTh1);
	            var theadTrTh2 = document.createElement("th");
	            theadTrTh2.setAttribute("scope", "col");
	            theadTrTh2.classList.add("table-light");
	            theadTrTh2.innerText="소속법원";
	            theadTr.appendChild(theadTrTh2);
	            var theadTrTh3 = document.createElement("th");
	            theadTrTh3.setAttribute("scope", "col");
	            theadTrTh3.classList.add("table-light");
	            theadTrTh3.innerText="조력자분류";
	            theadTr.appendChild(theadTrTh3);
	            var theadTrTh4 = document.createElement("th");
	            theadTrTh4.setAttribute("scope", "col");
	            theadTrTh4.classList.add("table-light");
	            theadTrTh4.innerText="이름";
	            theadTr.appendChild(theadTrTh4);
	            var theadTrTh5 = document.createElement("th");
	            theadTrTh5.setAttribute("scope", "col");
	            theadTrTh5.classList.add("table-light");
	            theadTrTh5.innerText="연락처";
	            theadTr.appendChild(theadTrTh5);
	            var theadTrTh6 = document.createElement("th");
	            theadTrTh6.setAttribute("scope", "col");
	            theadTrTh6.classList.add("table-light");
	            theadTrTh6.innerText="이메일";
	            theadTr.appendChild(theadTrTh6);
	            var theadTrTh7 = document.createElement("th");
	            theadTrTh7.setAttribute("scope", "col");
	            theadTrTh7.classList.add("table-light");
	            theadTrTh7.innerText="활동여부";
	            theadTr.appendChild(theadTrTh7);
	            
	            var tbody = document.createElement("tbody");
	            table.appendChild(tbody);
	            
            	var i = 1;
	            for(dataList of jsonObj.list){
	                var bodyTr1 = document.createElement("tr");
	                bodyTr1.setAttribute("onclick", "callUserDetail("+dataList.APLCN_DTLS_PROPER_NUM+")");
	                bodyTr1.setAttribute("data-bs-toggle", "modal");
	                bodyTr1.setAttribute("data-bs-target", "#userDetail");
	                tbody.appendChild(bodyTr1);

	                var bodyTr1Td1 = document.createElement("td");
	                bodyTr1Td1.classList.add("text-center");
	                bodyTr1Td1.innerText = i;
	                bodyTr1.appendChild(bodyTr1Td1);

	                var bodyTr1Td2 = document.createElement("td");
	                bodyTr1Td2.classList.add("text-center");
	                bodyTr1Td2.innerText = dataList.COURT_NAME;
	                bodyTr1.appendChild(bodyTr1Td2);
	                
	                var bodyTr1Td3 = document.createElement("td");
	                bodyTr1Td3.classList.add("text-center");
	                bodyTr1Td3.innerText = dataList.TRIAL_FCLTT_DESCRIPTION;
	                bodyTr1.appendChild(bodyTr1Td3);
	                
	                var bodyTr1Td4 = document.createElement("td");
	                bodyTr1Td4.classList.add("text-center");
	                bodyTr1Td4.innerText = dataList.USER_NAME;
	                bodyTr1.appendChild(bodyTr1Td4);
	                
	                var bodyTr1Td5 = document.createElement("td");
	                bodyTr1Td5.classList.add("text-center");
	                bodyTr1Td5.innerText = dataList.USER_PHONE;
	                bodyTr1.appendChild(bodyTr1Td5);
			
	                var bodyTr1Td6 = document.createElement("td");
	                bodyTr1Td6.classList.add("text-center");
	                bodyTr1Td6.innerText = dataList.USER_EMAIL;
	                bodyTr1.appendChild(bodyTr1Td6);
	                
	                var bodyTr1Td7 = document.createElement("td");
	                bodyTr1Td7.classList.add("text-center");
	                if(dataList.ACCEPT_ACT_YN == "y"){
		                bodyTr1Td7.innerText = "O";
	                }else{
	                	bodyTr1Td7.innerText = "X";
	                }
	                bodyTr1.appendChild(bodyTr1Td7);
	               	i ++;
				}
	            ListBox.appendChild(rowBox);
	            
	            //페이징 네비게이션 
	            var pagingTarget = document.getElementById("pagingTarget");
	            pagingTarget.innerHTML = "";
	            
	            if(jsonObj.startPage <= 1){
	            	var pagingLi1 = document.createElement("li");
	            	pagingLi1.setAttribute("class", "page-item disabled");
	            	pagingTarget.appendChild(pagingLi1);
	            	
	            	var Li1A = document.createElement("a");
	            	Li1A.setAttribute("class", "page-link");
	            	Li1A.setAttribute("onclick", "searchList("+jsonObj.startPage-1+")");
	            	Li1A.innerText = "<";
	            	pagingLi1.appendChild(Li1A);
	            }else{
	            	var pagingLi1 = document.createElement("li");
	            	pagingLi1.setAttribute("class", "page-item");
	            	pagingTarget.appendChild(pagingLi1);
	            	
	            	var Li1A = document.createElement("a");
	            	Li1A.setAttribute("class", "page-link");
	            	Li1A.setAttribute("onclick", "searchList("+jsonObj.startPage-1+")");
	            	Li1A.innerText = "<";
	            	pagingLi1.appendChild(Li1A);
	            }
	            
	            for(var i = jsonObj.startPage; i <= jsonObj.endPage; i++){
	            	if(i == jsonObj.currentPageNum){
	            		var pagingLi = document.createElement("li");
	            		pagingLi.setAttribute("class", "page-item active");
		            	pagingTarget.appendChild(pagingLi);
		            	
		            	var LiA = document.createElement("a");
		            	LiA.setAttribute("class", "page-link");
		            	LiA.setAttribute("onclick", "searchList("+i+")");
		            	LiA.innerText = i;
		            	pagingLi.appendChild(LiA);
	            	}else{
	            		var pagingLi = document.createElement("li");
	            		pagingLi.setAttribute("class", "page-item");
		            	pagingTarget.appendChild(pagingLi);
		            	
		            	var LiA = document.createElement("a");
		            	LiA.setAttribute("class", "page-link");
		            	LiA.setAttribute("onclick", "searchList("+i+")");
		            	LiA.innerText = i;
		            	pagingLi.appendChild(LiA);
	            	}
	            }
	            
	            if(jsonObj.endPage >= jsonObj.totalPageCount){
	            	var pagingLi2 = document.createElement("li");
	            	pagingLi2.setAttribute("class", "page-item disabled");
	            	pagingTarget.appendChild(pagingLi2);
	            	
	            	var Li2A = document.createElement("a");
	            	Li2A.setAttribute("class", "page-link");
	            	Li2A.setAttribute("onclick", "searchList("+jsonObj.startPage+1+")");
	            	Li2A.innerText = ">";
	            	pagingLi2.appendChild(Li2A);
	            }else{
	            	var pagingLi2 = document.createElement("li");
	            	pagingLi2.setAttribute("class", "page-item");
	            	pagingTarget.appendChild(pagingLi2);
	            	
	            	var Li2A = document.createElement("a");
	            	Li2A.setAttribute("class", "page-link");
	            	Li2A.setAttribute("onclick", "searchList("+jsonObj.startPage+1+")");
	            	Li2A.innerText = "<";
	            	pagingLi2.appendChild(Li2A);
	            }
			}
		}
		xhr.open("post" , "../admin/callRegistUser"); //리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); // 콘텐츠 타입을 json으로
		xhr.send(formData); //AJAX로 리퀘스트함..
	}
	
	function callUserDetail(e) {
		var userNo = e; 
		tableOneInfo(userNo);
		var navClassName ='nav-btn';
		var navBtn = document.getElementsByClassName(navClassName);
		for(btn of navBtn){
			btn.addEventListener('click', function(e){
				var addId = this.id;
				
				changeBtn(addId, navClassName);
				
				switch(addId){
					case 'oneTab' : 
						tableOneInfo(userNo);
						break;
					case 'fiveTab' : 
						tableFiveInfo(userNo);
						break;
					case 'sixTab' : 
						tableSixInfo(userNo);
						break;
					case 'sevenTab' : 
						tableSevenInfo(userNo);
						break;
					case 'eightTab' : 
						tableEightInfo(userNo);
						break;
					case 'nineTab' :
						tableNineInfo(userNo);
						break;
				}
			});
		}
	}
	
	window.addEventListener("DOMContentLoaded" , function (){
		searchList(1);
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
		<div class="col-3 text-center" style="border-right: solid 1px #ccc;">
			<div class="list-group list-group-flush nav submenu" style="margin-left:10px;">
    			<a href="../admin/registrationList" class="list-group-item list-group-item-action">등재명단 조회</a>
    		</div>
		</div>
		
		<!-- 본문 -->
		<div class="col m-3">
			<!-- 현재위치 -->
			<div class="row text-end loc">
				<div class="col" style="font-size: 11px;">
					<span> 홈 > 재판조력자관리 > </span><span style="color: #72a8fe;font-weight: bold;">등재명단 조회</span>
				</div>
			</div>
			<!-- 타이틀 -->
			<div class="row my-4">
				<div class="col">
					<img src="../resources/img/Admin/head_title_img.gif">
					<span style="font-weight: bold;">등재명단 조회</span>
				</div>
			</div>
			<!-- 안내 -->
			<div class="contentsinbox">
				<form id="searchForm">
					<div class= "row">
						<div class="col-10">
							<div class="row my-2">
								<div class="col-2 text-center">
									<span> 재판조력자 </span>
								</div>
								<div class="col-4 d-grid">
									<select name="trial_fcltt_proper_num" id="selectT10">
										<option selected="selected" value="0">선택</option>
										<c:forEach items="${t10_List}" var="list">
											<option value="${list.trial_fcltt_proper_num}">${list.trial_fcltt_description}</option>
										</c:forEach>	
									</select>
								</div>
								<div class="col-2 text-center">
									<span> 법원 </span>
								</div>
								<div class="col-4 d-grid">
									<select name="court_proper_num"  id="selectT11" >
										<option selected="selected" value="0">선택</option>
										<c:forEach items="${t11_List}" var="list">
											<option value="${list.court_proper_num}">${list.court_name}</option>
										</c:forEach>	
									</select>
								</div>
							</div>
							<div class="row my-2">
								<div class="col-3 d-grid">
									<select name="searchType" id="selectSearchType">
										<option selected="selected" value="">선택</option>
										<option value="user_id">아이디</option>
										<option value="user_name">이름</option>
										<option value="user_email">이메일</option>
										<option value="user_phone">연락처</option>
									</select>
								</div>
								<div class="col d-grid">
									<input name="searchWord" id="selectSearchWord">
								</div>
							</div>
						</div>
						<div class="col-2 d-grid align-items-center">
							<a onclick="searchList()" class="btn btn-secondary btn-sm">검색</a>
						</div>
					</div>
				</form>
				<br>
				<!-- 리스트출력 target -->
				<div class="row mx-0">
					<div id="list-info" class="col">
					</div>
				</div>
				
				<!-- 페이징 target --> 
				<div class="row">
					<div class="col">
						<nav aria-label="Page navigation example">
							<ul id ="pagingTarget" class="pagination" style="place-content: center;">
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>

<!-- User Detail Modal -->
<div class="modal fade" id="userDetail" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">User Detail Modal</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<!-- 실험용 -->
		 		<div class="row text-center my-2 mx-1"><!-- 네비바 -->            
		            <div class="col-2 py-3 nav-btn border border-bottom-0 text-primary text-opacity-50 fw-bold" id="oneTab"><span>기본정보</span></div>
		            <div class="col-2 py-3 nav-btn border bg-secondary bg-opacity-10" id="fiveTab"><span>신청정보</span></div>
		            <div class="col-2 py-3 nav-btn border bg-secondary bg-opacity-10" id="sixTab"><span>학력정보</span></div>
		            <div class="col-2 py-3 nav-btn border bg-secondary bg-opacity-10" id="sevenTab"><span>경력정보</span></div>
		            <div class="col-2 py-3 nav-btn border bg-secondary bg-opacity-10" id="eightTab"><span>자격증정보</span></div>
		            <div class="col-2 py-3 nav-btn border bg-secondary bg-opacity-10" id="nineTab"><span>첨부파일</span></div>
		        </div>
		 		<div class="row mx-0">
					<div id="nav-info" class="col">왜안됨</div>
				</div> 
			</div>
			<div id="userDetailButtonBox" class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</html>