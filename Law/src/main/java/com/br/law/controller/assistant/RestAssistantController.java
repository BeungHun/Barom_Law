package com.br.law.controller.assistant;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.br.law.service.admin.ApplicationRegistrationAdminService;
import com.br.law.service.assistant.AssistantServiceImpl;

@RestController
@RequestMapping("/admin/*")
public class RestAssistantController {
	
	@Autowired
	private AssistantServiceImpl assistantServiceImpl;
	
	@Autowired ApplicationRegistrationAdminService applicationRegistrationAdminService;
	
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(RestAssistantController.class);

	
	@RequestMapping("userInfoTable")
	public Map<String, Object> ApplicantDetail(int aplcn_dtls_proper_num) {				
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("aplcn_dtls_proper_num", aplcn_dtls_proper_num);
		System.out.println("레스트 map" + map);
		
		Map<String, Object> userInfo = assistantServiceImpl.applicantInformation(aplcn_dtls_proper_num);
		map.put("userInfo", userInfo);
		
//		Map<String, Object> certificateList = assistantServiceImpl.certificateList(aplcn_dtls_proper_num);
//		map.put("certificateList", certificateList);
//		
//		List<Map<String, Object>> uploadfile = assistantServiceImpl.uploadfile(aplcn_dtls_proper_num);
//		map.put("uploadfile", uploadfile);
//		
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("certificateList")
	public List<Map<String, Object>> certificateList(int aplcn_dtls_proper_num){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> certificate = assistantServiceImpl.certificateList(aplcn_dtls_proper_num);
		map.put("map", certificate);
		
		System.out.println(map);
		return certificate;
	}
	
	
	@RequestMapping("uploadfile")
	public List<Map<String, Object>> uploadfiles(int aplcn_dtls_proper_num){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> files = assistantServiceImpl.uploadfile(aplcn_dtls_proper_num);
		
		map.put("map", files);
		
		System.out.println(map);
		
		return files;
	}
 	
	
	@RequestMapping("announceSelect")
	public Map<String, Object> announceSelect(int announce_proper_num){
		Map<String, Object> map = new HashMap<String, Object>();
		
		Map<String, Object> announceSelect =  assistantServiceImpl.announceSelectList(announce_proper_num);
		
		map.put("map", announceSelect);
		map.put("result", "success");
		
		return map;
	}
	
	//0928 하다
	// 조견별 분류불러오기
	@RequestMapping("callA")
	public Map<String, Object> callA(){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("t10", assistantServiceImpl.callTb_010());
		return map;

	}
	
	//기간별은 추후 추가 예정
	// 공고별 분류불러오기
	@RequestMapping("callC")
	public Map<String, Object> callC(){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("t2", assistantServiceImpl.callTb_002());
		return map;
		
	}
	
	// 조건별 유저 불러오기
	@RequestMapping("callAUser")
	public Map<String, Object> callAUser(int trial_fcltt_proper_num){
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		map.put("result", "success");
		map.put("list", assistantServiceImpl.callAUser(trial_fcltt_proper_num));
		
		return map;
	}
	
	// 공고별 유저 불러오기
	@RequestMapping("callCUser")
	public Map<String, Object> callCUser(int announce_proper_num){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("list", assistantServiceImpl.callCUser(announce_proper_num));
		return map;
	}
	
	// 공고별 유저 불러오기
	@RequestMapping("callDUser")
	public Map<String, Object> callCUser(@RequestParam("aplcn_dtls_sts")String aplcn_dtls_sts){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("list", assistantServiceImpl.callDUser(aplcn_dtls_sts));
		return map;
	}
	
	//0929 하다
	// 전체 유저 불러오기
	@RequestMapping("callAllUser")
	public Map<String, Object> callAllUser(){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("list", assistantServiceImpl.allApplicantManagement());
	
		return map;
	}
	
	//1006 병훈 등재목록 유저 리스트 불러오기
	@RequestMapping("callRegistUser")
	public Map<String, Object> callRegistUser(
			@Param("trial_fcltt_proper_num") Integer trial_fcltt_proper_num, 
			@Param("court_proper_num") Integer court_proper_num, 
			@Param("searchType") String searchType, 
			@Param("searchWord") String searchWord,
			@RequestParam(value="pageNum", defaultValue="1") int pageNum){
		Map<String, Object> map = new HashMap<String, Object>();
		
		int boardCount = assistantServiceImpl.countRegistList(
				trial_fcltt_proper_num, court_proper_num, searchType, searchWord);
		int totalPageCount = (int)Math.ceil(boardCount/10.0);
		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		map.put("result", "success");
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("currentPageNum", pageNum);
		map.put("totalPageCount", totalPageCount);
		map.put("list", assistantServiceImpl.callRegistList(
				trial_fcltt_proper_num, court_proper_num, searchType, searchWord, pageNum));
	
		return map;
	}
	
	
	//1013 병훈 등재목록 유저 리스트 불러오기
	@RequestMapping("callConditionList")
	public Map<String, Object> callConditionList(
			@Param("announce_proper_num") Integer announce_proper_num, 
			@Param("trial_fcltt_proper_num") Integer trial_fcltt_proper_num, 
			@Param("court_proper_num") Integer court_proper_num, 
			@Param("aplcn_dtls_sts") String aplcn_dtls_sts, 
			@Param("searchType") String searchType, 
			@Param("searchWord") String searchWord,
			@RequestParam(value="pageNum", defaultValue="1") int pageNum){
		Map<String, Object> map = new HashMap<String, Object>();
		
		int boardCount = assistantServiceImpl.countcallConditionList(
				announce_proper_num, trial_fcltt_proper_num, court_proper_num, aplcn_dtls_sts, searchType, searchWord);
		int totalPageCount = (int)Math.ceil(boardCount/10.0);
		int startPage = ((pageNum-1)/5)*5 + 1;
		int endPage = ((pageNum-1)/5+1)*5;
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		map.put("result", "success");
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("currentPageNum", pageNum);
		map.put("totalPageCount", totalPageCount);
		map.put("list", assistantServiceImpl.callConditionList(
				announce_proper_num, trial_fcltt_proper_num, court_proper_num, aplcn_dtls_sts, searchType, searchWord, pageNum));
		
		return map;
	}
	
}
