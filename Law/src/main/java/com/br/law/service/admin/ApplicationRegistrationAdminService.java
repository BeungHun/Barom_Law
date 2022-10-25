package com.br.law.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.br.law.controller.user.TrialUserController;
import com.br.law.mapper.admin.ApplicationRegistrationAdminMapper;
import com.br.law.service.assistant.AssistantServiceImpl;
import com.br.law.service.user.TrialUserService;
import com.br.law.vo.Tb_001;
import com.br.law.vo.Tb_005;
import com.br.law.vo.Tb_009;
import com.br.law.vo.Tb_010;
import com.br.law.vo.Tb_014;

@Service
public class ApplicationRegistrationAdminService {

	private static final org.slf4j.Logger LOGGER = LoggerFactory.getLogger(TrialUserController.class);
	
	@Autowired
	ApplicationRegistrationAdminMapper applicationRegistrationAdminMapper;
	@Autowired
	TrialUserService trialUserService;
	@Autowired
	AssistantServiceImpl assistantServiceImpl;
	
	public List<Map<String, Object>> selUserList(){
		return applicationRegistrationAdminMapper.selUserList();
	}
	
	//기존
//	public Map<String, Object> onestExamination(Map<String, Object> param){
//		return applicationRegistrationAdminMapper.onestExamination(param);
//	}
	//신규
	public Map<String, Object> onestExamination(int aplcn_dtls_proper_num){
		return applicationRegistrationAdminMapper.onestExamination(aplcn_dtls_proper_num);
	}
	
	public void upComplete(int param) {
		applicationRegistrationAdminMapper.upComplete(param);
	}
	
	public void upFail(int param) {
		applicationRegistrationAdminMapper.upFail(param);
	}
	
	public void acceptIns(Tb_014 param) { 
		applicationRegistrationAdminMapper.acceptIns(param);
	}
	
	public Tb_005 getFive(int param) {
		return applicationRegistrationAdminMapper.getFive(param);
	}
	
	public Map<String, Object> forComplete(Map<String, Object> param){
		return applicationRegistrationAdminMapper.forComplete(param);
	}
	
	public List<Tb_009> uploadFileSel(int param) {
		List<Tb_009> resultList = new ArrayList<Tb_009>();
		List<Tb_009> searchList = applicationRegistrationAdminMapper.uploadFileSel(param);
		for(Tb_009 search : searchList) {
			Tb_009 item = new Tb_009();
			item.setAplcn_atch_file_proper_num(search.getAplcn_atch_file_proper_num());
			item.setAplcn_dtls_proper_num(search.getAplcn_dtls_proper_num());
			item.setFile_code(trialUserService.convertFileCodeToKorean(search.getFile_code()));
			item.setFile_type(trialUserService.convertFileTypeToKorean(search.getFile_type()));
			item.setOriginal_file_name(search.getOriginal_file_name());
			item.setFile_path(search.getFile_path());
			
			resultList.add(item);
		}
		LOGGER.info("ApplicationRegistrationAdminService uploadFileSel - list : " + resultList);
		
		return resultList;
	}
	
	// hyejin 추가 위 함수와 동일 (returnType - map으로 변경)
	public Map<String, Object> uploadFileSelMap(int param) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Tb_009> searchList = applicationRegistrationAdminMapper.uploadFileSel(param);
		
		for(Tb_009 search : searchList) {
			Tb_009 item = new Tb_009();
			item.setAplcn_atch_file_proper_num(search.getAplcn_atch_file_proper_num());
			item.setAplcn_dtls_proper_num(search.getAplcn_dtls_proper_num());
			item.setFile_code(trialUserService.convertFileCodeToKorean(search.getFile_code()));
			item.setFile_type(trialUserService.convertFileTypeToKorean(search.getFile_type()));
			item.setOriginal_file_name(search.getOriginal_file_name());
			item.setFile_path(search.getFile_path());
			
			map.put(search.getFile_type(), item);
		}
		
		return map;
	}
	
	public Tb_001 getUserNameAndPk(int param) {
		return applicationRegistrationAdminMapper.getUserNameAndPk(param);
	}
	
	public int userDetailPk(int param) {
		return applicationRegistrationAdminMapper.userDetailPk(param);
	}
	
	public Tb_009 noForUploadFileSel(int param) {
		return applicationRegistrationAdminMapper.noForUploadFileSel(param);
	}
	
	public void companionUp(int param) {
		applicationRegistrationAdminMapper.companionUp(param);
	}
	
	public void evaluationCpUp(int param) {
		applicationRegistrationAdminMapper.evaluationCpUp(param);
	}
	
	public List<Map<String, Object>> accList(){
		return applicationRegistrationAdminMapper.accList();
	}
	
	public List<Tb_010> optionBoxapp() {
		return applicationRegistrationAdminMapper.optionBoxapp();
	}
	
	//22.10.04 신우진 추가 : 활동중인 명단 중 이름 검색 기능
	public List<Map<String, Object>> searchUserName(Map<String, Object> map){
		List<Map<String, Object>> changeList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> searchList = applicationRegistrationAdminMapper.searchUserName(map);
		System.out.println("서비스로 오나?" + map);
		 
		for(Map<String, Object> search : searchList) {
			Map<String, Object> result = new HashMap<String ,Object>();
			result.put("aplcn_dtls_proper_num", search.get("APLCN_DTLS_PROPER_NUM"));
			result.put("announce_proper_num", search.get("ANNOUNCE_PROPER_NUM"));
			result.put("court_proper_num", search.get("COURT_PROPER_NUM"));
			result.put("aplcn_dtls_date", search.get("APLCN_DTLS_DATE"));
			result.put("trial_fcltt_description", search.get("TRIAL_FCLTT_DESCRIPTION"));
			result.put("user_name", search.get("USER_NAME"));
			result.put("announce_title", search.get("ANNOUNCE_TITLE"));
			
			String stsEnstr = (String)search.get("APLCN_DTLS_STS");
			result.put("aplcn_dtls_sts", assistantServiceImpl.convertAplcnStsToKorean(stsEnstr));
			
			changeList.add(result);
		}
		
		return changeList;
		
	}
	
}
