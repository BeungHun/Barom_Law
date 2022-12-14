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
			
			// ???????????? ????????? ???????????? ????????? ??????(?????????)
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
		// ???????????? ??????????????? ???????????? update, ???????????? ????????? ????????? insert
		Tb_009 search = trialMainMapper.selectTableNineByAplcnNoAndFileType(param.getAplcn_dtls_proper_num(), param.getFile_type());
		
		if(search != null) {	// ???????????? update
			param.setAplcn_atch_file_proper_num(search.getAplcn_atch_file_proper_num());
			if(trialMainMapper.modifyTableNine(param) < 1) result = false;
			
		} else {		// ???????????? ????????? insert
			if(applicationRegistrationMapper.uploadFilesIns(param) < 1) result = false;
		}
		
		// ?????? ???????????? ???????????? ?????? ??? return false
		return result;
		
	}
	
	public int updateApplicationStatus(int aplcn_dtls_proper_num, String aplcn_dtls_sts) {
		LOGGER.info("aplcn_dtls_proper_num : " + aplcn_dtls_proper_num);
		LOGGER.info("aplcn_dtls_sts : " + aplcn_dtls_sts);
		return trialMainMapper.updateApplicationStatus(aplcn_dtls_proper_num, aplcn_dtls_sts);
	}
	
	// ?????? ???????????? ?????????
	public List<Map<String, Object>> getMyActiveList(int user_proper_num) {
		return trialMainMapper.selectMyActiveList(user_proper_num);
	}	
	
	// ?????? ?????? ?????????
	public List<Map<String, Object>> getMyAcceptList(int user_proper_num) {
		return trialMainMapper.selectMyAcceptList(user_proper_num);
	}
	
	// ?????? ???????????? ??????
	public int updateAcceptActYn(int accept_proper_num, String accept_act_yn) {
		// accept_act_yn : y -> ??????????????? ??????
		// accept_act_yn : n -> ??????????????? ??????
		return trialMainMapper.updateAcceptActYn(accept_proper_num, accept_act_yn);
	}
	
	
	// ???????????? ?????? en -> ko ?????? ????????? ?????????
	public String convertAplcnStsToKorean(String aplcn_dtls_sts) {
		String stsKoStr = "";
		
		switch (aplcn_dtls_sts) {
		case "ing":
			stsKoStr = "?????????";
			break;
		case "examination" :
			stsKoStr = "?????????";
			break;
		case "evaluationCp" :
			stsKoStr = "1???????????????";
			break;
		case "companion" :
			stsKoStr = "??????????????????";
			break;
		case "failure" :
			stsKoStr = "?????????";
			break;
		case "accept" :
			stsKoStr = "??????";
			break;
		}
		return stsKoStr;
	}
	
	// ???????????? ?????? ??????  en -> ko ?????? ????????? ?????????
	public String convertFileCodeToKorean(String file_code) {
		String fileCodeKoStr = "";
		
		switch (file_code) {
		case "co" :
			fileCodeKoStr = "??????";
			break;
		case "pe" :
			fileCodeKoStr = "??????";
			break;
		case "ot" :
			fileCodeKoStr = "??????";
			break;
		}
		return fileCodeKoStr;
	}
	
	// ???????????? ?????? en -> ko ?????? ????????? ?????????
	public String convertFileTypeToKorean(String file_type) {
		String fileTypeKoStr = "";
		
		switch (file_type) {
		case "businesslicense" :
			fileTypeKoStr = "??????????????????";
			break;
		case "businessreport" :
			fileTypeKoStr = "???????????? ???????????? ??????";
			break;
		case "taxconfirm" :
			fileTypeKoStr = "?????????????????????";
			break;
		case "resume" :
			fileTypeKoStr = "?????????";
			break;
		case "educationlevel" :
			fileTypeKoStr = "???????????? ?????????";
			break;
		case "carrer" :
			fileTypeKoStr = "???????????? ?????????";
			break;
		case "certificate" :
			fileTypeKoStr = "??????????????? ?????????";
			break;
		case "other" :
			fileTypeKoStr = "??????";
			break;
		}
		return fileTypeKoStr;
	}
	
	
}
