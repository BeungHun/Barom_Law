package com.br.law.mapper.assistant;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.br.law.vo.Tb_002;
import com.br.law.vo.Tb_005;
import com.br.law.vo.Tb_010;
import com.br.law.vo.Tb_011;
import com.br.law.vo.Tb_013;
import com.br.law.vo.Tb_014;

public interface AssistantSQLMapper {
	public List<Map<String, Object>> ApplicantList();
	

	public Map<String, Object> ApplicantDetails(int aplcn_dtls_proper_num);
	public void ApplicnatAttachedFile(int aplcn_dtls_proper_num);
	public List<Map<String, Object>> certificate(int aplcn_dtls_proper_num);
	public void evaluationApplicants(Tb_013 tb_013);
	public void accept(int aplcn_dtls_proper_num);
	public void referral(int aplcn_dtls_proper_num);
	public List<Map<String, Object>> uploadFile(int aplcn_dtls_proper_num);
	public List<Map<String, Object>> announce();
	public List<Map<String, Object>> TRIAL_FCLTT_NAME();
	public Map<String, Object> announceSelect(int announce_proper_num);
	public Map<String, Object> trialSelect(int trial_fcltt_proper_num);
	
	public ArrayList<Tb_010> callTb_010();
	public ArrayList<Tb_002> callTb_002();
	public List<Map<String, Object>> callAUser(int trial_fcltt_proper_num);
	public List<Map<String, Object>> callCUser(int announce_proper_num);
	public List<Map<String, Object>> callDUser(String aplcn_dtls_sts);
	
	// 0930 하다
	public int sumTb_013(int aplcn_dtls_proper_num);
	public void insertTb_014(Tb_014 tb_014);
	public Tb_005 callTb_005(int aplcn_dtls_proper_num);
	
	// 1006 병훈 등재된 유저 List 출력
	public ArrayList<Tb_011> callTb_011();
	public List<Map<String, Object>> callRegistList(
			@Param("trial_fcltt_proper_num") Integer trial_fcltt_proper_num, 
			@Param("court_proper_num") Integer court_proper_num, 
			@Param("searchType") String searchType, 
			@Param("searchWord") String searchWord,
			@Param("pageNum") int pageNum);
	
	public int countRegistList(
			@Param("trial_fcltt_proper_num") Integer trial_fcltt_proper_num, 
			@Param("court_proper_num") Integer court_proper_num, 
			@Param("searchType") String searchType, 
			@Param("searchWord") String searchWord);
	
	// 1013 병훈 신청한 유저 List 출력
	public List<Map<String, Object>> callConditionList(
			@Param("announce_proper_num") Integer announce_proper_num,
			@Param("trial_fcltt_proper_num") Integer trial_fcltt_proper_num, 
			@Param("court_proper_num") Integer court_proper_num, 
			@Param("aplcn_dtls_sts") String aplcn_dtls_sts,
			@Param("searchType") String searchType, 
			@Param("searchWord") String searchWord,
			@Param("pageNum") int pageNum);
	
	public int countcallConditionList(
			@Param("announce_proper_num") Integer announce_proper_num,
			@Param("trial_fcltt_proper_num") Integer trial_fcltt_proper_num, 
			@Param("court_proper_num") Integer court_proper_num, 
			@Param("aplcn_dtls_sts") String aplcn_dtls_sts,
			@Param("searchType") String searchType, 
			@Param("searchWord") String searchWord);
	
}
