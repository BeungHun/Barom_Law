package com.br.law.controller.member;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.br.law.service.member.NoticeService;
import com.br.law.vo.Tb_003;
import com.br.law.vo.Tb_015;

@Controller
@RequestMapping("/member/*")
public class NoitceBoardController {

	@Autowired
	private NoticeService noticeService;

	@RequestMapping("noticeBoard")
	public String noticeBoard(Model model, HttpSession session) {
		
		ArrayList<HashMap<String, Object>> noticeDataList = noticeService.getNoticeBoard();
		model.addAttribute("noticeDataList", noticeDataList);
		
		session.getAttribute("admin");
		
		return "member/noticeBoard";
	}

	@RequestMapping("noticeWriteBoard")
	public String noticeWriteBoard(HttpSession session) {
		
		session.getAttribute("admin");
		
		return "member/noticeWriteBoard";
	}

	@RequestMapping("noticeWriteProcess")
	public String noticeWriteProcess(Model model, Tb_003 tb_003, HttpSession session) {

		Tb_015 sessionAdmin = (Tb_015)session.getAttribute("admin");
		sessionAdmin.getAdmin_proper_num();
		
		
		model.addAttribute("sessionAdmin", sessionAdmin);


		noticeService.writeNoticeBoard(tb_003);

		return "redirect:../member/noticeBoard";
	}
	
	@RequestMapping("noticeReadBoard")
	public String noticeReadBoard(int notice_proper_num, Model model, HttpSession session) {
		
		HashMap<String, Object> noticeData = noticeService.getNoticeData(notice_proper_num);
		model.addAttribute("noticeData", noticeData);
		
		
		session.getAttribute("admin");
		
		return "member/noticeReadBoard";
	}
	
	@RequestMapping("noticeDeleteProcess")
	public String noticeDeleteProcess(int notice_proper_num) {
		
		noticeService.deleteMyNotice(notice_proper_num);
		
		return "redirect:../member/noticeBoard";
	}
	
	@RequestMapping("noticeUpdateBoard")
	public String noticeUpdateBoard(int notice_proper_num , Model model, HttpSession session ) {
		
		HashMap<String, Object> noticeData = noticeService.getNoticeData(notice_proper_num);
		model.addAttribute("noticeData", noticeData);
		
		
		session.getAttribute("admin");
		
		return "member/noticeUpdateBoard";
	}
	
	@RequestMapping("updateNoticeProcess")
	public String updateNoticeProcess(Tb_003 tb_003, HttpSession session) {
		
		Tb_015 sessionAdmin = (Tb_015)session.getAttribute("admin");
		
		
		noticeService.updateMyNotice(tb_003);
		
		return "redirect:../member/noticeBoard";
	}
	
	
}
