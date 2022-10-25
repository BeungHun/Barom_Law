<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	하이 ${map.USER_PROPER_NUM }<br>
	이론상 됨 ${map.TRIAL_FCLTT_PROPER_NUM}<br>
	이건 되냐? ${map.APLCN_DTLS_PROPER_NUM}<br>
	
	 <form action="../admin/acceptProcess">
	 	<input type="hidden" name="trial_fcltt_proper_num" value="${map.TRIAL_FCLTT_PROPER_NUM}">
	 	<input type="hidden" name="aplcn_dtls_proper_num" value="${map.APLCN_DTLS_PROPER_NUM}">
			 <textarea name="accept_etc" cols="80"></textarea> 
		><button type="submit">인서트</button>
	 </form>
</body>
</html>