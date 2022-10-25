function changeBtn(addId, navClassName){
	
	var addBtn = document.getElementById(addId);
	
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


function tableFiveInfo(){
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)

                var commentListBox = document.getElementById("nav-info");
				commentListBox.innerHTML = "";

                var rowBox = document.createElement("div");
                rowBox.classList.add("row");	

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
                colGroupTwo.setAttribute("width", "80%");
                colGroup.appendChild(colGroupTwo);

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
                bodyTr1Th1.innerText="소송사건 당사자 경력 내용 " + jsonObj.userInfo.applicantInfo.LIGTN_CASE_CARER_YN;
                bodyTr1.appendChild(bodyTr1Th1);

                var bodyTr1Td1 = document.createElement("td");
				if(jsonObj.userInfo.applicantInfo.LIGTN_CASE_CARER_ETC == undefined) {
					bodyTr1Td1.innerText = '';
				} else {
					bodyTr1Td1.innerText=jsonObj.userInfo.applicantInfo.LIGTN_CASE_CARER_ETC;
				}
				bodyTr1.appendChild(bodyTr1Td1);

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
                bodyTr2Th1.innerText ="보험업계 경력 내용" + jsonObj.userInfo.applicantInfo.INSRN_INDST_CARER_YN;
                bodyTr2.appendChild(bodyTr2Th1);

                var bodyTr2Td1 = document.createElement("td");
				if(jsonObj.userInfo.applicantInfo.INSRN_INDST_CARER_ETC == undefined) {
					bodyTr2Td1.innerText = '';
				} else {
					 bodyTr2Td1.innerText=jsonObj.userInfo.applicantInfo.INSRN_INDST_CARER_ETC;
				}
				 bodyTr2.appendChild(bodyTr2Td1);

                var bodyTr3 = document.createElement("tr");
                bodyTr3.setAttribute("rowspan", "2");
                bodyTr3.setAttribute("scope", "row");
                bodyTr3.classList.add("text-center");
                bodyTr3.classList.add("border-2");
                bodyTr3.setAttribute("style", "line-height:100px");
                tbody.appendChild(bodyTr3);

                var bodyTr3Th1 = document.createElement("th");
                bodyTr3Th1.classList.add("table-light");
                bodyTr3Th1.innerText="형사처벌 경력 내용" + jsonObj.userInfo.applicantInfo.CRIMINAL_PENALTY_CARER_YN;
                bodyTr3.appendChild(bodyTr3Th1);

                var bodyTr3Td1 = document.createElement("td");
				if(jsonObj.userInfo.applicantInfo.CRIMINAL_PENALTY_CARER_ETC == undefined) {
					bodyTr3Td1.innerText = '';
				} else {
					  bodyTr3Td1.innerText= jsonObj.userInfo.applicantInfo.CRIMINAL_PENALTY_CARER_ETC;
				}
				  bodyTr3.appendChild(bodyTr3Td1);
                
                
                
                commentListBox.appendChild(rowBox);

            }
    }
		 xhr.open("get" , "userInfoTable?aplcn_dtls_proper_num=" + userNo); //리퀘스트 세팅..
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
                theadTrTd1.innerText=jsonObj.userInfo.applicantInfo.EDCTN_SCHOOL_NAME;
                theadTr.appendChild(theadTrTd1);

                var theadTrTh2 = document.createElement("th");
                theadTrTh2.classList.add("text-center");
                theadTrTh2.classList.add("table-light");
                theadTrTh2.innerText="학과전공";
                theadTr.appendChild(theadTrTh2);

                var theadTrTd2 = document.createElement("td");
                theadTrTd2.innerText=jsonObj.userInfo.applicantInfo.EDCTN_MAJOR;
                theadTr.appendChild(theadTrTd2);

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
                bodyTr1Td1.innerText=jsonObj.userInfo.applicantInfo.EDCTN_ADMSN_DATE;
                bodyTr1.appendChild(bodyTr1Td1);

                var bodyTr1Th2 = document.createElement("th");
                bodyTr1Th2.classList.add("text-center");
                bodyTr1Th2.classList.add("table-light");
                bodyTr1Th2.innerText="종료일";
                bodyTr1.appendChild(bodyTr1Th2);

                var bodyTr1Td2 = document.createElement("td");
                bodyTr1Td2.innerText=jsonObj.userInfo.applicantInfo.EDCTN_GRDTN_DATE;
                bodyTr1.appendChild(bodyTr1Td2);

                var bodyTr2 = document.createElement("tr");
                tbody.appendChild(bodyTr2);

                var bodyTr2Th1 = document.createElement("th");
                bodyTr2Th1.classList.add("text-center");
                bodyTr2Th1.classList.add("table-light");
                bodyTr2Th1.innerText="학위";
                bodyTr2.appendChild(bodyTr2Th1);

                var bodyTr2Td1 = document.createElement("td");
                bodyTr2Td1.innerText=jsonObj.userInfo.applicantInfo.EDCTN_DEGREE;
                bodyTr2.appendChild(bodyTr2Td1);

                var bodyTr2Th2 = document.createElement("th");
                bodyTr2Th2.innerText="최종학력";
                bodyTr2Th2.classList.add("text-center");
                bodyTr2Th2.classList.add("table-light");
                bodyTr2.appendChild(bodyTr2Th2);

                var bodyTr2Td2 = document.createElement("td");
                bodyTr2Td2.innerText=jsonObj.userInfo.applicantInfo.EDCTN_FINAL_YN;
                bodyTr2.appendChild(bodyTr2Td2);

                commentListBox.appendChild(rowBox);
                
            }
			
    }
        xhr.open("get" , "userInfoTable?aplcn_dtls_proper_num=" + userNo); //리퀘스트 세팅..
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
                theadTrTd1.innerText=jsonObj.userInfo.applicantInfo.COMPANY_NAME;
                theadTr.appendChild(theadTrTd1);

                var theadTrTh2 = document.createElement("th");
                theadTrTh2.classList.add("text-center");
                theadTrTh2.classList.add("table-light");
                theadTrTh2.innerText="경력 구분";
                theadTr.appendChild(theadTrTh2);

                var theadTrTd2 = document.createElement("td");
                theadTrTd2.innerText=jsonObj.userInfo.applicantInfo.CARER_TYPE;
                theadTr.appendChild(theadTrTd2);

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
                bodyTr1Td1.innerText=jsonObj.userInfo.applicantInfo.WORK_START_DATE;
                bodyTr1.appendChild(bodyTr1Td1);

                var bodyTr1Th2 = document.createElement("th");
                bodyTr1Th2.classList.add("text-center");
                bodyTr1Th2.classList.add("table-light");
                bodyTr1Th2.innerText="근무 종료 일자";
                bodyTr1.appendChild(bodyTr1Th2);

                var bodyTr1Td2 = document.createElement("td");
                bodyTr1Td2.innerText=jsonObj.userInfo.applicantInfo.WORK_END_DATE;
                bodyTr1.appendChild(bodyTr1Td2);

                var bodyTr2 = document.createElement("tr");
                tbody.appendChild(bodyTr2);

                var bodyTr2Th1 = document.createElement("th");
                bodyTr2Th1.classList.add("text-center");
                bodyTr2Th1.classList.add("table-light");
                bodyTr2Th1.innerText="직책";
                bodyTr2.appendChild(bodyTr2Th1);

                var bodyTr2Td1 = document.createElement("td");
                bodyTr2Td1.innerText=jsonObj.userInfo.applicantInfo.WORK_POSITION;
                bodyTr2.appendChild(bodyTr2Td1);

                var bodyTr2Th2 = document.createElement("th");
                bodyTr2Th2.innerText="부서";
                bodyTr2Th2.classList.add("text-center");
                bodyTr2Th2.classList.add("table-light");
                bodyTr2.appendChild(bodyTr2Th2);

                var bodyTr2Td2 = document.createElement("td");
                bodyTr2Td2.innerText=jsonObj.userInfo.applicantInfo.WORK_DEPARTMENT	;
                bodyTr2.appendChild(bodyTr2Td2);


                var bodyTr3 = document.createElement("tr");
                tbody.appendChild(bodyTr3);

                var bodyTr3Th = document.createElement("th");
                bodyTr3Th.classList.add("text-center");
                bodyTr3Th.classList.add("table-light");
                bodyTr3Th.innerText="수행 업무";
                bodyTr3.appendChild(bodyTr3Th);

                var bodyTr3Td = document.createElement("td");
                bodyTr3Td.setAttribute("colspan", "3");
                bodyTr3Td.innerText=jsonObj.userInfo.applicantInfo.WORK_DESCRIPTION;
                bodyTr3.appendChild(bodyTr3Td);


                //기본정보 네비
 
                //테이블 시작

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
                thead2Tr1Td1.innerText= jsonObj.userInfo.applicantInfo.CARER_DESCRIPTION;
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
                thead2Tr2Td1.innerText=jsonObj.userInfo.applicantInfo.SPECIAL_NOTE_DESCRIPTION;
                thead2Tr2.appendChild(thead2Tr2Td1);

                commentListBox.appendChild(rowBox);
            }
    }
        xhr.open("get" , "userInfoTable?aplcn_dtls_proper_num=" + userNo); //리퀘스트 세팅..
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
                colGroupThree.setAttribute("width", "25%");
                colGroup.appendChild(colGroupThree);
                
                var colGroupFour = document.createElement("col");
                colGroupTwo.setAttribute("width", "25%");
                colGroup.appendChild(colGroupFour);

               

                var thead = document.createElement("thead");
                table.appendChild(thead);

                var theadTr = document.createElement("tr");
                theadTr.classList.add("text-center");
                thead.appendChild(theadTr);

                var theadTrTh1 = document.createElement("th");
                theadTrTh1.setAttribute("scope", "col");
                theadTrTh1.classList.add("table-light");
                theadTrTh1.innerText="자격증 종목";
                theadTr.appendChild(theadTrTh1);

                var theadTrTh2 = document.createElement("th");
                theadTrTh2.setAttribute("scope", "col");
                theadTrTh2.classList.add("table-light");
                theadTrTh2.innerText="자격증 번호";
                theadTr.appendChild(theadTrTh2);

                var theadTrTh3 = document.createElement("th");
                theadTrTh3.setAttribute("scope", "col");
                theadTrTh3.classList.add("table-light");
                theadTrTh3.innerText="발급 기관";
                theadTr.appendChild(theadTrTh3);
                
                
                var theadTrTh4 = document.createElement("th");
                theadTrTh4.setAttribute("scope", "col");
                theadTrTh4.classList.add("table-light");
                theadTrTh4.innerText="발급일";
                theadTr.appendChild(theadTrTh4);






                var tbody = document.createElement("tbody");
                table.appendChild(tbody);
				
                
               for(certificateList of jsonObj){
             
                
                var bodyTr1 = document.createElement("tr");
                tbody.appendChild(bodyTr1);


                var bodyTr1Td1 = document.createElement("td");
                bodyTr1Td1.classList.add("text-center");
                bodyTr1Td1.innerText= certificateList.CRTFC_TYPE;
                bodyTr1.appendChild(bodyTr1Td1);

                var bodyTr1Td2 = document.createElement("td");
                bodyTr1Td2.classList.add("text-center");
                bodyTr1Td2.innerText = certificateList.CRTFC_NUMBER;
                bodyTr1.appendChild(bodyTr1Td2);

                var bodyTr1Td3 = document.createElement("td");
                bodyTr1Td3.classList.add("text-center");
                bodyTr1Td3.innerText = certificateList.ISSUE_AGENCY;
                bodyTr1.appendChild(bodyTr1Td3);
                
                var bodyTr1Td4 = document.createElement("td");
                bodyTr1Td4.classList.add("text-center");
                bodyTr1Td4.innerText = certificateList.ISSUE_DATE;
                bodyTr1.appendChild(bodyTr1Td4);
                
               }
                
                commentListBox.appendChild(rowBox);
                
                
            }
    }
        xhr.open("get" , "certificateList?aplcn_dtls_proper_num=" + userNo); //리퀘스트 세팅..
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
				
                
               for(dataList of jsonObj){
             
                
                var bodyTr1 = document.createElement("tr");
                tbody.appendChild(bodyTr1);


                var bodyTr1Td1 = document.createElement("td");
                bodyTr1Td1.classList.add("text-center");
                bodyTr1Td1.innerText= dataList.FILE_TYPE;
                bodyTr1.appendChild(bodyTr1Td1);

                var bodyTr1Td2 = document.createElement("td");
                bodyTr1Td2.classList.add("text-center");
                bodyTr1Td2.innerText = dataList.FILE_CODE;
                bodyTr1.appendChild(bodyTr1Td2);

                var bodyTr1Td3 = document.createElement("td");
                bodyTr1.appendChild(bodyTr1Td3);
                
                if(dataList.ORIGINAL_FILE_NAME != undefined){
                var bodyTr1Td3A = document.createElement("a");
                bodyTr1Td3A.classList.add("text-center");
                bodyTr1Td3A.setAttribute("href", "fileDownLoadProcess?aplcn_dtls_proper_num=" +dataList.APLCN_DTLS_PROPER_NUM+ "&aplcn_atch_file_proper_num=" +dataList.APLCN_ATCH_FILE_PROPER_NUM);
                bodyTr1Td3A.classList.add("text-decoration-none");
                bodyTr1Td3A.innerText = dataList.ORIGINAL_FILE_NAME;
                bodyTr1Td3.appendChild(bodyTr1Td3A);
                }
                
               }
                
                commentListBox.appendChild(rowBox);
                
                
            }
    }
        xhr.open("get" , "uploadfile?aplcn_dtls_proper_num=" + userNo); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..	
}



