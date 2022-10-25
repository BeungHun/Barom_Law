package com.br.law.service.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.br.law.controller.user.TrialUserController;
import com.br.law.mapper.user.ApplicationRegistrationMapper;
import com.br.law.mapper.user.TrialUserMapper;
import com.br.law.vo.Tb_001;
import com.br.law.vo.Tb_005;
import com.br.law.vo.Tb_006;
import com.br.law.vo.Tb_007;
import com.br.law.vo.Tb_008;
import com.br.law.vo.Tb_009;

@Service
public class TrialUserService {
	
	private static final org.slf4j.Logger LOGGER = LoggerFactory.getLogger(TrialUserController.class);
	
	@Autowired
	private TrialUserMapper trialMainMapper;
	@Autowired
	private ApplicationRegistrationMapper applicationRegistrationMapper;
	
	public Tb_001 login(Tb_001 user) {
		return trialMainMapper.login(user);
	}
	
//	public User login(User user) {
//		return trialMainMapper.login(user);
//	}
	
	public Tb_001 example(Tb_001 user) {
		return trialMainMapper.example(user);
	}
	
	public Tb_001 userins(Tb_001 user) {
		return trialMainMapper.seluser(user);
	}
	
	public Tb_001 getMyInfo(int user_proper_num) {
		return trialMainMapper.selectMyInfo(user_proper_num); 
	}
	
	public int modifyMyInfo(Tb_001 user) {
		return trialMainMapper.modifyMyInfo(user);
	}
	
	public int modifyPassword(int user_proper_num, String new_pw) {
		return trialMainMapper.modifyPassword(user_proper_num, new_pw);
	}
	
	public boolean withdrawal(int user_proper_num, String user_pw) {
		Tb_001 user = getMyInfo(user_proper_num);
		
		if(!user.getUser_pw().equals(user_pw)) {
			return false;
		}
		
		trialMainMapper.withdrawal(user_proper_num, user_pw);
		return true;
	}
	
	public List<Map<String, Object>> getMyApplicationList(int user_proper_num) {
		List<Map<String, Object>> resultList = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> searchList = trialMainMapper.selectMyApplicationList(user_proper_num);  
		
		for(Map<String, Object> search : searchList) {
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("rownum", search.get("ROWNUM"));
			result.put("announce_proper_num", search.get("ANNOUNCE_PROPER_NUM"));
			result.put("aplcn_dtls_proper_num", search.get("APLCN_DTLS_PROPER_NUM"));
			result.put("court_proper_num", search.get("COURT_PROPER_NUM"));
			result.put("aplcn_dtls_date", search.get("APLCN_DTLS_DATE"));
			result.put("trial_fcltt_description", search.get("TRIAL_FCLTT_DESCRIPTION"));
			result.put("court_name", search.get("COURT_NAME"));
			
			// 신청상태 한글로 변환하여 리스트 넣기(출력용)
			String stsEnStr = (String)search.get("APLCN_DTLS_STS");
			result.put("aplcn_dtls_sts", convertAplcnStsToKorean(stsEnStr));
			
			resultList.add(result);
		}
		
		return resultList;
	}
	
	public Map<String, Object> getMyApplication(int aplcn_dtls_proper_num) {
		return trialMainMapper.selectMyApplication(aplcn_dtls_proper_num);
	}
	
	public int modifyTableFive(Tb_005 param) {
		return trialMainMapper.modifyTableFive(param);
	}
	
	public int modifyTableSix(Tb_006 param) {
		return trialMainMapper.modifyTableSix(param);
	}
	
	public int modifyTableSeven(Tb_007 param) {
		return trialMainMapper.modifyTableSeven(param);
	}
	
	public int modifyTableEight(Tb_008 param) {
		return trialMainMapper.modifyTableEight(param);
	}
	
	public boolean modifyTableNine(Tb_009 param) {
		
		boolean result = true;
		// 등재신청 첨부파일이 존재하면 update, 존재하지 않으면 데이터 insert
		Tb_009 search = trialMainMapper.selectTableNineByAplcnNoAndFileType(param.getAplcn_dtls_proper_num(), param.getFile_type());
		
		if(search != null) {	// 존재하면 update
			param.setAplcn_atch_file_proper_num(search.getAplcn_atch_file_proper_num());
			if(trialMainMapper.modifyTableNine(param) < 1) result = false;
			
		} else {		// 존재하지 않으면 insert
			if(applicationRegistrationMapper.uploadFilesIns(param) < 1) result = false;
		}
		
		// 파일 하나라도 업데이트 실패 시 return false
		return result;
		
	}
	
	public int updateApplicationStatus(int aplcn_dtls_proper_num, String aplcn_dtls_sts) {
		LOGGER.info("aplcn_dtls_proper_num : " + aplcn_dtls_proper_num);
		LOGGER.info("aplcn_dtls_sts : " + aplcn_dtls_sts);
		return trialMainMapper.updateApplicationStatus(aplcn_dtls_proper_num, aplcn_dtls_sts);
	}
	
	// 나의 활동내역 리스트
	public List<Map<String, Object>> getMyActiveList(int user_proper_num) {
		return trialMainMapper.selectMyActiveList(user_proper_num);
	}	
	
	// 나의 등재 리스트
	public List<Map<String, Object>> getMyAcceptList(int user_proper_num) {
		return trialMainMapper.selectMyAcceptList(user_proper_num);
	}
	
	// 나의 활동여부 변경
	public int updateAcceptActYn(int accept_proper_num, String accept_act_yn) {
		// accept_act_yn : y -> 활동중으로 변경
		// accept_act_yn : n -> 활동중지로 변경
		return trialMainMapper.updateAcceptActYn(accept_proper_num, accept_act_yn);
	}
	
	
	// 등재신청 상태 en -> ko 변환 출력용 메소드
	public String convertAplcnStsToKorean(String aplcn_dtls_sts) {
		String stsKoStr = "";
		
		switch (aplcn_dtls_sts) {
		case "ing":
			stsKoStr = "작성중";
			break;
		case "examination" :
			stsKoStr = "신청중";
			break;
		case "evaluationCp" :
			stsKoStr = "1차심사완료";
			break;
		case "companion" :
			stsKoStr = "서류보완필요";
			break;
		case "failure" :
			stsKoStr = "불합격";
			break;
		case "accept" :
			stsKoStr = "합격";
			break;
		}
		return stsKoStr;
	}
	
	// 첨부서류 분류 코드  en -> ko 변환 출력용 메소드
	public String convertFileCodeToKorean(String file_code) {
		String fileCodeKoStr = "";
		
		switch (file_code) {
		case "co" :
			fileCodeKoStr = "공통";
			break;
		case "pe" :
			fileCodeKoStr = "개인";
			break;
		case "ot" :
			fileCodeKoStr = "기타";
			break;
		}
		return fileCodeKoStr;
	}
	
	// 첨부서류 타입 en -> ko 변환 출력용 메소드
	public String convertFileTypeToKorean(String file_type) {
		String fileTypeKoStr = "";
		
		switch (file_type) {
		case "businesslicense" :
			fileTypeKoStr = "사업자등록증";
			break;
		case "businessreport" :
			fileTypeKoStr = "업무관련 등록신고 현황";
			break;
		case "taxconfirm" :
			fileTypeKoStr = "납세증명확인서";
			break;
		case "resume" :
			fileTypeKoStr = "이력서";
			break;
		case "educationlevel" :
			fileTypeKoStr = "학력정보 증명서";
			break;
		case "carrer" :
			fileTypeKoStr = "경력정보 증명서";
			break;
		case "certificate" :
			fileTypeKoStr = "자격증정보 증명서";
			break;
		case "other" :
			fileTypeKoStr = "기타";
			break;
		}
		return fileTypeKoStr;
	}
	
	
}
