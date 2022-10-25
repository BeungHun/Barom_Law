package com.br.law.controller.member;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.br.law.service.member.FaqServiceImpl;
import com.br.law.vo.Tb_004;
import com.br.law.vo.Tb_015; 

@Controller
@RequestMapping("/member/*")
public class FaqController {
	
	@Autowired
	private FaqServiceImpl faqService;
	
	@RequestMapping("faqPage")
	public String faqPage(Model model) {
		
		ArrayList<Tb_004> dataList = faqService.getFaqDataList();
		model.addAttribute("dataList", dataList);
		
		//for(Tb_004 tb_004 : dataList) {
		//	System.out.println("tb_004 : " + tb_004.getFaq_proper_num());
		//}
		
		return "member/faqPage";
	}
	
	@RequestMapping("writeFaqPage")
	public String writeFaqPage() {
		//System.out.println("faq 글쓰기 페이지 테스트");
		return "member/writeFaqPage";
	}
	
	@RequestMapping("writeFaqProcess")
	public String writeFaqProcess(Tb_004 param , HttpSession session) {
		
		//Tb_015 sessionUser = (Tb_015)session.getAttribute("sessionUserInfo");
		Tb_015 sessionUser = (Tb_015)session.getAttribute("admin");
		
		int admin_proper_num = sessionUser.getAdmin_proper_num();
		
		param.setAdmin_proper_num(admin_proper_num);
		
		faqService.writeFaq(param);
		
		return "redirect:./faqPage";
	}
	
	@RequestMapping("faqDetailPage")
	public String faqDetailPage(int faq_proper_num , Model model) {
		
		HashMap<String, Object> data = faqService.getFaqData(faq_proper_num);
		
		Tb_004 tb_004 = (Tb_004)data.get("tb_004");	
		String content = tb_004.getFaq_ask_comment();
		content = StringEscapeUtils.escapeHtml4(content);
		content = content.replaceAll(" ", "&nbsp");
		content = content.replaceAll("\n", "<br>");
		tb_004.setFaq_ask_comment(content);
		
		model.addAttribute("data", data);
		
		return "member/faqDetailPage";
	}
	
	@RequestMapping("deleteFaqProcess")
	public String deleteFaqProcess(int faq_proper_num) {
		
		faqService.deleteFaq(faq_proper_num);
		
		return "redirect:./faqPage";
	}
	
	@RequestMapping("updateFaqPage")
	public String updateFaqPage(int faq_proper_num , Model model) {
		
		HashMap<String, Object> data = faqService.getFaqData(faq_proper_num);
		model.addAttribute("data", data);
		
		return "member/updateFaqPage";
	}
	
	@RequestMapping("updateFaqProcess")
	public String updateFaqProcess(Tb_004 param) {
		
		faqService.updateFaq(param);
		
		return "redirect:./faqPage";
	}

}