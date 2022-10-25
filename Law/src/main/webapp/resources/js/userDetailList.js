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

function tableOneInfo(){
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				
			
				
				
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)

				var commentListBox = document.getElementById("nav-info");
				commentListBox.innerHTML = "";

                

                var rowBox = document.createElement("div");
                rowBox.classList.add("row");

           
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
                
                var tableRowBox = document.createElement("div");
                tableRowBox.classList.add("row");
                tableRowBox.classList.add("px-0");
                tableRowBox.classList.add("mx-0");
                rowBox.appendChild(tableRowBox);

                var tableBox = document.createElement("table");
                tableBox.classList.add("table");
                tableBox.classList.add("table-bordered");
                tableRowBox.appendChild(tableBox);

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
                trTd1.innerText= jsonObj.map.USER_NAME;
                threadTr.appendChild(trTd1);

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
                bodyTd1.innerText= jsonObj.map.USER_EMAIL;
                bodyTr1.appendChild(bodyTd1);

                var bodyTh2 = document.createElement("th");
                bodyTh2.classList.add("text-center");
                bodyTh2.classList.add("table-light");
                bodyTh2.innerText="연락처";
                bodyTr1.appendChild(bodyTh2);

                var bodyTd2 = document.createElement("td");
                bodyTd2.innerText=jsonObj.map.USER_PHONE;
                bodyTr1.appendChild(bodyTd2);
                
            
                
                
                var bodyTr2 = document.createElement("tr");
                tableBody.appendChild(bodyTr2);

                var bodyTh3 = document.createElement("th");
                bodyTh3.classList.add("text-center");
                bodyTh3.classList.add("table-light");
                bodyTh3.innerText="직업";
                bodyTr2.appendChild(bodyTh3);

                var bodyTd3 = document.createElement("td");
                bodyTd3.innerText=jsonObj.map.USER_JOB ;
                bodyTr2.appendChild(bodyTd3);

                var bodyTh4 = document.createElement("th");
                bodyTh4.classList.add("text-center");
                bodyTh4.classList.add("table-light");
                bodyTh4.innerText="기본주소";
                bodyTr2.appendChild(bodyTh4);

                var bodyTd4 = document.createElement("td");
                bodyTd4.innerText=jsonObj.map.USER_AR ;
                bodyTr2 .appendChild(bodyTd4);

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
                bodyTd5.innerText="우편번호 : " + jsonObj.map.USER_AR_ZONECODE;
                bodyTr3 .appendChild(bodyTd5);



                var bodyTr4 = document.createElement("tr");
                tableBody.appendChild(bodyTr4);

                var bodyTd6 = document.createElement("td");
                bodyTd6.setAttribute("colspan", "3");
                bodyTd6.innerText="지번주소 : " + jsonObj.map.USER_AR_JIBUN;
                bodyTr4 .appendChild(bodyTd6);// 지번주소



                var bodyTr5 = document.createElement("tr");
                tableBody.appendChild(bodyTr5);

                var bodyTd7 = document.createElement("td");
                bodyTd7.setAttribute("colspan", "3");
                bodyTd7.innerText="상세주소 : " + jsonObj.map.USER_AR_DETAIL
                bodyTr5 .appendChild(bodyTd7);// 상세주소



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
                bodyTd8.innerText="계좌명 : " + jsonObj.map.USER_BANK_HOLDER;
                bodyTr6 .appendChild(bodyTd8);



                var bodyTr7 = document.createElement("tr");
                tableBody.appendChild(bodyTr7);
                
                var bodyTd9 = document.createElement("td");
                bodyTd9.setAttribute("colspan", "3");
                bodyTd9.innerText="계좌은행 : " + jsonObj.map.USER_BANK;
                bodyTr7 .appendChild(bodyTd9);
                
                var bodyTr8 = document.createElement("tr");
                tableBody.appendChild(bodyTr8);

                var bodyTd10 = document.createElement("td");
                bodyTd10.setAttribute("colspan", "3");
                bodyTd10.innerText="계좌번호 : " + jsonObj.map.USER_BANK_ACCOUNT;
                bodyTr8 .appendChild(bodyTd10);

                commentListBox.appendChild(rowBox);
                
            }
    }
        xhr.open("get" , "../admin/selTableOne?aplcn_dtls_proper_num=" + userNo + "&aplcn_dtls_sts=examination"); //리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..		
}

function tableFiveInfo(){
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)

                var commentListBox = document.getElementById("nav-info");
				commentListBox.innerHTML = "";

                var rowBox = document.createElement("div");
                rowBox.classList.add("row");

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
				
                var tableRow = document.createElement("div");
                tableRow.classList.add("row");
				tableRow.classList.add("mx-0");
				tableRow.classList.add("px-0");
                rowBox.appendChild(tableRow);

                var table = document.createElement("table");
                table.classList.add("table");
                table.classList.add("table-bordered");
                tableRow.appendChild(table);
                
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

				var ligtnYNBox = document.createElement("div");
				bodyTr1Td1.appendChild(ligtnYNBox);
				
				var ligtnYNSpan = document.createElement("span");
				var ligtnCaseCarerYn = jsonObj.map.LIGTN_CASE_CARER_YN;
				if(ligtnCaseCarerYn == 'y') {
					ligtnYNSpan.innerText = '유';
				} else if(ligtnCaseCarerYn == 'n') {
					ligtnYNSpan.innerText = '무';
				}
				ligtnYNBox.appendChild(ligtnYNSpan);
				
				var bodyTr1Td2 = document.createElement("td");
                bodyTr1.appendChild(bodyTr1Td2);
                
				var ligtnCaseCarerEtcSpan = document.createElement("span");
				var ligtnCaseCarerEtc = jsonObj.map.LIGTN_CASE_CARER_ETC;
				if(ligtnCaseCarerEtc == '' || ligtnCaseCarerEtc == undefined) {
					ligtnCaseCarerEtcSpan.innerText = '';
				} else {
					ligtnCaseCarerEtcSpan.innerText = ligtnCaseCarerEtc;
				}
                bodyTr1Td2.appendChild(ligtnCaseCarerEtcSpan);
				

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
                //bodyTr2Th1.innerText ="보험업계 경력 내용" + jsonObj.map.INSRN_INDST_CARER_YN;
                bodyTr2Th1.innerText ="보험업계 경력";
                bodyTr2.appendChild(bodyTr2Th1);

                var bodyTr2Td1 = document.createElement("td");
                bodyTr2.appendChild(bodyTr2Td1);
                
                var insrnYnBox = document.createElement("div");
				bodyTr2Td1.appendChild(insrnYnBox);
				
				var insrnYNSpan = document.createElement("span");
				var insrnCarerYn = jsonObj.map.INSRN_INDST_CARER_YN;
				if(insrnCarerYn == 'y') {
					insrnYNSpan.innerText = '유';
				} else if(insrnCarerYn == 'n') {
					insrnYNSpan.innerText = '무';
				}
				insrnYnBox.appendChild(insrnYNSpan);
                
                var bodyTr2Td2 = document.createElement("td");
                bodyTr2.appendChild(bodyTr2Td2);
                
                var insrnCarerEtcSpan = document.createElement("span");
				var insrnCarerEtc = jsonObj.map.INSRN_INDST_CARER_ETC;
				if(insrnCarerEtc == '' || insrnCarerEtc == undefined) {
					insrnCarerEtcSpan.innerText = '';
				} else {
					insrnCarerEtcSpan.innerText = insrnCarerEtc;
				}
                bodyTr2Td2.appendChild(insrnCarerEtcSpan);

                var bodyTr3 = document.createElement("tr");
                bodyTr3.setAttribute("rowspan", "2");
                bodyTr3.setAttribute("scope", "row");
                bodyTr3.classList.add("text-center");
                bodyTr3.classList.add("border-2");
                bodyTr3.setAttribute("style", "line-height:100px");
                tbody.appendChild(bodyTr3);

                var bodyTr3Th1 = document.createElement("th");
                bodyTr3Th1.classList.add("table-light");
                //bodyTr3Th1.innerText="형사처벌 경력 내용" + jsonObj.map.CRIMINAL_PENALTY_CARER_YN;
                bodyTr3Th1.innerText="형사처벌 경력";
                bodyTr3.appendChild(bodyTr3Th1);

                var bodyTr3Td1 = document.createElement("td");
                bodyTr3.appendChild(bodyTr3Td1);
                
                var criminalYNBox = document.createElement("div");
				bodyTr3Td1.appendChild(criminalYNBox);
				
				var criminalYNSpan = document.createElement("span");
				var criminalCarerYn = jsonObj.map.CRIMINAL_PENALTY_CARER_YN;
				if(criminalCarerYn == 'y') {
					criminalYNSpan.innerText = '유';
				} else if(criminalCarerYn == 'n') {
					criminalYNSpan.innerText = '무';
				}
				criminalYNBox.appendChild(criminalYNSpan);
            
            	var bodyTr3Td2 = document.createElement("td");
                bodyTr3.appendChild(bodyTr3Td2);
                
				var criminalCarerEtcSpan = document.createElement("span");
				var criminalCarerEtc = jsonObj.map.CRIMINAL_PENALTY_CARER_ETC;
				if(criminalCarerEtc == '' || criminalCarerEtc == undefined) {
					criminalCarerEtcSpan.innerText = '';
				} else {
					criminalCarerEtcSpan.innerText = criminalCarerEtc;
				}
                bodyTr3Td2.appendChild(criminalCarerEtcSpan);
                
                commentListBox.appendChild(rowBox);

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

                var commentListBox = document.getElementById("nav-info");
				commentListBox.innerHTML = "";

                var rowBox = document.createElement("div");
                rowBox.classList.add("row");
   
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
                //기본정보 끝

                //table시작

                var tableRow = document.createElement("div");
                tableRow.classList.add("row");
                tableRow.classList.add("mx-0");
                tableRow.classList.add("px-0");
                rowBox.appendChild(tableRow);

                var table = document.createElement("table");
                table.classList.add("table");
                table.classList.add("table-bordered");
                tableRow.appendChild(table);

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
                
                var schoolName = document.createElement("span");
                schoolName.innerText = jsonObj.map.EDCTN_SCHOOL_NAME;
                theadTrTd1.appendChild(schoolName);

                var theadTrTh2 = document.createElement("th");
                theadTrTh2.classList.add("text-center");
                theadTrTh2.classList.add("table-light");
                theadTrTh2.innerText="학과전공";
                theadTr.appendChild(theadTrTh2);

                var theadTrTd2 = document.createElement("td");
                theadTr.appendChild(theadTrTd2);
                
                var edctnMajor = document.createElement("span");
                edctnMajor.innerText = jsonObj.map.EDCTN_MAJOR;
                theadTrTd2.appendChild(edctnMajor);

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
                
                var edctnAdmsnDate = document.createElement("span");
                edctnAdmsnDate.innerText = setDateInput(jsonObj.map.EDCTN_ADMSN_DATE);
                bodyTr1Td1.appendChild(edctnAdmsnDate);

                var bodyTr1Th2 = document.createElement("th");
                bodyTr1Th2.classList.add("text-center");
                bodyTr1Th2.classList.add("table-light");
                bodyTr1Th2.innerText="종료일";
                bodyTr1.appendChild(bodyTr1Th2);

                var bodyTr1Td2 = document.createElement("td");
                bodyTr1.appendChild(bodyTr1Td2);
                
                var edctnGrdtnDate = document.createElement("span");
                edctnGrdtnDate.innerText = setDateInput(jsonObj.map.EDCTN_GRDTN_DATE);
                bodyTr1Td2.appendChild(edctnGrdtnDate);

                var bodyTr2 = document.createElement("tr");
                tbody.appendChild(bodyTr2);

                var bodyTr2Th1 = document.createElement("th");
                bodyTr2Th1.classList.add("text-center");
                bodyTr2Th1.classList.add("table-light");
                bodyTr2Th1.innerText="학위";
                bodyTr2.appendChild(bodyTr2Th1);

                var bodyTr2Td1 = document.createElement("td");
                bodyTr2.appendChild(bodyTr2Td1);
                
                var edctnDegree = document.createElement("span");
                edctnDegree.innerText = jsonObj.map.EDCTN_DEGREE;
                bodyTr2Td1.appendChild(edctnDegree);

                var bodyTr2Th2 = document.createElement("th");
                bodyTr2Th2.innerText="최종학력";
                bodyTr2Th2.classList.add("text-center");
                bodyTr2Th2.classList.add("table-light");
                bodyTr2.appendChild(bodyTr2Th2);

                var bodyTr2Td2 = document.createElement("td");
                bodyTr2.appendChild(bodyTr2Td2);
                
                var edctnFinalYNSpan = document.createElement("span");
                var edctnFinalYN = jsonObj.map.EDCTN_FINAL_YN;
                if(edctnFinalYN == 'y') {
                	edctnFinalYNSpan.innerText = '예';
                } else if(edctnFinalYN == 'n') {
                	edctnFinalYNSpan.innerText = '아니오';
                }
                bodyTr2Td2.appendChild(edctnFinalYNSpan);

                commentListBox.appendChild(rowBox);
                
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

                var commentListBox = document.getElementById("nav-info");
				commentListBox.innerHTML = "";

                var rowBox = document.createElement("div");
                rowBox.classList.add("row"); 
                
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
                //기본정보 끝

                //table시작

                var tableRow = document.createElement("div");
                tableRow.classList.add("row");
                tableRow.classList.add("mx-0");
                tableRow.classList.add("px-0");
                rowBox.appendChild(tableRow);

                var table = document.createElement("table");
                table.classList.add("table");
                table.classList.add("table-bordered");
                tableRow.appendChild(table);

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
                
                var companyName = document.createElement("span");
                companyName.innerText = jsonObj.map.COMPANY_NAME;
                theadTrTd1.appendChild(companyName);

                var theadTrTh2 = document.createElement("th");
                theadTrTh2.classList.add("text-center");
                theadTrTh2.classList.add("table-light");
                theadTrTh2.innerText="경력 구분";
                theadTr.appendChild(theadTrTh2);

                var theadTrTd2 = document.createElement("td");
                theadTr.appendChild(theadTrTd2);
                
                var carerType = document.createElement("span");
                carerType.innerText = jsonObj.map.CARER_TYPE;
                theadTrTd2.appendChild(carerType);

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
                
                var workStartDate = document.createElement("span");
                workStartDate.innerText = setDateInput(jsonObj.map.WORK_START_DATE);
                bodyTr1Td1.appendChild(workStartDate);

                var bodyTr1Th2 = document.createElement("th");
                bodyTr1Th2.classList.add("text-center");
                bodyTr1Th2.classList.add("table-light");
                bodyTr1Th2.innerText="근무 종료 일자";
                bodyTr1.appendChild(bodyTr1Th2);

                var bodyTr1Td2 = document.createElement("td");
                bodyTr1.appendChild(bodyTr1Td2);
                
                var workEndDate = document.createElement("span");
                workEndDate.innerText = setDateInput(jsonObj.map.WORK_END_DATE);
                bodyTr1Td2.appendChild(workEndDate);

                var bodyTr2 = document.createElement("tr");
                tbody.appendChild(bodyTr2);

                var bodyTr2Th1 = document.createElement("th");
                bodyTr2Th1.classList.add("text-center");
                bodyTr2Th1.classList.add("table-light");
                bodyTr2Th1.innerText="직책";
                bodyTr2.appendChild(bodyTr2Th1);

                var bodyTr2Td1 = document.createElement("td");
                bodyTr2.appendChild(bodyTr2Td1);
                
                var workPosition = document.createElement("span");
                workPosition.innerText = jsonObj.map.WORK_POSITION;
                bodyTr2Td1.appendChild(workPosition);

                var bodyTr2Th2 = document.createElement("th");
                bodyTr2Th2.innerText="부서";
                bodyTr2Th2.classList.add("text-center");
                bodyTr2Th2.classList.add("table-light");
                bodyTr2.appendChild(bodyTr2Th2);

                var bodyTr2Td2 = document.createElement("td");
                bodyTr2.appendChild(bodyTr2Td2);
                
                var workDepartment = document.createElement("span");
                workDepartment.innerText = jsonObj.map.WORK_DEPARTMENT;
                bodyTr2Td2.appendChild(workDepartment);

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
                
                var workDescription = document.createElement("span");
                workDescription.innerText = jsonObj.map.WORK_DESCRIPTION;
                bodyTr3Td.appendChild(workDescription);
                
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
                
                var carerDesc = document.createElement("span");
                carerDesc.innerText = jsonObj.map.CARER_DESCRIPTION;
                bodyTr4Td.appendChild(carerDesc);
                
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
                
                var specialNoteDesc = document.createElement("span");
                specialNoteDesc.innerText =  jsonObj.map.SPECIAL_NOTE_DESCRIPTION;
                bodyTr5Td.appendChild(specialNoteDesc);
                
                

                //기본정보 네비
                /*
                var subNab2 = document.createElement("div");
                subNab2.classList.add("row");
                subNab2.classList.add("mx-0");
                subNab2.classList.add("border-bottom");
                subNab2.classList.add("pb-4");
                rowBox.appendChild(subNab2);

                var subNab2Span = document.createElement("span");
                subNab2Span.innerText="기본정보";
                subNab2.appendChild(subNab2Span);

                var subNab2SpanFromI = document.createElement("i");
                subNab2SpanFromI.classList.add("bi");
                subNab2SpanFromI.classList.add("bi-circle-fill");
                subNab2Span.appendChild(subNab2SpanFromI);
                */

                //테이블 시작
                /*

                var tableRow2 = document.createElement("div");
                rowBox.appendChild(tableRow2);

                var table2 = document.createElement("table");
                table2.classList.add("table");
                table2.classList.add("table-bordereed");
                tableRow2.appendChild(table2);

                var colGroup2 = document.createElement("colgroup");
                table2.appendChild(colGroup2);

                var colGroupOne2 = document.createElement("col");
                colGroupOne2.setAttribute("width", "20%");
                colGroup2.appendChild(colGroupOne2);

                var colGroupTwo2 = document.createElement("col");
                colGroupTwo2.setAttribute("width", "80%");
                colGroup2.appendChild(colGroupTwo2);

                var thead2 = document.createElement("thead");
                table2.appendChild(thead2);

                var thead2Tr1 = document.createElement("tr");
                thead2Tr1.setAttribute("rowspan", "2");
                thead2Tr1.setAttribute("scope", "row");
                thead2Tr1.setAttribute("style", "line-height:100px");
                thead2.appendChild(thead2Tr1);

                var thead2Tr1Th1 = document.createElement("th");
                thead2Tr1Th1.classList.add("table-light");
                thead2Tr1Th1.classList.add("text-center");
                thead2Tr1Th1.innerText="활동경력";
                thead2Tr1.appendChild(thead2Tr1Th1);

                var thead2Tr1Td1 = document.createElement("td");
                thead2Tr1Td1.innerText= "적으셈";
                thead2Tr1.appendChild(thead2Tr1Td1);

                var thead2Tr2 = document.createElement("tr");
                thead2Tr2.classList.add("text-cneter");
                thead2Tr2.setAttribute("rowspan", "2");
                thead2Tr2.setAttribute("scope", "row");
                thead2Tr2.setAttribute("style", "line-height:100px");
                thead2.appendChild(thead2Tr2);

                var thead2Tr2Th1 = document.createElement("th");
                thead2Tr2Th1.classList.add("table-light");
                thead2Tr2Th1.classList.add("text-center");
                thead2Tr2Th1.innerText="특이사항";
                thead2Tr2.appendChild(thead2Tr2Th1);

                var thead2Tr2Td1 = document.createElement("hd");
                thead2Tr2Td1.innerText="적으셈";
                thead2Tr2.appendChild(thead2Tr2Td1);
                */

                commentListBox.appendChild(rowBox);
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

                var commentListBox = document.getElementById("nav-info");
				commentListBox.innerHTML = "";

                var rowBox = document.createElement("div");
                rowBox.classList.add("row");
                
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

                //기본정보 끝


                //table시작

                var tableRow = document.createElement("div");
                tableRow.classList.add("row");
                tableRow.classList.add("mx-0");
                tableRow.classList.add("px-0");
                rowBox.appendChild(tableRow);

                var table = document.createElement("table");
                table.classList.add("table");
                table.classList.add("table-bordered");
                tableRow.appendChild(table);

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
                
                var crtfcType = document.createElement("span");
                crtfcType.innerText = jsonObj.map.CRTFC_TYPE;
                theadTrTd1.appendChild(crtfcType);
                
                var theadTrTh2 = document.createElement("th");
                theadTrTh2.classList.add("text-center");
                theadTrTh2.classList.add("table-light");
                theadTrTh2.innerText="발급기관";
                theadTr.appendChild(theadTrTh2);

                var theadTrTd2 = document.createElement("td");
                theadTr.appendChild(theadTrTd2);
                
                var issueAgency = document.createElement("span");
                issueAgency.innerText = jsonObj.map.ISSUE_AGENCY;
                theadTrTd2.appendChild(issueAgency);

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
                
                var crtfcNumber = document.createElement("span");
                crtfcNumber.innerText = jsonObj.map.CRTFC_NUMBER;
                bodyTr1Td1.appendChild(crtfcNumber);

                var bodyTr1Th2 = document.createElement("th");
                bodyTr1Th2.classList.add("text-center");
                bodyTr1Th2.classList.add("table-light");
                bodyTr1Th2.innerText="발급일";
                bodyTr1.appendChild(bodyTr1Th2);

                var bodyTr1Td2 = document.createElement("td");
                bodyTr1.appendChild(bodyTr1Td2);
                
                var issueDate = document.createElement("span");
                issueDate.innerText = setDateInput(jsonObj.map.ISSUE_DATE);
                bodyTr1Td2.appendChild(issueDate);
                
                commentListBox.appendChild(rowBox);
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

                var commentListBox = document.getElementById("nav-info");
				commentListBox.innerHTML = "";

                var rowBox = document.createElement("div");
                rowBox.classList.add("row");

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

                //기본정보 끝


                //table시작

                var tableRow = document.createElement("div");
                tableRow.classList.add("row");
                tableRow.classList.add("mx-0");
                tableRow.classList.add("px-0");
                rowBox.appendChild(tableRow);

                var table = document.createElement("table");
                table.classList.add("table");
                table.classList.add("table-bordered");
                tableRow.appendChild(table);

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
	               	var bodyTr1Td3A = document.createElement("a");
	                bodyTr1Td3A.classList.add("text-center");
	                bodyTr1Td3A.setAttribute("href", "../admin/fileDownLoadProcess?aplcn_dtls_proper_num=" +jsonObj.businesslicense.aplcn_dtls_proper_num+ "&aplcn_atch_file_proper_num=" +jsonObj.businesslicense.aplcn_atch_file_proper_num);
	                bodyTr1Td3A.classList.add("text-decoration-none");
	                bodyTr1Td3A.innerText = jsonObj.businesslicense.original_file_name;
	                bodyTr1Td3.appendChild(bodyTr1Td3A);
	                bodyTr1.appendChild(bodyTr1Td3);
                }
                
                
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
	                var bodyTr2Td2A = document.createElement("a");
	                bodyTr2Td2A.classList.add("text-center");
	                bodyTr2Td2A.setAttribute("href", "../admin/fileDownLoadProcess?aplcn_dtls_proper_num=" +jsonObj.businessreport.aplcn_dtls_proper_num+ "&aplcn_atch_file_proper_num=" +jsonObj.businessreport.aplcn_atch_file_proper_num);
	                bodyTr2Td2A.classList.add("text-decoration-none");
	                bodyTr2Td2A.innerText = jsonObj.businessreport.original_file_name;
	                bodyTr2Td2.appendChild(bodyTr2Td2A);
	                bodyTr2.appendChild(bodyTr2Td2);
                }
                
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
	                var bodyTr3Td2A = document.createElement("a");
	                bodyTr3Td2A.classList.add("text-center");
	                bodyTr3Td2A.setAttribute("href", "../admin/fileDownLoadProcess?aplcn_dtls_proper_num=" +jsonObj.taxconfirm.aplcn_dtls_proper_num+ "&aplcn_atch_file_proper_num=" +jsonObj.taxconfirm.aplcn_atch_file_proper_num);
	                bodyTr3Td2A.classList.add("text-decoration-none");
	                bodyTr3Td2A.innerText = jsonObj.taxconfirm.original_file_name;
	                bodyTr3Td2.appendChild(bodyTr3Td2A);
	                bodyTr3.appendChild(bodyTr3Td2);
                }
                
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
	               	var bodyTr4Td3A = document.createElement("a");
	                bodyTr4Td3A.classList.add("text-center");
	                bodyTr4Td3A.setAttribute("href", "../admin/fileDownLoadProcess?aplcn_dtls_proper_num=" +jsonObj.resume.aplcn_dtls_proper_num+ "&aplcn_atch_file_proper_num=" +jsonObj.resume.aplcn_atch_file_proper_num);
	                bodyTr4Td3A.classList.add("text-decoration-none");
	                bodyTr4Td3A.innerText = jsonObj.resume.original_file_name;
	                bodyTr4Td3.appendChild(bodyTr4Td3A);
	                bodyTr4.appendChild(bodyTr4Td3);
                }
                
                // 학력 증명서
                var bodyTr5 = document.createElement("tr");
               	tbody.appendChild(bodyTr5);
               	
               	var bodyTr5Td1 = document.createElement("td");
               	bodyTr5Td1.classList.add("text-center");
                bodyTr5Td1.innerText = "학력 증명서";
                bodyTr5.appendChild(bodyTr5Td1);
                
            	var bodyTr5Td2 = document.createElement("td");
            	bodyTr5Td2.classList.add("text-center");
                
                if(jsonObj.educationlevel != undefined) {
	                var bodyTr5Td2A = document.createElement("a");
	                bodyTr5Td2A.classList.add("text-center");
	                bodyTr5Td2A.setAttribute("href", "../admin/fileDownLoadProcess?aplcn_dtls_proper_num=" +jsonObj.educationlevel.aplcn_dtls_proper_num+ "&aplcn_atch_file_proper_num=" +jsonObj.educationlevel.aplcn_atch_file_proper_num);
	                bodyTr5Td2A.classList.add("text-decoration-none");
	                bodyTr5Td2A.innerText = jsonObj.educationlevel.original_file_name;
	                bodyTr5Td2.appendChild(bodyTr5Td2A);
	                bodyTr5.appendChild(bodyTr5Td2);
                }
                
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
	            	var bodyTr6Td2A = document.createElement("a");
	                bodyTr6Td2A.classList.add("text-center");
	                bodyTr6Td2A.setAttribute("href", "../admin/fileDownLoadProcess?aplcn_dtls_proper_num=" +jsonObj.carrer.aplcn_dtls_proper_num+ "&aplcn_atch_file_proper_num=" +jsonObj.carrer.aplcn_atch_file_proper_num);
	                bodyTr6Td2A.classList.add("text-decoration-none");
	                bodyTr6Td2A.innerText = jsonObj.carrer.original_file_name;
	                bodyTr6Td2.appendChild(bodyTr6Td2A);
	                bodyTr6.appendChild(bodyTr6Td2);
                }
                
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
	            	var bodyTr7Td2A = document.createElement("a");
	                bodyTr7Td2A.classList.add("text-center");
	                bodyTr7Td2A.setAttribute("href", "../admin/fileDownLoadProcess?aplcn_dtls_proper_num=" +jsonObj.certificate.aplcn_dtls_proper_num+ "&aplcn_atch_file_proper_num=" +jsonObj.certificate.aplcn_atch_file_proper_num);
	                bodyTr7Td2A.classList.add("text-decoration-none");
	                bodyTr7Td2A.innerText = jsonObj.certificate.original_file_name;
	                bodyTr7Td2.appendChild(bodyTr7Td2A);
	                bodyTr7.appendChild(bodyTr7Td2);
                }
				
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
	               	var bodyTr8Td3A = document.createElement("a");
	                bodyTr8Td3A.classList.add("text-center");
	                bodyTr8Td3A.setAttribute("href", "../admin/fileDownLoadProcess?aplcn_dtls_proper_num=" +jsonObj.other.aplcn_dtls_proper_num+ "&aplcn_atch_file_proper_num=" +jsonObj.other.aplcn_atch_file_proper_num);
	                bodyTr8Td3A.classList.add("text-decoration-none");
	                bodyTr8Td3A.innerText = jsonObj.other.original_file_name;
	                bodyTr8Td3.appendChild(bodyTr8Td3A);
				}
                bodyTr8.appendChild(bodyTr8Td3);
				
                /*
               for(dataList of jsonObj){
             
                
                var bodyTr1 = document.createElement("tr");
                tbody.appendChild(bodyTr1);


                var bodyTr1Td1 = document.createElement("td");
                bodyTr1Td1.classList.add("text-center");
                bodyTr1Td1.innerText= dataList.file_type;
                bodyTr1.appendChild(bodyTr1Td1);

                var bodyTr1Td2 = document.createElement("td");
                bodyTr1Td2.classList.add("text-center");
                bodyTr1Td2.innerText = dataList.file_code;
                bodyTr1.appendChild(bodyTr1Td2);

                var bodyTr1Td3 = document.createElement("td");
                bodyTr1.appendChild(bodyTr1Td3);
                
                var bodyTr1Td3A = document.createElement("a");
                bodyTr1Td3A.classList.add("text-center");
                bodyTr1Td3A.setAttribute("href", "../admin/fileDownLoadProcess?aplcn_dtls_proper_num=" +dataList.aplcn_dtls_proper_num+ "&aplcn_atch_file_proper_num=" +dataList.aplcn_atch_file_proper_num);
                bodyTr1Td3A.classList.add("text-decoration-none");
                bodyTr1Td3A.innerText = dataList.original_file_name;
                bodyTr1Td3.appendChild(bodyTr1Td3A);
               }
               */
               
                commentListBox.appendChild(rowBox);
                
                
            }
    }
        xhr.open("get" , "../admin/selectFileList?aplcn_dtls_proper_num=" + userNo); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..	
}


