<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

function operation(e){
	console.log(e.value);
	const targetBox = document.getElementById("target");
	targetBox.innerHTML = "";
	
	if(e.value == "examination" || e.value =="evaluationCp" || e.value == "companion"){
	
	
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)

			
			        
			const selBox = document.createElement("select");
			selBox.setAttribute('id', "good");
            selBox.setAttribute('onchange', "callUser(this)");
            targetBox.appendChild(selBox);
           
            
            const selectBox = document.getElementById("good");
       	    selectBox.innerHTML = "";
    		
       		var optionBox1 = document.createElement('option');
       		optionBox1.innerText = '선택';
       		selectBox.appendChild(optionBox1);
       		
       		for(option of jsonObj.Tb_010){
   	    		var optionBox = document.createElement('option');
   	            /* optionBox.setAttribute('value', option.trial_fcltt_proper_num); */
   	        	optionBox.setAttribute('value', option.trial_fcltt_proper_num + e.value);
   	            optionBox.innerText = option.trial_fcltt_description;
   	            selectBox.appendChild(optionBox);
		       
			}
		}
	}
	}
	
	xhr.open("get" , "../admin/optionBoxapp"); //리퀘스트 세팅..
	//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
	xhr.send(); //AJAX로 리퀘스트함..
	
}


function OneSignupList(sts, num){
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
            var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
            
                var commitBox = document.getElementById("randoring");
				commitBox.innerHTML = "";

                var table = document.createElement("table");
                commitBox.classList.add(table);

                var thead = document.createElement("thead");
                table.appendChild(thead);

                var theadTr = document.createElement("tr");
                theadTr.appendChild(theadTr);

                var theadTh1 = document.createElement("th");
                theadTh.innerHTML="번호";
                theadTr.appendChild(theadTh);

                var theadTh2 = document.createElement("th");
                theadTh2.innerHTML="이름";
                theadTr.appendChild(theadTh);

                var theadTh3 = document.createElement("th");
                theadTh3.innerHTML="법원이름";
                theadTr.appendChild(theadTh);

                var theadTh4 = document.createElement("th");
                theadTh4.innerHTML="이메일";
                theadTr.appendChild(theadTh);

                var theadTh5 = document.createElement("th");
                theadTh5.innerHTML="신청일";
                theadTr.appendChild(theadTh);

                var theadTh6 = document.createElement("th");
                theadTh6.innerHTML="조력자분류";
                theadTr.appendChild(theadTh);

                var theadTh7 = document.createElement("th");
                theadTh7.innerHTML="신청현황";
                theadTr.appendChild(theadTh);

                var tbody = document.createElement("tbody");
                table.appendChild(tbody);

                for(dataList of jsonObj.json){

                    var tr = document.createElement("tr");
                    tr.setAttribute("onclick", "location.href='../admin/selUserListDetail?aplcn_dtls_proper_num=+${data.APLCN_DTLS_PROPER_NUM}+'");
                    tbody.appendChild(tr);

                    var td1 = document.createElement("td");
                    td1.innerText=dataList.APLCN_DTLS_PROPER_NUM;
                    tr.appendChild(td1);

                    var td2 = document.createElement("td");
                    td2.innerText=dataList.USER_NAME;
                    tr.appendChild(td2);

                    var td3 = document.createElement("td");
                    td3.innerText=dataList.COURT_NAME;
                    tr.appendChild(td3);

                    var td4 = document.createElement("td");
                    td4.innerText=dataList.USER_EMAIL;
                    tr.appendChild(td4);

                    var td5 = document.createElement("td");
                    td5.innerText=moment(dataList.APLCN_DTLS_DATE),format('YYYY-MM-DD');
                    tr.appendChild(td5);

                    var td6 = document.createElement("td");
                    td6.innerText=dataList.TRIAL_FCLTT_SBCLS_CODE;
                    tr.appendChild(td6);

                    var td7 = document.createElement("td");
                    td7.innerText=dataList.APLCN_DTLS_STS;
                    tr.appendChild(td7);
                }

                commitBox.appendchild(table);
    	}
	}
    xhr.open("get" , "../admin/OneSignupList?aplcn_dtls_sts="+sts.value+"&trial_fcltt_proper_num=num.value"); //리퀘스트 세팅..
	//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
	xhr.send(); //AJAX로 리퀘스트함..
	
}
</script>
</head>
<body>
	

</body>
</html>