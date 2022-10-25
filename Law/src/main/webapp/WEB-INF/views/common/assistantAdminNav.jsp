<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../resources/css/common.css">

<style>
/* .nav li{
		clear:both; 
		font-size:12px;
		font-weight:bold;
		line-height:1.3em;
		margin:5px 0;
		background:url('../resources/img/applicationRegistration/bg_submenu_on.gif') no-repeat 0 0 ;
} */
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

<div class="list-group list-group-flush nav submenu" style="margin-left:10px;">
    <a href="../admin/managementEvaluationtable" class="list-group-item list-group-item-action">평정 기준표 관리</a>
    <a href="../admin/searchCondition" class="list-group-item list-group-item-action">조건별 조회</a>
<!--     <a href="../admin/applicantManagement" class="list-group-item list-group-item-action">신청자 조회</a> -->
<!--     <a href="../admin/evaluationApplicantsList" class="list-group-item list-group-item-action">신청자 심사</a> -->
<!--     <a href="../admin/selUserList" class="list-group-item list-group-item-action">1차심사 리스트</a> -->
    <a href="../admin/evaluationApplicantsList" class="list-group-item list-group-item-action">최종 심사</a>
</div>
        