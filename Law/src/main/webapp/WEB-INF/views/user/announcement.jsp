<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
공고내역 선택지
<!--  -->
	<c:forEach items="${asd}" var="data">
		<a href="../user/announcementProcess?announce_proper_num=${data.announce_proper_num }">
		  <h1>구간</h1>
			공지번호 : ${data.announce_proper_num }<br>
			공지이름 : ${data.announce_title }<br>
		</a>
	</c:forEach>
	

</body>
</html>