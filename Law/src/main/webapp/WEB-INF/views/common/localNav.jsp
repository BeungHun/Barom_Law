<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<div class="col-3 text-center nav submenu" style="border-right: solid 1px #ccc; margin-left:10px;">
	<div class="list-group list-group-flush">
		<a href="../member/trialAssistantRegisterBoard" class="list-group-item list-group-item-action">감정인 등재공고</a>
		<a href="../member/noticeBoard" class="list-group-item list-group-item-action">공지사항</a>
		<a href="../member/faqPage" class="list-group-item list-group-item-action">FAQ(자주묻는질문)</a>
	</div>
</div>
