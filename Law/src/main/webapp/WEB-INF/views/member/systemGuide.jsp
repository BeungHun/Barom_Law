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
			<!-- <div class="col-3 text-center" style="border-right: solid 1px #ccc;">
				<div class="list-group list-group-flush">
					<a href="../member/systemGuide" class="list-group-item list-group-item-action">감정인 제도안내</a>
					<a href="../member/processGuide" class="list-group-item list-group-item-action">감정인 신청절차 안내</a>
				</div>
			</div> -->
			<div class="col-3 text-end border-end" style="padding-right: 0px;">
				<jsp:include page="../common/guideNav.jsp"></jsp:include>
			</div>
			
			<!-- 본문 -->
			<div class="col m-3">
				<!-- 현재위치 -->
				<div class="row text-end loc">
					<div class="col" style="font-size: 11px;">
						<span> 홈 > 감정인신청안내 > </span><span style="color: #72a8fe;font-weight: bold;">감정인 제도안내</span>
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
					<h4 class="mar">감정인의 종류 및 신청 방식</h4>
					<!--table start-->
					<div class="tabletop">
						<table class="list vline" summary="감정인의 종류 및 신청 방식" border="1">
							<colgroup>
							<col width="25%;">
							<col width="25%;">
							<col width="35%;">
							<col width="15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">감정인종류</th>
									<th scope="col">모집시기</th>
									<th scope="col">모집방법</th>
									<th scope="col" class="last">비고</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="title">신체/진료기록<br>감정인</td>
									<td>년 1회<br>3. 15.까지 추천 요청<br>3월 말 등재</td>
									<td>병원장의 추천을 받아 심사 후 등재</td>
									<td class="last"></td>
								</tr>
								<tr>
									<td class="title">공사비등의 감정인</td>
									<td>년 1회<br>모집공고기간 중 모집<br>12월 말 등재</td>
									<td>등재신청 모집공고</td>
									<td class="last"></td>
								</tr>
								<tr>
									<td class="title">측량감정인, 문서등의<br>감정인</td>
									<td>년 1회<br>모집공고기간 중 모집<br>12월 말 등재</td>
									<td>등재신청 모집공고</td>
									<td class="last"></td>
								</tr>
								<tr>
									<td class="title">시가등의 감정인</td>
									<td>년 1회</td>
									<td>감정평가협회의 추천을 받아 심사 후 등재</td>
									<td class="last"></td>
								</tr>
								<tr>
									<td class="title">경매 감정인</td>
									<td>년 1회</td>
									<td>감정평가협회의 추천을 받아 심사 후 등재</td>
									<td class="last"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<br>
					
					<h4 class="mar">감정인 세부구분 및 감정인 명단 등재기준</h4>
					<h5>공통사항</h5>
					<ul class="contnum">
						<li><span class="num">1.</span>다음 각호의 어느 하나에 해당하는 사람은 『감정인 명단』에 등재하지 아니한다.
							<ul style="padding-left: 0px;">
								<li>1. 금치산자 또는 한정치산자</li>
								<li>2. 파산선고를 받고 복권되지 아니한 사람</li>
								<li>3. 금고 이상의 형을 받고 그 집행이 종료되거나 집행을 받지 아니하기로 확정된 후 5년을 경과하지 아니한 사람</li>
								<li>4. 금고 이상의 형을 받고 그 집행유예의 기간이 완료된 날로부터 2년을 경과하지 아니한 사람</li>
								<li>5. 금고 이상의 형의 선고유예를 받은 경우에 그 선고유예 기간 중에 있는 사람</li>
								<li>6. 법원의 판결 또는 다른 법률에 의하여 자격이 상실 또는 정지된 사람</li>
								<li>7. 공무원으로서 파면의 징계처분을 받은 때로부터 5년을 경과하지 아니한 사람</li>
								<li>8. 공무원으로서 해임의 징계처분을 받은 때로부터 3년을 경과하지 아니한 사람</li>
								<li>9. 감정업무와 관련하여 형사처벌 또는 징계처분을 받은 전력이 있는 사람</li>
								<li>10. 『감정인 명단』에서 삭제된 날로부터 2년이 경과되지 아니한 사람</li>
							</ul>
						</li>
						<li><span class="num">2.</span>기타 공정하고 객관적인 감정 업무를 수행하기 곤란하다고 판단되는 자는 제외한다.</li>
					</ul>
					<br>
					
					<h5 class="mar2">신체/진료기록 감정인 세부구분 및 감정인 명단 등재기준</h5>
					<div class="tabletop">
						<table class="list vline" summary="신체/진료기록 감정인 세부구분 및 등재기준" border="1">
							<colgroup>
								<col width="14%;">
								<col width="15%;">
								<col width="36%;">
								<col width="23%;">
								<col width="12%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">구분</th>
									<th scope="col">대분류</th>
									<th scope="col">소분류</th>
									<th scope="col">등재기준</th>
									<th scope="col" class="last">제출서류</th>
								</tr>
							</thead>
				
							<tbody>
								<tr>
									<td align="center">신체/진료기록<p>감정인</p></td>
									<td colspan="2">
										<table>
											<tbody>
												<tr>
													<td width="29%;">내과</td>
													<td width="71%;" class="last">
														감염내과(바이러스), 감염내과(혈액), 감염내과(기타), 내분비내과(갑상선), 내분비내과(당뇨), 내분비내과(기타), 류마티스내과, 소화기내과(간장), 소화기내과(담도), 소화기내과(대장), 소화기내과(위장), 소화기내과(기타), 순환기내과(고혈압), 순환기내과(동맥경화), 순환기내과(심장), 순환기내과(협심증), 순환기내과(기타), 신장내과, 심혈관내과, 알레르기내과(알레르기), 알레르기내과(천식), 알레르기내과(기타), 혈액내과, 혈액종양내과, 호흡기내과(알레르기), 호흡기내과(폐결핵), 호흡기내과(폐질환), 호흡기내과(기타), 내과(기타)
													</td>
												</tr>
												<tr>
													<td width="29%;">외과</td>
													<td width="71%;" class="last">
													내분비외과, 두경부외과, 성형외과, 신경외과(경추), 신경외과(뇌전증), 신경외과(뇌종양), 신경외과(뇌혈관), 신경외과(두부외상), 신경외과(수두증), 신경외과(외부외상), 신경외과(척추), 신경외과(파킨슨), 신경외과(기타), 외과(간담췌), 외과(갑상선), 외과(내분비), 외과(대장), 외과(동맥), 외과(소화기), 외과(위장관), 외과(유방), 외과(이식혈관), 외과(정맥), 외과(기타), 이식외과, 정형외과(경추), 정형외과(고관절), 정형외과(골다공증), 정형외과(골절), 정형외과(말초신경), 정형외과(무릎(슬)관절), 정형외과(족부), 정형외과(발목관절), 정형외과(수부), 정형외과(손), 정형외과(어깨), 정형외과(척추), 정형외과(팔), 정형외과(기타), 항장외과, 흉부외과(관상동맥), 흉부외과(다한증), 흉부외과(부정맥), 흉부외과(식도외과), 흉부외과(심장), 흉부외과(종격동), 흉부외과(폐), 흉부외과(하지정맥), 흉부외과(기타)
													</td>
												</tr>
												<tr>
													<td width="29%;">소아관련</td>
													<td width="71%;" class="last">
														소아감염, 소아내분비, 소아내과, 소아비뇨의학과, 소아신경과, 소아신경외과(뇌전증), 소아신경외과(두부외상), 소아신경외과(수두증), 소아신경외과(외부외상), 소아신경외과(기타), 소아신장과, 소아심장과, 소아알레르기, 소아암과, 소아외과, 소아정형, 소아청소년과, 소아호흡기, 소아흉부외과, 신생아, 소아정신의학과
													</td>
												</tr>
												<tr>
													<td width="29%;">신경과</td>
													<td width="71%;" class="last">
														신경과(간질), 신경과(근육), 신경과(기억장애), 신경과(뇌졸중), 신경과(뇌혈관), 신경과(말초신경), 신경과(수면장애), 신경과(신경), 신경과(신경감염), 신경과(의식소실), 신경과(척추), 신경과(치매), 신경과(파킨슨), 신경과(기타)
													</td>
												</tr>
												<tr>
													<td width="29%;">정신건강의학과</td>
													<td width="71%;" class="last">
														정신건강의학과(기억장애), 정신건강의학과(만성통증), 정신건강의학과(불안장애), 정신건강의학과(수면), 정신건강의학과(알코올), 정신건강의학과(우울증), 정신건강의학과(인지기능장애), 정신건강의학과(정신분열), 정신건강의학과(조울증), 정신건강의학과(기타)
													</td>
												</tr>
												<tr>
													<td width="29%;">재활의학과</td>
													<td width="71%;" class="last">
														재활의학과(경부통), 재활의학과(근골격계), 재활의학과(뇌질환), 재활의학과(림프부종), 재활의학과(말초신경), 재활의학과(신경근육), 재활의학과(요통), 재활의학과(척추통증), 재활의학과(기타)
													</td>
												</tr>
												<tr>
													<td width="29%;">산부인과</td>
													<td width="71%;" class="last">
														산부인과(복강경), 산부인과(부인암), 산부인과(불임내분비), 산부인과(산과), 산부인과(월경이상), 산부인과(유방), 산부인과(임신중독증), 산부인과(자궁), 산부인과(폐경기질환), 산부인과(기타)
													</td>
												</tr>
												<tr>
													<td width="29%;">비뇨의학과</td>
													<td width="71%;" class="last">
														비뇨의학과(방광), 비뇨의학과(배뇨장애), 비뇨의학과(복강경), 비뇨의학과(성의학), 비뇨의학과(신장), 비뇨의학과(요로), 비뇨의학과(전립선), 비뇨의학과(종양), 비뇨의학과(기타)
													</td>
												</tr>
												<tr>
													<td width="29%;">안과</td>
													<td width="71%;" class="last">
														안과(각막), 안과(갑상선), 안과(공막), 안과(녹내장), 안과(망막), 안과(백내장), 안과(사시), 안과(신경), 안과(안성형), 안과(안와), 안과(외안부), 안과(유리체질환), 안과(포도막), 안과(기타)
													</td>
												</tr>
												<tr>
													<td width="29%;">이비인후과</td>
													<td width="71%;" class="last">
														이비인후과(갑상선), 이비인후과(두경부), 이비인후과(비과-코), 이비인후과(알레르기), 이비인후과(음성장애), 이비인후과(이과-귀), 이비인후과(후두과-목), 이비인후과(기타)
													</td>
												</tr>
												<tr>
													<td width="29%;">치과</td>
													<td width="71%;" class="last">
														치과(교정과), 치과(구강내과), 치과(구강외과), 치과(보존과), 치과(보철과), 치과(소아치과), 치과(치주과), 치과(기타)
													</td>
												</tr>
												<tr>
													<td width="29%;">피부과</td>
													<td width="71%;" class="last">
														피부과(건선), 피부과(류마티스성), 피부과(모발질환), 피부과(색소성질환), 피부과(수포성), 피부과(직업피부병), 피부과(피부종양), 피부과(기타)
													</td>
												</tr>
												<tr>
													<td width="29%;">영상의학과</td>
													<td width="71%;" class="last">
														영상의학과(갑상선), 영상의학과(근골격), 영상의학과(근관절), 영상의학과(복부), 영상의학과(비뇨기), 영상의학과(소화기), 영상의학과(신경), 영상의학과(신경두경부), 영상의학과(혈관), 영상의학과(흉부), 영상의학과(기타)
													</td>
												</tr>
												<tr>
													<td width="29%;" style="border-bottom:none;">기타</td>
													<td width="71%;" class="last" style="border-bottom:none;">
														가정의학과, 마취통증의학과, 방사선종양학과, 병리과(조직검사), 예방의학과, 응급의학과, 직업환경의학과, 진단검사의학과(소변검사), 진단검사의학과(혈액검사), 진단검사의학과(기타), 통증의학과, 핵의학과, 기타
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td>
										<ul>
											<li>가. 국·공립병원 및 대학부속병원 또는 종합병원(관할구역 내에 2개 이상의 국·공립병원이나 대학부속병원이 없는 경우에 한한다)의 과장 또는 대학의 전임강사 이상의 전문의</li>
											<li>나. 공정성·중립성 측면에서 신체감정을 수행하기에 부적절하다고 판단되는 전문의들(예를 들어 보험회사의 자문의, 근로복지공단의 촉탁의 등)은 제외</li>
										</ul>
									</td>
									<td class="last"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<br>
					
					<h5 class="mar2">공사비등의 감정인 세부구분 및 감정인 명단 등재기준</h5>
					<div class="tabletop">
						<table class="list vline" summary="공사비등의 감정인 세부구분 및 등재기준" border="1">
							<colgroup>
								<col width="20%;">
								<col width="25%;">
								<col width="15%;">
								<col width="25%;">
								<col width="15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">구분</th>
									<th scope="col">대분류</th>
									<th scope="col">소분류</th>
									<th scope="col">등재기준</th>
									<th scope="col" class="last">제출서류</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td rowspan="5">공사비등의 감정인</td>
									<td>건축(시공)</td>
									<td></td>
									<td rowspan="5">건축사·건축구조기술사·건축시공기술사 등의 국가기술자격을 가진 사람으로서 소속단체가 추천한 사람 또는 본인이 신청한 사람 중에서 적절하다고 판단되는 사람</td>
									<td rowspan="5" class="last"></td>
								</tr>
								<tr>
									<td>건축(구조·안전진단)</td>
									<td></td>
								</tr>
								<tr>
									<td>토목(시공)</td>
									<td></td>
								</tr>
								<tr>
									<td>토목(구조·안전진단)</td>
									<td></td>
								</tr>
								<tr>
									<td>토목(기타)</td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
					<br>
					
					<h5 class="mar2">측량감정인, 문서등의 감정인 세부구분 및 감정인 명단 등재기준</h5>
					<div class="tabletop">
						<table class="list vline" summary="측량, 문서, 인영, 필적 감정인 세부구분 및 선정기준" border="1">
							<colgroup>
								<col width="20%;">
								<col width="50%;">
								<col width="40%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">구분</th>
									<th scope="col">등재기준</th>
									<th scope="col" class="last">제출서류</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>측량감정인</td>
									<td>
										<ul>
											<li>지적측량감정인은 측량⋅수로조사 및 지적에 관한 법률에 따라 등록된 지적 측량업자 또는 그 소속 지적기술사, 지적기사, 지적산업기사 이상의 자격을 가진 사람(국토교통부에 등록된 측량감정인)</li>
										</ul>
									</td>
									<td class="last"></td>
								</tr>
								<tr>
									<td>문서등의 감정인</td>
									<td>
										<ul>
											<li>가. 국가기관연구소 문서감정실에서 5년 이상 감정·연구한 사람</li>
											<li>나. 국가기관연구소 문서감정실에서 5년 이상 감정·연구한 사람으로부터 문서감정 등에 관하여 5년 이상 연수받은 사람</li>
											<li>다. 다음과 같은 시설·장비를 갖추어야 함.① 입체현미경  ② 확대투영기③ 자외선 감식기 ④ 적외선 현미경(또는 적외선 휠터) ⑤ 마이크로렌즈가 장착된 카메라(또는 확대 컴퓨터) ⑥ 이화학적 실험기구</li>								
										</ul>
									</td>
									<td class="last"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</html>
