/*
 *	공통 사용 함수
 */


function showErrMsg(msg) {
	if(msg !== '') {
		alert(msg);
		location.href = '../user/login';
	}
}
