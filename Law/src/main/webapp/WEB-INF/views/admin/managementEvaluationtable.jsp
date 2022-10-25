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
<title>평정 기준표 관리</title>
<style>
	
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
			<jsp:include page="../common/assistantAdminNav.jsp"></jsp:include>
		</div>
		
		<!-- 본문 -->
		<div class="col m-3">
			<!-- 현재위치 -->
			<div class="row text-end loc">
				<div class="col" style="font-size: 11px;">
					<span> 홈 > 재판조력자관리 > </span><span style="color: #72a8fe;font-weight: bold;">평정 기준표 관리</span>
				</div>
			</div>
			<!-- 타이틀 -->
			<div class="row my-4">
				<div class="col">
					<img src="../resources/img/Admin/head_title_img.gif">
					<span style="font-weight: bold;">평정 기준표 관리</span>
				</div>
			</div>
			
			<!-- 안내 -->
			<div class="contentsinbox">
				<div class="row">
					<div class="col">
						<table class="table table-bordered" style="height: 800px; font-size:12px;">
						  <thead style="text-align : center; vertical-align : middle;">
						  	<tr>
						      <td colspan="3">신청인이름</td>		     
						      <td colspan="3">주민등록번호</td>		      		 
						    </tr>		  
						    <tr>
						      <td rowspan="2">평정항목</td>		     
						      <td rowspan="2">세부항목</td>
						      <td rowspan="2">배점</td>
						      <td colspan="3">내용</td>		  
						    </tr>
						    <tr>
						      <td scope="col">구분</td>
						      <td scope="col">기준</td>
						      <td scope="col">배점</td>		  
						    </tr>
						  </thead>
						  <tbody style="text-align : center; vertical-align : middle;">
						    <tr>
						      <td rowspan="9" >기본평정</td>
						      <td rowspan="6">경력점수</td>
						      <td rowspan="6">통산경력 + 관내경력</td>  
						      <td rowspan="3">통산경력</td>
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
						    	<td rowspan="2"></td>
						    	<td colspan="2">관내 사무소</td>
						    	<td scope="col">5</td>
						    </tr>
						    <tr>
						    	<td colspan="2">관외 사무소</td>
						    	<td scope="col">3</td>
						    </tr>
						    <tr>
						    	<td colspan="5">신청인 사무소 주소지</td>
						    </tr>
						   	<tr>
						   		<td rowspan="3">인성평가</td>
						   		<td rowspan="3"></td>
						   		<td rowspan="3"></td>
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
						   		<td rowspan="2"></td>
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
						   		<td rowspan="4"></td>
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
						   		<td scope="col"></td>
						   		<td colspan="3"></td>
						   	</tr>
						   	<tr>
						   		<td colspan="2">감정인 평정표</td>
						   		<td scope="col"></td>
						   		<td colspan="3"></td>
						   	</tr>
						   	<tr>
						   		<td scope="col">조정평점</td>
						   		<td scope="col">심사위원 추천</td>
						   		<td scope="col"></td>
						   		<td colspan="3">최대 7점</td>
						   	</tr>
						   	<tr>
						   		<td colspan="2">최종점수(종합)</td>
						   		<td scope="col"></td>
						   		<td colspan="3">--점/총점</td>
						   	</tr>
						  </tbody>
						</table>
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