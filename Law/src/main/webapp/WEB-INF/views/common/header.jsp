<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="header" class="row align-items-center" style="height: 85px;">
	<div class="col-3">
		<a class="navbar-brand" href="../user/main"><img src="../resources/img/Main/로고.png"></a>
	</div> 
	<div class="col">
		<!-- 홈, 로그인 -->	
		<div class="row text-center justify-content-end my-2" style="font-size: 11px;">
			<div class="col-3">
				<div class="row">
					<div class="col-2">
						<a href="../user/main">
							<span>홈</span>
						</a>
					</div>
					<c:choose>
						<c:when test="${!empty admin || !empty user}">
							<div class="col">
								<a href="../user/logout">
									<span>로그아웃</span>
								</a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="col">
								<a data-bs-toggle="modal" data-bs-target="#staticBackdrop">
									<span>로그인</span>
								</a>
							</div>
							<div class="col">
								<a href="../user/applicationRegistration">
									<span>회원가입</span>
								</a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<!-- 메뉴 -->
		<div class="row text-center align-items-center mt-2 mb-3 fw-bold" style="font-size: 15px;">
			<c:choose>
				<c:when test="${!empty admin}">
					<div class="col">
						<a href="../admin/managementEvaluationtable">
							<span>현황조회</span>
						</a>
					</div>
					<div class="col">
						<a href="../admin/registrationList">
							<span>재판조력자관리</span>
						</a>
					</div>
					<div class="col">
						<a href="../member/trialAssistantRegisterBoard">
							<span>게시글관리</span>
						</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col">
						<a onclick="testIMP()">
							<span>감정인등재신청</span>
						</a>
					</div>
					<div class="col">
						<a href="../member/systemGuide">
							<span>감정인신청안내</span>
						</a>
					</div>
					<div class="col">
						<a href="../user/identityVerificate">
							<span>My Page</span>
						</a>
					</div>
					<div class="col">
						<a href="../member/noticeBoard">
							<span>공지사항</span>
						</a>
					</div>
				</c:otherwise>
			</c:choose>
			<!-- 전체메뉴보기 -->	
			<div class="col">
				<a data-bs-toggle="collapse" href="#collapseAllMeru" role="button" aria-expanded="false" aria-controls="collapseAllMeru">
		        	전체메뉴보기
		      	</a>
			</div>
		</div>
	</div>
</div>
<div id="collapseAllMeru" class="row text-center collapse" style="font-size: 12px;">
	<div class="col-3"></div>
	<c:choose>
		<c:when test="${!empty admin}">
			<div class="col">
				<p><a href="../admin/managementEvaluationtable"><span>평정기준표관리</span></a></p>
				<p><a href="../admin/searchCondition"><span>조건별조회</span></a></p>
				<p><a href="../admin/evaluationApplicantsList"><span>최종심사</span></a></p>
			</div>
			<div class="col">
				<p><a href="../admin/registrationList"><span>등재명단조회</span></a></p>
			</div>
			<div class="col">
				<p><a href="../member/trialAssistantRegisterBoard"><span>감정인등재공고</span></a></p>
				<p><a href="../member/noticeBoard"><span>공지사항</span></a></p>
				<p><a href="../member/faqPage"><span>FAQ(자주묻는질문)</span></a></p>
			</div>
			
		</c:when>
		<c:otherwise>
			<div class="col">
				<p onclick="testIMP()"><span>감정인등재신청</span></p>
			</div>
			<div class="col">
				<p><a href="../member/systemGuide"><span>감정인신청안내</span></a></p>
				<p><a href="../member/processGuide"><span>감정인신청절차안내</span></a></p>
			</div>
			<div class="col">
				<p><a href="../user/identityVerificate"><span>내정보</span></a></p>
				<p><a href="../user/myApplication"><span>나의등재신청내역</span></a></p>
				<p><a href="../user/myActive"><span>나의활동내역</span></a></p>
				<p><a href="../user/myPause"><span>중지/해제신청관리</span></a></p>
			</div>
			<div class="col">
				<p><a href="../member/trialAssistantRegisterBoard"><span>감정인등재공고</span></a></p>
				<p><a href="../member/noticeBoard"><span>공지사항</span></a></p>
				<p><a href="../member/faqPage"><span>FAQ(자주묻는질문)</span></a></p>
			</div>
		</c:otherwise>
	</c:choose>
	<div class="col"></div>
</div>
<!-- 로그인 Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-body">
		<!-- 로그인 박스 -->
		<div class="row text-center pt-3">
			<div class="col align-self-center py-1 px-3">
				<!-- 아이디 비밀번호 입력 -->
				<form id="chkID" method="post">
					<div class="row">
						<div class = "col-1 pe-3 fs-3">
							<i class="bi bi-person-circle"></i>
						</div>
						<div class="col ps-3 form-control-lg d-grid">
							<input name="inputId" type="text" placeholder="아이디를 입력해주세요.">
						</div>
					</div>
					<div class="row">
						<div class = "col-1 pe-3 fs-3">
							<i class="bi bi-file-lock"></i>
						</div>
						<div class="col ps-3 form-control-lg d-grid">
							<input name="inputPw" type="password" placeholder="비밀번호를 입력해주세요.">
						</div>
					</div>
					<!-- 로그인 버튼 -->
					<div class="row py-2">
						<div class="col d-grid">
							<a type="button" class = "btn btn-primary" onclick="chkID()">로그인</a>
						</div>
					</div>
				</form>
				<!-- 회원가입 & 아이디 비밀번호 찾기 -->
				<div class="row rink_box py-2 text-center text-decoration-none">
					<div class="col">
						<a class = "text-secondary" href="./#"> 아이디 찾기 </a>
					</div>
					<div class="col">
						<a class = "text-secondary" href="./#"> 비밀번호 찾기 </a>
					</div>
					<div class="col">
						<a class = "text-secondary" href="../user/applicationRegistration"> 회원가입 </a>
					</div>
				</div>
			</div>
		</div>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>

    //로그인 Chk
    function chkID(){
    	var formData = new FormData(document.getElementById("chkID"));
    	var formBox = document.getElementById("chkID");
    	
    	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
        xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
                var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
                
                if(jsonObj.admin){
                	formBox.setAttribute("action","../admin/loginProcess");
                	console.log(formBox);
                }else{
                	formBox.setAttribute("action","../user/loginProcess");
                	console.log(formBox);
                }
                formBox.submit();
            }
        }
        
        xhr.open("post" , "../member/chkID"); //리퀘스트 세팅..
//         xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post 
        xhr.send(formData); //AJAX로 리퀘스트함..
        
    }
    
    var IMP = window.IMP; // 생략 가능
    IMP.init("imp65022454"); // 예: imp00000000
    	
    function testIMP(){
    		IMP.certification({ 
    			
    	  	}, function (rsp) { // callback
    		    if (rsp.success) {
    		    	location.href = "../user/applicationClause";
    		    } else {
    		    	alert('본인인증에 오류가 발생되었습니다. 다시 시도해주세요.');
    		    }
    		});
    }
</script>
   
   