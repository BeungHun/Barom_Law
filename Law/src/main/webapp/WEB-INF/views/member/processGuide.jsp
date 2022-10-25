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
<title>감정인 등재 신청</title>
<style>

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
	
</style>
<script>

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
				<div class="list-group list-group-flush">
					<a href="../member/systemGuide" class="list-group-item list-group-item-action">감정인 제도안내</a>
					<a href="../member/processGuide" class="list-group-item list-group-item-action">감정인 신청절차 안내</a>
				</div>
			</div>
			
			<!-- 본문 -->
			<div class="col m-3">
				<!-- 현재위치 -->
				<div class="row text-end loc">
					<div class="col" style="font-size: 11px;">
						<span> 홈 > 감정인신청안내 > </span><span style="color: #72a8fe;font-weight: bold;">감정인 신청절차 안내</span>
					</div>
				</div>
				<!-- 타이틀 -->
				<div class="row my-4">
					<div class="col">
						<img src="../resources/img/Guide/h3_ogi120.gif">
					</div>
				</div>
				
				<!-- 안내 -->
				<div class="contentsinbox">
					<h4 class="mar">일반감정인 감정인 신청절차</h4>
					<h5>신청절차 </h5>
				    <ul class="contnum">
						<li><span class="num">1.</span>감정인 신청인은 <a href="http://gamjung.scourt.go.kr/">http://gamjung.scourt.go.kr/</a> 접속하여 감정인 등재신청을 진행합니다.</li>
						<li><span class="num">2.</span>일반감정인은 측량감정인, 공사비등의 감정인, 문서등의 감정인으로 구분됩니다.</li>
						<li><span class="num">3.</span>감정인등재신청 메뉴 또는 첫화면의 감정분야별 등재신청 바로가기를 통하여 진행합니다.</li>
						<li><span class="num">4.</span>일반 감정인 등재 신청은 매년 감정인 명단 등재 희망자 모집 공고 기간 중에 할 수 있으며, 12월 감정인명단이 확정됩니다.</li>
						<li><span class="num">5.</span>감정인 신청인은 실지명의 확인이 가능한 전자서명 인증서나 휴대폰인증 또는 카드인증으로 본인인증을 한 후 등재신청을 진행하게 되며 기본정보, 학력정보, 경력정보, 자격정보, 증빙서류 등을 작성 및 첨부합니다.</li>
						<li><span class="num">6.</span>기타증빙서류 외 모든 항목은 반드시 입력하여야 하는 필수정보입니다.</li>
						<li><span class="num">7.</span>작성된 신청서는  My Page &gt; 나의 등재신청 내역 에서 확인할 수 있습니다.</li>
						<li><span class="num">8.</span>감정인 등재공고 접수 완료 전까지는 신청서를 수정 및 삭제를 하실 수 있습니다.</li>
						<li><span class="num">9.</span>감정인 명단 등재 희망자 모집 공고는 ‘대한민국법원 홈페이지 - 대국민서비스 - 새소식’란을 통하여 확인할 수 있습니다.</li>
	   			     </ul>
					<br>
				
					<h5>일반감정인 등재 신청 입력 항목 </h5>
				    <ul class="contnum">
						<li><span class="num">1.</span>감정인 공통 입력 항목</li>
					</ul>	
					<br>
					
					<div class="tabletop">
						<table class="list vline" summary="감정인 공통 입력 항목" border="1">
							<colgroup>
								<col width="20%;">
								<col width="15%;">
								<col width="20%;">
								<col width="20%;">
								<col width="25%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">기본정보</th>
									<th scope="col">학력정보</th>
									<th scope="col">경력정보</th>
									<th scope="col">자격증정보</th>
									<th scope="col" class="last">증빙서류첨부</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>감정분야</td>
									<td>학교명</td>
									<td>회사/활동기관명</td>
									<td>종목등급명</td>
									<td class="last">사업자등록증</td>
								</tr>
								<tr>
									<td>희망법원</td>
									<td>학과(전공)</td>
									<td>경력구분</td>
									<td>발급기관</td>
									<td class="last">업무관련등록신고현황</td>
								</tr>
								<tr>
									<td>감정인명</td>
									<td>학위</td>
									<td>기간</td>
									<td>자격면허번호</td>
									<td class="last">납세(국세및지방세포함)증명(완납)확인서</td>
								</tr>
								<tr>
									<td>주민등록번호</td>
									<td>입학년월일</td>
									<td>수행업무</td>
									<td>발급일</td>
									<td class="last">이력서(사진첨부필수/법원감정경력필수기재)</td>
								</tr>
								<tr>
									<td>휴대전화번호</td>
									<td>졸업년월일</td>
									<td>부서</td>
									<td>증빙서류 첨부</td>
									<td class="last">기타증빙서류</td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td>증빙서류 첨부</td>
									<td>직책</td>
									<td></td>
									<td class="last"></td>
								</tr>
								<tr>
									<td>신청자직업</td>
									<td></td>
									<td>증빙서류 첨부</td>
									<td></td>
									<td class="last"></td>
								</tr>
								<tr>
									<td>이메일</td>
									<td></td>
									<td>활동경력</td>
									<td></td>
									<td class="last"></td>
								</tr>
								<tr>
									<td>주소</td>
									<td></td>
									<td>특기사항</td>
									<td></td>
									<td class="last"></td>
								</tr>
								<tr>
									<td>사무소명</td>
									<td></td>
									<td></td>
									<td></td>
									<td class="last"></td>
								</tr>
								<tr>
									<td>사업자등록번호</td>
									<td></td>
									<td></td>
									<td></td>
									<td class="last"></td>
								</tr>
								<tr>
									<td>사무소전화번호</td>
									<td></td>
									<td></td>
									<td></td>
									<td class="last"></td>
								</tr>
								<tr>
									<td>팩스번호</td>
									<td></td>
									<td></td>
									<td></td>
									<td class="last"></td>
								</tr>
								<tr>
									<td>사무소주소</td>
									<td></td>
									<td></td>
									<td></td>
									<td class="last"></td>
								</tr>
								<tr>
									<td>소송사건 당사자 경력</td>
									<td></td>
									<td></td>
									<td></td>
									<td class="last"></td>
								</tr>
								<tr>
									<td>보험업계 자문 경력</td>
									<td></td>
									<td></td>
									<td></td>
									<td class="last"></td>
								</tr>
								<tr>
									<td>형사처벌 받은 경력</td>
									<td></td>
									<td></td>
									<td></td>
									<td class="last"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<br>
					
				    <ul class="contnum">
						<li><span class="num">2.</span>감정인별 입력 항목</li>
					</ul>	
					<br>

					<div class="tabletop">
						<table class="list vline" summary="감정인별 입력 항목" border="1">
							<colgroup>
								<col width="45%;">
								<col width="20%;">
								<col width="15%;">
								<col width="20%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">입력 항목</th>
									<th scope="col">공사비등</th>
									<th scope="col">측량</th>
									<th scope="col">문서/인영/필적</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>인력보유현황</td>
									<td class="text-center">O</td>
									<td class="text-center">-</td>
									<td class="text-center last">-</td>
								</tr>
								<tr>
									<td>최근2년간실적</td>
									<td class="text-center">O</td>
									<td class="text-center">-</td>
									<td class="text-center last">-</td>
								</tr>
								<tr>
									<td>업무수행과 관련있는 등록,신고를 한 경우 그 내용</td>
									<td class="text-center">O</td>
									<td class="text-center">-</td>
									<td class="text-center last">-</td>
								</tr>
								<tr>
									<td>자본금 및 매출액 등 재무상태 현황</td>
									<td class="text-center">O</td>
									<td class="text-center">-</td>
									<td class="text-center last">-</td>
								</tr>
								<tr>
									<td>국가등 발주처로부터 우수업체로 지정받은 사실 유무</td>
									<td class="text-center">O</td>
									<td class="text-center">-</td>
									<td class="text-center last">-</td>
								</tr>
								<tr>
									<td>감정,연구,연수 경력 여부</td>
									<td class="text-center">-</td>
									<td class="text-center">-</td>
									<td class="text-center last">O</td>
								</tr>
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;경력</td>
									<td class="text-center">-</td>
									<td class="text-center">-</td>
									<td class="text-center last">O</td>
								</tr>
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;경력증명사항</td>
									<td class="text-center">-</td>
									<td class="text-center">-</td>
									<td class="text-center last">O</td>
								</tr>
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;증빙서류 첨부</td>
									<td class="text-center">-</td>
									<td class="text-center">-</td>
									<td class="text-center last">O</td>
								</tr>
								<tr>
									<td>시설보유현황</td>
									<td class="text-center">-</td>
									<td class="text-center">-</td>
									<td class="text-center last">O</td>
								</tr>
							</tbody>
						</table>
					</div>
					<br>

					<h4 class="mar">신체/진료기록 감정인 신청절차</h4>
				    <ul class="contnum">
						<li><span class="num">1.</span>병원 신청인은 <a href="http://gamjung.scourt.go.kr/">http://gamjung.scourt.go.kr/</a> 접속하여 감정인 등재신청을 진행합니다.</li>
						<li><span class="num">2.</span>신체/진료기록 감정인 접수기간은 3월초 진행되며 3월말 감정인명단이 확정됩니다.</li>
						<li><span class="num">3.</span>병원 신청대리인은 실지명의 확인이 가능한 전자서명 인증서나 휴대폰인증 또는 카드인증으로 본인인증을 한 후 등재신청을 진행하게 되며 작성시 증빙서류(사업자등록증)를 첨부합니다.</li>
					    <li><span class="num">4.</span>병원 신청 대리인이 본인인증을 통하여 최초로 신청자정보 및 병원정보를 등록하였을 경우 신청자의 정보(이름, 주민등록번호)는 시스템에서 변경이 불가능 하며, 만약 접수기간 중 대리인이 변경 될 경우 사법지원실에 별도로 문의하여 변경하여야 합니다.</li>
						<li><span class="num">5.</span>수정 및 감정인을 추가 등록할 경우 최초 등록과 동일한 절차로 진행하시면 됩니다.</li>
	   			    </ul>
					<h4 class="mar">시스템 관련 문의사항은 UHD 02-3480-1715(평일 9시 ~ 18시)으로 연락하시기 바랍니다.</h4>
				</div>
				
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</html>