package com.br.law.controller.member;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.br.law.service.member.NoticeService;
import com.br.law.vo.Tb_002;
import com.br.law.vo.Tb_015;

@Controller
@RequestMapping("/member/*")
public class trialAssistantRegisterBoardController {
	
	@Autowired
	private NoticeService noticeService;
	
	//감정인 제도안내
	@RequestMapping("systemGuide")
	public String systemGuide() {
		return "member/systemGuide";
	}
	
	@RequestMapping("processGuide")
	public String processGuide() {
		return "member/processGuide";
	}
	

	@RequestMapping("trialAssistantRegisterBoard")
	public String trialAssistantRegisterBoard(Model model , HttpSession session) {
		
		ArrayList<HashMap<String, Object>> trialAssistantDataList = noticeService.getTrialAssistantBoard();
		model.addAttribute("trialAssistantDataList" , trialAssistantDataList);
	
		return "member/trialAssistantRegisterBoard";
	}
	
	@RequestMapping("trialAssistantRegisterWriteBoard")
	public String trialAssistantRegisterWriteBoard(Model model , HttpSession session) {
		
		session.getAttribute("admin");
		
		model.addAttribute("trialFcltt" , noticeService.getTrialFcltt());
		
		return "member/trialAssistantRegisterWriteBoard";
	}
	
	@RequestMapping("trialAssistantRegisterWriteProcess")
	public String trialAssistantRegisterWriteProcess(Model model , Tb_002 tb_002 , HttpSession session) {
		
		Tb_015 sessionAdmin = (Tb_015)session.getAttribute("admin");
		int sessionNo = sessionAdmin.getAdmin_proper_num();
		tb_002.setAdmin_proper_num(sessionNo);
		
		model.addAttribute("sessionAdmin", sessionAdmin);
		
		noticeService.writeTrialAssistantRegisterBorad(tb_002);
		
		return "redirect:../member/trialAssistantRegisterBoard";
	}

	
	@RequestMapping("trialAssistantRegisterReadBoard")
	public String trialAssistantRegisterReadBoard(int announce_proper_num, Model model) {
		HashMap<String, Object> trialAssistantData = noticeService.getSelectTrialAssistantBoard(announce_proper_num);
		
		model.addAttribute("trialAssistantData" , trialAssistantData);
		return "member/trialAssistantRegisterReadBoard";
		
	}
	
	@RequestMapping("trialAssistantRegisterUpdateBoard")
	public String trialAssistantRegisterUpdateBoard(int announce_proper_num, Model model, HttpSession session) {
		
		HashMap<String, Object> trialAssistantData = noticeService.getSelectTrialAssistantBoard(announce_proper_num);
		model.addAttribute("trialAssistantData" , trialAssistantData);
		model.addAttribute("trialFcltt" , noticeService.getTrialFcltt());
		
		
		
		
		return "member/trialAssistantRegisterUpdateBoard";
	}
	
	@RequestMapping("trialAssistantRegisterUpdateProcess")
	public String trialAssistantRegisterUpdateProcess(Tb_002 tb_002, HttpSession session) {
		
		session.getAttribute("admin");
		noticeService.updateMyTrialAssistant(tb_002);
		
		return "redirect:../member/trialAssistantRegisterBoard";
	}
	
	
	@RequestMapping("trialAssistantRegisterDeleteProcess")
	public String trialAssistantRegisterDeleteProcess(int announce_proper_num) {
		
		noticeService.deleteMytrialAssistant(announce_proper_num);
		
		return "redirect:../member/trialAssistantRegisterBoard";
	}
	

	
}
