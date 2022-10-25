package com.br.law.controller.assistant;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.br.law.service.assistant.AssistantServiceImpl;

@Controller
@RequestMapping("/admin/*")
public class ExcelController {

	@Autowired
	private AssistantServiceImpl assistantServiceImpl;
	
	
	@RequestMapping("excel")
	public void downloadExcel(HttpServletResponse response) throws IOException{
		
		Workbook workbook = new HSSFWorkbook();
		
		Sheet sheet = workbook.createSheet("조회목록");
		
		int rowNo = 0;
		
		Row headerRow = sheet.createRow(rowNo++);
		headerRow.createCell(0).setCellValue("신청번호");
		headerRow.createCell(1).setCellValue("이름");
		headerRow.createCell(2).setCellValue("신청공고");
		headerRow.createCell(3).setCellValue("조력자분류");
		headerRow.createCell(4).setCellValue("신청일");
		headerRow.createCell(5).setCellValue("신청상황");
		
//		headerRow.createCell(2).setCellValue("나이");
//		headerRow.createCell(3).setCellValue("이메일");
//		headerRow.createCell(4).setCellValue("번호");
//		headerRow.createCell(5).setCellValue("직업");
//		headerRow.createCell(6).setCellValue("주소");
//		headerRow.createCell(7).setCellValue("우편번호");
//		headerRow.createCell(8).setCellValue("지번주소");
//		headerRow.createCell(9).setCellValue("상세주소");
//		headerRow.createCell(10).setCellValue("은행");
//		headerRow.createCell(11).setCellValue("계좌번호");
//		headerRow.createCell(12).setCellValue("예금주");
//		headerRow.createCell(13).setCellValue("신청법원번호");
//		headerRow.createCell(14).setCellValue("신청법원");
//		headerRow.createCell(15).setCellValue("소송사건 당사자 경력 유무");
//		headerRow.createCell(16).setCellValue("소송사건 경력 내용");
//		headerRow.createCell(17).setCellValue("보험업계 자문 경력 유무");
//		headerRow.createCell(18).setCellValue("보험업계 자문 내용");
//		headerRow.createCell(19).setCellValue("형사처벌 받은 경력 유무");
//		headerRow.createCell(20).setCellValue("형사처벌 받은 경력 내용	");
//		headerRow.createCell(21).setCellValue("신청상태");
//		headerRow.createCell(22).setCellValue("신청 날짜");
//		headerRow.createCell(23).setCellValue("학교명");
//		headerRow.createCell(24).setCellValue("학과전공");
//		headerRow.createCell(25).setCellValue("학위");
//		headerRow.createCell(26).setCellValue("입학일");
//		headerRow.createCell(27).setCellValue("졸업일");
//		headerRow.createCell(28).setCellValue("최종학력 여부");
//		headerRow.createCell(29).setCellValue("활동기관명");
//		headerRow.createCell(30).setCellValue("경력구분");
//		headerRow.createCell(31).setCellValue("근무 시작 일자");
//		headerRow.createCell(32).setCellValue("근무 종료 일자");
//		headerRow.createCell(33).setCellValue("수행 업무");
//		headerRow.createCell(34).setCellValue("부서");
//		headerRow.createCell(35).setCellValue("직책");
//		headerRow.createCell(36).setCellValue("활동경력 설명");
//		headerRow.createCell(37).setCellValue("특기사항");
		
		List<Map<String, Object>> list = assistantServiceImpl.excelList();
		
		for(Map<String, Object> aa :list ) {
			Row row = sheet.createRow(rowNo++);
			 row.createCell(0).setCellValue(aa.get("APLCN_DTLS_PROPER_NUM").toString());
			 row.createCell(1).setCellValue(aa.get("USER_NAME").toString());
			 row.createCell(2).setCellValue(aa.get("ANNOUNCE_TITLE").toString());
			 row.createCell(3).setCellValue(aa.get("TRIAL_FCLTT_SBCLS_CODE").toString());
			 row.createCell(4).setCellValue(aa.get("APLCN_DTLS_DATE").toString());
			 row.createCell(5).setCellValue(aa.get("APLCN_DTLS_STS").toString());
			 
//			 row.createCell(2).setCellValue(aa.get("USER_AGE").toString());
//			 row.createCell(3).setCellValue(aa.get("USER_EMAIL").toString());
//			 row.createCell(4).setCellValue(aa.get("USER_PHONE").toString());
//			 row.createCell(5).setCellValue(aa.get("USER_JOB").toString());
//			 row.createCell(6).setCellValue(aa.get("USER_AR").toString());
//			 row.createCell(7).setCellValue(aa.get("USER_AR_ZONECODE").toString());
//			 row.createCell(8).setCellValue(aa.get("USER_AR_JIBUN").toString());
//			 row.createCell(9).setCellValue(aa.get("USER_AR_DETAIL").toString());
//			 row.createCell(10).setCellValue(aa.get("USER_BANK").toString());
//			 row.createCell(11).setCellValue(aa.get("USER_BANK_ACCOUNT").toString());
//			 row.createCell(12).setCellValue(aa.get("USER_BANK_HOLDER").toString());
//			 row.createCell(13).setCellValue(aa.get("COURT_PROPER_NUM").toString());
//			 row.createCell(14).setCellValue(aa.get("COURT_NAME").toString());
//			 row.createCell(15).setCellValue(aa.get("LIGTN_CASE_CARER_YN").toString());
//			 row.createCell(16).setCellValue(aa.get("LIGTN_CASE_CARER_ETC").toString());
//			 row.createCell(17).setCellValue(aa.get("INSRN_INDST_CARER_YN").toString());
//			 row.createCell(18).setCellValue(aa.get("INSRN_INDST_CARER_ETC").toString());
//			 row.createCell(19).setCellValue(aa.get("CRIMINAL_PENALTY_CARER_YN").toString());
//			 row.createCell(20).setCellValue(aa.get("CRIMINAL_PENALTY_CARER_ETC").toString());
//			 row.createCell(21).setCellValue(aa.get("APLCN_DTLS_STS").toString());
//			 row.createCell(22).setCellValue(aa.get("APLCN_DTLS_DATE").toString());
//			 row.createCell(23).setCellValue(aa.get("EDCTN_SCHOOL_NAME").toString());
//			 row.createCell(24).setCellValue(aa.get("EDCTN_MAJOR").toString());
//			 row.createCell(25).setCellValue(aa.get("EDCTN_DEGREE").toString());
//			 row.createCell(26).setCellValue(aa.get("EDCTN_ADMSN_DATE").toString());
//			 row.createCell(27).setCellValue(aa.get("EDCTN_GRDTN_DATE").toString());
//			 row.createCell(28).setCellValue(aa.get("EDCTN_FINAL_YN").toString());
//			 row.createCell(29).setCellValue(aa.get("COMPANY_NAME").toString());
//			 row.createCell(30).setCellValue(aa.get("CARER_TYPE").toString());
//			 row.createCell(31).setCellValue(aa.get("WORK_START_DATE").toString());
//			 row.createCell(32).setCellValue(aa.get("WORK_END_DATE").toString());
//			 row.createCell(33).setCellValue(aa.get("WORK_DESCRIPTION").toString());
//			 row.createCell(34).setCellValue(aa.get("WORK_DEPARTMENT").toString());
//			 row.createCell(35).setCellValue(aa.get("WORK_POSITION").toString());
//			 row.createCell(36).setCellValue(aa.get("CARER_DESCRIPTION").toString());
//			 row.createCell(37).setCellValue(aa.get("SPECIAL_NOTE_DESCRIPTION").toString());
			 
		}
		
		
		response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment;filename=boardlist.xls");
 
        workbook.write(response.getOutputStream());
        workbook.close();
		
		
		
	}
 
}
