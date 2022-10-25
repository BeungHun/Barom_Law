package com.br.law.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.br.law.service.admin.ApplicationRegistrationAdminService;
import com.br.law.vo.Tb_009;

@RestController
@RequestMapping("/admin/*")
public class RestApplicationRegistrationAdminController {
	
	@Autowired
	ApplicationRegistrationAdminService applicationRegistrationAdminService;
	
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(RestApplicationRegistrationAdminController.class);
	
	@RequestMapping("selTableOne")
//	public Map<String, Object> selTableOne(int aplcn_dtls_proper_num, String aplcn_dtls_sts) {
	public Map<String, Object> selTableOne(int aplcn_dtls_proper_num) {
		Map<String, Object> map = new HashMap<String, Object>();
	
		map.put("aplcn_dtls_proper_num", aplcn_dtls_proper_num);
//		map.put("aplcn_dtls_sts", aplcn_dtls_sts);
//		Map<String, Object> param = applicationRegistrationAdminService.onestExamination(map);
		Map<String, Object> param = applicationRegistrationAdminService.onestExamination(aplcn_dtls_proper_num);
		
		map.put("result", "success");
		map.put("map", param);
		
		return map;
	}
	
	@RequestMapping("fileList")
	public List<Tb_009> fileList(int aplcn_dtls_proper_num){
		Map<String, Object> map = new HashMap<>();
		List<Tb_009> list= applicationRegistrationAdminService.uploadFileSel(aplcn_dtls_proper_num); 
		
		map.put("list", list);
		
		logger.info("list", list);
		return list;
	}
	
	@RequestMapping("selectFileList")
	public Map<String, Object> selectFileList(int aplcn_dtls_proper_num) {
		Map<String, Object> map = applicationRegistrationAdminService.uploadFileSelMap(aplcn_dtls_proper_num);
		return map;
	}
	
	//분류별 출력 
	@RequestMapping("accList")
	public Map<String, Object> accList(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("json", applicationRegistrationAdminService.accList());
		
		map.put("result", "success");
		
		return map;
	}
		
		//option 목록 출력
	@RequestMapping("optionBoxapp")
	public Map<String, Object> optionBoxapp(){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("Tb_010", applicationRegistrationAdminService.optionBoxapp());
		
		return map;
	}
	
	@RequestMapping("searchUserName")
	public Map<String, Object> searchUserName
	(String user_name, Integer trial_fcltt_proper_num, Integer announce_proper_num, String aplcn_dtls_sts){
		System.out.println(user_name + "오오");
		Map<String, Object> map = new HashMap<String, Object>();
	    
		
	   logger.info("trial" + trial_fcltt_proper_num + "ann" + announce_proper_num + "apl" + aplcn_dtls_sts);
	   map.put("user_name", user_name);
	   if(trial_fcltt_proper_num != null) {
		   map.put("trial_fcltt_proper_num", trial_fcltt_proper_num);
	   }else if(announce_proper_num != null){
		   map.put("announce_proper_num", announce_proper_num);	  
	   }else if(aplcn_dtls_sts != null) {
		   map.put("aplcn_dtls_sts", aplcn_dtls_sts);
	   }
	   
		System.out.println("실행되는지 확인" + user_name);
		List<Map<String, Object>> list = applicationRegistrationAdminService.searchUserName(map);
		map.put("list", list);
		return map;

	}
	
//	//1차 심사 탈락
//	@RequestMapping("evaluationProcess")
//	public Map<String, Object> evaluationProcess(int aplcn_dtls_proper_num) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		applicationRegistrationAdminService.evaluationCpUp(aplcn_dtls_proper_num);
//		map.put("result", "success");
//		return map;
//	}
//	
//	//1차 심사 통과
//	@RequestMapping("companionProcess")
//	public Map<String, Object> companionProcess(int aplcn_dtls_proper_num) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		applicationRegistrationAdminService.companionUp(aplcn_dtls_proper_num);
//		map.put("result", "success");
//		return map;
//	}

	
}