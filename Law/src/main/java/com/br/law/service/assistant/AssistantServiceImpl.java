package com.br.law.service.assistant;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.br.law.mapper.assistant.AssistantSQLMapper;
import com.br.law.mapper.user.TrialUserMapper;
import com.br.law.service.user.TrialUserService;
import com.br.law.vo.Tb_002;
import com.br.law.vo.Tb_005;
import com.br.law.vo.Tb_010;
import com.br.law.vo.Tb_011;
import com.br.law.vo.Tb_013;
import com.br.law.vo.Tb_014;

@Service
public class AssistantServiceImpl {
	
	@Autowired
	private AssistantSQLMapper assistantSQLMapper;
	
	@Autowired
	private TrialUserService trialUserService;
	
	
	public List<Map<String, Object>> allApplicantManagement() {
		List<Map<String, Object>> changeList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> applicantList = assistantSQLMapper.ApplicantList();		
		
		for(Map<String, Object> search : applicantList) {
			Map<String, Object> result = new HashMap<String ,Object>();
			result.put("aplcn_dtls_proper_num", search.get("APLCN_DTLS_PROPER_NUM"));
			result.put("announce_proper_num", search.get("ANNOUNCE_PROPER_NUM"));
			result.put("court_proper_num", search.get("COURT_PROPER_NUM"));
			result.put("aplcn_dtls_date", search.get("APLCN_DTLS_DATE"));
			result.put("trial_fcltt_description", search.get("TRIAL_FCLTT_DESCRIPTION"));
			result.put("user_name", search.get("USER_NAME"));
			result.put("announce_title", search.get("ANNOUNCE_TITLE"));
			
			String stsEnstr = (String)search.get("APLCN_DTLS_STS");
			result.put("aplcn_dtls_sts", convertAplcnStsToKorean(stsEnstr));
			
			changeList.add(result);
		}
		
		return changeList;
	}
	
	public Map<String, Object> applicantInformation(int aplcn_dtls_proper_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> applicantInfo = assistantSQLMapper.ApplicantDetails(aplcn_dtls_proper_num);
		
		map.put("applicantInfo", applicantInfo);
		
		return map;
	}
	
	public List<Map<String, Object>> certificateList(int aplcn_dtls_proper_num){
		List<Map<String, Object>> certificateList = assistantSQLMapper.certificate(aplcn_dtls_proper_num);
		System.out.println(certificateList);
		
		return certificateList;
		
	}
	
	public List<Map<String, Object>> uploadfile(int aplcn_dtls_proper_num){
		List<Map<String, Object>> uploadfileList = assistantSQLMapper.uploadFile(aplcn_dtls_proper_num);
		
		return uploadfileList; 
	}
	public void evaluation(Tb_013 tb_013) {
		assistantSQLMapper.evaluationApplicants(tb_013);
	}
	
	public void accept(int aplcn_dtls_proper_num){
		 assistantSQLMapper.accept(aplcn_dtls_proper_num);
		 
		 Tb_005 tb_005 = assistantSQLMapper.callTb_005(aplcn_dtls_proper_num);
		 Tb_014 tb_014 = new Tb_014();
		 tb_014.setAplcn_dtls_proper_num(aplcn_dtls_proper_num);
		 tb_014.setUser_proper_num(tb_005.getUser_proper_num());
		 tb_014.setTrial_fcltt_proper_num(tb_005.getTrial_fcltt_proper_num());
		 tb_014.setCourt_proper_num(tb_005.getCourt_proper_num());
		 
		 assistantSQLMapper.insertTb_014(tb_014);
		
	}
	
	public void referral(int aplcn_dtls_proper_num){
		 assistantSQLMapper.referral(aplcn_dtls_proper_num);
		
	}
	
	public List<Map<String, Object>> announce(){
		List<Map<String, Object>> announceName = assistantSQLMapper.announce();
		
		return announceName;
	}
	
	public List<Map<String, Object>> trial_fcltt(){
		List<Map<String, Object>> trial_fcltt_name = assistantSQLMapper.TRIAL_FCLTT_NAME();
		
		return trial_fcltt_name;
	}
	
	public Map<String, Object> announceSelectList(int announce_proper_num){
		Map<String, Object> announceSelect =  assistantSQLMapper.announceSelect(announce_proper_num);
		
		return announceSelect;
	}
	
//	0928 하다 조건별 분류
	public ArrayList<Tb_010> callTb_010() {
		return assistantSQLMapper.callTb_010();
	}
	//0928 하다 공고별 분류
	public ArrayList<Tb_002> callTb_002() {
		return assistantSQLMapper.callTb_002();
	}
	
	//0928 하다 조건별 유저
	public List<Map<String, Object>> callAUser(int trial_fcltt_proper_num){
		List<Map<String, Object>> changeList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> applicantList = assistantSQLMapper.callAUser(trial_fcltt_proper_num);	
		
		for(Map<String, Object> search : applicantList) {
			Map<String, Object> result = new HashMap<String ,Object>();
			result.put("aplcn_dtls_proper_num", search.get("APLCN_DTLS_PROPER_NUM"));
			result.put("announce_proper_num", search.get("ANNOUNCE_PROPER_NUM"));
			result.put("court_proper_num", search.get("COURT_PROPER_NUM"));
			result.put("aplcn_dtls_date", search.get("APLCN_DTLS_DATE"));
			result.put("trial_fcltt_description", search.get("TRIAL_FCLTT_DESCRIPTION"));
			result.put("user_name", search.get("USER_NAME"));
			result.put("announce_title", search.get("ANNOUNCE_TITLE"));
			
			String stsEnstr = (String)search.get("APLCN_DTLS_STS");
			result.put("aplcn_dtls_sts", convertAplcnStsToKorean(stsEnstr));
			
			changeList.add(result);
		}
		
		return changeList;
	}
	
	//0928 하다 공고별 유저
	public List<Map<String, Object>> callCUser(int announce_proper_num){
		List<Map<String, Object>> changeList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> applicantList = assistantSQLMapper.callCUser(announce_proper_num);
		
		for(Map<String, Object> search : applicantList) {
			Map<String, Object> result = new HashMap<String ,Object>();
			result.put("aplcn_dtls_proper_num", search.get("APLCN_DTLS_PROPER_NUM"));
			result.put("announce_proper_num", search.get("ANNOUNCE_PROPER_NUM"));
			result.put("court_proper_num", search.get("COURT_PROPER_NUM"));
			result.put("aplcn_dtls_date", search.get("APLCN_DTLS_DATE"));
			result.put("trial_fcltt_description", search.get("TRIAL_FCLTT_DESCRIPTION"));
			result.put("user_name", search.get("USER_NAME"));
			result.put("announce_title", search.get("ANNOUNCE_TITLE"));
			
			String stsEnstr = (String)search.get("APLCN_DTLS_STS");
			result.put("aplcn_dtls_sts", convertAplcnStsToKorean(stsEnstr));
			
			changeList.add(result);
		}
		
		return changeList;
	}
	
	//0928 병훈 신청현황 별 유저
	public List<Map<String, Object>> callDUser(String aplcn_dtls_sts){
		List<Map<String, Object>> changeList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> applicantList = assistantSQLMapper.callDUser(aplcn_dtls_sts);
		
		for(Map<String, Object> search : applicantList) {
			Map<String, Object> result = new HashMap<String ,Object>();
			result.put("aplcn_dtls_proper_num", search.get("APLCN_DTLS_PROPER_NUM"));
			result.put("announce_proper_num", search.get("ANNOUNCE_PROPER_NUM"));
			result.put("court_proper_num", search.get("COURT_PROPER_NUM"));
			result.put("aplcn_dtls_date", search.get("APLCN_DTLS_DATE"));
			result.put("trial_fcltt_description", search.get("TRIAL_FCLTT_DESCRIPTION"));
			result.put("user_name", search.get("USER_NAME"));
			result.put("announce_title", search.get("ANNOUNCE_TITLE"));
			
			String stsEnstr = (String)search.get("APLCN_DTLS_STS");
			result.put("aplcn_dtls_sts", convertAplcnStsToKorean(stsEnstr));
			
			changeList.add(result);
		}
		
		return changeList;
	}
	
	//0930 하다
	public int sumTb_013 (int aplcn_dtls_proper_num) {
		 return assistantSQLMapper.sumTb_013(aplcn_dtls_proper_num); 	
		}
	
	//1006 병훈 TB_011 List
	public ArrayList<Tb_011> callTb_011() {
		return assistantSQLMapper.callTb_011();
	}
	
	//1006 병훈 DataList
	public List<Map<String, Object>> callRegistList(
			@Param("trial_fcltt_proper_num") Integer trial_fcltt_proper_num, 
			@Param("court_proper_num") Integer court_proper_num, 
			@Param("searchType") String searchType, 
			@Param("searchWord") String searchWord,
			@Param("pageNum") int pageNum) {
		return assistantSQLMapper.callRegistList(trial_fcltt_proper_num, court_proper_num, searchType, searchWord, pageNum);
	}
	
	public int countRegistList(
			@Param("trial_fcltt_proper_num") Integer trial_fcltt_proper_num, 
			@Param("court_proper_num") Integer court_proper_num, 
			@Param("searchType") String searchType, 
			@Param("searchWord") String searchWord) {
		return assistantSQLMapper.countRegistList(trial_fcltt_proper_num, court_proper_num, searchType, searchWord);
	}
	
	//1013 병훈 DataList
	public List<Map<String, Object>> callConditionList(
			@Param("announce_proper_num") Integer announce_proper_num,
			@Param("trial_fcltt_proper_num") Integer trial_fcltt_proper_num, 
			@Param("court_proper_num") Integer court_proper_num, 
			@Param("aplcn_dtls_sts") String aplcn_dtls_sts,
			@Param("searchType") String searchType, 
			@Param("searchWord") String searchWord,
			@Param("pageNum") int pageNum) {
		
		List<Map<String, Object>> dataList = assistantSQLMapper.callConditionList(announce_proper_num, trial_fcltt_proper_num, court_proper_num, aplcn_dtls_sts, searchType, searchWord, pageNum);
		for(Map<String, Object> search : dataList) {
			String stsEnstr = (String)search.get("APLCN_DTLS_STS");
			search.put("APLCN_DTLS_STS", convertAplcnStsToKorean(stsEnstr));
		}
		
		return dataList;
	}
	
	public int countcallConditionList(
			@Param("announce_proper_num") Integer announce_proper_num,
			@Param("trial_fcltt_proper_num") Integer trial_fcltt_proper_num, 
			@Param("court_proper_num") Integer court_proper_num, 
			@Param("aplcn_dtls_sts") String aplcn_dtls_sts,
			@Param("searchType") String searchType, 
			@Param("searchWord") String searchWord) {
		return assistantSQLMapper.countcallConditionList(announce_proper_num, trial_fcltt_proper_num, court_proper_num, aplcn_dtls_sts, searchType, searchWord);
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
			stsKoStr = "심사완료";
			break;
		case "companion" :
			stsKoStr = "서류보완";
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
	
	public List<Map<String, Object>> excelList(){
		List<Map<String, Object>> applicantList = assistantSQLMapper.ApplicantList();
		
		return applicantList;
	}
}
