package com.br.law.controller.user;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.br.law.service.member.NoticeService;
import com.br.law.service.user.ApplicationRegistrationService;
import com.br.law.service.user.TrialUserService;
import com.br.law.vo.Tb_001;
import com.br.law.vo.Tb_002;
import com.br.law.vo.Tb_005;
import com.br.law.vo.Tb_006;
import com.br.law.vo.Tb_007;
import com.br.law.vo.Tb_008;
import com.br.law.vo.Tb_009;
import com.br.law.vo.Tb_010;

@Controller
@RequestMapping("/user/*")
public class ApplicationRegistrationUserController {

	private static final org.slf4j.Logger LOGGER = LoggerFactory.getLogger(TrialUserController.class);
	
	//

	
	@Autowired
	private TrialUserService trialUserService; 
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private ApplicationRegistrationService applicationRegistrationService;
	
	
	@RequestMapping("user/main")
	public String main(Model model) {
		model.addAttribute("noticeDataList", noticeService.getNoticeBoard());
		return"user/main";
	}
	
	@RequestMapping("user/register")
	public String register() {
		return"user/register";
	}
	//회원가입
	@RequestMapping("applicationRegistration")
	public String applicationRegistration(HttpSession session, Model model){	
		return"user/applicationRegistration";
	}
	
	@RequestMapping("applicationRegistrationProcess")
	public String applicationRegistrationProcess(HttpSession session, Tb_001 param) {
		applicationRegistrationService.userIns(param); 
		return"redirect:../user/main";
	}
	
	//등재신청 목록 출력
	@RequestMapping("announcement")
	public String announcement(Model model) {
		List<Tb_002> list = applicationRegistrationService.asd();
		model.addAttribute("asd", list);
		return "user/announcement";
	}
	
	//등재공고 > 등재신청 Process
	@RequestMapping("announcementProcess")
	public String announcementProcess(HttpSession session, Tb_002 param) {
		session.setAttribute("two", param);
		return "redirect:../user/userDetail";
	}
	
	//등재신청 시작
	//등재신청 약관확인
	@RequestMapping("applicationClause")
	public String applicationClause() {
		return "user/applicationClause";
	}
	
	//등재신청 결격사유 확인
	@RequestMapping("applicationDisqualification")
	public String applicationDisqualification() {
		return "user/applicationDisqualification";
	}
	
	//등재신청 신청자 정보
	@RequestMapping("userDetail")
	public String userDetail(){
		return "user/userDetail";
	}
	
	@RequestMapping("userDetailInsProcess")
	public String userDetailInsProcess(HttpSession session, Model model, Tb_005 param, Tb_010 tb_010) {
		int userNo = ((Tb_001)session.getAttribute("user")).getUser_proper_num();
		int two = applicationRegistrationService.searchTb002ByTb010(tb_010).getAnnounce_proper_num();
		int ten = applicationRegistrationService.searchTb010ByTb010(tb_010).getTrial_fcltt_proper_num();
		param.setUser_proper_num(userNo);
		param.setAnnounce_proper_num(two);
		param.setTrial_fcltt_proper_num(ten);
		
		Tb_005 five = applicationRegistrationService.userDetailIns(param);
		session.setAttribute("five", five);
		System.out.println("확인 : " + five);
		return "redirect:../user/univ";
	}
	
	@RequestMapping("userDetailUpProcess")
	public String userDetailUpProcess(HttpSession session, Model model, Tb_005 param) {
		int userNo = ((Tb_001)session.getAttribute("user")).getUser_proper_num();
		param.setUser_proper_num(userNo);
		System.out.println("param 확인 : " + param.getAplcn_dtls_proper_num());
		System.out.println("param 확인 : " + param.getUser_proper_num());
		System.out.println("param 확인 : " + param.getCourt_proper_num());
		System.out.println("param 확인 : " + param.getAnnounce_proper_num());
		
		Tb_005 five = applicationRegistrationService.userDetailUp(param);
		session.setAttribute("five", five);
		System.out.println("확인 : " + five);
		return "redirect:../user/univ";
	}
	
	@RequestMapping("univ")
	public String univ (HttpSession session, Model model, Tb_006 param){
		int fiveNo = ((Tb_005)session.getAttribute("five")).getAplcn_dtls_proper_num();
		param.setAplcn_dtls_proper_num(fiveNo);
		
		int count = applicationRegistrationService.univCount(fiveNo);
		if(count != 0) {
			Tb_006 six = applicationRegistrationService.univSel(param);
			model.addAttribute("six", six);
			model.addAttribute("count", count);
			System.out.println("확인용 : " + model);	
		}
		return"user/univ";
	}
	
	@RequestMapping("univInsProcess")
	public String univInsProcess(HttpSession session, Tb_006 param) {
		int fiveNo = ((Tb_005)session.getAttribute("five")).getAplcn_dtls_proper_num();
		param.setAplcn_dtls_proper_num(fiveNo);
		applicationRegistrationService.univIns(param);
		return "redirect:../user/career";
	}
	@RequestMapping("univUpProcess")
	public String univUpProcess(HttpSession session, Tb_006 param) {
		int fiveNo = ((Tb_005)session.getAttribute("five")).getAplcn_dtls_proper_num();
		param.setAplcn_dtls_proper_num(fiveNo);
		applicationRegistrationService.univUp(param);
		return "redirect:../user/career";
	}
	
	
	@RequestMapping("career")
	public String career(HttpSession session, Model model, Tb_007 param) {
		int fiveNo = ((Tb_005)session.getAttribute("five")).getAplcn_dtls_proper_num();
		param.setAplcn_dtls_proper_num(fiveNo);
		
		int count = applicationRegistrationService.careerCount(fiveNo);
		if(count != 0) {
			Tb_007 seven = applicationRegistrationService.careerSel(param);
			model.addAttribute("seven", seven);
			model.addAttribute("count", count);
			System.out.println("확인용 : " + model);	
		}
		return "user/career";
	}
	
	@RequestMapping("careerInsProcess")
	public String careerInsProcess(HttpSession session, Tb_007 param) {
		int fiveNo = ((Tb_005)session.getAttribute("five")).getAplcn_dtls_proper_num();
		param.setAplcn_dtls_proper_num(fiveNo);
		applicationRegistrationService.careerIns(param);
		return "redirect:../user/license";
	}
	@RequestMapping("careerUpProcess")
	public String careerUpProcess(HttpSession session, Tb_007 param) {
		int fiveNo = ((Tb_005)session.getAttribute("five")).getAplcn_dtls_proper_num();
		param.setAplcn_dtls_proper_num(fiveNo);
		applicationRegistrationService.careerUp(param);
		return "redirect:../user/license";
	}
	
	@RequestMapping("license")
	public String license(HttpSession session, Model model, Tb_008 param) {
		int fiveNo = ((Tb_005)session.getAttribute("five")).getAplcn_dtls_proper_num();
		param.setAplcn_dtls_proper_num(fiveNo);
		
		int count = applicationRegistrationService.licenceCount(fiveNo);
		if(count != 0) {
			Tb_008 eight = applicationRegistrationService.licenceSel(param);
			model.addAttribute("eight", eight);
			model.addAttribute("count", count);
			System.out.println("확인용 : " + model);	
		}
		return "user/license";
	}
	
	@RequestMapping("licenseInsProcess")
	public String licenseInsProcess(HttpSession session, Tb_008 param){
		int fiveNo = ((Tb_005)session.getAttribute("five")).getAplcn_dtls_proper_num();
		param.setAplcn_dtls_proper_num(fiveNo);
		applicationRegistrationService.licenseIns(param);
		return "redirect:../user/fileUpload";
	}
	@RequestMapping("licenseUpProcess")
	public String licenseUpProcess(HttpSession session, Tb_008 param){
		int fiveNo = ((Tb_005)session.getAttribute("five")).getAplcn_dtls_proper_num();
		param.setAplcn_dtls_proper_num(fiveNo);
		applicationRegistrationService.licenseUp(param);
		return "redirect:../user/fileUpload";
	}
	
	@RequestMapping("user/fileUpload")
	public String fileUpload() {
		return "user/fileUpload";
	}
	
	
	
		
	
	
}
