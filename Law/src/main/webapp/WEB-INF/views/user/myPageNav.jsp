<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="../resources/css/common.css">
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
<div class="col-3 pe-0 text-center nav submenu" style="border-right: solid 1px #ccc; font-size: 14px; padding-left: 23px">
	<div class="list-group list-group-flush">
		<a href="./identityVerificate" class="list-group-item list-group-item-action">내정보</a>
		<a href="./myApplication" class="list-group-item list-group-item-action">나의 등재신청 내역</a>
		<a href="./myActive" class="list-group-item list-group-item-action">나의 활동 내역</a>
		<a href="./myPause" class="list-group-item list-group-item-action">중지/해제신청 관리</a>
	</div>
</div>