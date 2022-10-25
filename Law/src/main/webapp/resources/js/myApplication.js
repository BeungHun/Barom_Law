function changeBtn(addId, navClassName){
	//입력하는 버튼
	var addBtn = document.getElementById(addId);
	//지워질 버튼
	var delBtn = document.getElementsByClassName(navClassName);
	for(e of delBtn){
		e.classList.remove("border-bottom-0");
		e.classList.remove("text-primary");
		e.classList.remove("text-opacity-50");
		e.classList.remove("fw-bold");
		e.classList.add("bg-secondary");
		e.classList.add("bg-opacity-10");
	}
	addBtn.classList.remove("bg-secondary");
	addBtn.classList.remove("bg-opacity-10");
	addBtn.classList.add("border-bottom-0");
	addBtn.classList.add("text-primary");
	addBtn.classList.add("text-opacity-50");
	addBtn.classList.add("fw-bold");
}

function setDateInput(dateVal) {
	var date = new Date(dateVal);
	var yyyy = date.getFullYear();
	
	var month = parseInt(date.getMonth()+1);
	var mm = month > 9 ? month : '0' + month;
	
	var day = date.getDate();
	var dd = day > 9 ? day : '0' + day;
	
	return yyyy + '-' + mm + '-' + dd; 
}

// 파일 변경버튼 클릭 시 렌더링 변경
function showFileInput(ele, type, code) {
//	var ele = thisId.parentNode;
	ele.innerHTML = '';
	
	var inputFile = document.createElement("input");
   	inputFile.classList.add("file");
   	inputFile.type = "file";
   	inputFile.name = "file_" + type;
   	inputFile.classList.add("file");
   	inputFile.id = "file_" + type;
   	ele.appendChild(inputFile);
   	
   	var inputFileType = document.createElement("input");
   	inputFileType.type = "hidden";
   	inputFileType.name = "file_type";
   	inputFileType.value = type;
   	inputFileType.classList.add("file_type");
   	ele.appendChild(inputFileType);
   	
   	var inputFileCode = document.createElement("input");
   	inputFileCode.type = "hidden";
   	inputFileCode.name = "file_code";
   	inputFileCode.value = code;
   	inputFileCode.classList.add("file_code");
   	ele.appendChild(inputFileCode);
}


// 파일 다운로드  
function fileDownload(dtls_proper_num, atch_file_proper_num) {
	location.href = "../admin/fileDownLoadProcess?aplcn_dtls_proper_num=" + dtls_proper_num + "&aplcn_atch_file_proper_num=" + atch_file_proper_num;
}

// 유무 체크 시 disabled 처리함수
function disabledToggle(flag, id) {
	if(flag == 'y') { // 유 체크
		document.getElementById(id).disabled = false;	
	} else if(flag == 'n') { // 무 체크
		document.getElementById(id).disabled = true;
		document.getElementById(id).value = "";	
	}
}



// 작성완료 버튼 시 실행함수
function application(isEmptyChk) {
	if(isEmptyChk) {
		if(!chkValEmpty()) return;
	}

	var msg = "작성 완료하시겠습니까? 이후 수정이 불가합니다.";
	if(confirm(msg)) {
		// 확인 클릭 시 처리
		//alert("확인 클릭");
		var param = {
			'aplcn_dtls_proper_num' : userNo,
		}
		
		$.ajax({
			url: './updateAplcnStsToExamination',
			method: 'post',
			data: param,
			dataType: 'json',
		}).done(function(obj) {
			console.log(obj.result);
			console.log(obj.msg);
			
			if(obj.result == 'success') {
				alert(obj.msg);
				location.reload();
				location.href = "./myApplicationDetail?aplcn_dtls_proper_num=" + userNo;
				//location.href = "./myApplicationDetail?aplcn_dtls_proper_num=" + userNo;
				history.go(1);	// 뒤로가기 방지
				
			} else {
				alert(obj.msg);
			}
		}).fail(function() {});
		
	} else {
		location.reload();
	}
	
}

// 입력값 공백체크 함수
function chkValEmpty() {
	var result = true;
	var infoBox = document.getElementById("nav-info");
	var values = infoBox.getElementsByTagName("input");
	
	// 공백검사
	for(let i=0; i<values.length; i++) {
	
		// disabled가 아닌 입력값만 공백 체크
		if(!values[i].disabled) {
			if(values[i].value == '') {
				values[i].focus();
				result = false;
			}
		}
	}
	return result;
}

// 기본정보 submit
function tableOnefrmSubmit() {
	if(!chkValEmpty()) {
		return;
	} else {
		
		var frmData = $("#tableOneFrm").serialize();
		$.ajax({
			url: "./modifyUserDetail",
			method: "post",
			data: frmData,
			dataType: "json",
		}).done(function(obj) {
			alert(obj.msg);
	
		}).fail(function() {
			
		})
	}
}

// 신청정보 submit
function tableFiveFrmSubmit() {
	if(!chkValEmpty()) {
		return;
	} else {
	
		document.getElementById("ligtn_case_carer_etc").disabled = false;
		document.getElementById("insrn_indst_carer_etc").disabled = false;
		document.getElementById("criminal_penalty_carer_etc").disabled = false;
		
		var frmData = $("#tableFiveFrm").serialize();
		$.ajax({
			url: "./modifyTableFive",
			method: "post",
			data: frmData,
			dataType: "json",
		}).done(function(obj) {
			alert(obj.msg);
			tableFiveInfo();
		
		}).fail(function() { })
	
	}
}

// 학력정보 submit
function tableSixFrmSubmit() {
	if(!chkValEmpty()) {
		return;
	} else {
		var frmData = $("#tableSixFrm").serialize();
		//console.log("tableSixFrm : " + frmData);
		$.ajax({
			url: "./modifyTableSix",
			method: "post",
			data: frmData,
			dataType: "json",
		}).done(function(obj) {
			alert(obj.msg);
			tableSixInfo();
		}).fail(function() {})
	}
}


// 경력정보 submit
function tableSevenFrmSubmit() {
	if(!chkValEmpty()) {
		return;
	} else {
		var frmData = $("#tableSevenFrm").serialize();
		//console.log("tableSevenFrm : " + frmData);
		$.ajax({
			url: "./modifyTableSeven",
			method: "post",
			data: frmData,
			dataType: "json",		
		}).done(function(obj) {
			alert(obj.msg);
			tableSevenInfo();
		
		}).fail(function() {})
		
	}
	
}

// 자격증정보 submit
function tableEightFrmSubmit() {
	// 자격증 정보 필수X

	var frmData = $("#tableEightFrm").serialize();
	//console.log("tableEightFrm : " + frmData);
	$.ajax({
		url: "./modifyTableEight",
		method: "post",
		data: frmData,
		dataType: "json",		
	}).done(function(obj) {
		alert(obj.msg);
		tableEightInfo();
	
	}).fail(function() {})
}

// 같은 name의 엘리먼트들 value 배열 만들어주는 함수
function makeValArr(arr) {
	var resultArr = [];
	for(var i=0; i<arr.length; i++) {
		resultArr[i] = arr[i].value;
	}
	return resultArr;
}

function makeFileArr(arr) {
	var resultArr = [];
	for(var i=0; i<arr.length; i++) {
		if(arr[i].files.length > 0) {
			for(var j=0; j<arr[i].files.length; j++) {
				// console.log("arr[i].files[j] :: " + arr[i].files[j]);
				resultArr[i] = arr[i].files[j];
			}
		}
	}
	return resultArr;
}


// 22.10.04 오전 테스트코드
function tableNineFrmSubmit() {
	var formData = new FormData();
	formData.append('aplcn_dtls_proper_num', document.getElementById('aplcn_dtls_proper_num').value);	// 등재신청 고유번호
	
	var fileList = document.getElementsByClassName("file");
	var typeList = document.getElementsByName("file_type");		// type input list
	var codeList = document.getElementsByName("file_code");		// code input list
	
	var resTypeList = [];	// ajax 전송할 typeList
	var resCodeList = [];	// ajax 전송할 codeList
	
	var i=0;
	var j=0;
	for(e of fileList) {
		var file = e.files[0];
		if(file != undefined) {
			
			resTypeList[j] = typeList[i].value;
			resCodeList[j] = codeList[i].value;
			
			formData.append(e.name, file);
			
			j++;
		}
		i++;
	}
	
	formData.append("types", resTypeList);
	formData.append("codes", resCodeList);
	
	$.ajax({
		url: "./modifyTableNine",
		method: "post",
		data: formData,
		contentType: false,
		processData: false,
		cache: false,
	}).done(function(obj) {
		alert(obj.msg);
		tableNineInfo();
	}).fail(function() {});
}

/*
function tableNineFrmSubmit() {
	var formData = new FormData();
	formData.append('aplcn_dtls_proper_num', document.getElementById('aplcn_dtls_proper_num').value);
	formData.append('types', makeValArr(document.getElementsByName('file_type')));
	formData.append('codes', makeValArr(document.getElementsByName('file_code')));
	//formData.append('files', makeFileArr(document.getElementsByName('file')));
	
	var files = document.getElementsByName("file");
	for(file of files) {
		formData.append(file.id, file.files[0]);
	}
	
	formData.append("file_businesslicense", document.getElementById('file_businesslicense').files[0]);
	formData.append("file_businessreport", document.getElementById('file_businesslicense').files[0]);
	formData.append("file_taxconfirm", document.getElementById('file_businesslicense').files[0]);
	formData.append("file_resume", document.getElementById('file_businesslicense').files[0]);
	formData.append("file_educationlevel", document.getElementById('file_businesslicense').files[0]);
	formData.append("file_carrer", document.getElementById('file_businesslicense').files[0]);
	formData.append("file_certificate", document.getElementById('file_businesslicense').files[0]);
	formData.append("file_other", document.getElementById('file_businesslicense').files[0]);
	$.ajax({
		url: "./modifyTableNine",
		method: "post",
		data: formData,
		contentType: false,
		processData: false,
		cache: false,
	}).done(function(obj) {
		alert(obj.msg);
		tableNineInfo();
	}).fail(function() {});
}
*/


// 첨부파일정보 submit
/*
function tableNineFrmSubmit() {
	var form = $("#tableNineFrm")[0];
	var formData = new FormData(form);
	console.log("form : " + form);
	console.log("formData : " + formData);

	$.ajax({
		url: "./modifyTableNine",
		method: "post",
		data: formData,
		contentType: false,	// content-type 헤더가 multipart/form-data로 전송
		processData: false,	// formData를 string으로 변환하지않음
		cache: false,
	}).done(function(obj) {
		alert(obj.msg);
		tableNineInfo();
	
	}).fail(function() {})
}
*/




function userDetailWrite(){
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				var data = jsonObj.map;
				
				var commentListBox = document.getElementById("nav-info");
				commentListBox.innerHTML = "";
				
				if(data != null || data != undefined) {
				
	
	                var rowBox = document.createElement("div");
	                rowBox.classList.add("row");
	                
	                var txtRow = document.createElement("div");
	                txtRow.classList.add("row");
	                txtRow.classList.add("mx-0");
	                txtRow.classList.add("border-bottom");
	                txtRow.classList.add("pb-4");
	                rowBox.appendChild(txtRow);
	                
	                var txtCol = document.createElement("div");
	                txtCol.classList.add("col");
	                txtRow.appendChild(txtCol);
	                
	                var txtSpan = document.createElement("span");
	                txtSpan.innerText = "* 모든 값은 필수입력입니다.";
	                txtSpan.classList.add("text-danger");
	                txtSpan.classList.add("fw-bold");
	                txtCol.appendChild(txtSpan);
	                
	
					/*
	                var subNab1Span = document.createElement("span");
	                subNab1Span.innerText="기본정보";
	                subNab1.appendChild(subNab1Span);
					
	                var subNab1SpanFromI = document.createElement("i");
	                subNab1SpanFromI.classList.add("bi");
	                subNab1SpanFromI.classList.add("bi-circle-fill");
	                subNab1Span.appendChild(subNab1SpanFromI);
					*/
	                
	                var tableRowBox = document.createElement("div");
	                tableRowBox.classList.add("row");
	                tableRowBox.classList.add("px-0");
	                tableRowBox.classList.add("mx-0");
	                rowBox.appendChild(tableRowBox);
	                
	                var TableOneFrm = document.createElement("form");
	                TableOneFrm.id = "tableOneFrm";
	                TableOneFrm.name = "tableOneFrm";
	                tableRowBox.appendChild(TableOneFrm);
	
	                var tableBox = document.createElement("table");
	                tableBox.classList.add("table");
	                tableBox.classList.add("table-bordered");
	                TableOneFrm.appendChild(tableBox);
	
	                var colgp = document.createElement("colgroup");
	                tableBox.appendChild(colgp);
	
	                //스코프
	                var tableColGroup1 = document.createElement("col");
	                tableColGroup1.setAttribute("width", "15%");
	                colgp.appendChild(tableColGroup1);
	                
	                var tableColGroup2 = document.createElement("col");
	                tableColGroup2.setAttribute("width", "35%");
	                colgp.appendChild(tableColGroup2);
	
	                var tableColGroup3 = document.createElement("col");
	                tableColGroup3.setAttribute("width", "15%");
	                colgp.appendChild(tableColGroup3);
	
	                var tableColGroup4 = document.createElement("col");
	                tableColGroup4.setAttribute("width", "35%");
	                colgp.appendChild(tableColGroup4);
	
	                var tableThead = document.createElement("thead");
	                tableBox.appendChild(tableThead);
	
	                var threadTr = document.createElement("tr");
	                tableThead.appendChild(threadTr);
	
	                var trTh1 = document.createElement("th");
	                trTh1.classList.add("table-light");
	                trTh1.classList.add("text-center");
	                trTh1.innerText="이름";
	                threadTr.appendChild(trTh1);
	
	                var trTd1 = document.createElement("td");
	                trTd1.innerText = jsonObj.map.USER_NAME;
	                threadTr.appendChild(trTd1);
	                
	                /*
	                var inputUserName = document.createElement("input");
	                inputUserName.type = "text";
	                inputUserName.value = jsonObj.map.USER_NAME;
	                inputUserName.id = "user_name";
	                inputUserName.name = "user_name";
	                //inputUserName.classList.add("form-control");
	                trTd1.appendChild(inputUserName);
	                */
	
	                var trTh2 = document.createElement("th");
	                trTh2.classList.add("table-light");
	                trTh2.classList.add("text-center");
	                trTh2.innerText="나이";
	                threadTr.appendChild(trTh2);
	
	                var trTd2 = document.createElement("td");
	                trTd2.innerText= jsonObj.map.USER_AGE + "세";
	                threadTr.appendChild(trTd2);
	
	
	                var tableBody = document.createElement("tbody");
	                tableBox.appendChild(tableBody);
	
	                var bodyTr1 = document.createElement("tr");
	                tableBody.appendChild(bodyTr1);
	
	                var bodyTh1 = document.createElement("th");
	                bodyTh1.classList.add("text-center");
	                bodyTh1.classList.add("table-light");
	                bodyTh1.innerText="이메일";
	                bodyTr1.appendChild(bodyTh1);
	
	                var bodyTd1 = document.createElement("td");
	                bodyTr1.appendChild(bodyTd1);
	                
	                var inputEmail = document.createElement("input");
	                inputEmail.type = "text";
	                //inputEmail.classList.add("form-control");
	                inputEmail.value = jsonObj.map.USER_EMAIL;
	                inputEmail.id = "user_email";
	                inputEmail.name = "user_email";
	                bodyTd1.appendChild(inputEmail);
	
	                var bodyTh2 = document.createElement("th");
	                bodyTh2.classList.add("text-center");
	                bodyTh2.classList.add("table-light");
	                bodyTh2.innerText="연락처";
	                bodyTr1.appendChild(bodyTh2);
	
	                var bodyTd2 = document.createElement("td");
	                bodyTr1.appendChild(bodyTd2);
	                
	                var inputPhone = document.createElement("input");
	                inputPhone.type = "text";
	                //inputPhone.classList.add("form-control");
	                inputPhone.value = jsonObj.map.USER_PHONE;
	                inputPhone.id = "user_phone";
	                inputPhone.name = "user_phone";
	                bodyTd2.appendChild(inputPhone);
	                
	                var bodyTr2 = document.createElement("tr");
	                tableBody.appendChild(bodyTr2);
	
	                var bodyTh3 = document.createElement("th");
	                bodyTh3.classList.add("text-center");
	                bodyTh3.classList.add("table-light");
	                bodyTh3.innerText="직업";
	                bodyTr2.appendChild(bodyTh3);
	
	                var bodyTd3 = document.createElement("td");
	                bodyTr2.appendChild(bodyTd3);
	                
	                var inputJob = document.createElement("input");
	                inputJob.type = "text";
	                //inputJob.classList.add("form-control");
	                inputJob.value = jsonObj.map.USER_JOB;
	                inputJob.id = "user_job";
	                inputJob.name = "user_job";
	                bodyTd3.appendChild(inputJob);
	
	                var bodyTh4 = document.createElement("th");
	                bodyTh4.classList.add("text-center");
	                bodyTh4.classList.add("table-light");
	                bodyTh4.innerText="기본주소";
	                bodyTr2.appendChild(bodyTh4);
	
	                var bodyTd4 = document.createElement("td");
	                bodyTr2 .appendChild(bodyTd4);
	                
	                var inputAddr = document.createElement("input");
	                inputAddr.type = "text";
	                //inputAddr.classList.add("form-control");
	                inputAddr.value = jsonObj.map.USER_AR; 
	                inputAddr.id = "user_ar";
	                inputAddr.name = "user_ar";
	                bodyTd4.appendChild(inputAddr);
	
	                var bodyTr3 = document.createElement("tr");
	                tableBody.appendChild(bodyTr3);
	                
	                var bodyTh5 = document.createElement("th");
	                bodyTh5.setAttribute("rowspan", "3");
	                bodyTh5.setAttribute("scope", "row");
	                bodyTh5.classList.add("text-center");
	                bodyTh5.classList.add("table-light");
	                bodyTh5.setAttribute("style", "line-height:100px");
	                // style="line-height:100px" 안됨
	                bodyTh5.innerText="주소";
	                bodyTr3.appendChild(bodyTh5);
					
	                var bodyTd5 = document.createElement("td");
	                bodyTd5.setAttribute("colspan", "3");
	                //bodyTd5.innerText="우편번호 : ";
	                bodyTr3 .appendChild(bodyTd5);
	                
	                var zoneCodeRow = document.createElement("div");
	                zoneCodeRow.classList.add("row");
	                bodyTd5.appendChild(zoneCodeRow);
	                
	                var zoneCodeCol1 = document.createElement("div");
	                zoneCodeCol1.classList.add("col-2");
	                zoneCodeCol1.classList.add("mt-1");
	                zoneCodeCol1.style.width = "75px";
	                zoneCodeRow.appendChild(zoneCodeCol1);
	                
	                var zoneCodeSpan = document.createElement("span");
	                zoneCodeSpan.innerText = "우편번호 : ";
	                zoneCodeCol1.appendChild(zoneCodeSpan);
	                
	                var zoneCodeCol2 = document.createElement("div");
	                zoneCodeCol2.classList.add("col-2");
	                zoneCodeCol2.style.width = "90px";
	                zoneCodeRow.appendChild(zoneCodeCol2);
	                
	                var inputZoneCode = document.createElement("input");
	                inputZoneCode.type = "text";
	                //inputZoneCode.classList.add("form-control");
	                inputZoneCode.value = jsonObj.map.USER_AR_ZONECODE;
	                inputZoneCode.id = "user_ar_zonecode";
	                inputZoneCode.name = "user_ar_zonecode";
	                inputZoneCode.disabled = true;
	                inputZoneCode.style.width = "75px";
	                zoneCodeCol2.appendChild(inputZoneCode);
					
					var zoneCodeCol3 = document.createElement("div");
					zoneCodeCol3.classList.add("col-2");
					zoneCodeCol3.style.width = "100px";
					zoneCodeRow.appendChild(zoneCodeCol3);
					
					var addrSearchBtn = document.createElement("input");
					//addrSearchBtn.classList.add("btn");
					//addrSearchBtn.classList.add("btn-success");
					addrSearchBtn.type = "button";
					addrSearchBtn.value = "검색";
					addrSearchBtn.setAttribute("onClick", "searchAddr();");
					zoneCodeCol3.appendChild(addrSearchBtn);
					
	                var bodyTr4 = document.createElement("tr");
	                tableBody.appendChild(bodyTr4);
	
	                var bodyTd6 = document.createElement("td");
	                bodyTd6.setAttribute("colspan", "3");
	                //bodyTd6.innerText="지번주소 : ";
	                bodyTr4 .appendChild(bodyTd6);// 지번주소
	                
	                var addrJibunRow = document.createElement("div");
	                addrJibunRow.classList.add("row");
	                bodyTd6.appendChild(addrJibunRow);
	                
	                var addrJibunCol1 = document.createElement("div");
	                addrJibunCol1.classList.add("col-2");
	                addrJibunCol1.style.width = "75px";
	                addrJibunRow.appendChild(addrJibunCol1);
	                
	                var addrJibunSpan = document.createElement("span");
	                addrJibunSpan.innerText = "지번주소 : ";
	                addrJibunCol1.appendChild(addrJibunSpan);
	                
	                var addrJibunCol2 = document.createElement("div");
	                addrJibunCol2.classList.add("col");
	                addrJibunRow.appendChild(addrJibunCol2);
	                
					var inputArJibun = document.createElement("input");
					inputArJibun.type = "text";
					//inputArJibun.classList.add("form-control");
					inputArJibun.value = jsonObj.map.USER_AR_JIBUN;
					inputArJibun.id = "user_ar_jibun";
					inputArJibun.name = "user_ar_jibun";
					addrJibunCol2.appendChild(inputArJibun);
	
	                var bodyTr5 = document.createElement("tr");
	                tableBody.appendChild(bodyTr5);
	
	                var bodyTd7 = document.createElement("td");
	                bodyTd7.setAttribute("colspan", "3");
	                //bodyTd7.innerText="상세주소 : ";
	                bodyTr5 .appendChild(bodyTd7);// 상세주소
	
					var addrDetailRow = document.createElement("div");
					addrDetailRow.classList.add("row");
					bodyTd7.appendChild(addrDetailRow);
					
					var addrDetailCol1 = document.createElement("div");
					addrDetailCol1.classList.add("col-2");
					addrDetailCol1.style.width = "75px";
					addrDetailRow.appendChild(addrDetailCol1);
					
					var addrDetailSpan = document.createElement("span");
					addrDetailSpan.innerText = "상세주소 : ";
					addrDetailCol1.appendChild(addrDetailSpan);
					
					var addrDetailCol2 = document.createElement("div");
					addrDetailCol2.classList.add("col");
					addrDetailRow.appendChild(addrDetailCol2);
					
					var inputArDetail = document.createElement("input");
					inputArDetail.type = "text";
					//inputArDetail.classList.add("form-control");
					inputArDetail.value = jsonObj.map.USER_AR_DETAIL;
					inputArDetail.id = "user_ar_detail";
					inputArDetail.name = "user_ar_detail";
					inputArDetail.style.width = "80%";
					addrDetailCol2.appendChild(inputArDetail);
	
	                var bodyTr6 = document.createElement("tr");
	                tableBody.appendChild(bodyTr6);
	
	                var bodyTh8 = document.createElement("th");
	                bodyTh8.setAttribute("rowspan", "3");
	                bodyTh8.setAttribute("scope", "row");
	                bodyTh8.classList.add("text-center");
	                bodyTh8.classList.add("table-light");
	                bodyTh8.setAttribute("style", "line-height:100px");
	                bodyTh8.innerText="계좌정보";
	                // style="line-height:100px";
	                bodyTr6.appendChild(bodyTh8);
	
	                var bodyTd8 = document.createElement("td");
	                bodyTd8.setAttribute("colspan", "3");
	                //bodyTd8.innerText="예금주 : ";
	                bodyTr6 .appendChild(bodyTd8);
					
					var bankHolderRow = document.createElement("div");
					bankHolderRow.classList.add("row");
					bodyTd8.appendChild(bankHolderRow);
					
					var bankHolderCol1 = document.createElement("div");
					bankHolderCol1.classList.add("col-2");
					bankHolderCol1.style.width = "75px";
					bankHolderRow.appendChild(bankHolderCol1);
					
					var bankHolderSpan = document.createElement("span");
					bankHolderSpan.innerText = "예금주 : ";
					bankHolderCol1.appendChild(bankHolderSpan);
					
					var bankHolderCol2 = document.createElement("div");
					bankHolderCol2.classList.add("col");
					bankHolderRow.appendChild(bankHolderCol2);
					
					var inputBankHolder = document.createElement("input");
					inputBankHolder.type = "text";
					//inputBankHolder.classList.add("form-control");
					inputBankHolder.value = jsonObj.map.USER_BANK_HOLDER;
					inputBankHolder.id = "user_bank_holder";
					inputBankHolder.name = "user_bank_holder";
					bankHolderCol2.appendChild(inputBankHolder);
	
	                var bodyTr7 = document.createElement("tr");
	                tableBody.appendChild(bodyTr7);
	                
	                var bodyTd9 = document.createElement("td");
	                bodyTd9.setAttribute("colspan", "3");
	                //bodyTd9.innerText="계좌은행 : ";
	                bodyTr7 .appendChild(bodyTd9);
	                
	                var bankRow = document.createElement("div");
	                bankRow.classList.add("row");
	                bodyTd9.appendChild(bankRow);
	                
	                var bankCol1 = document.createElement("div");
	                bankCol1.classList.add("col-2");
	                bankCol1.style.width = "75px";
	                bankRow.appendChild(bankCol1);
	                
	                var bankSpan = document.createElement("span");
	                bankSpan.innerText = "계좌은행 : ";
	                bankCol1.appendChild(bankSpan);
	                
	                var bankCol2 = document.createElement("div");
	                bankCol2.classList.add("col");
	                bankRow.appendChild(bankCol2);
	                
	                var inputBank = document.createElement("input");
	                inputBank.type = "text";
	                //inputBank.classList.add("form-control");
	                inputBank.value = jsonObj.map.USER_BANK; 
	                inputBank.id = "user_bank";
	                inputBank.name = "user_bank";
	                bankCol2.appendChild(inputBank);
	                
	                var bodyTr8 = document.createElement("tr");
	                tableBody.appendChild(bodyTr8);
	
	                var bodyTd10 = document.createElement("td");
	                bodyTd10.setAttribute("colspan", "3");
	                // bodyTd10.innerText="계좌번호 : ";
	                bodyTr8 .appendChild(bodyTd10);
	                
	                var bankAccountRow = document.createElement("div");
	                bankAccountRow.classList.add("row");
	                bodyTd10.appendChild(bankAccountRow);
	                
	                var bankAccountCol1 = document.createElement("div");
	                bankAccountCol1.classList.add("col-2");
	                bankAccountCol1.style.width = "75px";
	                bankAccountRow.appendChild(bankAccountCol1);
	                
	                var bankAccountSpan = document.createElement("span");
	                bankAccountSpan.innerText = "계좌번호 : ";
	                bankAccountCol1.appendChild(bankAccountSpan);
	                
	                var bankAccountCol2 = document.createElement("div");
	                bankAccountCol2.classList.add("col");
	                bankAccountRow.appendChild(bankAccountCol2);
	                
	                var inputBankAccount = document.createElement("input");
	                inputBankAccount.type = "text";
	                //inputBankAccount.classList.add("form-control");
	                inputBankAccount.value = jsonObj.map.USER_BANK_ACCOUNT;
	                inputBankAccount.id = "user_bank_account"; 
	                inputBankAccount.name = "user_bank_account";
	                bankAccountCol2.appendChild(inputBankAccount); 
					
					/*
		 			var btnRow = document.createElement("div");
		 			btnRow.classList.add("row");
		 			btnRow.classList.add("text-center");
		 			TableOneFrm.appendChild(btnRow);
		 			
		 			var btnCol = document.createElement("div");
		 			btnCol.classList.add("col");
		 			btnRow.appendChild(btnCol);
		 			
					var submitBtn = document.createElement("input");
					submitBtn.type = "submit";
					submitBtn.value = "다음";
					submitBtn.classList.add("btn");
					submitBtn.classList.add("btn-outline-primary");
					submitBtn.setAttribute("onclick", "tableFiveInfo();");
					btnCol.appendChild(submitBtn);
					*/
					
					var properNum = document.createElement("input");
					properNum.type = "hidden";
					properNum.value = jsonObj.map.USER_PROPER_NUM;
					properNum.id = "user_proper_num";
					properNum.name = "user_proper_num";
					TableOneFrm.appendChild(properNum);
					
	                commentListBox.appendChild(rowBox);
	                
	                // 저장버튼
	                var submitRow = document.createElement("div");
	                submitRow.classList.add("row");
	                submitRow.classList.add("text-center");
	                TableOneFrm.appendChild(submitRow);
	                
	                var submitCol = document.createElement("div");
	                submitCol.classList.add("col");
	                submitRow.appendChild(submitCol);
	                
	                var submitBtn = document.createElement("button");
	                submitBtn.classList.add("btn");
	                submitBtn.classList.add("btn-sm");
	                submitBtn.classList.add("btn-secondary");
	                submitBtn.classList.add("mx-2");
	                submitBtn.classList.add("frmSubmit");
	                
	                submitBtn.id = "tableOneFrm";
	                submitBtn.type = "button";
	                submitBtn.innerText = "저장";
	                submitBtn.setAttribute("onclick", "tableOnefrmSubmit();");
	                submitCol.appendChild(submitBtn);
	                
	                var finalSubmitBtn = document.createElement("button");
	                finalSubmitBtn.classList.add("btn");
	                finalSubmitBtn.classList.add("btn-sm");
	                finalSubmitBtn.classList.add("btn-outline-success");
	                finalSubmitBtn.innerText = "작성완료";
	                finalSubmitBtn.setAttribute("onclick", "application(true);");
	                submitCol.appendChild(finalSubmitBtn);
	                
	                
	            // ajax 등재신청 결과값 null일 때    
                } else {	
                	var errMsgRow = document.createElement("div");
                	errMsgRow.classList.add("row");
                	
                	var errMsgCol = document.createElement("div");
                	errMsgCol.classList.add("col");
                	errMsgRow.appendChild(errMsgCol);
                	
                	var errMsgSpan = document.createElement("span");
                	errMsgSpan.innerText = "등재신청 정보를 찾을 수 없습니다.";
                	errMsgCol.appendChild(errMsgSpan);
                	
                	commentListBox.appendChild(errMsgRow);
                	 
                }
            }
    }
        xhr.open("get" , "../admin/selTableOne?aplcn_dtls_proper_num=" + userNo); //리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..		
}


function tableFiveInfo(){
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				var data = jsonObj.map;

                var commentListBox = document.getElementById("nav-info");
				commentListBox.innerHTML = "";
				
				
				if(data != null && data != undefined) {

	                var rowBox = document.createElement("div");
	                rowBox.classList.add("row");
	
	                
	                var subNab1 = document.createElement("div");
	                subNab1.classList.add("row");
	                subNab1.classList.add("mx-0");
	                subNab1.classList.add("border-bottom");
	                subNab1.classList.add("pb-4");
	                rowBox.appendChild(subNab1);
		
					/*
	                var subNab1Span = document.createElement("span");
	                subNab1Span.innerText="기본정보";
	                subNab1.appendChild(subNab1Span);
	
	                var subNab1SpanFromI = document.createElement("i");
	                subNab1SpanFromI.classList.add("bi");
	                subNab1SpanFromI.classList.add("bi-circle-fill");
	                subNab1Span.appendChild(subNab1SpanFromI);
					*/
					
	                var tableRow = document.createElement("div");
	                tableRow.classList.add("row");
					tableRow.classList.add("mx-0");
					tableRow.classList.add("px-0");
	                rowBox.appendChild(tableRow);
	
					var tableFiveFrm = document.createElement("form");
					tableFiveFrm.id = "tableFiveFrm";
					tableFiveFrm.name = "tableFiveFrm";
					tableRow.appendChild(tableFiveFrm);
	
	                var table = document.createElement("table");
	                table.classList.add("table");
	                table.classList.add("table-bordered");
	                tableFiveFrm.appendChild(table);
	                
	                var colGroup = document.createElement("colgroup");
	                table.appendChild(colGroup);
	
	                var colGroupOne = document.createElement("col");
	                colGroupOne.setAttribute("width", "20%");
	                colGroup.appendChild(colGroupOne);
	                
	                var colGroupTwo = document.createElement("col");
	                colGroupTwo.setAttribute("width", "20%");
	                colGroup.appendChild(colGroupTwo);
	
	                var colGroupThree = document.createElement("col");
	                colGroupThree.setAttribute("width", "60%");
	                colGroup.appendChild(colGroupThree);
	
	                // var colGroupThree = document.createElement("col");
	                // colGroupThree.setAttribute("width", "15%");
	                // colGroup.appendChild(colGroupThree);
	
	                // var colGroupFour = document.createElement("col");
	                // colGroupFour.setAttribute("width", "35%");
	                // colGroup.appendChild(colGroupFout);
	
	                var tbody = document.createElement("tbody");
	                table.appendChild(tbody);
	
	                var bodyTr1 = document.createElement("tr");
	                bodyTr1.setAttribute("rowspan", "2");
	                bodyTr1.setAttribute("scope", "row");
	                bodyTr1.classList.add("text-center");
	                bodyTr1.classList.add("border-2");
	                bodyTr1.classList.add("style", "line-height:100px");
	                tbody.appendChild(bodyTr1);
	
	                var bodyTr1Th1 = document.createElement("th");
	                bodyTr1Th1.classList.add("table-light");
	                bodyTr1Th1.innerText="소송사건 당사자 경력";
	                bodyTr1.appendChild(bodyTr1Th1);
	
					var bodyTr1Td1 = document.createElement("td");
					bodyTr1.appendChild(bodyTr1Td1);
					
					var inputYesLigtnBox = document.createElement("div");
					//inputYesLigtnBox.classList.add("form-check");
					inputYesLigtnBox.style.float = "left";
					inputYesLigtnBox.style.margin = "4px 20px 0px 17px";
					bodyTr1Td1.appendChild(inputYesLigtnBox);
					
					var inputYesLigtn = document.createElement("input");
					//inputYesLigtn.classList.add("form-check-input");
					inputYesLigtn.type = "radio";
					inputYesLigtn.name = "ligtn_case_carer_yn";
					inputYesLigtn.id = "ligtn_case_carer_y";
					inputYesLigtn.value = "y";
					inputYesLigtn.setAttribute("onclick", "disabledToggle('y', 'ligtn_case_carer_etc');");
					inputYesLigtnBox.appendChild(inputYesLigtn);
					
					var labelYesLigtn = document.createElement("label");
					//labelYesLigtn.classList.add("form-check-label");
					labelYesLigtn.for = "ligtn_case_carer_y";
					labelYesLigtn.innerText = "유";
					inputYesLigtnBox.appendChild(labelYesLigtn);
					
					var inputNoLigtnBox = document.createElement("div");
					//inputNoLigtnBox.classList.add("form-check");
					inputNoLigtnBox.style.float = "left";
					inputNoLigtnBox.style.marginTop = "4px";
					bodyTr1Td1.appendChild(inputNoLigtnBox);
					
					var inputNoLigtn = document.createElement("input");
					//inputNoLigtn.classList.add("form-check-input");
					inputNoLigtn.type = "radio";
					inputNoLigtn.name = "ligtn_case_carer_yn";
					inputNoLigtn.id = "ligtn_case_carer_n";
					inputNoLigtn.value = "n";
					inputNoLigtn.setAttribute("onclick", "disabledToggle('n', 'ligtn_case_carer_etc');");
					inputNoLigtnBox.appendChild(inputNoLigtn);
					
					var labelNoLigtn = document.createElement("label");
					//labelNoLigtn.classList.add("form-check-label");
					labelNoLigtn.for = "ligtn_case_carer_n";
					labelNoLigtn.innerText = "무";
					inputNoLigtnBox.appendChild(labelNoLigtn);
					
	                var bodyTr1Td2 = document.createElement("td");
	                //bodyTr1Td2.innerText=jsonObj.map.LIGTN_CASE_CARER_ETC;
	                bodyTr1.appendChild(bodyTr1Td2);
	                
	                var InputligtnCaseCarerEtc = document.createElement("input");
	                InputligtnCaseCarerEtc.id = "ligtn_case_carer_etc";
	                InputligtnCaseCarerEtc.name = "ligtn_case_carer_etc";
	                InputligtnCaseCarerEtc.style.width = "100%";
	                //InputligtnCaseCarerEtc.classList.add("form-control");
	                
	                InputligtnCaseCarerEtc.value = jsonObj.map.LIGTN_CASE_CARER_ETC; 
	                var ligtnCaseCarerEtc =  jsonObj.map.LIGTN_CASE_CARER_ETC
	                if(ligtnCaseCarerEtc == "" || ligtnCaseCarerEtc == undefined) {
		                InputligtnCaseCarerEtc.value = ""; 
	                } else {
		                InputligtnCaseCarerEtc.value = ligtnCaseCarerEtc; 
	                }
	                
	                bodyTr1Td2.appendChild(InputligtnCaseCarerEtc);
	
					var ligtn_case_carer_yn = jsonObj.map.LIGTN_CASE_CARER_YN;
					//console.log("ligtn_case_carer_yn : " + ligtn_case_carer_yn);
					if(ligtn_case_carer_yn == 'y') {
						inputYesLigtn.checked = true;
						InputligtnCaseCarerEtc.disabled = false;
					} else if(ligtn_case_carer_yn == 'n') {
						inputNoLigtn.checked = true;
						InputligtnCaseCarerEtc.disabled = true;
					} 
					
	                // var bodyTr1Th2 = document.createElement("th");
	                // bodyTr1Th2.classList.add("text-center");
	                // bodyTr1Th2.classList.add("table-light");
	                // bodyTr1Th2.innerText="보험업계 경력 내용";
	                // bodyTr1.appendChild(bodyTr1Th2);
	
	                // var bodyTr1Td2 = document.createElement("td");
	                // bodyTr1Td2.innerText = "적으셈";
	                // bodyTr1.appendChild(bodyTr1Td2);
	
	                var bodyTr2 = document.createElement("tr");
	                bodyTr2.setAttribute("rowspan", "2");
	                bodyTr2.setAttribute("scope", "row");
	                bodyTr2.setAttribute("style", "line_height:100px");
	                bodyTr2.classList.add("text-center");
	                bodyTr2.classList.add("border-2");
	                tbody.appendChild(bodyTr2);
	
	                var bodyTr2Th1 = document.createElement("th");
	                bodyTr2Th1.classList.add("table-light");
	                bodyTr2Th1.innerText ="보험업계 경력";
	                bodyTr2.appendChild(bodyTr2Th1);
					
					var bodyTr2Td1 = document.createElement("td");
					bodyTr2.appendChild(bodyTr2Td1);
					
					var inputYesInsrnBox = document.createElement("div");
					//inputYesInsrnBox.classList.add("form-check");
					inputYesInsrnBox.style.float = "left";
					inputYesInsrnBox.style.margin = "4px 20px 0px 17px";
					bodyTr2Td1.appendChild(inputYesInsrnBox);
					
					var inputYesInsrn = document.createElement("input");
					//inputYesInsrn.classList.add("form-check-input");
					inputYesInsrn.type = "radio";
					inputYesInsrn.name = "insrn_indst_carer_yn";
					inputYesInsrn.id = "insrn_indst_carer_y";
					inputYesInsrn.value = "y";
					inputYesInsrn.style.float = "none";
					//inputYesInsrn.style.marginRight = "4px";
					inputYesInsrn.setAttribute("onclick", "disabledToggle('y', 'insrn_indst_carer_etc');");
					inputYesInsrnBox.appendChild(inputYesInsrn);
					
					var labelYesInsrn = document.createElement("label");
					//labelYesInsrn.classList.add("form-check-label");
					labelYesInsrn.for = "insrn_indst_carer_y";
					labelYesInsrn.innerText = "유";
					inputYesInsrnBox.appendChild(labelYesInsrn);
					
					var inputNoInsrnBox = document.createElement("div");
					//inputNoInsrnBox.classList.add("form-check");
					inputNoInsrnBox.style.float = "left";
					inputNoInsrnBox.style.marginTop = "4px";
					bodyTr2Td1.appendChild(inputNoInsrnBox);
					
					var inputNoInsrn = document.createElement("input");
					//inputNoInsrn.classList.add("form-check-input");
					inputNoInsrn.type = "radio";
					inputNoInsrn.name = "insrn_indst_carer_yn";
					inputNoInsrn.id = "insrn_indst_carer_n";
					inputNoInsrn.value = "n";
					inputNoInsrn.style.float = "none";
					//inputNoInsrn.style.marginRight = "5px";
					inputNoInsrn.setAttribute("onclick", "disabledToggle('n', 'insrn_indst_carer_etc');");
					inputNoInsrnBox.appendChild(inputNoInsrn);
					
					var labelNoInsrn = document.createElement("label");
					//labelNoInsrn.classList.add("form-check-label");
					labelNoInsrn.for = "insrn_indst_carer_n";
					labelNoInsrn.innerText = "무";
					inputNoInsrnBox.appendChild(labelNoInsrn);
					
	                var bodyTr2Td2 = document.createElement("td");
	                //bodyTr2Td2.innerText=jsonObj.map.INSRN_INDST_CARER_ETC;
	                bodyTr2.appendChild(bodyTr2Td2);
	                
	                var InputInsrnIndstCarerEtc = document.createElement("input");
	                InputInsrnIndstCarerEtc.id = "insrn_indst_carer_etc";
	                InputInsrnIndstCarerEtc.name = "insrn_indst_carer_etc";
	                InputInsrnIndstCarerEtc.style.width = "100%";
	               // InputInsrnIndstCarerEtc.classList.add("form-control");
	                var insrnIndstCarerEtc =  jsonObj.map.INSRN_INDST_CARER_ETC
	                if(insrnIndstCarerEtc == "" || insrnIndstCarerEtc == undefined) {
		                InputInsrnIndstCarerEtc.value = ""; 
	                } else {
		                InputInsrnIndstCarerEtc.value = insrnIndstCarerEtc; 
	                }
	                bodyTr2Td2.appendChild(InputInsrnIndstCarerEtc);
	
					// 유무 체크
	                var insrn_indst_carer_yn = jsonObj.map.INSRN_INDST_CARER_YN;
					//console.log("insrn_indst_carer_yn : " + insrn_indst_carer_yn);
					if(insrn_indst_carer_yn == 'y') {
						inputYesInsrn.checked = true;
						InputInsrnIndstCarerEtc.disabled = false;
					} else if(insrn_indst_carer_yn == 'n') {
						inputNoInsrn.checked = true;
						InputInsrnIndstCarerEtc.disabled = true;
					} 
	
					//////////////////
					/*
					var insrn_indst_carer_yn = jsonObj.map.INSRN_INDST_CARER_YN;
					if(insrn_indst_carer_yn == 'y') {
						inputNoInsrn.checked = false;
						inputYesInsrn.checked = true;
						document.querySelector("input[name='insrn_indst_carer_yn']").value = 'y'
						
					} else if(insrn_indst_carer_yn == 'n') {
						inputNoInsrn.checked = true;
						inputYesInsrn.checked = false;
						document.querySelector("input[name='insrn_indst_carer_yn']").value = 'n'
					} 
					
					if(insrn_indst_carer_yn_val == 'y') {
						InputInsrnIndstCarerEtc.disabled = false;
					} else if(insrn_indst_carer_yn_val == 'n') {
						InputInsrnIndstCarerEtc.disabled = true;
					}
					
					var checkValInsrn = document.querySelector("input[name='insrn_indst_carer_yn']:checked").value;
					if(checkValInsrn == 'y') {
						InputInsrnIndstCarerEtc.disabled = false;
					} else if(checkValInsrn == 'n') {
						InputInsrnIndstCarerEtc.disabled = true;				
					}
					*//////////////////////////////
					
	                var bodyTr3 = document.createElement("tr");
	                bodyTr3.setAttribute("rowspan", "2");
	                bodyTr3.setAttribute("scope", "row");
	                bodyTr3.classList.add("text-center");
	                bodyTr3.classList.add("border-2");
	                //bodyTr3.setAttribute("style", "line-height:100px");
	                tbody.appendChild(bodyTr3);
	
	                var bodyTr3Th1 = document.createElement("th");
	                bodyTr3Th1.classList.add("table-light");
	                bodyTr3Th1.innerText="형사처벌 경력";
	                bodyTr3.appendChild(bodyTr3Th1);
	                
	                var bodyTr3Td1 = document.createElement("td");
	                bodyTr3.appendChild(bodyTr3Td1);
	                
	                var inputYesCriBox = document.createElement("div");
	                //inputYesCriBox.classList.add("form-check");
	                inputYesCriBox.style.float = "left";
	                inputYesCriBox.style.margin = "4px 20px 0px 17px";
	                bodyTr3Td1.appendChild(inputYesCriBox);
	                
	                var inputYesCri = document.createElement("input");
	                //inputYesCri.classList.add("form-check-input");
	                inputYesCri.type = "radio";
	                inputYesCri.name = "criminal_penalty_carer_yn";
	                inputYesCri.id = "criminal_penalty_carer_y";
	                inputYesCri.value = "y";
	                inputYesCri.style.float = "none";
	                //inputYesCri.style.marginRight = "5px";
	                inputYesCri.setAttribute("onclick", "disabledToggle('y', 'criminal_penalty_carer_etc');");
	                inputYesCriBox.appendChild(inputYesCri);
	                
	                var labelYesCri = document.createElement("label");
	               // labelYesCri.classList.add("form-check-label");
	                labelYesCri.for = "criminal_penalty_carer_y";
	                labelYesCri.innerText = "유";
	                inputYesCriBox.appendChild(labelYesCri);
	                
	                var inputNoCriBox = document.createElement("div");
					//inputNoCriBox.classList.add("form-check");
					inputNoCriBox.style.float = "left";
					inputNoCriBox.style.marginTop = "4px";
					bodyTr3Td1.appendChild(inputNoCriBox);
					
					var inputNoCri = document.createElement("input");
					//inputNoCri.classList.add("form-check-input");
					inputNoCri.type = "radio";
					inputNoCri.name = "criminal_penalty_carer_yn";
					inputNoCri.id = "criminal_penalty_carer_ n";
					inputNoCri.value = "n";
					//inputNoCri.style.float = "none";
					//inputNoCri.style.marginRight = "5px";
					inputNoCri.setAttribute("onclick", "disabledToggle('n', 'criminal_penalty_carer_etc');");
					inputNoCriBox.appendChild(inputNoCri);
					
					var labelNoCri = document.createElement("label");
					//labelNoCri.classList.add("form-check-label");
					labelNoCri.for = "criminal_penalty_carer_n";
					labelNoCri.innerText = "무";
					inputNoCriBox.appendChild(labelNoCri);
					
					var bodyTr3Td2 = document.createElement("td");
	                bodyTr3.appendChild(bodyTr3Td2);
	                
	               	var inputCriPenCarerEtc = document.createElement("input");
	               	inputCriPenCarerEtc.id = "criminal_penalty_carer_etc";
	               	inputCriPenCarerEtc.name = "criminal_penalty_carer_etc";
	               	inputCriPenCarerEtc.style.width = "100%";
	               	//inputCriPenCarerEtc.classList.add("form-control");
	               	var criPenCarerEtc = jsonObj.map.CRIMINAL_PENALTY_CARER_ETC;
	               	if(criPenCarerEtc == "" || criPenCarerEtc == undefined) {
	               		inputCriPenCarerEtc.value = "";
	               	} else {
	               		inputCriPenCarerEtc.value = criPenCarerEtc; 
	               	}
	               	bodyTr3Td2.appendChild(inputCriPenCarerEtc);
					
					// 유무 체크
	                var criminal_penalty_carer_yn = jsonObj.map.CRIMINAL_PENALTY_CARER_YN;
					//console.log("criminal_penalty_carer_yn : " + criminal_penalty_carer_yn);
					if(criminal_penalty_carer_yn == 'y') {
						inputYesCri.checked = true;
						inputCriPenCarerEtc.disabled = false;
					} else if(criminal_penalty_carer_yn == 'n') {
						inputNoCri.checked = true;
						inputCriPenCarerEtc.disabled = true;
					} 
					
					// 저장버튼
					var submitRow = document.createElement("div");
	                submitRow.classList.add("row");
	                submitRow.classList.add("text-center");
	                tableFiveFrm.appendChild(submitRow);
	                
	                var submitCol = document.createElement("div");
	                submitCol.classList.add("col");
	                submitRow.appendChild(submitCol);
				
	                var submitBtn = document.createElement("button");
	                submitBtn.classList.add("btn");
	                submitBtn.classList.add("btn-sm");
	                submitBtn.classList.add("btn-secondary");
	                submitBtn.classList.add("mx-2");
	                submitBtn.classList.add("frmSubmit");
		                
	                submitBtn.id = "tableFiveFrm";
	                submitBtn.type = "button";
	                submitBtn.innerText = "저장";
	                submitBtn.setAttribute("onclick", "tableFiveFrmSubmit();");
	                submitCol.appendChild(submitBtn);
	                
		            var finalSubmitBtn = document.createElement("button");
	                finalSubmitBtn.classList.add("btn");
	                finalSubmitBtn.classList.add("btn-sm");
	                finalSubmitBtn.classList.add("btn-outline-success");
	                finalSubmitBtn.innerText = "작성완료";
	                finalSubmitBtn.setAttribute("onclick", "application(true);");
	                submitCol.appendChild(finalSubmitBtn);    
	                
	                var properNum = document.createElement("input");
	                properNum.type = "hidden";
	                properNum.value = jsonObj.map.APLCN_DTLS_PROPER_NUM;
	                properNum.name = "aplcn_dtls_proper_num";
	                tableFiveFrm.appendChild(properNum);
	                
	                commentListBox.appendChild(rowBox);
	                
                } else {	// 등재신청 결과값 null일 때
                	var errMsgRow = document.createElement("div");
                	errMsgRow.classList.add("row");
                	
                	var errMsgCol = document.createElement("div");
                	errMsgCol.classList.add("col");
                	errMsgRow.appendChild(errMsgCol);
                	
                	var errMsgSpan = document.createElement("span");
                	errMsgSpan.innerText = "등재신청 정보를 찾을 수 없습니다.";
                	errMsgCol.appendChild(errMsgSpan);
                	
                	commentListBox.appendChild(errMsgRow);
                }

            }
    }
		 xhr.open("get" , "../admin/selTableOne?aplcn_dtls_proper_num=" + userNo); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..			
}

function tableSixInfo(){
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				var data = jsonObj.map;

                var commentListBox = document.getElementById("nav-info");
				commentListBox.innerHTML = "";

				if(data != null && data != undefined) {
	                var rowBox = document.createElement("div");
	                rowBox.classList.add("row");
	   	
	   				var txtRow = document.createElement("div");
	                txtRow.classList.add("row");
	                txtRow.classList.add("mx-0");
	                txtRow.classList.add("border-bottom");
	                txtRow.classList.add("pb-4");
	                rowBox.appendChild(txtRow);
	                
	                var txtCol = document.createElement("div");
	                txtCol.classList.add("col");
	                txtRow.appendChild(txtCol);
	                
	                var txtSpan = document.createElement("span");
	                txtSpan.innerText = "* 모든 값은 필수입력입니다.";
	                txtSpan.classList.add("text-danger");
	                txtSpan.classList.add("fw-bold");
	                txtCol.appendChild(txtSpan);
	                
	                /*
	                var subNab1 = document.createElement("div");
	                subNab1.classList.add("row");
	                subNab1.classList.add("mx-0");
	                subNab1.classList.add("border-bottom");
	                subNab1.classList.add("pb-4");
	                rowBox.appendChild(subNab1);
	
	                var subNab1Span = document.createElement("span");
	                subNab1Span.innerText="기본정보";
	                subNab1.appendChild(subNab1Span);
	
	                var subNab1SpanFromI = document.createElement("i");
	                subNab1SpanFromI.classList.add("bi");
	                subNab1SpanFromI.classList.add("bi-circle-fill");
	                subNab1Span.appendChild(subNab1SpanFromI);
					*/
	
	                //table시작
	                var tableRow = document.createElement("div");
	                tableRow.classList.add("row");
	                tableRow.classList.add("mx-0");
	                tableRow.classList.add("px-0");
	                rowBox.appendChild(tableRow);
	
					var tableSixFrm = document.createElement("form");
	                tableSixFrm.id = "tableSixFrm";
	                tableSixFrm.name = "tableSixFrm";
	                tableRow.appendChild(tableSixFrm);
	
	                var table = document.createElement("table");
	                table.classList.add("table");
	                table.classList.add("table-bordered");
	                tableSixFrm.appendChild(table);
	
	                //여기까진 같음
	                
	                var colGroup = document.createElement("colgroup");
	                table.appendChild(colGroup);
	
	                var colGroupOne = document.createElement("col");
	                colGroupOne.setAttribute("width", "15%");
	                colGroup.appendChild(colGroupOne);
	
	                var colGroupTwo = document.createElement("col");
	                colGroupTwo.setAttribute("width", "35%");
	                colGroup.appendChild(colGroupTwo);
	
	                var colGroupThree = document.createElement("col");
	                colGroupThree.setAttribute("width", "15%");
	                colGroup.appendChild(colGroupThree);
	
	                var colGroupFour = document.createElement("col");
	                colGroupFour.setAttribute("width", "35%");
	                colGroup.appendChild(colGroupFour);
	
	                var thead = document.createElement("thead");
	                table.appendChild(thead);
	
	                var theadTr = document.createElement("tr");
	                thead.appendChild(theadTr);
	
	                var theadTrTh1 = document.createElement("th");
	                theadTrTh1.classList.add("text-center");
	                theadTrTh1.classList.add("table-light");
	                theadTrTh1.innerText="학교명";
	                theadTr.appendChild(theadTrTh1);
					
	                var theadTrTd1 = document.createElement("td");
	                theadTr.appendChild(theadTrTd1);
	
					var inputSchoolName = document.createElement("input");
					inputSchoolName.type = "text";
					//inputSchoolName.classList.add("form-control");
					inputSchoolName.value = jsonObj.map.EDCTN_SCHOOL_NAME;
					inputSchoolName.id = "edctn_school_name";
					inputSchoolName.name = "edctn_school_name";
					theadTrTd1.appendChild(inputSchoolName);
	
	                var theadTrTh2 = document.createElement("th");
	                theadTrTh2.classList.add("text-center");
	                theadTrTh2.classList.add("table-light");
	                theadTrTh2.innerText="학과전공";
	                theadTr.appendChild(theadTrTh2);
	
	                var theadTrTd2 = document.createElement("td");
	                theadTr.appendChild(theadTrTd2);
	
					var inputEdctnMajor = document.createElement("input");
					inputEdctnMajor.type = "text";
					//inputEdctnMajor.classList.add("form-control");
					inputEdctnMajor.value = jsonObj.map.EDCTN_MAJOR;
					inputEdctnMajor.id = "edctn_major";
					inputEdctnMajor.name = "edctn_major";
					theadTrTd2.appendChild(inputEdctnMajor);
	
	                var tbody = document.createElement("tbody");
	                table.appendChild(tbody);
	
	                var bodyTr1 = document.createElement("tr");
	                tbody.appendChild(bodyTr1);
	
	                var bodyTr1Th1 = document.createElement("th");
	                bodyTr1Th1.classList.add("text-center");
	                bodyTr1Th1.classList.add("table-light");
	                bodyTr1Th1.innerText="입학일";
	                bodyTr1.appendChild(bodyTr1Th1);
	
	                var bodyTr1Td1 = document.createElement("td");
	                bodyTr1.appendChild(bodyTr1Td1);
	
					var inputEdctnAdmsnDate = document.createElement("input");
					inputEdctnAdmsnDate.type = "date";
					//inputEdctnAdmsnDate.classList.add("form-control");
					//console.log(jsonObj.map.EDCTN_ADMSN_DATE);
					inputEdctnAdmsnDate.value = setDateInput(jsonObj.map.EDCTN_ADMSN_DATE);
					inputEdctnAdmsnDate.id = "edctn_admsn_date";
					inputEdctnAdmsnDate.name = "edctn_admsn_date";
					bodyTr1Td1.appendChild(inputEdctnAdmsnDate);
	
	                var bodyTr1Th2 = document.createElement("th");
	                bodyTr1Th2.classList.add("text-center");
	                bodyTr1Th2.classList.add("table-light");
	                bodyTr1Th2.innerText="종료일";
	                bodyTr1.appendChild(bodyTr1Th2);
	
	                var bodyTr1Td2 = document.createElement("td");
	                bodyTr1.appendChild(bodyTr1Td2);
	                
	                var inputEdctnGrdtnDate = document.createElement("input");
	                inputEdctnGrdtnDate.type = "date";
	                //inputEdctnGrdtnDate.classList.add("form-control");
	                inputEdctnGrdtnDate.value = setDateInput(jsonObj.map.EDCTN_GRDTN_DATE);
	                inputEdctnGrdtnDate.id = "edctn_grdtn_date";
	                inputEdctnGrdtnDate.name = "edctn_grdtn_date";
	                bodyTr1Td2.appendChild(inputEdctnGrdtnDate);
	
	                var bodyTr2 = document.createElement("tr");
	                tbody.appendChild(bodyTr2);
	
	                var bodyTr2Th1 = document.createElement("th");
	                bodyTr2Th1.classList.add("text-center");
	                bodyTr2Th1.classList.add("table-light");
	                bodyTr2Th1.innerText="학위";
	                bodyTr2.appendChild(bodyTr2Th1);
	
	                var bodyTr2Td1 = document.createElement("td");
	                bodyTr2.appendChild(bodyTr2Td1);
	                
	                var inputEdctnDegree = document.createElement("input");
	                inputEdctnDegree.type = "text";
	                //inputEdctnDegree.classList.add("form-control");
	                inputEdctnDegree.value = jsonObj.map.EDCTN_DEGREE;
	                inputEdctnDegree.id = "edctn_degree";
	                inputEdctnDegree.name = "edctn_degree";
	                bodyTr2Td1.appendChild(inputEdctnDegree);
	
	                var bodyTr2Th2 = document.createElement("th");
	                bodyTr2Th2.innerText="최종학력";
	                bodyTr2Th2.classList.add("text-center");
	                bodyTr2Th2.classList.add("table-light");
	                bodyTr2.appendChild(bodyTr2Th2);
	
	                var bodyTr2Td2 = document.createElement("td");
	                bodyTr2.appendChild(bodyTr2Td2);
	                
	                
	                // 220923 hyejin 추가
	                var inputEdctnFinalYBox = document.createElement("div");
	                //inputEdctnFinalYBox.classList.add("form-check");
	                inputEdctnFinalYBox.style.float = "left";
	                inputEdctnFinalYBox.style.margin = "4px 40px 0px 43px";
					bodyTr2Td2.appendChild(inputEdctnFinalYBox);
					
					var inputEdctnFinalY = document.createElement("input");
					//inputEdctnFinalY.classList.add("form-check-input");
					inputEdctnFinalY.type = "radio";
					inputEdctnFinalY.name = "edctn_final_yn";
					inputEdctnFinalY.id = "edctn_final_y";
					inputEdctnFinalY.value = "y";
					inputEdctnFinalY.marginRight = "5px";
					inputEdctnFinalYBox.appendChild(inputEdctnFinalY);
					
					var labelEdctnFinalY = document.createElement("label");
					//labelEdctnFinalY.classList.add("form-check-label");
					labelEdctnFinalY.setAttribute("for", "edctn_final_y");
					labelEdctnFinalY.innerText = "예";
					inputEdctnFinalYBox.appendChild(labelEdctnFinalY);
					
					
					var inputEdctnFinalNBox = document.createElement("div");
					//inputEdctnFinalNBox.classList.add("form-check");
					inputEdctnFinalNBox.style.float = "left";
					inputEdctnFinalNBox.style.marginTop = "4px";
					bodyTr2Td2.appendChild(inputEdctnFinalNBox);
					
					var inputEdctnFinalN = document.createElement("input");
					//inputEdctnFinalN.classList.add("form-check-input");
					inputEdctnFinalN.type = "radio";
					inputEdctnFinalN.name = "edctn_final_yn";
					inputEdctnFinalN.id = "edctn_final_n";
					inputEdctnFinalN.value = "n";
					inputEdctnFinalN.style.marginRight = "5px";
					inputEdctnFinalNBox.appendChild(inputEdctnFinalN);
					
					var labelEdctnFinalN = document.createElement("label");
					//labelEdctnFinalN.classList.add("form-check-label");
					labelEdctnFinalN.setAttribute("for", "edctn_final_n");
					labelEdctnFinalN.innerText = "아니오";
					inputEdctnFinalNBox.appendChild(labelEdctnFinalN);
					
					// 최종학력 체크
					var edctnFinalVal = jsonObj.map.EDCTN_FINAL_YN;
					//console.log("최종학력인가 ? " + edctnFinalVal);
					if(edctnFinalVal == 'y') {
						inputEdctnFinalY.checked = true;
					} else if(edctnFinalVal == 'n') {
						inputEdctnFinalN.checked = true;
					}
					
					var properNum = document.createElement("input");
					properNum.type = "hidden";
					properNum.value = jsonObj.map.APLCN_DTLS_PROPER_NUM;
					properNum.id = "aplcn_dtls_proper_num";
					properNum.name = "aplcn_dtls_proper_num";
					tableSixFrm.appendChild(properNum);
	                
	                // 저장버튼
	                var submitRow = document.createElement("div");
	                submitRow.classList.add("row");
	                submitRow.classList.add("text-center");
	                tableSixFrm.appendChild(submitRow);
	                
	                var submitCol = document.createElement("div");
	                submitCol.classList.add("col");
	                submitRow.appendChild(submitCol);
	                
	                var submitBtn = document.createElement("button");
	                submitBtn.classList.add("btn");
	                submitBtn.classList.add("btn-sm");
	                submitBtn.classList.add("btn-secondary");
	                submitBtn.classList.add("mx-2");
	                submitBtn.classList.add("frmSubmit");
		                
		            submitBtn.id = "tableOneFrm";
	                submitBtn.type = "button";
	                submitBtn.innerText = "저장";
	                submitBtn.setAttribute("onclick", "tableSixFrmSubmit();")
	                submitCol.appendChild(submitBtn);
	                
	                var finalSubmitBtn = document.createElement("button");
	                finalSubmitBtn.classList.add("btn");
	                finalSubmitBtn.classList.add("btn-sm");
	                finalSubmitBtn.classList.add("btn-outline-success");
	                finalSubmitBtn.innerText = "작성완료";
	                finalSubmitBtn.setAttribute("onclick", "application(true);");
	                submitCol.appendChild(finalSubmitBtn);
	
	                commentListBox.appendChild(rowBox);
	                
                } else {	// 등재신청 결과 null일때
                	var errMsgRow = document.createElement("div");
                	errMsgRow.classList.add("row");
                	
                	var errMsgCol = document.createElement("div");
                	errMsgCol.classList.add("col");
                	errMsgRow.appendChild(errMsgCol);
                	
                	var errMsgSpan = document.createElement("span");
                	errMsgSpan.innerText = "등재신청 정보를 찾을 수 없습니다.";
                	errMsgCol.appendChild(errMsgSpan);
                	
                	commentListBox.appendChild(errMsgRow);
                
                }
                
            }
			
    }
        xhr.open("get" , "../admin/selTableOne?aplcn_dtls_proper_num=" + userNo); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..	
}

function tableSevenInfo(){
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				var data = jsonObj.map;

                var commentListBox = document.getElementById("nav-info");
				commentListBox.innerHTML = "";

				if(data != null && data != undefined) {
	                var rowBox = document.createElement("div");
	                rowBox.classList.add("row"); 
	                
	                var txtRow = document.createElement("div");
	                txtRow.classList.add("row");
	                txtRow.classList.add("mx-0");
	                txtRow.classList.add("border-bottom");
	                txtRow.classList.add("pb-4");
	                rowBox.appendChild(txtRow);
	                
	                var txtCol = document.createElement("div");
	                txtCol.classList.add("col");
	                txtRow.appendChild(txtCol);
	                
	                var txtSpan = document.createElement("span");
	                txtSpan.innerText = "* 모든 값은 필수입력입니다.";
	                txtSpan.classList.add("text-danger");
	                txtSpan.classList.add("fw-bold");
	                txtCol.appendChild(txtSpan);
	
	                //table시작
	
	                var tableRow = document.createElement("div");
	                tableRow.classList.add("row");
	                tableRow.classList.add("mx-0");
	                tableRow.classList.add("px-0");
	                rowBox.appendChild(tableRow);
					
					var tableSevenFrm = document.createElement("form");
					tableSevenFrm.id = "tableSevenFrm";
					tableSevenFrm.name = "tableSevenFrm";
					rowBox.appendChild(tableSevenFrm);
	
	                var table = document.createElement("table");
	                table.classList.add("table");
	                table.classList.add("table-bordered");
	                tableSevenFrm.appendChild(table);
	
	                //여기까진 같음
	                
	                var colGroup = document.createElement("colgroup");
	                table.appendChild(colGroup);
	
	                var colGroupOne = document.createElement("col");
	                colGroupOne.setAttribute("width", "15%");
	                colGroup.appendChild(colGroupOne);
	
	                var colGroupTwo = document.createElement("col");
	                colGroupTwo.setAttribute("width", "35%");
	                colGroup.appendChild(colGroupTwo);
	
	                var colGroupThree = document.createElement("col");
	                colGroupThree.setAttribute("width", "15%");
	                colGroup.appendChild(colGroupThree);
	
	                var colGroupFour = document.createElement("col");
	                colGroupFour.setAttribute("width", "35%");
	                colGroup.appendChild(colGroupFour);
	
	                var thead = document.createElement("thead");
	                table.appendChild(thead);
	
	                var theadTr = document.createElement("tr");
	                thead.appendChild(theadTr);
	
	                var theadTrTh1 = document.createElement("th");
	                theadTrTh1.classList.add("text-center");
	                theadTrTh1.classList.add("table-light");
	                theadTrTh1.innerText="회사/활동기관";
	                theadTr.appendChild(theadTrTh1);
	
	                var theadTrTd1 = document.createElement("td");
	                theadTr.appendChild(theadTrTd1);
	                
	                var inputCompanyName = document.createElement("input");
	                //inputCompanyName.classList.add("form-control");
	                inputCompanyName.type = "text";
	                inputCompanyName.id = "company_name";
	                inputCompanyName.name = "company_name";
	                inputCompanyName.value = jsonObj.map.COMPANY_NAME;
	                theadTrTd1.appendChild(inputCompanyName);
	
	                var theadTrTh2 = document.createElement("th");
	                theadTrTh2.classList.add("text-center");
	                theadTrTh2.classList.add("table-light");
	                theadTrTh2.innerText="경력 구분";
	                theadTr.appendChild(theadTrTh2);
	
	                var theadTrTd2 = document.createElement("td");
	                theadTr.appendChild(theadTrTd2);
	                
	                var inputCarerType = document.createElement("input");
	                //inputCarerType.classList.add("form-control");
	                inputCarerType.type = "text";
	                inputCarerType.id = "carer_type";
	                inputCarerType.name = "carer_type";
	                inputCarerType.value = jsonObj.map.CARER_TYPE;
	                theadTrTd2.appendChild(inputCarerType);
	
	                var tbody = document.createElement("tbody");
	                table.appendChild(tbody);
	
	                var bodyTr1 = document.createElement("tr");
	                tbody.appendChild(bodyTr1);
	
	                var bodyTr1Th1 = document.createElement("th");
	                bodyTr1Th1.classList.add("text-center");
	                bodyTr1Th1.classList.add("table-light");
	                bodyTr1Th1.innerText="근무 시작 일자";
	                bodyTr1.appendChild(bodyTr1Th1);
	
	                var bodyTr1Td1 = document.createElement("td");
	                bodyTr1.appendChild(bodyTr1Td1);
	                
	                var inputWorkStartDate = document.createElement("input");
	                //inputWorkStartDate.classList.add("form-control");
	                inputWorkStartDate.type = "date";
	                inputWorkStartDate.id = "work_start_date";
	                inputWorkStartDate.name = "work_start_date";
	                inputWorkStartDate.value = setDateInput(jsonObj.map.WORK_START_DATE);
	                bodyTr1Td1.appendChild(inputWorkStartDate);
	
	                var bodyTr1Th2 = document.createElement("th");
	                bodyTr1Th2.classList.add("text-center");
	                bodyTr1Th2.classList.add("table-light");
	                bodyTr1Th2.innerText="근무 종료 일자";
	                bodyTr1.appendChild(bodyTr1Th2);
	
	                var bodyTr1Td2 = document.createElement("td");
	                bodyTr1.appendChild(bodyTr1Td2);
	
					var inputWorkEndDate = document.createElement("input");
	                //inputWorkEndDate.classList.add("form-control");
	                inputWorkEndDate.type = "date";
	                inputWorkEndDate.id = "work_end_date";
	                inputWorkEndDate.name = "work_end_date";
	                inputWorkEndDate.value = setDateInput(jsonObj.map.WORK_END_DATE);
	                bodyTr1Td2.appendChild(inputWorkEndDate);
	
	                var bodyTr2 = document.createElement("tr");
	                tbody.appendChild(bodyTr2);
	
	                var bodyTr2Th1 = document.createElement("th");
	                bodyTr2Th1.classList.add("text-center");
	                bodyTr2Th1.classList.add("table-light");
	                bodyTr2Th1.innerText="직책";
	                bodyTr2.appendChild(bodyTr2Th1);
	
	                var bodyTr2Td1 = document.createElement("td");
	                bodyTr2.appendChild(bodyTr2Td1);
	                
	                var inputWorkPosition = document.createElement("input");
	                //inputWorkPosition.classList.add("form-control");
	                inputWorkPosition.type = "text";
	                inputWorkPosition.id = "work_position";
	                inputWorkPosition.name = "work_position";
	                inputWorkPosition.value = jsonObj.map.WORK_POSITION;
	                bodyTr2Td1.appendChild(inputWorkPosition);
	
	                var bodyTr2Th2 = document.createElement("th");
	                bodyTr2Th2.innerText="부서";
	                bodyTr2Th2.classList.add("text-center");
	                bodyTr2Th2.classList.add("table-light");
	                bodyTr2.appendChild(bodyTr2Th2);
	
	                var bodyTr2Td2 = document.createElement("td");
	                bodyTr2.appendChild(bodyTr2Td2);
	
					var inputWorkDepartment = document.createElement("input");
	                //inputWorkDepartment.classList.add("form-control");
	                inputWorkDepartment.type = "text";
	                inputWorkDepartment.id = "work_department";
	                inputWorkDepartment.name = "work_department";
	                inputWorkDepartment.value = jsonObj.map.WORK_DEPARTMENT;
	                bodyTr2Td2.appendChild(inputWorkDepartment);
	
	                var bodyTr3 = document.createElement("tr");
	                tbody.appendChild(bodyTr3);
	
	                var bodyTr3Th = document.createElement("th");
	                bodyTr3Th.classList.add("text-center");
	                bodyTr3Th.classList.add("table-light");
	                bodyTr3Th.innerText="수행 업무";
	                bodyTr3.appendChild(bodyTr3Th);
	
	                var bodyTr3Td = document.createElement("td");
	                bodyTr3Td.setAttribute("colspan", "3");
	                bodyTr3.appendChild(bodyTr3Td);
	
					var inputWorkDescription = document.createElement("input");
	                //inputWorkDescription.classList.add("form-control");
	                inputWorkDescription.type = "text";
	                inputWorkDescription.id = "work_description";
	                inputWorkDescription.name = "work_description";
	                inputWorkDescription.value = jsonObj.map.WORK_DESCRIPTION;
	                bodyTr3Td.appendChild(inputWorkDescription);
	
					var bodyTr4 = document.createElement("tr");
	                tbody.appendChild(bodyTr4);
	
	                var bodyTr4Th = document.createElement("th");
	                bodyTr4Th.classList.add("text-center");
	                bodyTr4Th.classList.add("table-light");
	                bodyTr4Th.innerText="활동경력";
	                bodyTr4.appendChild(bodyTr4Th);
	
	                var bodyTr4Td = document.createElement("td");
	                bodyTr4Td.setAttribute("colspan", "3");
	                bodyTr4.appendChild(bodyTr4Td);
	
					var inputCarerDesc = document.createElement("textarea");
	                //inputCarerDesc.classList.add("form-control");
	                inputCarerDesc.id = "carer_description";
	                inputCarerDesc.name = "carer_description";
	                inputCarerDesc.value = jsonObj.map.CARER_DESCRIPTION;
	                bodyTr4Td.appendChild(inputCarerDesc);
	                
	                var bodyTr5 = document.createElement("tr");
	                tbody.appendChild(bodyTr5);
	
	                var bodyTr5Th = document.createElement("th");
	                bodyTr5Th.classList.add("text-center");
	                bodyTr5Th.classList.add("table-light");
	                bodyTr5Th.innerText="활동경력";
	                bodyTr5.appendChild(bodyTr5Th);
	
	                var bodyTr5Td = document.createElement("td");
	                bodyTr5Td.setAttribute("colspan", "3");
	                bodyTr5.appendChild(bodyTr5Td);
	
					var inputSpecialNoteDesc = document.createElement("textarea");
	                //inputSpecialNoteDesc.classList.add("form-control");
	                inputSpecialNoteDesc.id = "special_note_description";
	                inputSpecialNoteDesc.name = "special_note_description";
	                inputSpecialNoteDesc.value = jsonObj.map.SPECIAL_NOTE_DESCRIPTION;
	                bodyTr5Td.appendChild(inputSpecialNoteDesc);
	                
	                var properNum = document.createElement("input");
	                properNum.id = "aplcn_dtls_proper_num";
	                properNum.name = "aplcn_dtls_proper_num";
	                properNum.value = jsonObj.map.APLCN_DTLS_PROPER_NUM;
	                properNum.type = "hidden";
	                tableSevenFrm.appendChild(properNum);
					
	                // 저장버튼
	                var submitRow = document.createElement("div");
	                submitRow.classList.add("row");
	                submitRow.classList.add("text-center");
	                tableSevenFrm.appendChild(submitRow);
	                
	                var submitCol = document.createElement("div");
	                submitCol.classList.add("col");
	                submitRow.appendChild(submitCol);
	                
	                var submitBtn = document.createElement("button");
	                submitBtn.classList.add("btn");
	                submitBtn.classList.add("btn-sm");
	                submitBtn.classList.add("btn-secondary");
	                submitBtn.classList.add("mx-2");
	                submitBtn.classList.add("frmSubmit");
	                
	                submitBtn.id = "tableSevenFrm";
	                submitBtn.type = "button";
	                submitBtn.innerText = "저장";
	                submitBtn.setAttribute("onclick", "tableSevenFrmSubmit();");
	                submitCol.appendChild(submitBtn);
	                
	                var finalSubmitBtn = document.createElement("button");
	                finalSubmitBtn.classList.add("btn");
	                finalSubmitBtn.classList.add("btn-sm");
	                finalSubmitBtn.classList.add("btn-outline-success");
	                finalSubmitBtn.innerText = "작성완료";
	                finalSubmitBtn.setAttribute("onclick", "application(true);");
	                submitCol.appendChild(finalSubmitBtn);
	                
	                commentListBox.appendChild(rowBox);
	                
                } else {	// 등재신청 결과 null 일때
                	var errMsgRow = document.createElement("div");
                	errMsgRow.classList.add("row");
                	
                	var errMsgCol = document.createElement("div");
                	errMsgCol.classList.add("col");
                	errMsgRow.appendChild(errMsgCol);
                	
                	var errMsgSpan = document.createElement("span");
                	errMsgSpan.innerText = "등재신청 정보를 찾을 수 없습니다.";
                	errMsgCol.appendChild(errMsgSpan);
                	
                	commentListBox.appendChild(errMsgRow);
                
                }
            }
    }
        xhr.open("get" , "../admin/selTableOne?aplcn_dtls_proper_num=" + userNo); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..	
}

function tableEightInfo(){
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				var data = jsonObj.map;

                var commentListBox = document.getElementById("nav-info");
				commentListBox.innerHTML = "";

				if(data != null && data != undefined) {
	                var rowBox = document.createElement("div");
	                rowBox.classList.add("row");
	                
	                //table시작
	
	                var tableRow = document.createElement("div");
	                tableRow.classList.add("row");
	                tableRow.classList.add("mx-0");
	                tableRow.classList.add("px-0");
	                rowBox.appendChild(tableRow);
	                
	                var tableEightFrm = document.createElement("form");
	                tableEightFrm.id = "tableEightFrm";
	                tableEightFrm.name = "tableEightFrm";
	                rowBox.appendChild(tableEightFrm);
	
	                var table = document.createElement("table");
	                table.classList.add("table");
	                table.classList.add("table-bordered");
	                tableEightFrm.appendChild(table);
	
	                //여기까진 같음
	                
	                var colGroup = document.createElement("colgroup");
	                table.appendChild(colGroup);
	
	                var colGroupOne = document.createElement("col");
	                colGroupOne.setAttribute("width", "15%");
	                colGroup.appendChild(colGroupOne);
	
	                var colGroupTwo = document.createElement("col");
	                colGroupTwo.setAttribute("width", "35%");
	                colGroup.appendChild(colGroupTwo);
	
	                var colGroupThree = document.createElement("col");
	                colGroupThree.setAttribute("width", "15%");
	                colGroup.appendChild(colGroupThree);
	
	                var colGroupFour = document.createElement("col");
	                colGroupFour.setAttribute("width", "35%");
	                colGroup.appendChild(colGroupFour);
	
	
	                var thead = document.createElement("thead");
	                table.appendChild(thead);
	
	                var theadTr = document.createElement("tr");
	                thead.appendChild(theadTr);
	
	                var theadTrTh1 = document.createElement("th");
	                theadTrTh1.classList.add("text-center");
	                theadTrTh1.classList.add("table-light");
	                theadTrTh1.innerText="자격증 종목";
	                theadTr.appendChild(theadTrTh1);
	
	                var theadTrTd1 = document.createElement("td");
	                theadTr.appendChild(theadTrTd1);
	                
					var crtfcTypeSelect = document.createElement("select");
					//crtfcTypeSelect.classList.add("form-select");
					crtfcTypeSelect.id = "crtfc_type";
					crtfcTypeSelect.name = "crtfc_type";
					theadTrTd1.appendChild(crtfcTypeSelect);

					var crtfcTypeOptionDefault = document.createElement("option");
					crtfcTypeOptionDefault.id = "default";
					crtfcTypeOptionDefault.innerText = "선택";
					crtfcTypeSelect.appendChild(crtfcTypeOptionDefault);
										
					// TODO: 추후 option -> value 수정 필요
					var crtfcTypeOption1 = document.createElement("option");
					crtfcTypeOption1.value = "o1";
					crtfcTypeOption1.innerText = "건축사";
					crtfcTypeSelect.appendChild(crtfcTypeOption1);
					
					var crtfcTypeOption2 = document.createElement("option");
					crtfcTypeOption2.value = "o2";
					crtfcTypeOption2.innerText = "가구제작산업기사";
					crtfcTypeSelect.appendChild(crtfcTypeOption2);
					
					var crtfcTypeOption3 = document.createElement("option");
					crtfcTypeOption3.value = "o3";
					crtfcTypeOption3.innerText = "가스기사";
					crtfcTypeSelect.appendChild(crtfcTypeOption3);
					
					var crtfcTypeOption4 = document.createElement("option");
					crtfcTypeOption4.value = "o4";
					crtfcTypeOption4.innerText = "건설기계설비기사";
					crtfcTypeSelect.appendChild(crtfcTypeOption4);
	                
	              	var crtfcTypeOption5 = document.createElement("option");
					crtfcTypeOption5.value = "o5";
					crtfcTypeOption5.innerText = "건축산업기사";
					crtfcTypeSelect.appendChild(crtfcTypeOption5);
					
					var crtfcTypeOption6 = document.createElement("option");
					crtfcTypeOption6.value = "o6";
					crtfcTypeOption6.innerText = "방재기사";
					crtfcTypeSelect.appendChild(crtfcTypeOption6);
					
					// 입력했던 종목 selected
					var crtfcType = data.CRTFC_TYPE;
					//console.log("crtfcType : " + crtfcType);
					
					if(crtfcType == null || crtfcType == undefined) {
	                	crtfcTypeOptionDefault.selected = true;
	                }
					
					var options = crtfcTypeSelect.getElementsByTagName("option");
					for(option of options) {
						if(crtfcType == option.value) {
							option.selected = true;
						}
					}
	                
	                
	                /*
	                var inputCrtfcType = document.createElement("input");
	                //inputCrtfcType.classList.add("form-control");
	                inputCrtfcType.type = "text";
	                inputCrtfcType.id = "crtfc_type";
	                inputCrtfcType.name = "crtfc_type";
	                inputCrtfcType.value = data.CRTFC_TYPE;
	                theadTrTd1.appendChild(inputCrtfcType);
					*/
	
	
	
	                var theadTrTh2 = document.createElement("th");
	                theadTrTh2.classList.add("text-center");
	                theadTrTh2.classList.add("table-light");
	                theadTrTh2.innerText="발급기관";
	                theadTr.appendChild(theadTrTh2);
	
	                var theadTrTd2 = document.createElement("td");
	                theadTr.appendChild(theadTrTd2);
	                
	                var inputIssueAgency = document.createElement("input");
	                //inputIssueAgency.classList.add("form-control");
	                inputIssueAgency.type = "text";
	                inputIssueAgency.id = "issue_agency";
	                inputIssueAgency.name = "issue_agency";
	                inputIssueAgency.value = data.ISSUE_AGENCY;
	                theadTrTd2.appendChild(inputIssueAgency);
	
	                var tbody = document.createElement("tbody");
	                table.appendChild(tbody);
	
	                var bodyTr1 = document.createElement("tr");
	                tbody.appendChild(bodyTr1);
	
	                var bodyTr1Th1 = document.createElement("th");
	                bodyTr1Th1.classList.add("text-center");
	                bodyTr1Th1.classList.add("table-light");
	                bodyTr1Th1.innerText="자격증 번호";
	                bodyTr1.appendChild(bodyTr1Th1);
	
	                var bodyTr1Td1 = document.createElement("td");
	                bodyTr1.appendChild(bodyTr1Td1);
	                
	                var inputCrtfcNumber = document.createElement("input");
	                //inputCrtfcNumber.classList.add("form-control");
	                inputCrtfcNumber.type = "text";
	                inputCrtfcNumber.id = "crtfc_number";
	                inputCrtfcNumber.name = "crtfc_number";
	                inputCrtfcNumber.value = data.CRTFC_NUMBER;
	                bodyTr1Td1.appendChild(inputCrtfcNumber);
	
	                var bodyTr1Th2 = document.createElement("th");
	                bodyTr1Th2.classList.add("text-center");
	                bodyTr1Th2.classList.add("table-light");
	                bodyTr1Th2.innerText="발급일";
	                bodyTr1.appendChild(bodyTr1Th2);
	
	                var bodyTr1Td2 = document.createElement("td");
	                bodyTr1.appendChild(bodyTr1Td2);
	                
	                var inputIssueDate = document.createElement("input");
	                //inputIssueDate.classList.add("form-control");
	                inputIssueDate.type = "date";
	                inputIssueDate.id = "issue_date";
	                inputIssueDate.name = "issue_date";
	                inputIssueDate.value = setDateInput(data.ISSUE_DATE);
	                bodyTr1Td2.appendChild(inputIssueDate);
	                
	                commentListBox.appendChild(rowBox);
	                
	                var properNum = document.createElement("input");
	                properNum.type = "hidden";
	                properNum.id = "aplcn_dtls_proper_num";
	                properNum.name = "aplcn_dtls_proper_num";
	                properNum.value = data.APLCN_DTLS_PROPER_NUM;
	                tableEightFrm.appendChild(properNum);
	                
	                // 저장버튼
	                var submitRow = document.createElement("div");
	                submitRow.classList.add("row");
	                submitRow.classList.add("text-center");
	                tableEightFrm.appendChild(submitRow);
	                
	                var submitCol = document.createElement("div");
	                submitCol.classList.add("col");
	                submitRow.appendChild(submitCol);
	                
	                var submitBtn = document.createElement("button");
	                submitBtn.classList.add("btn");
	                submitBtn.classList.add("btn-sm");
	                submitBtn.classList.add("btn-secondary");
	                submitBtn.classList.add("mx-2");
	                submitBtn.classList.add("frmSubmit");
	                
	                submitBtn.id = "tableOneFrm";
	                submitBtn.type = "button";
	                submitBtn.innerText = "저장";
	                submitBtn.setAttribute("onclick", "tableEightFrmSubmit();");
	                submitCol.appendChild(submitBtn);
	                
	                var finalSubmitBtn = document.createElement("button");
	                finalSubmitBtn.classList.add("btn");
	                finalSubmitBtn.classList.add("btn-sm");
	                finalSubmitBtn.classList.add("btn-outline-success");
	                finalSubmitBtn.innerText = "작성완료";
	                finalSubmitBtn.setAttribute("onclick", "application(false);");
	                submitCol.appendChild(finalSubmitBtn);
	                
	            } else {	// ajax 등재신청 결과값 null일 때
	            	var errMsgRow = document.createElement("div");
                	errMsgRow.classList.add("row");
                	
                	var errMsgCol = document.createElement("div");
                	errMsgCol.classList.add("col");
                	errMsgRow.appendChild(errMsgCol);
                	
                	var errMsgSpan = document.createElement("span");
                	errMsgSpan.innerText = "등재신청 정보를 찾을 수 없습니다.";
                	errMsgCol.appendChild(errMsgSpan);
                	
                	commentListBox.appendChild(errMsgRow);	
	            
	            }
            }
    }
        xhr.open("get" , "../admin/selTableOne?aplcn_dtls_proper_num=" + userNo); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..	
}

function tableNineInfo(){
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				//console.log("jsonObj : " + jsonObj);
				
                var commentListBox = document.getElementById("nav-info");
				commentListBox.innerHTML = "";

                var rowBox = document.createElement("div");
                rowBox.classList.add("row");
 
 
                //table시작
                var tableRow = document.createElement("div");
                tableRow.classList.add("row");
                tableRow.classList.add("mx-0");
                tableRow.classList.add("px-0");
                rowBox.appendChild(tableRow);

				var tableNineFrm = document.createElement("form");
				tableNineFrm.id = "tableNineFrm";
                tableNineFrm.name = "tableNineFrm";
                tableRow.appendChild(tableNineFrm);

                var table = document.createElement("table");
                table.classList.add("table");
                table.classList.add("table-bordered");
                tableNineFrm.appendChild(table);

                //여기까진 같음
                
                var colGroup = document.createElement("colgroup");
                table.appendChild(colGroup);

                var colGroupOne = document.createElement("col");
                colGroupOne.setAttribute("width", "25%");
                colGroup.appendChild(colGroupOne);

                var colGroupTwo = document.createElement("col");
                colGroupTwo.setAttribute("width", "25%");
                colGroup.appendChild(colGroupTwo);

                var colGroupThree = document.createElement("col");
                colGroupThree.setAttribute("width", "50%");
                colGroup.appendChild(colGroupThree);


                var thead = document.createElement("thead");
                table.appendChild(thead);

                var theadTr = document.createElement("tr");
                theadTr.classList.add("text-center");
                thead.appendChild(theadTr);

                var theadTrTh1 = document.createElement("th");
                theadTrTh1.setAttribute("scope", "col");
                theadTrTh1.classList.add("table-light");
                theadTrTh1.innerText="첨부서류 분류 코드";
                theadTr.appendChild(theadTrTh1);

                var theadTrTh2 = document.createElement("th");
                theadTrTh2.setAttribute("scope", "col");
                theadTrTh2.classList.add("table-light");
                theadTrTh2.innerText="첨부 서류 타입";
                theadTr.appendChild(theadTrTh2);

                var theadTrTh3 = document.createElement("th");
                theadTrTh3.setAttribute("scope", "col");
                theadTrTh3.classList.add("table-light");
                theadTrTh3.innerText="파일 이름";
                theadTr.appendChild(theadTrTh3);


                var tbody = document.createElement("tbody");
                table.appendChild(tbody);
				
				// 사업자등록증
               	var bodyTr1 = document.createElement("tr");
               	tbody.appendChild(bodyTr1);
               	
               	var bodyTr1Td1 = document.createElement("td");
               	bodyTr1Td1.classList.add("text-center");
                bodyTr1Td1.innerText = "사업자등록증";
                bodyTr1.appendChild(bodyTr1Td1);
                
                var bodyTr1Td2 = document.createElement("td");
               	bodyTr1Td2.classList.add("text-center");
               	bodyTr1Td2.setAttribute("rowspan", "3");
               	bodyTr1Td2.setAttribute("valign", "middle");
                bodyTr1Td2.innerText = "공통서류";
                bodyTr1.appendChild(bodyTr1Td2);

               	var bodyTr1Td3 = document.createElement("td");
               	bodyTr1Td3.classList.add("text-center");
               	
				if(jsonObj.businesslicense != undefined) {
	              
	              	var bodyTr1Td3Span = document.createElement("span");
	              	bodyTr1Td3Span.setAttribute("onclick", "fileDownload('"+jsonObj.businesslicense.aplcn_dtls_proper_num+"', '"+jsonObj.businesslicense.aplcn_atch_file_proper_num+"');");
	              	bodyTr1Td3Span.classList.add("text-decoration-none");
	                bodyTr1Td3Span.innerText = jsonObj.businesslicense.original_file_name;
	                bodyTr1Td3.appendChild(bodyTr1Td3Span);
	                
	                var bodyTr1Td3MofBtn = document.createElement("input");
	                bodyTr1Td3MofBtn.type = "button";
	                bodyTr1Td3MofBtn.value = "변경";
	                bodyTr1Td3MofBtn.setAttribute("onclick", "showFileInput(this.parentNode,'businesslicense', 'co');");
	                bodyTr1Td3MofBtn.style.float = "right";
	                bodyTr1Td3.appendChild(bodyTr1Td3MofBtn);
	              
                } else {
                	// 저장된 파일이 없을때
                	showFileInput(bodyTr1Td3,'businesslicense', 'co');
                }
                
                bodyTr1.appendChild(bodyTr1Td3);
                
                // 업무관련 등록신고서류
               	var bodyTr2 = document.createElement("tr");
               	tbody.appendChild(bodyTr2);
               	
               	var bodyTr2Td1 = document.createElement("td");
               	bodyTr2Td1.classList.add("text-center");
                bodyTr2Td1.innerText = "업무관련 등록신고 서류";
                bodyTr2.appendChild(bodyTr2Td1);
                
            	var bodyTr2Td2 = document.createElement("td");
            	bodyTr2Td2.classList.add("text-center");
            	
                if(jsonObj.businessreport != undefined) {
               		var bodyTr2Td2Span = document.createElement("span");
	              	bodyTr2Td2Span.setAttribute("onclick", "fileDownload('"+jsonObj.businessreport.aplcn_dtls_proper_num+"', '"+jsonObj.businessreport.aplcn_atch_file_proper_num+"');");
	              	bodyTr2Td2Span.classList.add("text-decoration-none");
	                bodyTr2Td2Span.innerText = jsonObj.businessreport.original_file_name;
	                bodyTr2Td2.appendChild(bodyTr2Td2Span);
	                
	                 var bodyTr2Td2MofBtn = document.createElement("input");
	                bodyTr2Td2MofBtn.type = "button";
	                bodyTr2Td2MofBtn.value = "변경";
	                bodyTr2Td2MofBtn.setAttribute("onclick", "showFileInput(this.parentNode,'businessreport', 'co');");
	                bodyTr2Td2MofBtn.style.float = "right";
	                bodyTr2Td2.appendChild(bodyTr2Td2MofBtn);
                
                
                } else {
                	// 저장된 파일이 없을때
                	showFileInput(bodyTr2Td2,'businessreport', 'co');
                }
                
                bodyTr2.appendChild(bodyTr2Td2);
                
                // 납세증명확인서
                var bodyTr3 = document.createElement("tr");
               	tbody.appendChild(bodyTr3);
               	
               	var bodyTr3Td1 = document.createElement("td");
               	bodyTr3Td1.classList.add("text-center");
                bodyTr3Td1.innerText = "납세증명확인서";
                bodyTr3.appendChild(bodyTr3Td1);
                
                var bodyTr3Td2 = document.createElement("td");
                bodyTr3Td2.classList.add("text-center");
                
                if(jsonObj.taxconfirm != undefined) {
	               	bodyTr3Td2.classList.add("text-center");
	                
	                var bodyTr3Td2Span = document.createElement("span");
	              	bodyTr3Td2Span.setAttribute("onclick", "fileDownload('"+jsonObj.taxconfirm.aplcn_dtls_proper_num+"', '"+jsonObj.taxconfirm.aplcn_atch_file_proper_num+"');");
	              	bodyTr3Td2Span.classList.add("text-decoration-none");
	                bodyTr3Td2Span.innerText = jsonObj.taxconfirm.original_file_name;
	                bodyTr3Td2.appendChild(bodyTr3Td2Span);
	                
	                var bodyTr3Td2MofBtn = document.createElement("input");
	                bodyTr3Td2MofBtn.type = "button";
	                bodyTr3Td2MofBtn.value = "변경";
	                bodyTr3Td2MofBtn.setAttribute("onclick", "showFileInput(this.parentNode,'taxconfirm', 'co');");
	                bodyTr3Td2MofBtn.style.float = "right";
	                bodyTr3Td2.appendChild(bodyTr3Td2MofBtn);
	                
                } else {
                	// 저장된 파일이 없을때
                	showFileInput(bodyTr3Td2,'taxconfirm', 'co');
                }
                
                bodyTr3.appendChild(bodyTr3Td2);
                
                // 이력서
                var bodyTr4 = document.createElement("tr");
               	tbody.appendChild(bodyTr4);
               	
               	var bodyTr4Td1 = document.createElement("td");
               	bodyTr4Td1.classList.add("text-center");
                bodyTr4Td1.innerText = "이력서";
                bodyTr4.appendChild(bodyTr4Td1);
                
                var bodyTr4Td2 = document.createElement("td");
               	bodyTr4Td2.classList.add("text-center");
               	bodyTr4Td2.setAttribute("rowspan", "4");
               	bodyTr4Td2.setAttribute("valign", "middle");
                bodyTr4Td2.innerText = "개인서류";
                bodyTr4.appendChild(bodyTr4Td2);
               	
               	var bodyTr4Td3 = document.createElement("td");
               	bodyTr4Td3.classList.add("text-center");
               	
               	if(jsonObj.resume != undefined) {
               		var bodyTr4Td3Span = document.createElement("span");
	              	bodyTr4Td3Span.setAttribute("onclick", "fileDownload('"+jsonObj.resume.aplcn_dtls_proper_num+"', '"+jsonObj.resume.aplcn_atch_file_proper_num+"');");
	              	bodyTr4Td3Span.classList.add("text-decoration-none");
	                bodyTr4Td3Span.innerText = jsonObj.resume.original_file_name;
	                bodyTr4Td3.appendChild(bodyTr4Td3Span);
	                
	                var bodyTr4Td3MofBtn = document.createElement("input");
	                bodyTr4Td3MofBtn.type = "button";
	                bodyTr4Td3MofBtn.value = "변경";
	                bodyTr4Td3MofBtn.setAttribute("onclick", "showFileInput(this.parentNode,'resume', 'pe');");
	                bodyTr4Td3MofBtn.style.float = "right";
	                bodyTr4Td3.appendChild(bodyTr4Td3MofBtn);
               		
                } else {
                	// 저장된 파일이 없을때
                	showFileInput(bodyTr4Td3,'resume', 'pe');
                }
                
                bodyTr4.appendChild(bodyTr4Td3);
	                
                // 학력 증명서
                var bodyTr5 = document.createElement("tr");
               	tbody.appendChild(bodyTr5);
               	
               	var bodyTr5Td1 = document.createElement("td");
               	bodyTr5Td1.classList.add("text-center");
                bodyTr5Td1.innerText = "학력 증명서";
                bodyTr5.appendChild(bodyTr5Td1);
                
            	var bodyTr5Td2 = document.createElement("td");
            	bodyTr5Td2.classList.add("text-center");
            	
                if(jsonObj.educationlevel != null) {
                	var bodyTr5Td2Span = document.createElement("span");
	              	bodyTr5Td2Span.setAttribute("onclick", "fileDownload('"+jsonObj.educationlevel.aplcn_dtls_proper_num+"', '"+jsonObj.educationlevel.aplcn_atch_file_proper_num+"');");
	              	bodyTr5Td2Span.classList.add("text-decoration-none");
	                bodyTr5Td2Span.innerText = jsonObj.educationlevel.original_file_name;
	                bodyTr5Td2.appendChild(bodyTr5Td2Span);
	                
	                var bodyTr5Td2MofBtn = document.createElement("input");
	                bodyTr5Td2MofBtn.type = "button";
	                bodyTr5Td2MofBtn.value = "변경";
	                bodyTr5Td2MofBtn.setAttribute("onclick", "showFileInput(this.parentNode,'educationlevel', 'pe');");
	                bodyTr5Td2MofBtn.style.float = "right";
	                bodyTr5Td2.appendChild(bodyTr5Td2MofBtn);
                
                } else {
                	showFileInput(bodyTr5Td2,'educationlevel', 'pe');
                }
                
                bodyTr5.appendChild(bodyTr5Td2);
                
                // 경력 증명서
                var bodyTr6 = document.createElement("tr");
               	tbody.appendChild(bodyTr6);
               	
               	var bodyTr6Td1 = document.createElement("td");
               	bodyTr6Td1.classList.add("text-center");
                bodyTr6Td1.innerText = "경력 증명서";
                bodyTr6.appendChild(bodyTr6Td1);
                
            	var bodyTr6Td2 = document.createElement("td");
            	bodyTr6Td2.classList.add("text-center");
            	
                if(jsonObj.carrer != undefined) {
                	var bodyTr6Td2Span = document.createElement("span");
	              	bodyTr6Td2Span.setAttribute("onclick", "fileDownload('"+jsonObj.carrer.aplcn_dtls_proper_num+"', '"+jsonObj.carrer.aplcn_atch_file_proper_num+"');");
	              	bodyTr6Td2Span.classList.add("text-decoration-none");
	                bodyTr6Td2Span.innerText = jsonObj.carrer.original_file_name;
	                bodyTr6Td2.appendChild(bodyTr6Td2Span);
	                
	                var bodyTr6Td2MofBtn = document.createElement("input");
	                bodyTr6Td2MofBtn.type = "button";
	                bodyTr6Td2MofBtn.value = "변경";
	                bodyTr6Td2MofBtn.setAttribute("onclick", "showFileInput(this.parentNode,'carrer', 'pe');");
	                bodyTr6Td2MofBtn.style.float = "right";
	                bodyTr6Td2.appendChild(bodyTr6Td2MofBtn);
                
                } else {
                	showFileInput(bodyTr6Td2,'carrer', 'pe');
                }
                
                bodyTr6.appendChild(bodyTr6Td2);
                
                // 자격증 사본
                var bodyTr7 = document.createElement("tr");
               	tbody.appendChild(bodyTr7);
               	
               	var bodyTr7Td1 = document.createElement("td");
               	bodyTr7Td1.classList.add("text-center");
                bodyTr7Td1.innerText = "자격증 사본";
                bodyTr7.appendChild(bodyTr7Td1);
                
            	var bodyTr7Td2 = document.createElement("td");
            	bodyTr7Td2.classList.add("text-center");
            	
                if(jsonObj.certificate != undefined) {
                	var bodyTr7Td2Span = document.createElement("span");
	              	bodyTr7Td2Span.setAttribute("onclick", "fileDownload('"+jsonObj.certificate.aplcn_dtls_proper_num+"', '"+jsonObj.certificate.aplcn_atch_file_proper_num+"');");
	              	bodyTr7Td2Span.classList.add("text-decoration-none");
	                bodyTr7Td2Span.innerText = jsonObj.certificate.original_file_name;
	                bodyTr7Td2.appendChild(bodyTr7Td2Span);
	                
	                var bodyTr7Td2MofBtn = document.createElement("input");
	                bodyTr7Td2MofBtn.type = "button";
	                bodyTr7Td2MofBtn.value = "변경";
	                bodyTr7Td2MofBtn.setAttribute("onclick", "showFileInput(this.parentNode,'certificate', 'pe');");
	                bodyTr7Td2MofBtn.style.float = "right";
	                bodyTr7Td2.appendChild(bodyTr7Td2MofBtn);
                } else {
                	showFileInput(bodyTr7Td2,'certificate', 'pe');
                }
                
                bodyTr7.appendChild(bodyTr7Td2);
                
                // 기타서류
                var bodyTr8 = document.createElement("tr");
               	tbody.appendChild(bodyTr8);
               	
               	var bodyTr8Td1 = document.createElement("td");
               	bodyTr8Td1.classList.add("text-center");
                bodyTr8Td1.innerText = "기타서류";
                bodyTr8.appendChild(bodyTr8Td1);
                
                var bodyTr8Td2 = document.createElement("td");
               	bodyTr8Td2.classList.add("text-center");
                bodyTr8Td2.innerText = "기타서류";
                bodyTr8.appendChild(bodyTr8Td2);
               	
               	var bodyTr8Td3 = document.createElement("td");
               	bodyTr8Td3.classList.add("text-center");
               	
               	if(jsonObj.other != undefined) {
               		var bodyTr8Td3Span = document.createElement("span");
	              	bodyTr8Td3Span.setAttribute("onclick", "fileDownload('"+jsonObj.other.aplcn_dtls_proper_num+"', '"+jsonObj.other.aplcn_atch_file_proper_num+"');");
	              	bodyTr8Td3Span.classList.add("text-decoration-none");
	                bodyTr8Td3Span.innerText = jsonObj.other.original_file_name;
	                bodyTr8Td3.appendChild(bodyTr8Td3Span);
	                
	                var bodyTr8Td3MofBtn = document.createElement("input");
	                bodyTr8Td3MofBtn.type = "button";
	                bodyTr8Td3MofBtn.value = "변경";
	                bodyTr8Td3MofBtn.setAttribute("onclick", "showFileInput(this.parentNode,'other', 'ot');");
	                bodyTr8Td3MofBtn.style.float = "right";
	                bodyTr8Td3.appendChild(bodyTr8Td3MofBtn);
                } else {
                	showFileInput(bodyTr8Td3,'other', 'ot');
                }
                bodyTr8.appendChild(bodyTr8Td3);
                
                var properNum = document.createElement("input");
                properNum.name = "aplcn_dtls_proper_num";
                properNum.id = "aplcn_dtls_proper_num";
                properNum.type = "hidden";
                properNum.value = userNo;
                tableNineFrm.appendChild(properNum);
                
                
                // 저장버튼
                var submitRow = document.createElement("div");
                submitRow.classList.add("row");
                submitRow.classList.add("text-center");
                tableNineFrm.appendChild(submitRow);
                
                var submitCol = document.createElement("div");
                submitCol.classList.add("col");
                submitRow.appendChild(submitCol);
                
                var submitBtn = document.createElement("button");
                submitBtn.classList.add("btn");
                submitBtn.classList.add("btn-sm");
                submitBtn.classList.add("btn-secondary");
                submitBtn.classList.add("mx-2");
                submitBtn.classList.add("frmSubmit");
                
                submitBtn.id = "tableOneFrm";
                submitBtn.type = "button";
                submitBtn.innerText = "저장";
                submitBtn.setAttribute("onclick", "tableNineFrmSubmit();");
                submitCol.appendChild(submitBtn);
                
                var finalSubmitBtn = document.createElement("button");
                finalSubmitBtn.classList.add("btn");
                finalSubmitBtn.classList.add("btn-sm");
                finalSubmitBtn.classList.add("btn-outline-success");
                finalSubmitBtn.innerText = "작성완료";
                finalSubmitBtn.setAttribute("onclick", "application(false);");
                submitCol.appendChild(finalSubmitBtn);
                
                commentListBox.appendChild(rowBox);
                
              } else {	// ajax 등재신청 결과값 null일 때   
              	var errMsgRow = document.createElement("div");
            	errMsgRow.classList.add("row");
            	
            	var errMsgCol = document.createElement("div");
            	errMsgCol.classList.add("col");
            	errMsgRow.appendChild(errMsgCol);
            	
            	var errMsgSpan = document.createElement("span");
            	errMsgSpan.innerText = "등재신청 정보를 찾을 수 없습니다.";
            	errMsgCol.appendChild(errMsgSpan);
            	
            	commentListBox.appendChild(errMsgRow);
              }  
                
    }
        xhr.open("get" , "../admin/selectFileList?aplcn_dtls_proper_num=" + userNo); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..	
}

