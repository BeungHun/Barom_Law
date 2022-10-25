package com.br.law.controller.assistant;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.br.law.controller.admin.ApplicationRegistrationAdminController;
import com.br.law.service.admin.ApplicationRegistrationAdminService;
import com.br.law.service.assistant.AssistantServiceImpl;
import com.br.law.vo.Tb_009;
import com.br.law.vo.Tb_010;
import com.br.law.vo.Tb_013;
import com.br.law.vo.Tb_015;

@Controller
@RequestMapping("/admin/*")
public class AssistantController {
	
	@Autowired
	private AssistantServiceImpl assistantServiceImpl;
	
	@Autowired
	private ApplicationRegistrationAdminService applicationRegistrationAdminService;
	
	@Autowired
	private ApplicationRegistrationAdminController applicationRegistrationAdminController;
	
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(RestAssistantController.class);
	
	@RequestMapping("managementEvaluationtable")
	public String ManagementEvaluationtable(){
		
		return "admin/managementEvaluationtable";
	}
	
	@RequestMapping("applicantManagement")
	public String  ApplicantManagement(Model model) {
		List<Map<String, Object>> applicantManagementList= assistantServiceImpl.allApplicantManagement();
		System.out.println(applicantManagementList);
		
		model.addAttribute("applicantManagementList", applicantManagementList);
		
		return "admin/applicantManagement";
	}
	
	//삭제요망
	@RequestMapping("applicantManagementDetail")
	public String ApplicantManagementDetail(Model model, int aplcn_dtls_proper_num){
		Map<String, Object> user = new HashMap<String, Object>();
		 
		Map<String, Object> userInfo = assistantServiceImpl.applicantInformation(aplcn_dtls_proper_num);
		model.addAttribute("userInfo", userInfo); 
		
		List<Map<String, Object>> map = assistantServiceImpl.certificateList(aplcn_dtls_proper_num);
		List<Map<String,Object>> map2 = assistantServiceImpl.uploadfile(aplcn_dtls_proper_num);
		
		model.addAttribute("uploadfile", map2); 
		System.out.println("파ㅏ일" + assistantServiceImpl.uploadfile(aplcn_dtls_proper_num));
		
		return "admin/applicantManagementDetail";
	}
	
	@RequestMapping("searchCondition")
	public String SearchCondition(Model model) {
		
		List<Map<String, Object>> applicantManagementList= assistantServiceImpl.allApplicantManagement();	
		model.addAttribute("applicantManagementList", applicantManagementList);
		
		List<Map<String, Object>> announceList = assistantServiceImpl.announce();
		model.addAttribute("announce", announceList);
		
		List<Map<String, Object>> trial_fclttList = assistantServiceImpl.trial_fcltt();
		model.addAttribute("trial", trial_fclttList);
		
		model.addAttribute("t2_List", assistantServiceImpl.callTb_002());
		model.addAttribute("t10_List", assistantServiceImpl.callTb_010());
		model.addAttribute("t11_List", assistantServiceImpl.callTb_011());
		
		return "admin/searchCondition";
	}
	
	@RequestMapping("evaluationApplicantsList")
	public String  EvaluationApplicantsList(Model model) {
		List<Map<String, Object>> applicantManagementList= assistantServiceImpl.allApplicantManagement();
		
		
		model.addAttribute("applicantManagementList", applicantManagementList);
		System.out.println(model);
		return "admin/evaluationApplicantsList";
	}	
	
	@RequestMapping("evaluationApplicants")
	public String  EvaluationApplicants(HttpServletRequest request, Model model,int aplcn_dtls_proper_num) {
		Map<String, Object> user = new HashMap<String, Object>();
		int userNo = Integer.parseInt(request.getParameter("aplcn_dtls_proper_num"));
		user.put("aplcn_dtls_proper_num", userNo);
		model.addAttribute("map", user);
		
		Map<String, Object> userInfo = assistantServiceImpl.applicantInformation(aplcn_dtls_proper_num);
		model.addAttribute("userInfo", userInfo);
		
		List<Tb_009> map = applicationRegistrationAdminService.uploadFileSel(userNo);
		model.addAttribute("uploadfiale", map);
				
		List<Map<String, Object>> certificateList = assistantServiceImpl.certificateList(aplcn_dtls_proper_num);
		model.addAttribute("certificateList", certificateList);
		
		return "admin/evaluationApplicants";
	}
	
	@RequestMapping("evaluationApplicantsProcess")
	public String EvaluationApplicantsProcess(Tb_013 param, int aplcn_dtls_proper_num, HttpSession session){ 
		 Tb_015 admin = (Tb_015) session.getAttribute("admin");
		 int adminNo = admin.getAdmin_proper_num();
		 
		 param.setAdmin_proper_num(adminNo);
		 param.setAplcn_dtls_proper_num(aplcn_dtls_proper_num);
		 
		 assistantServiceImpl.evaluation(param);
		 
		 if(assistantServiceImpl.sumTb_013(aplcn_dtls_proper_num) >= 40) {
			 assistantServiceImpl.accept(aplcn_dtls_proper_num);			 
		 }else {
			 assistantServiceImpl.referral(aplcn_dtls_proper_num);
		 }
		 
		return "redirect:./evaluationApplicantsList";
	}
	
	
	@RequestMapping("fileDownLoadProcess2")
	public String fileDownLoadProcess(HttpServletResponse response, 
			@Param("aplcn_dtls_proper_num")int aplcn_dtls_proper_num,
			@Param("aplcn_atch_file_proper_num")int aplcn_atch_file_proper_num) {
		
		applicationRegistrationAdminController.fileDownLoadProcess(response, aplcn_dtls_proper_num, aplcn_atch_file_proper_num);
		
		return "admin/fileDownLoadProcess";
	}
	
//	 22.10.06 병훈 등재목록 조회
	@RequestMapping("registrationList")
	public String registrationList(Model model) {
		
		model.addAttribute("t10_List", assistantServiceImpl.callTb_010());
		model.addAttribute("t11_List", assistantServiceImpl.callTb_011());
		
		return "admin/registrationList";
	}
	
	
	
}